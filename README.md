Spec:

-- 1st - Ask for total
-- 2nd - Ask for names
-- Split into drinks, apps, entrees, etc...
-- Note: Make sure that you make it flash yellow when total is not correct
-- and change color the closer you get to the total

1. Package and Build for Web

Using Davidobot/love.js (requires Node.js/npm) is the cleanest path for GitHub Pages because it outputs a self-contained static site.
1. Create the .love file from your project root (where main.lua lives):bash
zip -9 -r game.love . -x "*.git*" "*.DS_Store" "web/*"
Use code with caution.
2. Generate the static web build into a folder (e.g., web/) using the -c (compatibility / single-threaded) flag:bash
npx love.js game.love web -c -t "Your Game Title"
Use code with caution.
Note: Omit -c only if you plan to add a coi-serviceworker.js workaround, as GitHub Pages does not let you configure custom COOP/COEP HTTP headers required for multi-threaded WebAssembly.

2. Automate Deployment with GitHub Actions

Rather than committing binary .wasm and .love files directly to your main branch, you can use a GitHub Actions workflow to build and deploy automatically whenever you push code.
Create .github/workflows/deploy.yml in your repository:
yaml
name: Deploy LÖVE2D to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 20

      - name: Package .love archive
        run: zip -9 -r game.love . -x "*.git*" "*.github*" "*.DS_Store"

      - name: Build love.js web bundle
        run: npx --yes love.js game.love dist -c -t "My Love2D Game"

      - name: Upload Pages artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: dist

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
Use code with caution.

3. Enable GitHub Pages in Your Repository

1. Push your code and the workflow file to GitHub.
2. Open your repository on GitHub and go to Settings > Pages.
3. Under Build and deployment > Source, select GitHub Actions.
4. Once the workflow finishes running under the Actions tab, your game will be live at https://<username>.github.io/<repo-name>/.

Common GitHub Pages Pitfalls

• Memory allocation (-m flag): If your game uses large sprites or audio files and crashes on load with an out-of-memory error, pass a larger byte size to love.js (e.g., -m 67108864 for 64 MB).
• Subdirectory paths: Because GitHub Pages hosts project sites under /<repo-name>/, avoid leading slashes (/assets/player.png) in your Lua paths; always use relative paths (assets/player.png).
If you'd like, let me know:
• Whether your project uses Teal (.tl) or MoonScript that needs to compile to .lua inside the GitHub Action
• Your game's approximate asset size (so I can calculate the -m memory flag)
• If you need multi-threading (SharedArrayBuffer) enabled on GitHub Pages via a service worker

