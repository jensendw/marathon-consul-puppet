# == Class: marathon_consul::install
#
#  Fetches and installs the marathon_consul binary
#
class marathon_consul::install {
  case $marathon_consul::install_method {
    'url': {
      include ::staging
      staging::deploy { "${marathon_consul::package_name}-${marathon_consul::version}.${marathon_consul::download_extension}":
        source  => "${marathon_consul::download_url_base}${marathon_consul::version}/${marathon_consul::package_name}_${marathon_consul::version}_linux_amd64.${marathon_consul::download_extension}",
        target  => '/opt/',
        creates => "/opt/${marathon_consul::package_name}-${marathon_consul::version}_${marathon_consul::architecture}",
      }

      file { "/opt/${marathon_consul::package_name}":
        ensure => link,
        target => "/opt/${marathon_consul::package_name}_${marathon_consul::version}_${marathon_consul::architecture}",
      }

    }
    default: {
      fail('Unknown install method specified')
    }
  }
}
