# Step 1:
# Build image and add a descriptive tag
docker build . --tag=es_capstone_project

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run the docker container locally
docker run -p 8000:80 es_capstone_project
