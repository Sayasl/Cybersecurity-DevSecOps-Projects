Write-Output "Pulling latest Docker images..."
docker pull bkimminich/juice-shop:latest

Write-Output "Stopping and removing old container..."
docker stop juice-shop
docker rm juice-shop

Write-Output "Running new container with updated image..."
docker run -d --name juice-shop -p 3000:3000 bkimminich/juice-shop:latest
