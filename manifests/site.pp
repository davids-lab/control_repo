node default {
   file { '/root/README':
      ensure => file,
      content => 'this is a readme',
      owner => 'root",
      
  }
 
node david.master.vm {
   include role::master_server
 }

node /^web/ {
   include role::app_server
}
  
node /^db/ {
  include role::db_server
}
