### CD Project Overview
- CD creation aims to automate tagging and pushing of Docker images to Docker Hub when a new Git tag is pushed to the repo. This helps to streamline devlopment processes and makes sure that the latest version of the application and CD's are always available for deployment.
- Tools Used:
  - GitHub
  - GitHub Actions
  - Docer Hub
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
