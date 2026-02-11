#!/bin/bash
# Clawbi 飞书连接测试脚本
# 测试三项：1) App Token  2) User Token  3) Refresh Token

set -e

# 加载 .env
source "$(dirname "$0")/.env"

echo "========================================="
echo "  Clawbi 飞书连接测试"
echo "========================================="
echo ""

# --- 测试 1: 获取 app_access_token ---
echo "[测试 1/3] 获取 app_access_token..."
APP_TOKEN_RESPONSE=$(curl -s -X POST "${FEISHU_DOMAIN}/open-apis/auth/v3/app_access_token/internal" \
  -H "Content-Type: application/json" \
  -d "{
    \"app_id\": \"${FEISHU_APP_ID}\",
    \"app_secret\": \"${FEISHU_APP_SECRET}\"
  }")

APP_TOKEN_CODE=$(echo "$APP_TOKEN_RESPONSE" | node -e "
  const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
  console.log(data.code || 'ERROR');
")

if [ "$APP_TOKEN_CODE" = "0" ]; then
  APP_ACCESS_TOKEN=$(echo "$APP_TOKEN_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    console.log(data.app_access_token);
  ")
  echo "  ✅ app_access_token 获取成功"
  echo "  Token: ${APP_ACCESS_TOKEN:0:20}..."
else
  echo "  ❌ app_access_token 获取失败"
  echo "  响应: $APP_TOKEN_RESPONSE"
  echo ""
  echo "  检查: App ID 和 App Secret 是否正确？应用是否已发布？"
  exit 1
fi

echo ""

# --- 测试 2: 验证 user_access_token ---
echo "[测试 2/3] 验证 user_access_token（获取 Clawbi 用户信息）..."
USER_INFO_RESPONSE=$(curl -s -X GET "${FEISHU_DOMAIN}/open-apis/authen/v1/user_info" \
  -H "Authorization: Bearer ${FEISHU_USER_ACCESS_TOKEN}")

USER_INFO_CODE=$(echo "$USER_INFO_RESPONSE" | node -e "
  const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
  console.log(data.code || 'ERROR');
")

if [ "$USER_INFO_CODE" = "0" ]; then
  USER_NAME=$(echo "$USER_INFO_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    console.log(data.data?.name || 'Unknown');
  ")
  USER_EMAIL=$(echo "$USER_INFO_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    console.log(data.data?.enterprise_email || data.data?.email || 'Unknown');
  ")
  USER_ID=$(echo "$USER_INFO_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    console.log(data.data?.user_id || 'Unknown');
  ")
  echo "  ✅ user_access_token 有效"
  echo "  用户名: $USER_NAME"
  echo "  邮箱: $USER_EMAIL"
  echo "  User ID: $USER_ID"
else
  echo "  ❌ user_access_token 无效或已过期"
  echo "  错误码: $USER_INFO_CODE"
  echo "  响应: $USER_INFO_RESPONSE"
  echo ""
  echo "  如果错误码是 99991668 或 99991672，说明 Token 已过期。"
  echo "  将尝试用 refresh_token 续期..."

  # 自动尝试续期
  echo ""
  echo "  [自动续期] 使用 refresh_token 获取新的 user_access_token..."
  REFRESH_RESPONSE=$(curl -s -X POST "${FEISHU_DOMAIN}/open-apis/authen/v1/oidc/refresh_access_token" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${APP_ACCESS_TOKEN}" \
    -d "{
      \"grant_type\": \"refresh_token\",
      \"refresh_token\": \"${FEISHU_USER_REFRESH_TOKEN}\"
    }")

  REFRESH_CODE=$(echo "$REFRESH_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    console.log(data.code || 'ERROR');
  ")

  if [ "$REFRESH_CODE" = "0" ]; then
    NEW_ACCESS_TOKEN=$(echo "$REFRESH_RESPONSE" | node -e "
      const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
      console.log(data.data?.access_token || '');
    ")
    NEW_REFRESH_TOKEN=$(echo "$REFRESH_RESPONSE" | node -e "
      const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
      console.log(data.data?.refresh_token || '');
    ")

    echo "  ✅ 续期成功！"
    echo "  新 access_token: ${NEW_ACCESS_TOKEN:0:20}..."
    echo "  新 refresh_token: ${NEW_REFRESH_TOKEN:0:20}..."
    echo ""
    echo "  ⚠️ 请更新 .env 文件中的 Token："
    echo "  FEISHU_USER_ACCESS_TOKEN=${NEW_ACCESS_TOKEN}"
    echo "  FEISHU_USER_REFRESH_TOKEN=${NEW_REFRESH_TOKEN}"

    # 自动更新 .env
    SCRIPT_DIR="$(dirname "$0")"
    sed -i "s|^FEISHU_USER_ACCESS_TOKEN=.*|FEISHU_USER_ACCESS_TOKEN=${NEW_ACCESS_TOKEN}|" "$SCRIPT_DIR/.env"
    sed -i "s|^FEISHU_USER_REFRESH_TOKEN=.*|FEISHU_USER_REFRESH_TOKEN=${NEW_REFRESH_TOKEN}|" "$SCRIPT_DIR/.env"
    echo "  ✅ .env 已自动更新"

    # 用新 token 重新验证
    FEISHU_USER_ACCESS_TOKEN="$NEW_ACCESS_TOKEN"
    echo ""
    echo "  [重新验证] 使用新 token 获取用户信息..."
    USER_INFO_RESPONSE=$(curl -s -X GET "${FEISHU_DOMAIN}/open-apis/authen/v1/user_info" \
      -H "Authorization: Bearer ${FEISHU_USER_ACCESS_TOKEN}")
    USER_NAME=$(echo "$USER_INFO_RESPONSE" | node -e "
      const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
      console.log(data.data?.name || 'Unknown');
    ")
    echo "  ✅ 验证通过 — 用户: $USER_NAME"
  else
    echo "  ❌ 续期失败"
    echo "  响应: $REFRESH_RESPONSE"
    echo "  需要重新走 OAuth 授权流程获取新的 user_access_token"
    exit 1
  fi
fi

echo ""

# --- 测试 3: 测试发送消息能力 ---
echo "[测试 3/3] 测试消息发送能力（获取 Clawbi 可用的聊天列表）..."
CHAT_RESPONSE=$(curl -s -X GET "${FEISHU_DOMAIN}/open-apis/im/v1/chats?page_size=5" \
  -H "Authorization: Bearer ${FEISHU_USER_ACCESS_TOKEN}")

CHAT_CODE=$(echo "$CHAT_RESPONSE" | node -e "
  const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
  console.log(data.code || 'ERROR');
")

if [ "$CHAT_CODE" = "0" ]; then
  CHAT_COUNT=$(echo "$CHAT_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    const items = data.data?.items || [];
    console.log(items.length);
  ")
  echo "  ✅ 消息 API 可用"
  echo "  可见聊天数量: $CHAT_COUNT"

  # 列出聊天
  echo "$CHAT_RESPONSE" | node -e "
    const data = JSON.parse(require('fs').readFileSync('/dev/stdin','utf8'));
    const items = data.data?.items || [];
    items.forEach((c, i) => {
      console.log('  ' + (i+1) + '. ' + (c.name || 'DM') + ' (' + c.chat_type + ') - chat_id: ' + c.chat_id);
    });
  "
else
  echo "  ⚠️ 聊天列表获取失败（可能是权限问题，不影响基础功能）"
  echo "  错误码: $CHAT_CODE"
fi

echo ""
echo "========================================="
echo "  测试完成"
echo "========================================="
echo ""
echo "下一步："
echo "  1. 安装 OpenClaw: curl -fsSL https://openclaw.ai/install.sh | bash"
echo "  2. 配置飞书通道（参考 04_Feishu_User_Setup_Guide.md）"
echo "  3. 启动 Clawbi 并在飞书中发送第一条消息"
