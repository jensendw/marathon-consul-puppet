# == Class: marathon_consul
#
#  Module to install marathon-consul bridge
#
class marathon_consul (
  $install_method                 = $marathon_consul::params::install_method,
  $package_name                   = $marathon_consul::params::package_name,
  $download_url_base              = $marathon_consul::params::download_url_base,
  $download_extension             = $marathon_consul::params::download_extension,
  $version                        = $marathon_consul::params::version,
  $architecture                   = $marathon_consul::params::architecture,
  #$config_mode                    = $marathon_consul::params::config_mode,
  $conf_dir                       = $marathon_consul::params::conf_dir,
  $init_style                     = $marathon_consul::params::init_style,
  $init_path                      = $marathon_consul::params::init_path,
  $service_name                   = $marathon_consul::params::service_name,
  $options                        = $marathon_consul::params::options
  ) inherits marathon_consul::params {

  validate_string($install_method)
  validate_string($package_name)
  validate_string($download_url_base)
  validate_string($version)
  validate_string($architecture)
  validate_string($conf_dir)
  validate_string($init_style)
  validate_string($init_path)
  validate_string($service_name)
  validate_hash($options)

  anchor { 'marathon_consul::begin': } ->
  class { '::marathon_consul::install': } ->
  class { '::marathon_consul::config': } ->
  class { '::marathon_consul::service': } ->
  anchor { 'marathon_consul::end': }

  #stuff goes here
}
