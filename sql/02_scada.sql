CREATE DATABASE scadalts;
CREATE USER 'scada'@'%' IDENTIFIED BY 'scada';
GRANT ALL PRIVILEGES ON `scadalts`.* TO 'scada'@'%';
