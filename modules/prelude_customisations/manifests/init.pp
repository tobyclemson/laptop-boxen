class prelude_customisations {
  require prelude

  $home_dir = "/Users/${::luser}"
  $emacsd_dir = "$home_dir/.emacs.d"

  file { "$emacsd_dir/personal":
    ensure => 'directory',
    recurse => 'true',
    source => "puppet:///modules/prelude_customisations/personal",
    require => Class['prelude']
  }

  file { "$emacsd_dir/themes":
    ensure => 'directory',
    recurse => 'true',
    source => "puppet:///modules/prelude_customisations/themes",
    require => Class['prelude']
  }
}
