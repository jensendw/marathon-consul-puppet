# == Class: marathon_consul::config
#
#  Handles necessary configuration for marathon-consul service
#
class marathon_consul::config {

  file { $marathon_consul::conf_dir:
    ensure => directory,
  }

  file { "${marathon_consul::conf_dir}/marathon-consul.conf":
    ensure  => file,
    content => template('marathon_consul/marathon-consul.conf.erb'),
    notify  => Service[$marathon_consul::service_name],
  }

  file { $marathon_consul::init_path:
    content => template("marathon_consul/marathon-consul.${marathon_consul::init_style}.erb"),
    mode    => '0755',
  }
}
