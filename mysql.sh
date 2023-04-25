echo -e"\e [36m >>>>>>> Enabling mysql required version <<<<<<<\e[0m"
dnf module disable mysql -y
echo -e"\e [36m >>>>>>> Copying the mysql repo <<<<<<<\e[0m"
cp /home/centos/Roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo
echo -e"\e [36m >>>>>>> Installing mysql <<<<<<<\e[0m"
yum install mysql-community-server -y
echo -e"\e [36m >>>>>>> Enable startup services and start the mysql servies <<<<<<<\e[0m"
systemctl enable mysqld
systemctl start mysqld
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1
