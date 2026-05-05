import http from 'http';
import { readFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const swaggerUI = readFileSync(join(__dirname, 'swagger/index.html'));
const openAPISpec = readFileSync(join(__dirname, 'openapi.yml'));

const server = http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('ok');
  } else if (req.method === 'GET' && req.url === '/swagger') {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(swaggerUI);
  } else if (req.method === 'GET' && req.url === '/swagger/openapi.yml') {
    res.writeHead(200, { 'Content-Type': 'application/yaml' });
    res.end(openAPISpec);
  } else {
    res.writeHead(404);
    res.end();
  }
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`node server listening on :${PORT}`);
});
