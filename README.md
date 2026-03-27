# Astro Starter Kit: Basics

```sh
pnpm create astro@latest -- --template basics
```

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

## 🚀 Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── public/
│   └── favicon.svg
├── src
│   ├── assets
│   │   └── astro.svg
│   ├── components
│   │   └── Welcome.astro
│   ├── layouts
│   │   └── Layout.astro
│   └── pages
│       └── index.astro
└── package.json
```

To learn more about the folder structure of an Astro project, refer to [our guide on project structure](https://docs.astro.build/en/basics/project-structure/).

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `pnpm install`            | Installs dependencies                            |
| `pnpm dev`                | Starts local dev server at `localhost:4321`      |
| `pnpm build`              | Build your production site to `./dist/`          |
| `pnpm preview`            | Preview your build locally, before deploying     |
| `pnpm deploy`             | Read `.env`, build, and deploy locally with Wrangler CLI |
| `pnpm astro ...`          | Run CLI commands like `astro add`, `astro check` |
| `pnpm astro -- --help`    | Get help using the Astro CLI                     |

## Deploy to Cloudflare Pages

This project supports both local Wrangler CLI deployment and GitHub Actions deployment.

### Local deployment with `.env`

1. Install dependencies:

```sh
pnpm install
```

2. Log in to Cloudflare locally once:

```sh
pnpm exec wrangler login
```

3. If the Pages project does not exist yet, create it once:

```sh
pnpm exec wrangler pages project create blog --production-branch main
```

4. Create your local env file:

```sh
cp .env.example .env
```

5. Edit `.env` and set the actual Pages project name:

```sh
CLOUDFLARE_PAGES_PROJECT_NAME=blog
```

6. Deploy:

```sh
pnpm deploy
```

The deploy script reads `.env` first, and falls back to your current shell environment if needed.

Equivalent manual command:

```sh
pnpm build
pnpm exec wrangler pages deploy dist --project-name=$CLOUDFLARE_PAGES_PROJECT_NAME
```

### GitHub Actions deployment

Workflow file: `.github/workflows/deploy.yml`

Add these repository settings in GitHub:

- Secret: `CLOUDFLARE_API_TOKEN`
- Secret: `CLOUDFLARE_ACCOUNT_ID`
- Variable: `CLOUDFLARE_PAGES_PROJECT_NAME`

`CLOUDFLARE_PAGES_PROJECT_NAME` must exactly match an existing Cloudflare Pages project name in the same account.

After the secrets and variable are set, every push to `main` will:

- install dependencies
- build the Astro site into `dist`
- deploy `dist` to Cloudflare Pages

If you get `Project not found`, the configured project name does not match an existing Cloudflare Pages project in your account.

## 👀 Want to learn more?

Feel free to check [our documentation](https://docs.astro.build) or jump into our [Discord server](https://astro.build/chat).
