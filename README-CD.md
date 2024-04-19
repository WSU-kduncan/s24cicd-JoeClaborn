### CD Project Overview
- CD creation aims to automate tagging and pushing of Docker images to Docker Hub when a new Git tag is pushed to the repo. This helps to streamline devlopment processes and makes sure that the latest version of the application and CD's are always available for deployment.
- Tools Used:
  - GitHub
  - GitHub Actions
  - Docer Hub
  - adnanh's Webhook
- Diagram:
  ```
  +----------------------------------------+
  |              GitHub Repository         |
  +----------------------------------------+
            |    |
            |    |
  +----------------------+
  |   GitHub Actions     |
  |   Workflow           |
  |   (on tag push)      |
  +----------------------+
              |
              v
  +----------------------+
  |   Docker Hub         |
  |   Repository         |
  +----------------------+
              |
              v
  +------------------------------+
  |   EC2 Instance               |
  |   (with Docker installed)    |
  +------------------------------+
            |               |
            |               |
  +-----------------+   +-----------------+
  |  adnanh's       |   |  Docker         |
  |  Webhook        |   |  Container      |
  |  Listener/Hook  |   |                 |
  +-----------------+   +-----------------+
```
### How to generate a tag in git / GitHub
- Commit all changes.
- Run `git tag`.
- Push the tag using `git push --tags`.
### Behavior of GitHub workflow
- Build Docker Image from the codebase.
- Generates multiple tags for Docker Image based on the Git tag that is pushed to the repo.
- Tags Include:
  - `latest`: Points to Latest version of image.
  - `major`: Points to Major version of image.
  - `major.minor`: Points to Major.Minor version of image.
### Link to Docker Hub repository (as additional proof)
- [Docker Hub Link](https://hub.docker.com/repository/docker/dismallake/ceg3120project4ci/general).
### How to install Docker to your instance
- Run the command `sudo apt-get install docker.io -y` to install Docker.
- Run `sudo systemctl start docker` to start Docker.
- Run `docker --version` to check the current version of Docker that is installed in the instance.
### Container restart script
- Justification & description of what it does:
  - The container restart script (`update_container.sh`) pulls the latest Docker image from Docker Hub, stops the running container, removes it, and then starts a new container with the updated image.
- Where it should be on the instance (if someone were to use your setup):
  - The script should be placed in a directory accessible to the user who will execute it on the instance. For simplicity, it can be placed in the home directory of the user.
### Setting up a webhook listener on the instance
- How to install adnanh's webhook to the instance:
  - Make sure that the 'Go' Environment is properly set-up on version 1.4+, then run the command `$ go build github.com/adnanh/webhook` to start the webhook.
### `webhook` task definition file
- Description of what it does:
  - The webhook task definition file (`webhook.json`) defines the webhook configurations, including the execute command, response message, and trigger rules.
- Where it should be on the instance (if someone were to use your setup):
  - The webhook definition file should be placed in the same directory where the webhook binary is located.
### How to start the `webhook`
- Run the command `/path/to/webhook -hooks /path/to/webhook.json -verbose`
### How to modify/ create a webhook service file such that your webhook listener is listening as soon as the system is booted
- The webhook service file defines how the webhook listener should be started as a service when the system boots.
- After modifying the webhook service file, you can reload the systemd service using the following command: `sudo systemctl daemon-reload` and `sudo systemctl restart webhook.service`.
### How to configure GitHub OR DockerHub to message the listener
- Configure either GitHub or DockerHub to send a POST request to your webhook listener endpoint whenever an event occurs (e.g., image push, release). Include the appropriate webhook URL in the configuration settings of GitHub or DockerHub.
