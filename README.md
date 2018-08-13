#docker-apprtc

Docker container for [apprtc] [3]

> Detailed information on developing in the webrtc github repo can be found in the WebRTC GitHub repo developer's guide.

## Install dependencies

  - [Docker] [2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage (no checking out)

	$ docker build -t hisign.com/broadcastserver .

## Usage (building pre-built image from build)

	$ docker run -it --name broadcastserver -p 3001:3001 -p 3000:3000 hisign.com/broadcastserver
	
## Accessing the web app:

After that open up the following address :

  - **http://$DOCKER_HOST:3000/


## More Info

About apprtc: [https://github.com/AnsonLoveLina/broadCastNodeJS] [1]
