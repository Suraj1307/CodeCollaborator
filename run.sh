#!/bin/bash

echo "Step 1: Build Frontend"
cd Frontend
npm run build

echo "Step 2: Build Docker Image"
cd ..
docker build --no-cache -t server -f dockerfile .

echo "Step 3: Remove old container (if exists)"
docker stop server-test 2>/dev/null
docker rm server-test 2>/dev/null

echo "Step 4: Run new container"
docker run -d --name server-test -p 3000:3000 server

echo "Done: http://localhost:3000"
