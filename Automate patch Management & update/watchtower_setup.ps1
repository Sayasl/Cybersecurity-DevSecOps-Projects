Write-Output "Setting up Watchtower for automatic Docker updates..."

docker run -d --name watchtower `
  -v \\.\pipe\docker_engine:\\.\pipe\docker_engine `
  containrrr/watchtower `
  --cleanup --schedule "0 0 * * *"

Write-Output "Watchtower setup completed!"
