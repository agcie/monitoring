# Linting & Formatting

## Tools

| Scope      | Tool                | Config                      |
| ---------- | ------------------- | --------------------------- |
| Go         | golangci-lint       | `go_be/.golangci.yml`       |
| Node.js    | ESLint              | `node_be/eslint.config.js`  |
| React      | ESLint              | `react_fe/eslint.config.js` |
| JS/JSX/MD  | Prettier            | `.prettierrc` (root)        |
| Pre-commit | Husky + lint-staged | `.husky/pre-commit`         |

## Running manually

```bash
make lint        # all linters
make lint-go     # Go only
make lint-node   # Node only
make lint-fe     # React only
make format      # Prettier across all JS/JSX/JSON/MD
```

Or per-package:

```bash
cd node_be  && npm run lint
cd node_be  && npm run format
cd react_fe && npm run lint
cd react_fe && npm run format
```

## Pre-commit hook

Husky runs `lint-staged` before every commit. Only staged files are linted:

- `go_be/**/*.go` → `golangci-lint run --fix`
- `node_be/**/*.{js,json}` → Prettier + ESLint fix
- `react_fe/**/*.{js,jsx,json}` → Prettier + ESLint fix
- `**/*.md` → Prettier

## Installing golangci-lint (Go)

golangci-lint is not bundled — install it once:

```bash
brew install golangci-lint
# or
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```
