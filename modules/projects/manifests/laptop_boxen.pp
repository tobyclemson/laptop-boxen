class projects::laptop_boxen {
  repository { "/Users/${::boxen_user}/Code/laptop-boxen":
    source   => 'tobyclemson/laptop-boxen',
    provider => 'git',
    require  => File['code'],
  }
}
