class projects::funk {
  repository { "/Users/${::boxen_user}/Code/funk":
    source   => 'tobyclemson/funk',
    provider => 'git',
    require  => File['code']
  }

  repository { "/Users/${::boxen_user}/Code/funk-javafunk":
    source   => 'javafunk/funk',
    provider => 'git',
    require  => File['code']
  }
}
