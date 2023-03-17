class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure => 'running',
    enable => 'true',
  }
  ssh_authorized_key { 'root@david.master':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDgxDrRX+7UOD7faFVYRM0R3mlTWuZ2XlT4XOIz2/HKpdJYbsUS6K7APslIMu3WxvYDkC9TsfG5jQVpXWzSV6NsGTPutI7iUAXnnidsTlegDxt60DmW8RWUYRG8+sxljXDzRJD1MUJwx/sg3JgGOrSD/5lEbfVukdr6CQIBVpJBSy0OeG/v09xgI46ptNlZs6aI1yrZL/aPhY9vU595dRInJiADUkrmuExVaJ0jskNGUXKiQyJnJf8+YV41Ow67+dPxagmyqLge/kqg47smtORRdB1KDOgCgp+YtZpG2K4HjJdO5D9l6U5CitE02G9l+Ye2cgydJ3qxjvAcgz+Nf/Mp',
  }  
}
