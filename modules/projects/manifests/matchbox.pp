class projects::matchbox {
  repository { "/Users/${::boxen_user}/Code/matchbox":
    source   => 'tobyclemson/matchbox',
    provider => 'git',
    require  => File['code'],
  }

  repository { "/Users/${::boxen_user}/Code/matchbox-javafunk":
    source   => 'javafunk/matchbox',
    provider => 'git',
    require  => File['code'],
  }
}
