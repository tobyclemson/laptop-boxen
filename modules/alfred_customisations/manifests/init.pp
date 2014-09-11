class alfred_customisations(
  $code,
  $email
) {
  $home_dir = "/Users/$::boxen_user"

  $alfred_app_support_dir = "${home_dir}/Library/Application Support/Alfred 2"
  $alfred_license_plist = "$alfred_app_support_dir/license.plist"

  file { $alfred_app_support_dir:
    ensure => 'directory'
  }

  plist::file { $alfred_license_plist:
    require => File[$alfred_app_support_dir]
  }

  plist::entry { 'Alfred license email':
    target => $alfred_license_plist,
    path => ":'email'",
    type => 'string',
    value => $email,
    require => Plist::File[$alfred_license_plist]
  }

  plist::entry { 'Alfred license code':
    target => $alfred_license_plist,
    path => ":'code'",
    type => 'string',
    value => $code,
    require => Plist::File[$alfred_license_plist]
  }
}
