class projects::mfcom_dev {
  repository { "/Users/${::boxen_user}/Code/mfcom-dev":
    source   => 'ThoughtWorksInc/mfcom-dev',
    provider => 'git',
    require  => File['code'],
  }
}
