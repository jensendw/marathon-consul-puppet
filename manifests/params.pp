# == Class: marathon_consul::params
#
#  All parameters for the marathon_consul puppet module
#
class marathon_consul::params {
  $install_method                 = 'url'
  $package_name                   = 'marathon-consul'
  $download_url_base              = 'https://github.com/allegro/marathon-consul/releases/download/v'
  $download_extension             = 'tar.gz'
  $version                        = '1.2.1'
  $architecture                   = 'linux_amd64'
  $config_mode                    = '0660'
  $conf_dir                       = "/etc/${package_name}"
  $service_name                   = $package_name
  $options                        = {}

  #set init style
  if $::operatingsystem =~ /Scientific|CentOS|RedHat|OracleLinux/ {
    case $::operatingsystemmajrelease {
      '7': {
        $init_style = 'systemd'
        $init_path  = "/lib/systemd/system/${service_name}.service"
      }
      default: {
        fail('Unsupported operating system version')
      }
    }
  } else {
    fail('Unsupported operating system')
  }


}
