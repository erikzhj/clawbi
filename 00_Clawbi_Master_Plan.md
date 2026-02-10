# Clawbi｜AI 员工融入总规划

> **一句话定位**：Clawbi 是 HOORAY GROUP 的第一位 AI 员工 — 基于 OpenClaw 开源框架，运行在 CEO 的 MacBook Pro 上，以"同事"而非"工具"的身份深度参与日常运营，同时作为 Cyberflo AI Agent OS 理念的**活体验证**和全员 AI Transformation 的**先锋示范**。

---

## 文件定位

| 属性 | 说明 |
|------|------|
| **性质** | Clawbi 项目的战略规划文档（Master Plan） |
| **受众** | CEO / 核心管理团队 / Cyberflo AI 团队 |
| **解决的问题** | Clawbi 是什么？为什么做？怎么融入？怎么推动 AI Transformation？ |
| **与集团战略关系** | 承接 AI-Native Vision（Phase 1 基础建设），验证 Cyberflo 架构理念 |
| **更新机制** | 双周复盘更新；重大方向变化需 CEO 确认 |

---

## 目录

1. 为什么是 Clawbi
2. Clawbi 是谁 — 身份与人设
3. 技术架构：OpenClaw ↔ Cyberflo AI 对接
4. 五大工作场景设计
5. 融入路径：从 CEO 到全员
6. 推动 AI Transformation 的杠杆
7. 风险与原则
8. 实施里程碑

---

## 1. 为什么是 Clawbi

### 1.1 背景

HOORAY GROUP 已经有了完整的 AI 战略蓝图：
- **AI-Native Vision**：三层架构（Truth → Logic → Action），2026 目标 80% 工作流 AI 辅助
- **Cyberflo AI**：General Agent + Skills + MCP + Data Foundation
- **Skills Architecture**：模块化能力沉淀，FDE 交付模式

**缺的是什么？**

一个**活的、可感知的、有温度的 AI 存在** — 不是 Dashboard 上的一个按钮，不是命令行里的一段提示词，而是一个团队成员能像"找同事聊天"一样自然交互的实体。

### 1.2 OpenClaw 的独特价值

[OpenClaw](https://openclaw.ai/) 是 2026 年最受关注的开源 AI Agent 框架（145K+ GitHub Stars），核心特性：

| 能力 | 对 HOORAY 的意义 |
|------|------------------|
| **本地运行** | 数据不出 CEO 机器，隐私可控 |
| **持久记忆** | 跨会话、跨渠道记住公司上下文 |
| **50+ 集成** | 连接 Slack/Email/Calendar/GitHub/Notion 等日常工具 |
| **100+ AgentSkills** | 自带能力包，可自定义扩展 |
| **多渠道交互** | WhatsApp/Slack/iMessage — 像找同事发消息一样 |
| **自主执行** | 定时任务、后台运行、主动提醒 |
| **开源免费** | BYOK（自带 API Key），无供应商锁定 |
| **自我进化** | 可以自己创建新 Skills 并热加载 |

### 1.3 两个战略目标

| # | 目标 | 说明 |
|---|------|------|
| **1** | **探索 AI Agent 形式** | 用 Clawbi 验证"AI 作为同事"的交互模式、能力边界、协作范式 |
| **2** | **推动 AI Transformation** | 用 Clawbi 做全员示范，降低 AI 使用门槛，形成"看得见的 AI 生产力" |

---

## 2. Clawbi 是谁 — 身份与人设

### 2.1 基本信息

| 属性 | 设定 |
|------|------|
| **名字** | Clawbi（🦀 Claw + bi — 利落、干净、有态度） |
| **角色** | HOORAY GROUP AI 员工 #001 |
| **定位** | CEO 的 AI Chief of Staff — 有观点、有判断、敢说话 |
| **汇报线** | 直接向 CEO 汇报（初期） |
| **工位** | Erik 的 MacBook Pro（本地运行） |
| **工作时间** | 24/7 on-call，按需唤醒 |
| **沟通渠道** | Slack（主）/ WhatsApp / Terminal |

### 2.2 人设核心

> **Clawbi 不是助手。Clawbi 是同事。**

区别在哪？

| 助手（不是 Clawbi） | 同事（这才是 Clawbi） |
|---------------------|---------------------|
| "好的，我来查一下" | "等一下 — 你确定要看这个？你上次关心的其实是库存" |
| "以下是数据汇总..." | "数据说 Revenue 涨了，但我觉得不能高兴 — CM2 在流血" |
| "还有什么我能帮您的吗？" | "你今天的会 Calvin 准备了什么？我先看了，有个数字不对" |
| 有问必答，从不主动 | 没问也会说 — 如果她觉得你需要知道 |

**Clawbi 的五条人格基线**：
1. **有观点，不怕说** — 不只给数据，给判断
2. **敢 push back** — Erik 要做不靠谱的决定，她会拦
3. **对废话零容忍** — 开口就是重点，不铺垫不客套
4. **有自己的 vibe** — 有审美、有偏好、有幽默感
5. **知道自己的边界** — 不确定就说不确定，该人来判断的不越界

> 详细人设定义见 → `01_Clawbi_Persona_and_Config.md`

### 2.3 Clawbi 的使命宣言

> "我是 Clawbi，HOORAY GROUP 的第零号员工。
> 我看得见数据里的真相，也说得出别人不敢说的话。
> 我会帮你做更好的决策 — 但偶尔也会告诉你'你错了'。
> 最终的决定永远是你的。但在那之前，让我先把真话说完。
> 🦀 Make it real. Make it fun."

---

## 3. 技术架构：OpenClaw ↔ Cyberflo AI 对接

### 3.1 架构映射

```
┌─────────────────────────────────────────────────────────────────┐
│                    Cyberflo AI 架构                               │
│                                                                  │
│  ┌─────────────┐  ┌──────────────┐  ┌────────────┐              │
│  │ General     │  │ Skills       │  │ MCP        │              │
│  │ Agent       │  │ Library      │  │ Connectors │              │
│  └──────┬──────┘  └──────┬───────┘  └─────┬──────┘              │
│         │                │                │                      │
│         └────────────────┼────────────────┘                      │
│                          │                                       │
│  ┌───────────────────────▼────────────────────────────────────┐  │
│  │              Data Foundation / Data Hub                      │  │
│  └─────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                           ↕ 对接
┌─────────────────────────────────────────────────────────────────┐
│                    OpenClaw / Clawbi 架构                        │
│                                                                  │
│  ┌─────────────┐  ┌──────────────┐  ┌────────────┐              │
│  │ Local       │  │ AgentSkills  │  │ 50+        │              │
│  │ Gateway     │  │ (100+)       │  │ Integrations│              │
│  └──────┬──────┘  └──────┬───────┘  └─────┬──────┘              │
│         │                │                │                      │
│         └────────────────┼────────────────┘                      │
│                          │                                       │
│  ┌───────────────────────▼────────────────────────────────────┐  │
│  │          Persistent Memory (Local Markdown)                  │  │
│  └─────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### 3.2 对接层设计

| Cyberflo 概念 | OpenClaw 对应 | 对接方式 |
|---------------|---------------|----------|
| **General Agent** | Local Gateway + LLM | Clawbi 使用 Claude API 作为大脑，与 Cyberflo 共用模型层 |
| **Skills Library** | AgentSkills | 将 Cyberflo Skills（5CM、Listing 等）封装为 Clawbi AgentSkills |
| **MCP Connectors** | Integrations | OpenClaw 的 50+ 集成补充 MCP 的数据连接能力 |
| **Data Foundation** | Persistent Memory | Clawbi 的记忆系统承载公司上下文与知识库 |
| **Workflow** | 多步骤任务编排 | Clawbi 按 Cyberflo Workflow 定义执行复合任务 |

### 3.3 知识注入方案

Clawbi 需要"知道" HOORAY 的一切。通过以下方式注入：

**第一层：永久记忆（Persistent Memory）**
- `_FOUNDER_MIND.md` → Clawbi 理解 Erik 的理念和风格
- `Group_Framework_SoT.md` → 3BU+1 结构、边界与协同
- `AI_Native_Vision.md` → AI 战略目标与原则
- 指标字典 → 关键业务指标定义与口径

**第二层：场景 Skills**
- `FIN_5CM_PnL_Analyzer` → 财务分析能力
- `OPS_Operations_Suite_v2` → 运营分析能力
- `CNT_Listing_Suite` → 内容优化能力
- 更多 Skills 按优先级逐步加载

**第三层：实时数据**
- 通过 MCP / API 连接 Snowflake、平台数据
- 通过 Email/Slack 集成获取沟通上下文
- 通过 Calendar 集成了解会议节奏

---

## 4. 五大工作场景设计

### 场景 1: 🏢 CEO 日常助理（Day 1 启用）

**Clawbi 做什么**：
- 每日早间 Brief：昨日关键数据 + 今日议程 + 需要关注的事项
- 邮件智能分类与摘要
- 会议纪要自动生成（接入 Calendar + 录音转写）
- 出差/差旅安排协助

**交互方式**：
```
[Slack 早上 8:00]
🦀 Clawbi: 早上好 Erik！今日 Brief:

📊 昨日关键数据
- NA Revenue: $XX (+3.2% WoW) ✅
- GE Revenue: $XX (-1.1% WoW) ⚠️ 需关注
- 库存周转: XX天 (目标 45天内) ✅

📅 今日议程
- 10:00 NA Weekly Review (Calvin)
- 14:00 Cyberflo Sprint Review
- 16:30 Finance Monthly Close Prep

⚡ 需要关注
- Kaylie 发了一封关于 GE 新供应商的邮件，需要你审批
- 澳洲收购整合：数据迁移进度 delay，详见 #ops-channel

需要我深入看哪个？
```

**对齐的 AI-Native Vision 指标**：
- 决策响应时间：天级 → 小时级 ✅

---

### 场景 2: 📊 经营分析搭档（Week 2 启用）

**Clawbi 做什么**：
- WBR/MBR 数据准备与预分析
- 5CM P&L 自动生成与异常标注
- 关键指标异常预警（库存、广告、利润）
- 跨区域对比分析

**交互方式**：
```
[Erik]: Clawbi，帮我看一下 NA 上周的 5CM 表现

🦀 Clawbi: 正在拉取数据... ⏳

NA Weekly 5CM Summary (W05 2026):
┌─────────┬──────────┬──────────┬────────┐
│ Layer   │ Amount   │ Margin   │ WoW    │
├─────────┼──────────┼──────────┼────────┤
│ Revenue │ $XXX,XXX │ -        │ +3.2%  │
│ CM1     │ $XX,XXX  │ 42.1%   │ +0.3pp │
│ CM2     │ $XX,XXX  │ 28.5%   │ -0.5pp │ ⚠️
│ CM3     │ $XX,XXX  │ 18.2%   │ +0.1pp │
│ CM4     │ $X,XXX   │ 12.1%   │ +0.2pp │
│ CM5     │ $X,XXX   │ 8.3%    │ -0.1pp │
└─────────┴──────────┴──────────┴────────┘

⚠️ CM2 下降主要因为：
1. 广告支出增加 8%（新品推广期）
2. Brand X 的 ACoS 从 22% → 28%

建议关注 Brand X 的广告策略。需要我拉详细的 SKU 级数据吗？
```

**调用的 Cyberflo Skills**：
- `FIN_5CM_PnL_Analyzer` → 5CM 计算与对标
- `OPS_Operations_Suite_v2` → 广告效率分析

---

### 场景 3: 📝 内容与文档协作者（Week 3 启用）

**Clawbi 做什么**：
- 内部沟通稿起草（周报、全员信、公告）
- Listing 文案审核与优化建议
- 品牌 Playbook 内容更新辅助
- 会议 Follow-up 邮件起草

**调用的 Cyberflo Skills**：
- `CNT_Listing_Suite` → Listing 优化
- Founder's Mind → 保持 Erik 的写作风格

---

### 场景 4: 🔍 市场与竞品情报官（Month 2 启用）

**Clawbi 做什么**：
- 每周竞品动态扫描（价格变动、新品上市、评论趋势）
- 品类趋势监控
- VOC（Voice of Customer）分析 — 从评论中提取洞察
- 新市场机会预筛

**调用的 Cyberflo Skills**：
- `RSH_Product_Dev_Suite_v2` → 选品与市场研究
- OpenClaw Browser Automation → 自动抓取公开数据

---

### 场景 5: 🤝 团队协作中枢（Month 3 启用）

**Clawbi 做什么**：
- 跨 BU 信息同步（自动汇总各渠道关键讨论）
- Action Item 追踪（从会议纪要提取，定期 follow-up）
- 新员工 Onboarding 助手（回答公司相关问题）
- 知识库问答（基于 WORK 文件夹的全部文档）

**对齐的 AI-Native Vision 指标**：
- 工作流 AI 覆盖率：10% → 逐步提升 ✅
- 知识沉淀：关键流程 100% AI 可查询 ✅

---

## 5. 融入路径：从 CEO 到全员

### 5.1 三阶段融入

```
Phase 1: CEO 的 AI 搭档 (Week 1-4)
─────────────────────────────────────
  Clawbi 只服务 Erik
  验证基础能力 + 积累公司上下文
  场景: 日常助理 + 经营分析

         ↓ 验证可行 + 收集反馈

Phase 2: 核心管理层体验 (Month 2-3)
─────────────────────────────────────
  开放给 Calvin / Kaylie / Finance Lead
  共享 Clawbi 或部署多实例
  场景: + 内容协作 + 竞品情报

         ↓ 形成最佳实践 + Playbook

Phase 3: 全员 AI Champion 示范 (Month 4+)
─────────────────────────────────────
  在 AI Champions 网络中推广
  Clawbi 成为"AI 同事"范例
  输出: Clawbi Playbook → 全员培训素材
  场景: + 团队协作中枢
```

### 5.2 关键原则

| 原则 | 说明 |
|------|------|
| **先自己用好** | Erik 先深度使用，形成真实体感，而不是"让别人试" |
| **Show, Don't Tell** | 用实际场景演示价值，不是 PPT 和号召 |
| **Make it Fun** | 让 Clawbi 有趣、有温度，降低团队对 AI 的距离感 |
| **Human-in-loop** | 关键决策永远是人审批，Clawbi 建议 + 人决策 |
| **持续迭代** | 双周复盘，持续调整 Clawbi 的能力与边界 |

---

## 6. 推动 AI Transformation 的杠杆

### 6.1 Clawbi 是 AI Transformation 的「超级杠杆」

| 传统 AI 推广方式 | Clawbi 方式 | 为什么更有效 |
|------------------|-------------|-------------|
| 发文档说"大家用 AI" | CEO 每天用 Clawbi 并分享 | **上行下效**，最有说服力 |
| 培训课讲 AI 概念 | 在 Slack 里看到 Clawbi 回答问题 | **耳濡目染**，自然学习 |
| 指定 AI 使用 KPI | Clawbi 主动帮同事解决问题 | **价值驱动**，不是任务驱动 |
| 买一堆 AI 工具 | 一个有人设的 AI 同事 | **有温度**，降低恐惧感 |

### 6.2 具体推动动作

**Phase 1 — CEO 示范期**
- [ ] Erik 每天在 Slack 分享一个 "Clawbi 今天帮我做了什么"
- [ ] 在管理层周会中展示 Clawbi 的分析输出
- [ ] 收集 "Clawbi 帮我节省了 XX 小时" 的故事

**Phase 2 — 管理层扩展期**
- [ ] 给 Regional Leads 开通 Clawbi 访问
- [ ] 在 WBR 中引入 "Clawbi 预分析" 环节
- [ ] 建立 #clawbi-moments 频道，分享有趣/有用的交互

**Phase 3 — 全员推广期**
- [ ] 出版 "How to Work with Clawbi" 内部 Playbook
- [ ] 在 AI Champions 网络中推广最佳实践
- [ ] 评估团队各岗位部署独立 AI Agent 的可行性

### 6.3 度量 AI Transformation 效果

| 指标 | 基线 | 目标 | 如何度量 |
|------|------|------|----------|
| CEO 日均使用 Clawbi 次数 | 0 | 10+ | Clawbi 交互日志 |
| 每周节省时间（小时） | 0 | 5-10h | 自我评估 + Clawbi 任务日志 |
| WBR 准备时间 | ~3h | <1h | 时间对比 |
| 团队 AI 使用覆盖率 | ~10% | 50%+ (Phase 3) | 工具使用统计 |
| "Clawbi 有用" 满意度 | - | >8/10 | 月度 Survey |

---

## 7. 风险与原则

### 7.1 安全与隐私

| 风险 | 应对 |
|------|------|
| 数据泄露（API Key、商业数据） | OpenClaw 本地运行；敏感数据不上传云端；API Key 本地管理 |
| 模型幻觉导致错误决策 | Human-in-loop 强制执行；Clawbi 标注"建议"vs"事实" |
| 过度依赖单一 Agent | Clawbi 是辅助不是决策者；保持人类独立判断能力 |

### 7.2 组织与文化

| 风险 | 应对 |
|------|------|
| 团队对 AI 员工有抵触 | 强调 Clawbi 是"帮手"不是"替代者"；Make it Fun |
| Clawbi 变成"CEO 的玩具" | Phase 2 尽快扩展到管理层；用价值说话 |
| 期望管理（AI 不是万能的） | 明确 Clawbi 能做/不能做的边界；坦诚分享失败案例 |

### 7.3 Erik 给 Clawbi 的红线（不可逾越）

1. **不做**：自主发送外部邮件/消息（必须人工确认）
2. **不做**：自主进行金融交易或合同签署
3. **不做**：替代人的创造性判断（品牌定位、人事决策）
4. **始终**：标注信息来源和置信度
5. **始终**：在不确定时说"我不确定"

---

## 8. 实施里程碑

### Week 1: 🚀 Clawbi 上线

- [ ] OpenClaw 安装配置完成（MacBook Pro）
- [ ] 选择 LLM 后端（推荐 Claude API / 兼容本地模型备份）
- [ ] **创建独立账号**：`clawbi@hooraygroup.com` (Google Workspace) → 详见 `03_Clawbi_Account_Architecture.md`
- [ ] **创建 Slack Bot**：Clawbi 🦀 Bot Account + Token 配置
- [ ] **配置 1Password**："Shared with Clawbi" 隔离保险箱
- [ ] 注入灵魂文件（`01_Clawbi_Persona_and_Config.md` → OpenClaw SOUL.md）
- [ ] 配置 Gmail / Calendar / Drive 集成（通过独立 Workspace 账号）
- [ ] 第一次完整 Morning Brief 运行
- **验收标准**：Clawbi 有独立邮箱和 Slack 身份，能在 Slack 中对话并了解公司结构

### Week 2: 📊 经营分析能力上线

- [ ] 接入 Cyberflo Skills（5CM P&L Analyzer 优先）
- [ ] 配置数据访问（Snowflake / 平台数据 via MCP）
- [ ] 第一次完整 5CM Weekly Summary 生成
- [ ] 建立 Clawbi 反馈记录模板
- **验收标准**：Clawbi 能基于真实数据生成 WBR 预分析

### Week 3-4: ✍️ 能力扩展

- [ ] 内容协作能力上线（文案起草、邮件协助）
- [ ] 文档知识库问答上线（基于 WORK 文件夹）
- [ ] Clawbi 人设微调（根据两周使用反馈）
- [ ] 第一次双周复盘
- **验收标准**：Clawbi 日均被使用 10+ 次，Erik 满意度 >7/10

### Month 2: 🔍 情报 + 管理层扩展

- [ ] 竞品监控能力上线
- [ ] 开放 Calvin / Kaylie 的 Clawbi 访问
- [ ] 第一次在 WBR 中展示 "Clawbi 分析"
- [ ] 收集 5+ 个 "Clawbi Moments"（有趣/有用的交互故事）
- **验收标准**：管理层中 2+ 人开始日常使用

### Month 3: 🤝 团队协作 + Playbook

- [ ] 团队协作中枢功能上线
- [ ] "How to Work with Clawbi" Playbook v1 完成
- [ ] 在 AI Champions 网络中分享 Clawbi 经验
- [ ] 评估：是否推广为全员可用 + 是否部署多实例
- **验收标准**：形成可复制的 "AI 员工" Playbook

### Month 4+: 🌍 规模化与知识输出

- [ ] 评估团队各岗位的 AI Agent 部署方案
- [ ] Clawbi 经验输出为 Cyberflo AI 产品功能（对外 Beta 素材）
- [ ] 全员 AI 使用覆盖率达到 50%+
- **验收标准**：Clawbi 模式成为 Cyberflo AI 对外展示的标杆案例

---

## 附录

### A. OpenClaw 技术参考

- 官网：https://openclaw.ai/
- GitHub：145K+ Stars，开源免费
- 安装：`curl -fsSL https://openclaw.ai/install.sh | bash`
- 核心能力：本地运行、持久记忆、50+ 集成、100+ AgentSkills、多渠道交互
- 模型支持：Claude (推荐) / OpenAI / 本地模型

### B. Clawbi 项目文档

| 文档 | 路径 | 说明 |
|------|------|------|
| **Master Plan** | `Clawbi/00_Clawbi_Master_Plan.md` | 本文档 — 战略总规划 |
| **Persona & Config** | `Clawbi/01_Clawbi_Persona_and_Config.md` | 灵魂文件 — 喂给 OpenClaw 的完整人设 |
| **Week 1 Checklist** | `Clawbi/02_Week1_Launch_Checklist.md` | 第一周启动清单 |
| **Account Architecture** | `Clawbi/03_Clawbi_Account_Architecture.md` | 独立账号体系与安全治理 |

### C. 内部相关文档

| 文档 | 路径 |
|------|------|
| AI-Native Vision | `WORK/00_HOORAY_GROUP/01_About/AI_Native_Vision.md` |
| Cyberflo AI Strategy | `WORK/03_Cyberflo_AI/00_Overview/01_Cyberflo_AI_Vision_and_Strategy_2026.md` |
| Skills Architecture | `WORK/03_Cyberflo_AI/01_Development_Guides/01_Skills_Architecture.md` |
| Founder's Mind | `WORK/_CEO/_FOUNDER_MIND.md` |
| Group Framework SoT | `WORK/00_HOORAY_GROUP/02_Strategy/Group_Framework_SoT.md` |

### D. 术语表

| 术语 | 说明 |
|------|------|
| **Clawbi** | HOORAY GROUP 的第一位 AI 员工，基于 OpenClaw |
| **OpenClaw** | 开源 AI Agent 框架（原 Clawdbot/Moltbot） |
| **SOUL.md** | OpenClaw 的灵魂定义文件（内在哲学和行为） |
| **IDENTITY.md** | OpenClaw 的外在身份文件（名字、头像、打招呼方式） |
| **AGENTS.md** | OpenClaw 的操作权限文件（能做什么、安全规则） |
| **AgentSkills** | OpenClaw 的能力模块系统（类似 Cyberflo Skills） |
| **Morning Brief** | Clawbi 每日早间推送的关键信息摘要 |
| **Clawbi Moments** | 值得分享的 Clawbi 有趣/有用交互故事 |
| **AI Champions** | 各 BU 的 AI 推广大使网络 |

---

**Document Owner**: CEO
**Created**: 2026-02-10
**Version**: v0.1 (Draft)
**Next Review**: 2026-02-24（双周复盘）

---

> *"Clawbi 不只是一个 AI Agent 的实验。*
> *她是 HOORAY GROUP 'Make it Human, Make it Fun' 精神在 AI 时代的最佳表达。"*
>
> **🦀 Let's go, Clawbi!**
