cp /home/centos/Roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org -y
systemctl enable mongod
systemctl start mongod
# Need to change default address 127.0.01 to 0.0.0.0 in /etc/mongod.conf
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
systemctl restart mongod