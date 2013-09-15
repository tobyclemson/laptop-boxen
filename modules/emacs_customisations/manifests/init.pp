class emacs_customisations {
  require prelude

  $home_dir = "/Users/${::luser}"
  $emacsd_dir = "$home_dir/.emacs.d"

  file { "$emacsd_dir/personal":
    ensure => 'directory',
    recurse => 'true',
    source => "puppet:///modules/emacs_customisations/personal",
    require => Class['prelude']
  }

  file { "$emacsd_dir/prelude-modules.el":
    ensure => 'directory',
    recurse => 'true',
    source => "puppet:///modules/emacs_customisations/prelude-modules.el",
    require => Class['prelude']
  }
}
