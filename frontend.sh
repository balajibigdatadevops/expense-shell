echo -e "\e[31m installing nginx package\e[0m"
dnf install nginx -y &>>/tmp/expense-frontend.log
echo $?

echo -e "\e[32m clearing nginx file content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense-frontend.log
echo $?

echo -e "\e[33m copying nginx reverse proxy configuration file \e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf &>>/tmp/expense-frontend.log
echo $?

echo -e "\e[34m downloading application content \e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense-frontend.log
echo $?

echo -e "\e[35m extracting application code content \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>/tmp/expense-frontend.log
echo $?

echo -e "\e[36m enabling and starting nginx service\e[0m"
systemctl enable nginx &>>/tmp/expense-frontend.log
systemctl restart nginx &>>/tmp/expense-frontend.log
echo $?
