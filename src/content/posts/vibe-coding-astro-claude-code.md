---
title: "使用 Claude Code 实现 Vibe Coding：从零构建 Astro 博客"
description: "记录使用 AI 辅助编程方式，通过自然语言对话完成一个 Astro 博客项目的完整过程。"
pubDate: 2026-03-30T10:00:00
hero: "https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=800&q=80"
---

## 什么是 Vibe Coding？

Vibe Coding 是一种新型的编程方式，由 Andre Karpaty 首先提出。它的核心理念是：**用自然语言与 AI 协作，通过对话和感觉来驱动开发**，而不是传统的逐行编写代码。

你可以把想法说出来，AI 会帮你实现。这种方式特别适合：

- 快速原型开发
- 个人项目和小工具
- 学习新技术的过程中探索

## 为什么选择 Astro + Claude Code？

### Astro：内容为王

Astro 是一个专注于内容驱动的静态站点生成器。它默认不发送 JavaScript 到客户端，所以页面加载极快，特别适合博客场景。

### Claude Code：更懂你的 AI 助手

Claude Code 不仅能生成代码，还能理解你的意图。当你说"首页显示最近三条，See All 链接到全部文章列表"，它能理解这是一个典型的博客首页模式。

## 项目初始化

```bash
# 创建新项目
pnpm create astro@latest blog --template basics

# 进入目录
cd blog

# 添加 Tailwind CSS
pnpm astro add tailwind
```

## Vibe Coding 实践

### 第一轮对话

> "启动开发服务器，让它监听所有网络接口，这样手机也能访问预览"

Claude Code 理解了需求，生成了 `pnpm dev --host` 命令。

### 第二轮对话

> "首页默认显示最近三条文章，底部有一个 See All 链接跳转到全部文章列表页"

Claude Code 帮我们：
1. 创建了 Content Collections 来管理文章
2. 实现了按日期排序的逻辑
3. 创建了动态路由和列表页

### 第三轮对话

> "导航栏底部那条黑色波浪线去掉，边框颜色浅一点"

几秒钟后，波浪效果移除，边框改成了灰色。

## 项目结构

```
blog/
├── src/
│   ├── components/     # 组件
│   │   ├── Card.astro
│   │   ├── Nav.astro
│   │   └── SearchModal.astro
│   ├── content/
│   │   └── posts/     # 博客文章
│   ├── layouts/
│   │   └── Layout.astro
│   └── pages/
│       ├── index.astro
│       ├── posts/
│       └── search.astro
├── public/
└── astro.config.mjs
```

## 部署到 Cloudflare Pages

```bash
# 构建
pnpm build

# 部署
pnpm exec wrangler pages deploy dist --project-name=blog
```

或者配置 GitHub Actions，推送到 main 分支自动部署。

## 总结

Vibe Coding 不是让 AI 完全替代程序员，而是让 AI 处理那些重复性的实现工作，程序员则专注于产品和创意。

通过 Claude Code，我在大约半小时内完成了：
- ✅ 博客基础框架
- ✅ 响应式设计
- ✅ 搜索功能
- ✅ CI/CD 自动化部署

这在传统编程方式下可能需要一整天。

**关键收获**：学会提问比学会编码更重要。清晰的描述 + AI = 高效开发。

---

*本文使用 Vibe Coding 方式编写，AI 辅助完成了 90% 的代码工作。*
