## Go server (`go_be/`)

- Module: `monitor/go_be` (Go 1.26)
- Entry point: `main.go`
- Starts an HTTP server on `:8080`
- Single route: `GET /` returns `200 ok`
- No external dependencies — uses stdlib `net/http` only

**Run:**

```bash
cd go_be && go run main.go
```

## Node.js server (`node_be/`)

- Runtime: Node 24, no framework
- Entry point: `index.js`
- Starts an HTTP server on `:3000`
- Single route: `GET /` returns `200 ok`
- No external dependencies — uses stdlib `http` module only

**Run:**

```bash
cd node_be && node index.js
```
