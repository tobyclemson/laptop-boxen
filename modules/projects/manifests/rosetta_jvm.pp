class projects::rosetta_jvm {
  repository { "/Users/${::boxen_user}/Code/rosetta-jvm":
    source   => 'tobyclemson/rosetta-jvm',
    provider => 'git',
    require  => File['code'],
  }
}
