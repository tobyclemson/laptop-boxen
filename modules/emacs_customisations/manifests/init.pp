class emacs_customisations {
  require prelude

  $home_dir = "/Users/${::luser}"
  $emacsd_dir = "$home_dir/.emacs.d"

  file { "$emacsd_dir/personal":
    ensure => 'directory',
    recurse => 'true',
    source => "puppet:///modules/prelude_customisations/emacs.d/personal",
    require => Class['prelude']
  }

  file { "$emacsd_dir/themes":
    ensure => 'directory',
    recurse => 'true',
    source => "puppet:///modules/prelude_customisations/emacs.d/themes",
    require => Class['prelude']
  }
}
