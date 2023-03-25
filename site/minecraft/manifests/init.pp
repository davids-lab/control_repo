class minecraft {
  file {'/opt/minecraft':  #Creates minecraft directory
    ensure => directory,
  }
  file {'/opt/minecraft/server.jar': #download minecraft server file
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar'
  }
  file {'/opt/minecraft/jdk-17.0.6_linux-x64_bin.rpm':  #installs JAVA17
    ensure   => file,
    source  => 'https://download.oracle.com/java/17/archive/jdk-17.0.6_linux-x64_bin.rpm',
  }
    package {'java':  #Makes sure JAVA is installed
    ensure => present,
  }
  file {'/etc/systemd/system/minecraft.service': #Creates file as a service
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft':
    ensure => running
    enable => true,
  }
}
