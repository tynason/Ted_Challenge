
https://github.com/tynason/Ted_Challenge 

Docker container with bash script to build and run the image on an existing EC2 instance as a homework assignment for an application to a Comcast position.

To demo this I would run:
ssh -i ~/.ssh/my_pem_file.pem ubuntu@< IP of amazon instance 
git clone git://github.com/tynason/Ted_Challenge && cd Ted_Challenge && chmod +x dock.sh && ./dock.sh

Once the shell finishes, check the service and redirect to https via http://<IP of amazon instance>.
