class alfred_customisations(
  $code,
  $email
) {
  require alfred

  $home_dir = "/Users/$::boxen_user"

  $alfred_app_support_dir = "${home_dir}/Library/Application Support/Alfred 2"

  file { $alfred_app_support_dir:
    ensure => 'directory'
  }

  plist::entry { 'Alfred license email':
    target => "$alfred_app_support_dir/license.plist",
    path => ":'email'",
    type => 'string',
    value => $email,
    require => File[$alfred_app_support_dir]
  }

  plist::entry { 'Alfred license code':
    target => "$alfred_app_support_dir/license.plist",
    path => ":'code'",
    type => 'string',
    value => $code,
    require => File[$alfred_app_support_dir]
  }
}
