### Objective: Implement Continuous Integration (CI) for a software project to automate testing, building, and deployment processes.
- Why: Improve software quality, reduce manual efforts, and increase development velocity.
## Tools:
- Version Control System (e.g., Git)
- CI/CD Platform (e.g., Jenkins, GitLab CI, Travis CI)
- Docker for containerization
- Testing frameworks (e.g., JUnit, Selenium)
- Scripting languages (e.g., Bash, Python)
## Run Project Locally:
- Clone the project repository from the version control system.
- Install project dependencies using package manager or build tools (e.g., npm install for Node.js projects).
- Run the project locally using development server or appropriate commands (e.g., npm start for a Node.js project).
## Installing Docker + Dependencies (WSL2):
- Install WSL2: Follow official documentation to install Windows Subsystem for Linux 2 (WSL2) on your Windows machine.
- Install Docker In Terminal: run the command 'sudo apt install docker.io' 
- Verify Installation: Open a WSL2 terminal and run 'docker --version' to verify Docker installation.
## Building an Image from Dockerfile:
- Navigate to the directory containing your Dockerfile and project files.
- Run the following command to build the Docker image: 'docker build -t my-project-image .'
## Running the Container:
After building the Docker image, run the container using the following command: 'docker run -d -p 81:81  my-project-image'
## Viewing the Project Running in the Container:
- Open a web browser and navigate to 'http://localhost:<host_port>' to view the project running inside the Docker container. If using WSL2, use the IP address of your WSL2 instance instead of 'localhost'.
- If the project is running on a different port, replace '<host_port>' with the port you specified while running the container.
