# Class: graphite::carbon::service
#
class graphite::carbon::service {
  $service_name = $::graphite::carbon::params::service_name

  service { $service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
  if ($::osfamily == 'Debian'){
    augeas { "CARBON_CACHE_ENABLED":
      context => "/files//etc/default/graphite-carbon",
      changes => [
        "set CARBON_CACHE_ENABLED true",
      ],
      before  => Service["$service_name"],
    }
  }
}

