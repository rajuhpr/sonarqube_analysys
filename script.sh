#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
set -x
if [[$EUID -ne 0 ]]; then
    echo "The script must be run as root" 1>&2
    exit 1
fi
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
# sudo echo '<h1>Welcome to DevOps - Training</h1>' | sudo tee /var/www/html/index.html
# sudo mkdir /var/www/html/app1
# sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to DevOps - Aws-Tearraform</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
# sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
sudo yum install java-17* -y
sudo yum install git -y
#install maven
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
sudo tar xvf apache-maven-3.9.4-bin.tar.gz
sudo rm -r apache-maven-3.9.4-bin.tar.gz
sudo mv apache-maven-3.9.4 maven
sudo cd /opt
sudo cp -r /root/maven .  
#install git
sudo yum install git -y
#Jenkins install
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install fontconfig java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl start jenkins -y

#Check Jenkins Status 
sudo service jenkins status
sudo systemctl enable jenkins  

#install docker
sudo yum install docker -y
sudo service docker start
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
sudo systemctl restart docker

#install sonarqube community container
docker run -itd  -p 9000:9000 sonarqube:lts-community

