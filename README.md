# Blog

一个使用 **Astro 6** 构建的个人博客项目，采用 **Vibe Coding** 方式，通过 **Claude Code** AI 助手协助开发，部署在 **Cloudflare Pages**。

## Tech Stack

- **Framework**: Astro 6.x
- **Styling**: Tailwind CSS v4
- **Hosting**: Cloudflare Pages
- **AI Assistant**: Claude Code (via Anthropic)

## 开发方式

本项目采用 Vibe Coding 理念 - 以 AI 助手为核心，通过自然语言对话驱动开发。

```bash
# 启动开发服务器
pnpm dev

# 构建生产版本
pnpm build

# 预览构建结果
pnpm preview
```

## 部署

### GitHub Actions

推送到 `main` 分支自动部署到 Cloudflare Pages。

需要配置以下 GitHub Secrets:
- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ACCOUNT_ID`
- `CLOUDFLARE_PAGES_PROJECT_NAME` (设置为 `blog`)

### 本地部署

```bash
pnpm build
pnpm exec wrangler pages deploy dist --project-name=blog
```

## 项目结构

```
src/
├── components/     # Astro 组件
├── content/        # 博客文章 (Markdown)
├── layouts/        # 页面布局
└── pages/          # 路由页面
    ├── index.astro         # 首页
    ├── posts/             # 文章详情
    │   ├── index.astro    # 全部文章列表
    │   └── [...slug].astro # 动态路由
    └── search.astro       # 搜索页面
```

## 功能特性

- 响应式设计，支持移动端和桌面端
- 全文搜索弹窗 (Raycast 风格)
- 按日期排序的文章列表
- 深色边框导航栏
