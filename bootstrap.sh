# bootstrap Vagrant env

# install JAVA
sudo add-apt-repository ppa:webupd8team/java -y
apt-get update -y
sudo apt-get update -y
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get install oracle-java7-installer -y

# install additional tools
apt-get install -y git
apt-get install -y unzip

# install GVM
curl -s get.gvmtool.net | bash
#source "/home/vagrant/.gvm/bin/gvm-init.sh"
source "/root/.gvm/bin/gvm-init.sh"
#echo "gvm_auto_answer=true" >> /home/vagrant/.gvm/etc/config # make it answer true to questions
echo "gvm_auto_answer=true" >> /root/.gvm/etc/config # make it answer true to questions

#install grails 2.2.4.
gvm install grails 2.2.4

# download GSCF
git clone https://github.com/PhenotypeFoundation/GSCF.git
#git clone -b integrated https://github.com/PhenotypeFoundation/GSCF.git

# go to and start the application
cd GSCF
sed -i "s/your-apikey/c62bc477-a20d-4dc3-802f-92b6d9d78a16/g" /home/vagrant/GSCF/grails-app/conf/default.properties

# startup!
grails compile
grails compile
grails run-app
