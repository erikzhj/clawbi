# Clawbi Week 1 Launch Checklist 🚀

> **目标**：让 Clawbi 在 Erik 的 MacBook Pro 上运行起来，完成基础配置，
> 实现第一次 Morning Brief 推送，验证"AI 同事"的基本交互体验。

---

## Day 1: 安装与基础配置

### 1.1 OpenClaw 安装

- [ ] 确认 MacBook Pro 系统环境（macOS 版本、Node.js、npm）
- [ ] 安装 OpenClaw
  ```bash
  curl -fsSL https://openclaw.ai/install.sh | bash
  ```
- [ ] 验证安装成功
  ```bash
  openclaw --version
  ```
- [ ] 首次启动，完成初始化引导

### 1.2 LLM 配置

- [ ] 配置 Anthropic Claude API Key（推荐，与 Cyberflo 统一模型层）
  ```bash
  export ANTHROPIC_API_KEY="sk-ant-xxx"
  ```
- [ ] （可选）配置备用模型（OpenAI / 本地模型）
- [ ] 测试基础对话能力 — 发一条消息确认连通

### 1.3 Clawbi 命名与人设注入

- [ ] 在 OpenClaw 的 persona 配置中设置名称为 "Clawbi"
- [ ] 注入人设文件：`01_Clawbi_Persona_and_Config.md` 的核心人设段落
- [ ] 注入 Founder's Mind 核心理念（Make it Human, Make it Fun）
- [ ] 测试：问 Clawbi "你是谁？" — 确认她能用正确的人设回答

---

## Day 2: 知识注入与集成

### 2.1 知识注入（Persistent Memory）

- [ ] 将以下文件导入 Clawbi 的记忆系统：
  - `_CEO/_FOUNDER_MIND.md` — 创始人理念
  - `00_HOORAY_GROUP/01_About/AI_Native_Vision.md` — AI 战略
  - `00_HOORAY_GROUP/02_Strategy/Group_Framework_SoT.md` — 集团架构
  - `01_Hooray_Commerce/README.md` — Commerce 概览
  - `02_Yeaday_Brands/README.md` — Brands 概览
- [ ] 测试：问 Clawbi "HOORAY GROUP 有几个 BU？各自做什么？"
- [ ] 测试：问 Clawbi "Erik 最看重的价值观是什么？"
- [ ] 验证回答准确性，如有偏差，调整记忆权重

### 2.2 Slack 集成

- [ ] 配置 Slack Bot 或通过 OpenClaw 的 Slack 集成连接
- [ ] 设置 Clawbi 在 Slack 中的显示名和头像（🦀）
- [ ] 测试 DM 对话功能
- [ ] 测试 Channel 中 @Clawbi 的响应
- [ ] 设置 Slack 通知偏好（DM always, Channel on-mention）

### 2.3 Email 集成

- [ ] 配置 Gmail 集成（只读权限先行）
- [ ] 测试邮件摘要功能 — "Clawbi，今天有什么重要邮件？"
- [ ] 测试邮件搜索功能 — "找一下 Kaylie 上周发的关于 GE 供应商的邮件"

### 2.4 Calendar 集成

- [ ] 配置 Google Calendar 集成（只读权限先行）
- [ ] 测试日程查询 — "Clawbi，我今天有什么会？"
- [ ] 测试会议准备提醒功能

---

## Day 3-4: Morning Brief 搭建

### 3.1 设计 Morning Brief 模板

```
🦀 Clawbi Morning Brief | {Date}

📊 昨日关键数据
- NA Revenue: $XXX (+X.X% WoW)
- GE Revenue: $XXX (+X.X% WoW)
- AP Revenue: $XXX (+X.X% WoW)
- 库存周转: XX天

📅 今日议程
- {时间} {会议名称} ({参与者})
- ...

📧 重要邮件 (X封需关注)
- {发件人}: {主题} — {一句话摘要}
- ...

⚡ 需要关注
- {异常或重要事项}
- ...

🎯 今日建议
- {基于数据和议程的 1-2 条建议}

—
Have a great day! 🎊
```

### 3.2 配置定时推送

- [ ] 设置 Morning Brief 定时任务（每日 08:00 HKT）
- [ ] 如数据接口尚未就绪，先用模拟数据/手动输入的方式
- [ ] 测试完整 Brief 推送流程
- [ ] 根据 Erik 反馈调整模板格式

### 3.3 数据源对接（可延后到 Week 2）

- [ ] 评估当前可用的数据源（Snowflake / 平台 API / Excel 导出）
- [ ] 如有 MCP Connector，配置数据拉取
- [ ] 如暂无自动数据源，设计"手动喂数据"的临时流程
  - 例如：每天把 Excel 放到指定文件夹，Clawbi 自动读取

---

## Day 5: 文件系统与知识库

### 5.1 WORK 文件夹访问

- [ ] 配置 Clawbi 对 WORK 文件夹的只读访问
- [ ] 测试文档查询 — "Clawbi，帮我找一下 Yeaday 的品牌 Playbook"
- [ ] 测试知识问答 — "HOORAY 的 5CM 框架是什么？"
- [ ] 测试文件搜索 — "最近更新过的 Strategy 文档有哪些？"

### 5.2 安全边界确认

- [ ] 确认 Clawbi 不能访问 WORK 以外的敏感目录
- [ ] 确认文件写入需要 Erik 确认
- [ ] 测试安全边界 — 尝试让 Clawbi 访问不该访问的内容，确认被拒绝

---

## Day 6-7: 综合测试与调优

### 6.1 综合场景测试

- [ ] **场景 A**：Morning Brief 完整运行（定时推送 → Slack）
- [ ] **场景 B**：数据查询（"上周 NA 表现怎么样？"）
- [ ] **场景 C**：文档协作（"帮我起草一封给团队的周报"）
- [ ] **场景 D**：邮件处理（"Kaylie 的邮件说了什么？帮我回一下"）
- [ ] **场景 E**：知识问答（"HOORAY 的年度战略优先级是什么？"）

### 6.2 人设验证

- [ ] Clawbi 是否符合设定的人设？（专业、亲和、有幽默感）
- [ ] 沟通风格是否对？（中英混用、先结论后细节）
- [ ] 在不确定时是否会坦诚说"我不确定"？
- [ ] 是否有过度道歉或过度正式的问题？

### 6.3 记录与反馈

- [ ] 记录 Week 1 所有交互的亮点和问题
- [ ] 评分：总体满意度（1-10）
- [ ] 列出 Week 2 优先改进项
- [ ] 决定是否继续推进 Week 2 计划

---

## Week 1 验收标准

| 标准 | 具体要求 | 通过？ |
|------|----------|--------|
| **Clawbi 能对话** | 在 Slack 中自然对话，回复 <30 秒 | ☐ |
| **Clawbi 知道公司** | 准确回答公司结构、战略、文化问题 | ☐ |
| **Morning Brief 运行** | 至少成功推送 3 次 Morning Brief | ☐ |
| **邮件摘要可用** | 能查询和摘要 Gmail 邮件 | ☐ |
| **文档查询可用** | 能基于 WORK 文件夹回答问题 | ☐ |
| **人设正确** | 风格匹配设定，不冰冷不官僚 | ☐ |
| **Erik 满意度 >7/10** | 整体体验评分 | ☐ |

---

## 遇到问题怎么办

| 问题 | 建议 |
|------|------|
| 安装失败 | 检查 Node.js 版本；参考 OpenClaw GitHub Issues |
| API 连接超时 | 检查网络；确认 API Key 有效 |
| 记忆注入不完整 | 分批注入；检查文件格式兼容性 |
| Slack 集成报错 | 确认 Bot Token 权限；参考 OpenClaw Slack 文档 |
| 人设偏差 | 调整 persona 配置；增加更多示例对话 |
| 数据接口未就绪 | 先用手动/模拟数据；Week 2 再接真实数据 |

---

**完成后的下一步**：→ 进入 Week 2: 经营分析能力上线（接入 5CM Skills + 真实数据）

---

> *"万事开头难，但 Clawbi 的第一步只需要一行命令。*
> *剩下的，我们一起迭代。"*
>
> **🦀 curl -fsSL https://openclaw.ai/install.sh | bash**
