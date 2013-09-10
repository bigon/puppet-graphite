# Class: graphite::whisper::package
#
class graphite::whisper::package {
  $package_name = $::osfamily ? {
    /(?i:Debian)/ => 'python-whisper',
    default       => 'whisper',
  }

  package { $package_name:
    ensure   => present,
    provider => $package_provider,
  }
}

