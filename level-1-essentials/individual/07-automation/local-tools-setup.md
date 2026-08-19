# Local Tools Setup

The five tools every AI power-user should have installed locally.

## 1. A great code editor with AI baked in

**Choose one:**

### Cursor
- Download: cursor.sh
- Best for: mainstream Claude/GPT-in-editor experience
- Config: Settings → Rules for AI → paste your master system prompt
- Pricing: $20/mo Pro

### Zed with AI
- Download: zed.dev
- Best for: performance, minimalism
- Free with paid AI features

### VS Code + Continue + GitHub Copilot
- Free-ish path
- More setup, more flexibility

## 2. An agentic coding tool

### Claude Code (recommended)
- Install: `npm install -g @anthropic-ai/claude-code`
- Best for: multi-file refactors, autonomous coding sessions
- Config: create `CLAUDE.md` in each project root with:
  ```
  # Project rules for Claude Code

  ## Voice
  [inherit master prompt voice]

  ## Codebase conventions
  - Framework: [Next.js / Node / whatever]
  - Tests: [Vitest / Jest / etc.]
  - Formatting: [Prettier config]

  ## Commands
  - Build: npm run build
  - Test: npm test
  - Lint: npm run lint

  ## Never do
  - Delete files without confirmation
  - Modify env files
  - Commit to main
  ```

## 3. A launcher with AI extensions

### Raycast (macOS)
- Download: raycast.com
- Install AI Chat extension
- Bind hotkeys: `⌥ Space` for launcher, `⌥ ⌘ Space` for AI Chat
- Add extensions: OpenAI, Claude, Perplexity

### Alfred + AI powerpacks
- Alternative for macOS die-hards

### PowerToys (Windows)
- Windows equivalent with Copilot integration

## 4. A clipboard manager

Essential when prompt-engineering — you copy and paste dozens of times per day.

- **macOS:** Raycast Clipboard History, Alfred, or Paste.app
- **Windows:** Windows+V (built-in), or Ditto
- **Linux:** CopyQ

Configure: 30-day history, exclude password fields.

## 5. Media tools

### ffmpeg
```bash
# macOS
brew install ffmpeg

# Windows
winget install ffmpeg

# Linux
sudo apt install ffmpeg
```
Used for: converting audio/video for Whisper, extracting frames, compressing outputs.

### yt-dlp
```bash
brew install yt-dlp
```
Used for: downloading videos to feed to transcription / analysis.

### mat2 (metadata scrubber)
```bash
brew install mat2
```
Used for: stripping metadata from files before uploading (privacy hygiene).

## 6. Text expander

Snippets that expand into common prompts.

- **macOS/Windows:** TextExpander, Alfred/Raycast snippets
- **Cross-platform:** Espanso (free, open source)

Suggested snippets:
- `;;aboutme` → your compact about-me block
- `;;style` → link or paste of your style guide
- `;;reviewprompt` → the code-review prompt
- `;;summarize` → the meeting-summarizer prompt

## 7. Ollama (optional but recommended)

Run local models on your machine for offline / sensitive work.

```bash
# Install
brew install ollama

# Pull a model
ollama pull llama3.3:70b
ollama pull qwen3:32b
ollama pull deepseek-r1

# Run
ollama run llama3.3
```

Best used for:
- Sensitive data that can't leave your machine
- Learning how models work
- Offline scenarios

## 8. Environment variables setup

Create `~/.env.local` (never commit) with your API keys from `individual/02-accounts/api-keys-setup.md`.

Add to your shell profile (`~/.zshrc` or `~/.bashrc`):
```bash
if [ -f ~/.env.local ]; then
  set -a
  source ~/.env.local
  set +a
fi
```

Now every terminal session has your keys available as env vars.

## Verification

After setup, run:
```bash
ffmpeg -version
yt-dlp --version
ollama --version
claude-code --version   # if installed
echo $OPENAI_API_KEY | cut -c1-10   # should show 'sk-proj-' or 'sk-'
```

If any fails, fix before moving on.
