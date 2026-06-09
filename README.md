# Code Collaborator

Code Collaborator is a real-time collaborative coding app with a React + Monaco frontend and a Node.js + Socket.IO backend. Users can create protected rooms, join existing rooms with a room ID and password, or enter a shared guest room for quick collaboration.

## Features

- Real-time collaborative editing with Monaco Editor and Yjs
- Private rooms with room ID and password protection
- Shared guest room for instant access
- Live collaborator presence list
- Single-container Docker workflow for deployment

## Tech Stack

- Frontend: React, Vite, Monaco Editor, Yjs
- Backend: Node.js, Express, Socket.IO, y-socket.io
- Deployment: Docker

## Project Structure

```text
.
|-- Backend/
|   |-- package.json
|   `-- server.js
|-- Frontend/
|   |-- package.json
|   `-- src/
|-- dockerfile
`-- run.sh
```

## How It Works

The frontend is built into `Backend/public`, and the backend serves both the API and the compiled frontend. Real-time synchronization is powered by Yjs over Socket.IO.

Available backend endpoints:

- `POST /api/rooms/create` to create a private room
- `POST /api/rooms/join` to join a private room
- `POST /api/rooms/guest` to enter the guest room
- `GET /health` for a simple health check

## Local Development

### 1. Install dependencies

```bash
cd Frontend && npm install
cd ../Backend && npm install
```

### 2. Run the frontend

```bash
cd Frontend
npm run dev
```

### 3. Run the backend

```bash
cd Backend
npm run dev
```

By default:

- Frontend runs with Vite
- Backend serves on `http://localhost:3000`

If needed, you can configure:

- `VITE_API_BASE_URL`
- `VITE_SOCKET_SERVER_URL`

## Docker

Build and run with Docker manually:

```bash
docker build -t code-collaborator -f dockerfile .
docker run -d --name code-collaborator -p 3000:3000 code-collaborator
```

Or use the helper script:

```bash
./run.sh
```

The script:

1. Builds the frontend
2. Builds the Docker image
3. Stops and removes the old container if it exists
4. Starts a new container on port `3000`

## Notes

- Room data and sessions are currently stored in memory.
- Restarting the server clears active rooms and tokens.
- The Docker image serves the production frontend from the backend container.
