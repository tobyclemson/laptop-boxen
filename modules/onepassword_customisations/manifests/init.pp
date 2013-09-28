class onepassword_customisations(
  $person,
  $serial
) {
  require onepassword

  plistbuddy::add { 'Install 1Password license person':
    target_plist => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    add_path => ":License:Person",
    type => 'string',
    value => $person,
  }

  plistbuddy::add { 'Install 1Password license serial':
    target_plist => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    add_path => ":License:Serial",
    type => 'string',
    value => $serial,
  }


  # boxen::osx_defaults { 'Install 1Password license person':
  #   key => "License:Person",
  #   value => $person,
  #   domain => 'ws.agile.1Password',
  #   user => $::boxen_user,
  #   ensure => 'present',
  #   require => Class['onepassword']
  # }

  # boxen::osx_defaults { 'Install 1Password license serial':
  #   key => "License:Serial",
  #   value => $serial,
  #   domain => 'ws.agile.1Password',
  #   user => $::boxen_user,
  #   ensure => 'present',
  #   require => Class['onepassword']
  # }
}
