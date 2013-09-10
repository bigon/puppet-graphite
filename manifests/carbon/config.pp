# Class: graphite::carbon::config
#
class graphite::carbon::config {
  include concat::setup

  $config_dir   = $::graphite::carbon::params::config_dir
  $service_name = $::graphite::carbon::params::service_name
  $www_group    = $::graphite::carbon::params::www_group
  $www_user     = $::graphite::carbon::params::www_user

  concat { "${config_dir}/storage-schemas.conf":
    group  => '0',
    mode   => '0644',
    owner  => '0',
    notify => Service[$::graphite::carbon::params::service_name];
  }

  concat::fragment { 'header':
    target => "${config_dir}/storage-schemas.conf",
    order  => 0,
    source => 'puppet:///modules/graphite/storage-schemas.conf',
  }

  if $::osfamily == 'Debian' {
    # Fixme: needs abstraction
    file { "${config_dir}/carbon.conf":
      ensure  => present,
      mode    => '0640',
      content => template("graphite/carbon.conf.${::osfamily}.erb"),
    }
  }
}

