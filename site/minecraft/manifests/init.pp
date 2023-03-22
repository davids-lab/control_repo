class minecraft {
  file {'/opt/minecraft':  #Creates minecraft directory
    ensure => directory,
  }
  file {'/opt/minecraft/server.jar': #download minecraft server file
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar'
  }
  package {'java':  #Makes sure JAVA is installed
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':  #Confirms EULA doc
    ensure   => file,
    content  => 'eula=true',
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
