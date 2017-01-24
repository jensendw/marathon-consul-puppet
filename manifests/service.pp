# == Class: marathon_consul::service
#
#  Sets up the service for marathon-consul
#
class marathon_consul::service {

  service { $marathon_consul::service_name:
    ensure  => running,
    enable  => true,
    require => File[$marathon_consul::init_path],
  }
}
