echo "AWS_EC2_IP_ADDRESS=$AWS_EC2_IP_ADDRESS"
echo "AWS_EC2_PEM_FILE=$AWS_EC2_PEM_FILE"
echo "AWS_EC2_USER=$AWS_EC2_USER"

EC2_SUDO="ssh -i $AWS_EC2_PEM_FILE $AWS_EC2_USER@$AWS_EC2_IP_ADDRESS sudo "

$EC2_SUDO docker kill aws_geo_server
$EC2_SUDO docker rm /aws_geo_server
$EC2_SUDO docker pull nuuuwan/geo_server
$EC2_SUDO docker run -p 82:82 -d --name aws_geo_server nuuuwan/geo_server
$EC2_SUDO docker ps
