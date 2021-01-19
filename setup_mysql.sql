ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password999';
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'password999';
mysql --host=localhost --user=root --password=password999
create database myDB;
use myDB;
CREATE TABLE MyGuests (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50),
reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
insert into MyGuests  (id,firstname,lastname) values ( 1,'Aneesh','Vijayan');
