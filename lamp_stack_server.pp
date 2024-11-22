# Install Apache
package { 'apache2':
  ensure => installed,
}

# Install PHP
package { 'php':
  ensure  => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

# Install PHP MySQL Connector
package { 'php-mysql':
  ensure  => installed,
  require => Package['php'],
}

# Manage the phpinfo.php file
file { '/var/www/html/phpinfo.php':
  content => "<?php\nphpinfo();\n?>",
  notify  => Service['apache2'],
  require => [Package['apache2'], Package['php']],
}

# Ensure Apache is running and enabled
service { 'apache2':
  ensure  => running,
  enable  => true,
  require => [Package['apache2'], Package['php']],
}

