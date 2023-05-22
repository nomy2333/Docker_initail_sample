## docker steps:
create nodejs web app-> create dockerfile ->build image from docker->run image as a container ->connect a web from container
## pull image and how to run:
cmd:docker build .
cmd:docker build -t mydockerid/projectname .
    eg:docker build -t artoriay/web-docker .
    the new image will show in the docker desktop/image
cmd: docker run artoriay/web-docker
    it will start, but localhost:8080 cannot be opened, need a port maping
cmd: docker run -p 5000(localhost port):8080(container port) <image id>
    eg:docker run -p 5000:8080 artoriay/web-docker
    it will generate an new container with random name, open localhost:5000
    make sure the conatiner port ===index.js port
## others:
cmd: docker run -it artoriay/web-docker sh
/ # ls
it will show all the documents in the container
/ # exit
it will exit 
cmd:docker ps -a
 to view a list of all containers, including those that are stopped.
cmd: docker ps
to check the information of current container including the container id.
cmd: docker start [container name]
 to start a container
## minimizing the rebuilds images
split COPY ./ ./ into 2 steps in Dockerfile:
COPY ./package.json ./
to find the package.json file and copy and paste in the WORKDIR directory
RUN npm install
to install the independencies only when package.json changed
COPY ./ ./ 
to copy the rest 
when change the project files , rebuild the container, all changes will put in new one.
cmd: docker build -t artoriay/web-docker .
docker run -p 8080:8080 artoriay/web-docker
it will create a new container 
