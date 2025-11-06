# ------------------------
# HHVM Docker Makefile (full dev setup)
# ------------------------

# Docker image and container
IMAGE_NAME := hhvm-app
CONTAINER_NAME := $(IMAGE_NAME)
PORT := 8080
PROJECT_DIR := $(PWD)

# ------------------------
# Build Docker image
# ------------------------
build:
	docker build -t $(IMAGE_NAME) .

# ------------------------
# Run web server
# ------------------------
web:
	docker run --rm -it -p $(PORT):8080 \
	  -v $(PROJECT_DIR):/var/www \
	  --user hhvmuser \
	  $(IMAGE_NAME)

# ------------------------
# Run CLI for Hack scripts
# ------------------------
cli:
	@docker run --rm -it \
	  -v $(PROJECT_DIR):/var/www \
	  --user hhvmuser \
	  $(IMAGE_NAME) hhvm main.hack

# ------------------------
# Stop and remove container
# ------------------------
stop:
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)

# ------------------------
# Remove Docker image
# ------------------------
clean:
	-docker rmi $(IMAGE_NAME)

# ------------------------
# Prune unused containers and images
# ------------------------
prune:
	docker container prune -f
	docker image prune -f

# ------------------------
# Rebuild workflow: stop, clean, build, run web
# ------------------------
rebuild: stop clean build web

# ------------------------
# Development mode: rebuild and run web server with mounted project
# ------------------------
dev: stop build
	docker run -it -p $(PORT):8080 \
	  -v $(PROJECT_DIR):/var/www \
	  --name $(CONTAINER_NAME) \
	  --user hhvmuser \
	  $(IMAGE_NAME)
