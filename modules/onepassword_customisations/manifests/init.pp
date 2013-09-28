class onepassword_customisations(
  $person,
  $serial
) {
  require onepassword

  plistbuddy::set { 'Install 1Password license person':
    target_plist => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    set_path => ":License:Person",
    value => $person,
  }

  plistbuddy::set { 'Install 1Password license serial':
    target_plist => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    set_path => ":License:Serial",
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
