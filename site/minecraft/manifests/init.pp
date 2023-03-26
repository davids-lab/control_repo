class minecraft {
  file {'/opt/minecraft': 
    ensure => directory,
  }
  file {'/opt/minecraft/server.jar': 
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar',
  }
  file {'/opt/minecraft/jdk-17.0.6_linux-x64_bin.rpm': 
    ensure   => file,
    source  => 'https://download.oracle.com/java/17/archive/jdk-17.0.6_linux-x64_bin.rpm',
  }
  exec {'java 17':
    command => 'rpm -i jdk-17.0.6_linux-x64_bin.rpm',
    path    => '/usr/bin',
  }
  package {'java': 
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true'
  }
  file {'/etc/systemd/system/minecraft.service': 
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running,
    enable => true,
  }
}
