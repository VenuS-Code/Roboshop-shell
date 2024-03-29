yum install nginx -y

systemctl enable nginx
systemctl start nginx

cp /home/centos/Roboshop-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

cd /usr/share/nginx/html

unzip /tmp/frontend.zip

## Some files need to be created

systemctl restart nginx


