# = Class: graphite::params
#
class graphite::params {
  $config_dir = $::osfamily ? {
    /(?i:Debian)/ => '/etc/graphite',
    /(?i:RedHat)/ => '/etc/graphite-web',
    default       => '/etc/graphite-web',
  }

  $manage_httpd = false
  $time_zone    = 'UTC'
}

