### Objective: Implement Continuous Integration (CI) for a software project to automate testing, building, and deployment processes.
- Why: Improve software quality, reduce manual efforts, and increase development velocity.
### Tools:
- Version Control System (e.g., Git)
- CI/CD Platform
- Docker for containerization
- Scripting languages (e.g., Bash, WSL2)
### Diagramming Image:
```
                                  +----------------------------------------+
                                  |                                        |
                                  |             GitHub Repository           |
                                  |                                        |
                                  +---------------+----------------+---------+
                                                  |                |
                                                  | (1) Push      |
                                                  | Changes       |
                                                  |                |
                                                  v                v
                                  +---------------+----------------+---------+
                                  |                                        |
                                  |         GitHub Actions Workflow        |
                                  |                                        |
                                  +---------------+----------------+---------+
                                                  |                |
                                                  | (2) Trigger   |
                                                  | Workflow      |
                                                  |                |
                                                  v                v
                   +------------------------------+----------------+---------+
                   |                                                            |
                   |                    Workflow Execution                      |
                   |                                                            |
                   +-------------+--------------+--------------+-----------------+
                                 |              |              |
                                 | (3) Set up   | (4) Build    | (5) Publish
                                 | Environment  | Docker Image | Docker Image
                                 |              |              | to DockerHub
                                 v              v              v
            +--------------------+--------------+--------------+-----------------+
            |                    |              |              |                 |
            |    Environment     |   Docker     |   Docker     |    DockerHub    |
            |    Preparation     |   Build      |   Image      |    Registry     |
            |    (e.g., install  |   Process    |   Creation   |    (Store       |
            |    dependencies,   |   (Building  |   (Creation  |    Docker       |
            |    setup tools)    |   Docker     |   of Docker  |    Images)      |
            |                    |   Container) |   Image)     |                 |
            |                    |              |              |                 |
            +--------------------+--------------+--------------+-----------------+
```
### Diagramming Image Explanation:
- Changes pushed to the GitHub repository trigger the GitHub Actions workflow.
- The GitHub Actions workflow is triggered and starts execution.
- Workflow execution begins with setting up the environment necessary for building the Docker image. (This step might involve installing dependencies and configuring tools.)
- Once the environment is set up, the workflow proceeds to build the Docker image based on the specifications defined in the Dockerfile.
- After the Docker image is successfully built, it is published to DockerHub, which serves as a registry for storing Docker images.
- The DockerHub registry stores the Docker image, making it available for deployment on various platforms.
### Run Project Locally:
- Clone the project repository from the version control system.
- Install project dependencies using package manager or build tools.
- Run the project locally using development server or appropriate commands.
### Installing Docker + Dependencies (WSL2):
- Install WSL2: Follow official documentation to install Windows Subsystem for Linux 2 (WSL2) on your Windows machine.
- Install Docker In Terminal: run the command 'sudo apt install docker.io' 
- Verify Installation: Open a WSL2 terminal and run 'docker --version' to verify Docker installation.
### Building an Image from Dockerfile:
- Navigate to the directory containing your Dockerfile and project files.
- Run the following command to build the Docker image: 'docker build -t my-project-image .'
### Running the Container:
After building the Docker image, run the container using the following command: 'docker run -d -p <host_port>:<container_port> my-project-image'
### Viewing the Project Running in the Container:
- Open a web browser and navigate to 'http://localhost:<host_port>' to view the project running inside the Docker container. If using WSL2, use the IP address of your WSL2 instance instead of 'localhost'.
- If the project is running on a different port, replace '<host_port>' with the port you specified while running the container.
### Process to create public repo in DockerHub
- Go to DockerHub and log in to your account.
- Click on "Create Repository" button.
- Fill in the details such as the name of the repository, description, visibility (public/private), and other settings as needed.
- Click on "Create".
### How to authenticate with DockerHub via CLI using Dockerhub credentials
- Authenticating with DockerHub via CLI:
  - Install Docker on your system if you haven't already.
  - Open your terminal or command prompt.
  - Run the command `docker login` and provide your DockerHub username and password when prompted.
  - Alternatively, you can use `docker login -u <username> -p <password>` to provide credentials directly.
- What credentials would you recommend providing?
  - I recommend providing your Docker username and Docker password for the authentication process. However, for security purposes, a security token can be used rather than a password.
### How to push container image to Dockerhub (without GitHub Actions)
- Pushing Container Image to DockerHub:
  - After building your Docker image locally using `docker build`, tag the image with your DockerHub username and repository name: `docker tag image_name dockerhub_username/repository_name`.
  - Then, push the tagged image to DockerHub: `docker push dockerhub_username/repository_name`.
### Link to your DockerHub repository
- You can find the link to your DockerHub repository on the DockerHub website under the repository settings or simply by navigating to `https://hub.docker.com/r/<username>/<repository_name>`.
### Configuring GitHub Secrets
- Setting a Secret in GitHub:
  - Go to your GitHub repository.
  - Navigate to "Settings" and then "Secrets".
  - Click on "New repository secret" and add your secret name and value.
- Secrets set for this project are the `DOCKER_USERNAME` secret which holds the value of my docker username, along with the `DOCKER_PASSWORD` secret that holds the value of my docker account's access token.
### Behavior of GitHub workflow
- The GitHub workflow is typically configured to automate the building and pushing of Docker images to DockerHub.
- It runs whenever changes are pushed to the specified branches (e.g., main, develop).
- Custom variables in the workflow might include the `DockerHub repository name`, `DockerHub username`, and any specific build settings or environment variables required for your application.
- If someone else is going to use or reuse the workflow, they may need to modify these variables to match their own repository and DockerHub credentials. Additionally, they might need to adjust any other specific settings related to their project.
