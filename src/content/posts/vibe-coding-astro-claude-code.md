---
title: "使用 Claude Code 实现 Vibe Coding：从零构建 Astro 博客"
description: "记录使用 AI 辅助编程方式，通过自然语言对话完成一个 Astro 博客项目的完整过程。"
pubDate: 2026-03-30T10:00:00
hero: "https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800&q=80"
---

# 为什么选择 Vibe Coding？

传统的编程方式是：打开 IDE → 写代码 → 调试 → 修复 bug → 重复。

Vibe Coding 则完全不同：**说出你的想法，AI 帮你实现**。

## 核心理念

Vibe Coding 由 Andre Karpaty 首先提出，它的本质是：
- 用自然语言描述需求，而不是逐行编写代码
- AI 负责实现细节和语法
- 人类专注于产品设计和创意决策

## 适用场景

这种方式特别适合：

| 场景 | 说明 |
|------|------|
| 快速原型 | 几小时完成一个可用的项目 |
| 个人项目 | 独立开发者的效率利器 |
| 技术探索 | 学习新技术的实验田 |

---

# 技术选型：Astro + Claude Code

## 为什么是 Astro？

Astro 是一个专注于内容的静态站点生成器，它的核心优势：

- **零 JS 默认**：页面默认不发送 JavaScript，加载速度极快
- **内容集合**：内置的内容管理让博客开发变得简单
- **多框架支持**：可以混用 React、Vue、Svelte 组件

## 为什么是 Claude Code？

Claude Code 不仅是代码生成器，更是**理解意图的伙伴**：

当你说出"首页显示最近三条，See All 链接到全部文章列表"，它理解这是一个典型的博客首页模式，而不只是字面翻译。

---

# 项目初始化

## 创建项目

```bash
# 初始化 Astro 项目
pnpm create astro@latest blog --template basics

# 进入目录
cd blog
```

## 安装依赖

```bash
# 安装依赖
pnpm install

# 添加 Tailwind CSS
pnpm astro add tailwind
```

---

# Vibe Coding 实践

## 对话一：启动服务

> **我说**：启动开发服务器，让它监听所有网络接口，这样手机也能访问预览

Claude Code 立即理解了需求，执行：
```bash
pnpm dev --host 0.0.0.0
```

服务启动后，同一网络的设备都可以访问预览。

## 对话二：首页布局

> **我说**：首页默认显示最近三条文章，底部有一个 See All 链接跳转到全部文章列表页

Claude Code 分析后帮我完成了：

1. **创建 Content Collections**
   - 定义文章的数据结构
   - 设置内容目录

2. **实现排序逻辑**
   ```javascript
   const sortedPosts = posts.sort((a, b) =>
     new Date(b.data.pubDate).getTime() - new Date(a.data.pubDate).getTime()
   );
   const recentPosts = sortedPosts.slice(0, 3);
   ```

3. **创建路由文件**
   - `/pages/index.astro` - 首页
   - `/pages/posts/index.astro` - 列表页
   - `/pages/posts/[...slug].astro` - 详情页

## 对话三：样式调整

> **我说**：导航栏底部那条黑色波浪线去掉，边框颜色浅一点

几秒钟后，波浪 SVG 效果移除，边框改成了柔和的灰色 `border-gray-300`。

---

# 项目结构

项目完成后的目录结构：

```text
blog/
├── src/
│   ├── components/     # UI 组件
│   │   ├── Card.astro
│   │   ├── Nav.astro
│   │   └── SearchModal.astro
│   ├── content/
│   │   ├── config.ts  # 内容集合配置
│   │   └── posts/     # 博客文章
│   ├── layouts/
│   │   └── Layout.astro
│   └── pages/
│       ├── index.astro
│       ├── search.astro
│       └── posts/
│           ├── index.astro
│           └── [...slug].astro
├── public/
└── astro.config.mjs
```

---

# 部署上线

## 方式一：本地部署

```bash
# 构建生产版本
pnpm build

# 部署到 Cloudflare Pages
pnpm exec wrangler pages deploy dist --project-name=blog
```

## 方式二：GitHub Actions 自动部署

配置好 Secrets 后，推送到 `main` 分支自动触发部署流程：

```yaml
# .github/workflows/deploy.yml 核心配置
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: pnpm
      - run: pnpm install
      - run: pnpm build
      - run: pnpm exec wrangler pages deploy dist
```

---

# 成果与收获

## 完成的功能

通过 Claude Code 辅助，我在约 **30 分钟** 内完成了：

- 博客基础框架和响应式设计
- 全文搜索弹窗（Raycast 风格）
- 文章列表和详情页
- CI/CD 自动化部署

## 关键认知

> **学会提问比学会编码更重要**

传统的编程方式下，这些功能可能需要一整天。但通过 Vibe Coding：

| 传统方式 | Vibe Coding |
|----------|-------------|
| 查文档 | 直接描述需求 |
| 写模板代码 | AI 生成 |
| 调试排错 | AI 修复 |

---

*本文使用 Vibe Coding 方式编写，AI 辅助完成了 90% 的代码工作。*
