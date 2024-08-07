$containerName = "open-webui"
$websiteUrl = "http://localhost:3000/auth"

function Open-Website {
    param($url)
    Write-Host "Opening website: $url"
    Start-Process $url
}

# Check if the container is running
$containerStatus = docker ps --filter "name=$containerName" --format "{{.Names}}"

if ($containerStatus -eq $containerName) {
    Write-Host "The container '$containerName' is currently running."
    Write-Host "Stopping the container..."
    docker stop $containerName
    if ($?) {
        Write-Host "The container has been stopped successfully."
    } else {
        Write-Host "Failed to stop the container. Please check for any errors."
    }
} else {
    Write-Host "The container '$containerName' is not running."
    
    # Check if the container exists but is stopped
    $stoppedContainer = docker ps -a --filter "name=$containerName" --format "{{.Names}}"
    
    if ($stoppedContainer -eq $containerName) {
        Write-Host "The container exists but is stopped. Starting it now..."
        docker start $containerName
        if ($?) {
            Write-Host "The container has been started successfully."
            Write-Host "Waiting for container to start..."
            Start-Sleep -Seconds 5
            Open-Website $websiteUrl
        } else {
            Write-Host "Failed to start the container. Please check for any errors."
        }
    } else {
        Write-Host "The container does not exist. You may need to create it first using 'docker run'."
    }
}