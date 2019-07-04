package_list=(
  # Apache server
  apache2
  libapache2-mod-php5

  # PHP
  php5
  php5-cli
  php5-common
  php5-dev
  php5-mcrypt
  php5-imagick
  php5-imap
  php5-curl
  php5-gd

  # MySQL
  mysql-server
  php5-mysql
  mysql-client

  # Phpmyadmin
  phpmyadmin
)

# APT update
sudo apt-get update -y

# Credentials for MySQL
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
# Credentials for Phpmyadmin
debconf-set-selections <<< 'phpmyadmin phpmyadmin/dbconfig-install boolean true'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/app-password-confirm password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/admin-pass password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/mysql/app-pass password root'
debconf-set-selections <<< 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2'

# Install packages
sudo apt-get install -y ${package_list[@]}

# Set global servername
sudo tee -a /etc/apache2/apache2.conf <<< "ServerName localhost"

# Restarting web server
sudo service apache2 restart
sudo apache2ctl configtest

# Clean apt cache
sudo apt-get clean
