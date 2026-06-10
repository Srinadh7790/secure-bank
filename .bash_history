apt update -y && apt upgrade -y
apt install git -y
yum install git -y
yum install java-21-amazon-corretto -y
java --version
git --version
vi securebank-key.pem
chmod 400 pem
chmod 400 securebank-key.pem
ssh -i "securebank-key.pem" ec2-user@10.0.2.219
ls
cd securebank/ 
ls
mvn clean package
ls
cd securebank/
ls
mvn clean package
java -version
javac -version
maven -version
maven --version
yum install maven -y
maven --version
cd ..
maven --version
yum install maven -y
mvn --version
cd securebank/
ls
java --version
javac --version
which java
which javac
echo $JAVA_HOME
sudo alternatives --config java
sudo alternatives --config javac
echo $JAVA_HOME
ls /usr/lib/jvm/
/usr/lib/jvm/java-21-amazon-corretto.x86_64
export JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto.x86_64
export PATH=$JAVA_HOME/bin:$PATH
java --version
javac --version
mvn --version
mvn clean package
ls
cd target/
ls
java -jar target/*.jar
cd ..
java -jar target/*.jar
cd ~/securebank
find src/main/java -name "*.java"
grep -R "@GetMapping" src/main/java
mkdir -p src/main/java/com/bank/securebank
vi src/main/java/com/bank/securebank/BankController.java
ls
mvn clean
ls
mvn clean package
java -jar target/*.jar
ls
ls -l /home/ec2-user
cd /home
cd /ec2-user
ls
cd ec2-user
ls
apt install unzip -y
yum install unzip -y
unzip securebank.zip 
ls
mv /home/ec2-user/securebank /root/
ls
cd ..
ls
cd home
cd ec2-user
ls
unzip securebank.zip 
ls
vi securebank-key.pem
chmod 400 securebank-key.pem 
ssh -i "securebank-key.pem" ec2-user@10.0.2.219
scp -i securebank-key.pem securebank.zip ec2-user@10.0.2.219:/home/ec2-user/
vi securebank-key.pem
chmod 400 securebank-key.pem 
scp -i securebank-key.pem securebank.zip ec2-user@10.0.2.219:/home/ec2-user/
ssh -i "securebank-key.pem" ec2-user@10.0.2.219
ls
cd securebank/
ls
mvn clean package
yum install maven --y
yum install maven -y
java --version
mvn clean package
javac -version
java -version
mvn -version
sudo alternatives --config java
mvn clean package
sudo alternatives --config javac
sudo dnf install java-21-amazon-corretto-devel -y
sudo alternatives --config java
sudo alternatives --config javac
sudo alternatives --config java
sudo alternatives --config javac
java -v
java --version
javac --version
mvn clean package
javac -version
mvn -version
which javac
echo $JAVA_HOME
ls
cd securebank/
ls
java -jar target/*.jar
sudo ss -tulpn | grep 8080
curl http://localhost:8080/
curl http://localhost:8080/balance
kill -9 9364
java -jar target/*.jar
ls
cd target/
ls
exit
sudo -su
sudo su
exit
vi securebank-key.pem
chmod 400 securebank-key.oem
chmod 400 securebank-key.pem
ssh -i "securebank-key.pem" ec2-user@10.0.2.219
ssh -i securebank-key.pem ec2-user@10.0.2.219
ls
cd securebank/
ls
cd target/
scp -i securebank-key.pem target/*.jar ec2-user@10.0.2.219
ls
scp -i ../securebank-key.pem securebank-0.0.1-SNAPSHOT.jar ec2-user@10.0.2.219:~
scp -i ../securebank-key.pem securebank-0.0.1-SNAPSHOT.jar ec2-user@10.0.2.219
ls
hostname -I
hostname
ssh -i ~/securebank-key.pem ec2-user@10.0.2.219
scp -i securebank-key.pem securebank.zip ec2-user@10.0.2.219:/home/ec2-user/
cd ..
scp -i securebank-key.pem securebank.zip ec2-user@10.0.2.219:/home/ec2-user/
cd ~
ls -l securebank-key.pem
scp -i securebank-key.pem securebank.zip ec2-user@10.0.2.219:/home/ec2-user/
find /root -name "securebank.zip"
ls
scp -i /root/securebank-key.pem /root/securebank/target/securebank-0.0.1-SNAPSHOT.jar ec2-user@10.0.2.219:/home/ec2-user/
ls
cd securebank/
ls
cd ..
ssh -i "securebank-key.pem" root@10.0.2.219
sudo -i
ssh -i "securebank-key.pem" root@10.0.2.219
ssh -i "securebank-key.pem" ec2-user@10.0.2.219
ls
ssh -i "securebank-key.pem" ec2-user@10.0.2.219
