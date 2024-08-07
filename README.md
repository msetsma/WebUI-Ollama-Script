Here's the updated `README.md` file:

**Docker Container Launcher**
==========================

A simple PowerShell script to start and launch a Docker container, followed by opening a website hosted within the container.

**Prerequisites**
-----------------

Before running this script, you need to install the following:

* **Ollama**: Download and install Ollama from [https://ollama.com/download/windows](https://ollama.com/download/windows)
* **Docker Desktop for Home**: Install Docker Desktop for Home from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)
* **OpenWebUI**: Follow the installation instructions at [https://docs.openwebui.com/](https://docs.openwebui.com/)

**Step 1: Run the Docker Command**
---------------------------------

Before running this script, you need to run the following Docker command in your terminal:
```bash
docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
```
This command downloads and installs OpenWebUI with Ollama integration.


**Configuration**
---------------

* You can modify the `$containerName` variable at the top of the script to match your container's name
* The website URL is set to `http://localhost:3000/auth`, you can change it to point to a different website within your container

**Features**
------------

* Checks if the container is running and stops it if so
* Starts the container if it's not running or exists but is stopped
* Waits for the container to start before launching the website