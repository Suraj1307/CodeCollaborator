# 🚀 CodeCollaborator

A full-stack real-time collaborative code editor that enables multiple users to write and edit code together instantly. Built with React, Monaco Editor, Socket.IO, and Yjs CRDT synchronization, the application provides low-latency collaborative editing with room-based access control and live collaborator presence tracking.

---

## ✨ Features

### Real-Time Collaboration

* Multi-user code editing in real time
* Conflict-free synchronization using Yjs CRDTs
* Monaco Editor integration
* Instant updates across connected clients

### Room Management

* Create private collaboration rooms
* Password-protected room access
* Join existing rooms securely
* Shared guest room for quick collaboration

### Live Presence

* Real-time collaborator tracking
* Active user list updates
* Username-based presence management

### Modern UI

* Dark glassmorphism design
* Gold accent theme
* Responsive layout for desktop and mobile
* Custom scrollbar styling

### Deployment Ready

* Dockerized architecture
* Single-container deployment
* Production build served directly by Express

---

## 🏗️ Architecture

```text
┌─────────────────────┐
│      React App      │
│    Monaco Editor    │
└──────────┬──────────┘
           │
           │ Socket.IO + Yjs
           ▼
┌─────────────────────┐
│   Express Server    │
│    Socket.IO API    │
│      YSocketIO      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  In-Memory Storage  │
│ Rooms & Sessions    │
└─────────────────────┘
```

---

## 🛠️ Tech Stack

### Frontend

* React
* Vite
* Monaco Editor
* Yjs
* y-monaco
* y-socket.io
* Tailwind CSS v4

### Backend

* Node.js
* Express.js
* Socket.IO
* YSocketIO

### DevOps

* Docker
* Multi-stage Docker Builds

---

## 📂 Project Structure

```text
CodeCollaborator/
│
├── Frontend/
│   ├── src/
│   │   ├── app/
│   │   │   ├── App.jsx
│   │   │   └── App.css
│   │   └── main.jsx
│   │
│   ├── package.json
│   └── vite.config.js
│
├── Backend/
│   ├── public/
│   ├── server.js
│   └── package.json
│
├── dockerfile
├── run.sh
└── README.md
```

---

## 🔄 How It Works

### Creating a Room

1. User enters room details.
2. Frontend sends request to:

   ```http
   POST /api/rooms/create
   ```
3. Backend creates room metadata.
4. Access token is generated.
5. Room session is stored in browser session storage.

### Joining a Room

1. User enters room ID and password.
2. Backend validates credentials.
3. Access token is returned.
4. User joins collaborative session.

### Real-Time Editing

1. Monaco Editor is mounted.
2. Yjs document is created.
3. SocketIOProvider connects to backend.
4. MonacoBinding synchronizes editor content.
5. All connected users receive updates instantly.

---

## 🔌 API Endpoints

### Create Room

```http
POST /api/rooms/create
```

### Join Room

```http
POST /api/rooms/join
```

### Join Guest Room

```http
POST /api/rooms/guest
```

### Health Check

```http
GET /health
```

Response:

```json
{
  "message": "ok",
  "success": true
}
```

---

## 🚀 Local Development

### Clone Repository

```bash
git clone https://github.com/Suraj1307/CodeCollaborator.git
cd CodeCollaborator
```

### Frontend Setup

```bash
cd Frontend
npm install
npm run dev
```

### Backend Setup

```bash
cd Backend
npm install
npm run dev
```

Frontend:

```text
http://localhost:5173
```

Backend:

```text
http://localhost:3000
```

---

## 🐳 Docker Deployment

Build and run using:

```bash
chmod +x run.sh
./run.sh
```

The script:

1. Builds the React application
2. Generates production assets
3. Builds Docker image
4. Replaces old container
5. Starts server on port 3000

Application URL:

```text
http://localhost:3000
```

---

## 🔒 Room Validation Rules

* Room IDs are normalized to uppercase
* Allowed pattern:

```regex
^[A-Z0-9_-]{4,20}$
```

* Reserved room:

```text
GUEST
```

* Password required for private rooms
* Access token required for collaborative sessions

---

## 🎨 UI Highlights

* Glassmorphism cards
* Dark theme workspace
* Responsive editor layout
* Mobile-friendly experience
* Live collaborator sidebar

---

## ⚠️ Current Limitations

* No database persistence
* Rooms are stored in memory only
* Server restart clears all rooms
* Passwords stored in plaintext memory
* No authentication system
* No automated tests
* Open CORS configuration

---

## 🔮 Future Improvements

* MongoDB/PostgreSQL integration
* User authentication
* Persistent documents
* Syntax-aware collaboration features
* Code execution support
* Voice & video collaboration
* File explorer
* Multi-file projects
* Role-based permissions
* End-to-end encryption

---

## 👨‍💻 Author

**Suraj Kumar**

* GitHub: https://github.com/Suraj1307
* LeetCode: https://leetcode.com/u/Suraj_2909/

---

⭐ If you found this project useful, consider giving it a star.
