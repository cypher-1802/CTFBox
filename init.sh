#NEW USER
echo "Enter ChallengeNo :"
read username
sudo useradd -m $username
sudo passwd $username
sudo usermod -aG sudo $username

#COPYING FILES(docker still need to be configured)
cp /home/gdsc-root/build.sh .
cp /home/gdsc-root/dockerfile .

mkdir challengeFile
cp /home/gdsc-root/$username/* challengeFile

#BASHRC SCRIPT
echo -e "docker run -it --rm --entrypoint /bin/bash $username\nif [ \$? -eq 0 ]\nthen exit 0\nfi" >> .bashrc

#DOCKER
cd /home/$username
sudo apt -y install docker.io
sudo groupadd docker
sudo usermod -aG docker $username
sudo newgrp docker

#DOCKER IMAGE
docker image build . -t $username