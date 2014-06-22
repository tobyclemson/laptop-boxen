class projects::mfcom_dev {
  repository { "/Users/${::boxen_user}/Code/mfcom-dev":
    source   => 'tobyclemson/mfcom-dev',
    provider => 'git',
    require  => File['code'],
  }
}
