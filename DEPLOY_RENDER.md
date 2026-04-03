# Deploying this repo to Render

This repository includes a ready-to-use `render.yaml` Blueprint that deploys:

1. **`occu-med-map-web`** (static site)
2. **`occu-med-map-api`** (Node/Express API)

## One-click setup

1. Push this repo to GitHub/GitLab.
2. In Render, go to **Blueprints** → **New Blueprint Instance**.
3. Select the repository.
4. Render will detect `render.yaml` and propose both services.
5. Click **Apply**.

> If you are on Render's **"New Static Site"** form (like in your screenshot), you are doing a **manual service deploy**, not Blueprint deploy. That works too — use the exact values in the "Manual setup" section below.

## What gets built

- Frontend build command:
  - `corepack enable && pnpm install --frozen-lockfile && pnpm --filter @workspace/occu-med-map build`
- Frontend publish path:
  - `occu-med-map/dist/public`
- API build command:
  - `corepack enable && pnpm install --frozen-lockfile && pnpm --filter @workspace/api-server build`
- API start command:
  - `pnpm --filter @workspace/api-server start`

## Manual setup (if Blueprint is not being used)

Use this when you click **New +** and create services directly.

### 1) Frontend (Static Site)

- **Root Directory**: `occu-med-map`
- **Build Command**: `corepack enable && pnpm install --frozen-lockfile && pnpm --filter @workspace/occu-med-map build`
- **Publish Directory**: `dist/public`
  - (If you leave Root Directory blank, then use `occu-med-map/dist/public` instead.)
- Optional SPA rewrite rule:
  - Source: `/*`
  - Destination: `/index.html`

### 2) API (Web Service)

- **Root Directory**: *(leave blank)*
- **Build Command**: `corepack enable && pnpm install --frozen-lockfile && pnpm --filter @workspace/api-server build`
- **Start Command**: `pnpm --filter @workspace/api-server start`
- **Health Check Path**: `/api/health`
- Environment variables:
  - `NODE_VERSION=20`
  - `NODE_ENV=production`
  - Optional (improves Price Hunt/OCC Hunt relevance):
    - `SERPER_API_KEY`
    - `TAVILY_API_KEY`
    - `GEMINI_API_KEY`

## Important notes

- Render injects `PORT` automatically for the API service.
- `NODE_ENV=production` is set in the blueprint.
- The frontend currently works as a static app and does not require server-side rendering.

## Optional: connect frontend to API URL

If you later wire the frontend to call your Render API service, use the API service URL:

- Example: `https://occu-med-map-api.onrender.com`
- Health endpoint: `https://occu-med-map-api.onrender.com/api/health`

Then expose that URL to the frontend through a `VITE_...` environment variable and reference it in the app code.


## Troubleshooting: “Blueprint file render.yaml not found on main branch”

If you see that exact error in Render, it means Render cannot read the file from the branch/path you selected.

1. Confirm this file exists at repo root on the selected branch:
   - `render.yaml` (and this repo also includes `render.yml` for compatibility)
2. In Render’s Blueprint screen:
   - **Branch** should match the branch that contains the file.
   - **Blueprint Path** should be exactly `render.yaml` (with the dot), or `render.yml`.
3. If you just pushed changes, click **Retry** after Git provider sync completes.
4. If still failing, reconnect the Git repo in Render and re-open the Blueprint flow.

## Troubleshooting: “Publish Directory required” on New Static Site

This is expected if you are in manual setup mode.

- If **Root Directory = `occu-med-map`**, set **Publish Directory = `dist/public`**.
- If **Root Directory is blank**, set **Publish Directory = `occu-med-map/dist/public`**.

The field cannot be empty on Render's Static Site form.

## Troubleshooting: `npm error Unsupported URL Type "catalog:"`

If Render logs show it is installing with **npm** (for example: `Installing dependencies with npm...`) this monorepo will fail, because workspace packages use `catalog:` dependency versions.

Fix:

1. Ensure Render deploys a commit that includes:
   - `packageManager: "pnpm@10.17.1"` in the repo root `package.json`
   - `packageManager: "pnpm@10.17.1"` in `occu-med-map/package.json` when Root Directory is `occu-med-map`
   - your custom build command that starts with `corepack enable && pnpm install ...`
2. In manual service settings, set Build Command exactly (do not leave it on auto-detect).
3. Trigger a **Manual Deploy** on the latest commit on `main` after saving settings.

### Fast verification checklist (matches your error log)

- In Render deploy logs, confirm **Checked out commit** is the newest commit on `main`.
- If logs still show an older commit (for example `12ff863`), Render is deploying stale code/config.
- Open service **Settings** and verify:
  - **Branch** = `main`
  - **Root Directory** matches this guide
  - **Build Command** is explicitly set to the pnpm command (not auto-detect)
- Then run **Manual Deploy → Deploy latest commit**.

### If Render keeps deploying exactly `12ff863`

That means Render only sees `12ff863` on your Git provider branch and none of the newer fixes are on `main` yet.

Do this in order:

1. Push/merge the latest branch changes to GitHub `main`.
2. Confirm GitHub `main` shows a commit newer than `12ff863`.
3. In Render, click **Manual Deploy → Clear build cache & deploy latest commit**.

If step 2 still shows `12ff863`, this is a Git sync issue (not a Render build-command issue).
