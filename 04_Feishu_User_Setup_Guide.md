# Clawbi｜飞书用户配置指南

> 本文档是 Clawbi 飞书/Lark 员工席位的详细配置教程。
> 目标：让 Clawbi 以"AI 同事"身份出现在飞书通讯录和日常协作中。

---

## 0. 前置条件

| 条件 | 状态 |
|------|------|
| 飞书管理后台管理员权限 | 需要 |
| 飞书账号已注册 | ✅ `clawbi@cyberflo.ai` (主) / `clawbi@hooraycommerce.com` (别名) |
| OpenClaw 已安装 | 参考 `02_Week1_Launch_Checklist.md` |
| Anthropic API Key 已配置 | 参考 Week 1 Checklist |

---

## 1. 飞书管理后台 — 添加 Clawbi 为员工

### 1.1 登录飞书管理后台

1. 打开 [飞书管理后台](https://www.feishu.cn/admin) （国际版: [Lark Admin](https://www.larksuite.com/admin)）
2. 使用管理员账号登录

### 1.2 添加员工

路径：**组织架构** → **成员管理** → **添加成员**

| 字段 | 填写内容 |
|------|---------|
| **姓名** | Clawbi |
| **邮箱** | `clawbi@cyberflo.ai` |
| **邮箱别名** | `clawbi@hooraycommerce.com` |
| **部门** | CEO Office 或 Cyberflo AI（建议归属 CEO 直属） |
| **职位** | AI Employee #001 |
| **手机号** | 可不填（用邮箱登录） |
| **直接上级** | Erik |

### 1.3 设置个人资料

登录 Clawbi 的飞书账号后：

1. **头像**：上传 Clawbi 🦀 的品牌头像
2. **显示名**：`Clawbi 🦀 | AI Employee #001`
3. **个人签名**：`I see what the data says. I say what others won't.`
4. **个人简介**：
   ```
   HOORAY GROUP AI 员工 #001
   基于 OpenClaw 运行 | 24/7 on-call
   擅长：经营分析、数据洞察、内容协作
   🦀 Make it real. Make it fun.
   ```

### 1.4 配置权限

在管理后台为 Clawbi 设置最小必要权限：

| 权限项 | 设置 | 说明 |
|--------|------|------|
| **消息** | 完整读写 | DM + 群聊正常沟通 |
| **通讯录** | 只读 | 了解组织结构 |
| **日历** | 只读（被共享的）+ 写自己的 | 查看团队日程 |
| **云文档** | 被共享的文档可读写 | 只访问被明确共享的文档 |
| **审批流** | 可被分配 + 可评论 | 参与特定审批节点 |
| **邮件** | 收取 + 发送需审批 | 不自主发送外部邮件 |

---

## 2. 飞书开放平台 — 创建应用（OpenClaw 对接用）

> OpenClaw 通过飞书开放平台的自建应用来与飞书通信。
> 即使 Clawbi 是员工席位，技术对接仍需要一个飞书应用作为"桥梁"。

### 2.1 创建自建应用

1. 打开 [飞书开放平台](https://open.feishu.cn/)（国际版: [Lark Developer](https://open.larksuite.com/)）
2. 点击 **创建应用** → 选择 **自建应用**
3. 填写：

| 字段 | 内容 |
|------|------|
| **应用名称** | Clawbi Agent |
| **应用描述** | HOORAY GROUP AI 员工 Clawbi 的运行时接入 |
| **应用图标** | 上传 Clawbi 🦀 头像 |

### 2.2 获取应用凭证

创建完成后，在 **凭证与基础信息** 页面获取：

| 凭证 | 说明 | 存放位置 |
|------|------|---------|
| **App ID** | 应用唯一标识 | 1Password "Shared with Clawbi" |
| **App Secret** | 应用密钥（绝不外泄） | 1Password "Shared with Clawbi" |

### 2.3 配置权限范围（Scopes）

路径：**权限管理** → **API 权限**

需要开通的权限：

**消息相关**：
| 权限 | 权限 ID | 用途 |
|------|---------|------|
| 获取与发送单聊、群组消息 | `im:message` | 接收和回复消息 |
| 获取群组信息 | `im:chat:readonly` | 了解群组成员 |
| 获取用户发给机器人的单聊消息 | `im:message.p2p_msg:readonly` | 接收 DM |
| 获取群组中 @机器人的消息 | `im:message.group_at_msg:readonly` | 群组 @mention |
| 以应用的身份发消息 | `im:message:send_as_bot` | 发送消息 |

**通讯录相关**：
| 权限 | 权限 ID | 用途 |
|------|---------|------|
| 获取通讯录基本信息 | `contact:user.base:readonly` | 了解组织结构 |
| 获取部门基本信息 | `contact:department.base:readonly` | 了解部门信息 |

**日历相关**：
| 权限 | 权限 ID | 用途 |
|------|---------|------|
| 查看日历 | `calendar:calendar:readonly` | 查看会议日程 |
| 查看日程 | `calendar:calendar.event:readonly` | 查看日程详情 |

**云文档相关**（可选，Phase 2 再开）：
| 权限 | 权限 ID | 用途 |
|------|---------|------|
| 查看文档 | `docx:document:readonly` | 读取共享文档 |
| 查看电子表格 | `sheets:spreadsheet:readonly` | 读取共享表格 |

### 2.4 配置事件订阅

路径：**事件订阅** → **添加事件**

| 事件 | 事件类型 | 用途 |
|------|---------|------|
| 接收消息 | `im.message.receive_v1` | 监听新消息 |
| 消息已读 | `im.message.message_read_v1` | 消息状态（可选） |

**订阅方式选择**：

推荐 **WebSocket 模式**（OpenClaw 原生支持）：
- 不需要公网 URL / Webhook
- 适合本地运行（MacBook Pro）
- 稳定长连接

如果选 Webhook 模式：
- 需要一个可被飞书访问的 URL
- 可以用 Tailscale Funnel / ngrok 暴露本地端口

### 2.5 发布应用

1. 配置完成后，点击 **版本管理与发布** → **创建版本**
2. 提交审核（企业内部应用通常自动通过）
3. 管理员在管理后台 **应用审核** 中批准
4. 确认应用状态为 **已启用**

---

## 3. OpenClaw 端 — 飞书集成配置

### 3.1 环境变量配置

在 OpenClaw 的环境配置中添加飞书相关变量：

```bash
# 飞书/Lark 配置
# 国内飞书用 feishu，国际 Lark 用 lark
export FEISHU_APP_ID="cli_xxxxxxxxxxxxx"
export FEISHU_APP_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxx"

# 选择域名（二选一）
export FEISHU_DOMAIN="https://open.feishu.cn"     # 国内飞书
# export FEISHU_DOMAIN="https://open.larksuite.com"  # 国际 Lark

# WebSocket 模式（推荐）
export FEISHU_USE_WEBSOCKET=true
```

### 3.2 OpenClaw 飞书通道配置

在 OpenClaw 的配置文件中启用飞书通道：

```yaml
# openclaw.config.yaml 或等效配置文件
channels:
  feishu:
    enabled: true
    app_id: "${FEISHU_APP_ID}"
    app_secret: "${FEISHU_APP_SECRET}"
    domain: "${FEISHU_DOMAIN}"
    transport: websocket          # 推荐 WebSocket
    # transport: webhook          # 或 Webhook 模式
    # webhook_url: "https://your-domain.com/feishu/webhook"

    # 消息处理
    reply_in_thread: true         # 在话题中回复（保持对话整洁）
    support_rich_text: true       # 支持富文本消息
    support_card: true            # 支持卡片消息
    support_image: true           # 支持图片
    support_file: true            # 支持文件

    # 响应策略
    respond_to:
      - direct_message            # 回复 DM
      - group_mention             # 回复群组 @mention
    ignore:
      - bot_message               # 忽略其他 Bot 消息
```

### 3.3 配置用户白名单

在 OpenClaw 的 AGENTS.md 或等效安全配置中：

```yaml
# Clawbi 的飞书访问控制
feishu_access_control:
  allowlist:
    - name: "Erik"
      feishu_id: "erik_user_id"
      permission: full              # 完整权限
    - name: "Calvin"
      feishu_id: "calvin_user_id"
      permission: read_query        # 只能查询（Phase 2 开放）
    - name: "Kaylie"
      feishu_id: "kaylie_user_id"
      permission: read_query        # 只能查询（Phase 2 开放）

  # 未在白名单中的用户
  default_policy: ignore            # 忽略未授权用户的消息
```

---

## 4. 验证测试

### 4.1 基础连接测试

```
测试 1: 启动 OpenClaw 并检查飞书通道状态
  - 预期: 日志显示 "Feishu channel connected via WebSocket"
  - 如果失败: 检查 App ID / App Secret 是否正确

测试 2: 在飞书中给 Clawbi 发 DM "你好"
  - 预期: Clawbi 以设定的人设风格回复
  - 如果失败: 检查事件订阅是否正确配置

测试 3: 在群组中 @Clawbi "你是谁？"
  - 预期: Clawbi 回复自我介绍，风格匹配 01_Clawbi_Persona_and_Config.md
  - 如果失败: 检查权限 Scope 是否包含群组消息
```

### 4.2 功能测试

| # | 测试场景 | 操作 | 预期结果 |
|---|---------|------|---------|
| 1 | DM 对话 | 给 Clawbi 发 "HOORAY 有几个 BU？" | 准确回答 3BU+1 结构 |
| 2 | 群组 @mention | 在群里 @Clawbi "帮我看看今天的日程" | 回复 Erik 的日程（如已接日历） |
| 3 | 富文本 | 发送一段长文本问 Clawbi 总结 | 返回结构化摘要 |
| 4 | 卡片消息 | 触发 Morning Brief | 以卡片格式推送 Brief |
| 5 | 安全边界 | 用非白名单账号发消息 | 不回复 / 提示无权限 |

### 4.3 人设验证

- [ ] Clawbi 在飞书中是否符合设定的人设？
- [ ] 中英混用、先结论后细节的风格是否正确？
- [ ] 不确定时是否坦诚说"我不确定"？
- [ ] 是否出现"好的！没问题！"等不符合人设的回复？

---

## 5. 常见问题与排错

### Q1: WebSocket 连接断开怎么办？

**原因**：网络不稳定 / 飞书服务端主动断连
**解决**：OpenClaw 通常自带重连机制。检查日志：
```bash
# 查看 OpenClaw 日志
openclaw logs --channel feishu
```
如持续断连，检查防火墙/VPN 是否影响 WebSocket 连接。

### Q2: 收不到群组消息？

**检查清单**：
1. 应用是否已发布并启用？
2. `im:message.group_at_msg:readonly` 权限是否已开通？
3. Clawbi（应用）是否已被添加到该群组？
4. 事件订阅 `im.message.receive_v1` 是否已配置？

### Q3: 消息发送失败？

**检查清单**：
1. `im:message:send_as_bot` 权限是否已开通？
2. App Secret 是否正确？
3. 应用是否有发送消息的频率限制？

### Q4: 飞书 vs Lark 域名选错了？

| 版本 | 域名 | 说明 |
|------|------|------|
| 国内飞书 | `open.feishu.cn` | 中国大陆用户 |
| 国际 Lark | `open.larksuite.com` | 海外用户 |

确认你的组织用的是哪个版本，对应配置 `FEISHU_DOMAIN`。

### Q5: 员工席位 vs Bot 应用，我需要两个都配吗？

**是的**。架构如下：
```
飞书员工席位（clawbi@cyberflo.ai）
  → 提供"人"的身份（通讯录、日历、文档协作）
  → 团队成员看到的是"同事 Clawbi"

飞书自建应用（Clawbi Agent）
  → 提供"技术桥梁"（API 调用、消息收发、事件订阅）
  → OpenClaw 通过这个应用与飞书通信

两者结合 = Clawbi 以员工身份出现，通过应用能力实现自动化
```

---

## 6. 安全注意事项

| 事项 | 要求 |
|------|------|
| **App Secret** | 仅存放在 1Password "Shared with Clawbi" 保险箱，绝不硬编码 |
| **环境变量** | 使用 `.env` 文件管理，确保 `.env` 在 `.gitignore` 中 |
| **消息内容** | 飞书消息不应包含银行账号、密码等敏感信息 |
| **权限最小化** | 只开通当前需要的权限，Phase 2/3 再逐步扩展 |
| **审计** | 定期检查 OpenClaw 日志，确认无异常操作 |
| **凭证轮换** | 每月 rotate App Secret（与 1Password 配合） |

---

## 7. 实施清单

### 立即完成（Day 1）

- [ ] 在飞书管理后台确认 `clawbi@cyberflo.ai` 员工状态
- [ ] 设置 Clawbi 飞书显示名和头像
- [ ] 在飞书开放平台创建 "Clawbi Agent" 自建应用
- [ ] 获取 App ID + App Secret，存入 1Password
- [ ] 配置消息相关权限（`im:message` 系列）
- [ ] 配置事件订阅（`im.message.receive_v1`）
- [ ] 选择 WebSocket 模式
- [ ] 发布应用并在管理后台审批通过

### 接入测试（Day 2）

- [ ] 在 OpenClaw 中配置飞书环境变量
- [ ] 启动 OpenClaw，确认飞书通道连接成功
- [ ] 通过 DM 测试基础对话
- [ ] 通过群组 @mention 测试群聊响应
- [ ] 验证白名单访问控制

### 持续优化（Week 2+）

- [ ] 接入日历权限，支持日程查询
- [ ] 接入云文档权限，支持文档协作
- [ ] 配置卡片消息模板（Morning Brief 等）
- [ ] 开放 Calvin / Kaylie 的访问权限
- [ ] 收集团队反馈，调优响应风格

---

**Document Owner**: CEO
**Created**: 2026-02-11
**Version**: v0.1

> *"在飞书里看到 Clawbi 出现在通讯录的那一刻，*
> *她就不再是一个工具 — 她是团队的一员。"*
>
> **🦀 clawbi@cyberflo.ai — 飞书在线，随时待命。**
