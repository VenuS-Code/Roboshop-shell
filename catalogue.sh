
echo -e "\e[32m >>>>>>>>> Configuring the NodeJS repos<<<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[32m >>>>>>>>> Installing NodeJS <<<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[32m >>>>>>>>>Adding a Roboshop User <<<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[32m >>>>>>>>>Creating a Application Directory <<<<<<<<<\e[0m"
mkdir /app
echo -e "\e[32m >>>>>>>>> Downloading code artifacts <<<<<<<<<\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
echo -e "\e[32m >>>>>>>>> Unzip catatalogue.zip File<<<<<<<<<\e[0m"
unzip /tmp/catalogue.zip
cd /app
echo -e "\e[32m >>>>>>>>> Installing Node Package Manager<<<<<<<<<\e[0m"
npm install
cp /home/centos/Roboshop-shell/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
cp /home/centos/Roboshop-shell/mongo.repo /etc/yum.repos.s/mongo.repo
yum install mongodb-org-shell -y
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js