# Monitor

URL monitoring service — add a URL and the app checks if it's up on a configurable interval.

## Stack

| Layer    | Technology         |
| -------- | ------------------ |
| Backend  | Go (`:8080`)       |
| Backend  | Node.js (`:3000`)  |
| Frontend | React + Vite       |
| Database | PostgreSQL + Redis |

## Quick start

```bash
make install   # install all JS dependencies
make dev       # run all services concurrently
```

## Available commands

```
make help
```

## API docs (Swagger)

Avaiable after (`make dev`):

| Backend | Swagger UI                    |
| ------- | ----------------------------- |
| Go      | http://localhost:8080/swagger |
| Node    | http://localhost:3000/swagger |

## Docs

- [docs/backend-init.md](docs/backend-init.md) — Go and Node server setup
- [docs/linting.md](docs/linting.md) — linting and formatting setup
