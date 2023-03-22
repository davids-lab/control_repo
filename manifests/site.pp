node default {
   file { '/root/README':
      ensure => file,
      content => 'this is a readme',
      owner => 'root',
   }
}
node 'minetest.puppet,vm' {
  include role::minecraft_server
}
node david.master {
   include role::master_server
   file {'/root/README':
     ensure  =>  file,
     content =>  "Welcome to ${fqdn}\n",
   }
}

node /^web/ {
   include role::app_server
}
  
node /^db/ {
  include role::db_server
}
