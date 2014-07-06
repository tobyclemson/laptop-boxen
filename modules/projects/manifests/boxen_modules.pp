class projects::boxen_modules {
  $boxen_modules_dir = "/Users/${::boxen_user}/Code/boxen-modules"

  file { $boxen_modules_dir:
    ensure  => 'directory',
    require => File['code'],
  }

  repository { "${boxen_modules_dir}/puppet-libreoffice":
    source   => 'tobyclemson/puppet-libreoffice',
    provider => 'git',
    require  => File[$boxen_modules_dir],
  }

  repository { "${boxen_modules_dir}/puppet-gpgtools":
    source   => 'tobyclemson/puppet-gpgtools',
    provider => 'git',
    require  => File[$boxen_modules_dir],
  }

  repository { "${boxen_modules_dir}/puppet-eclipse":
    source   => 'tobyclemson/puppet-eclipse',
    provider => 'git',
    require  => File[$boxen_modules_dir],
  }

  repository { "${boxen_modules_dir}/puppet-couchdbx":
    source   => 'tobyclemson/puppet-couchdbx',
    provider => 'git',
    require  => File[$boxen_modules_dir],
  }

  repository { "${boxen_modules_dir}/puppet-omnigraffle":
    source   => 'tobyclemson/puppet-omnigraffle',
    provider => 'git',
    require  => File[$boxen_modules_dir],
  }
}
