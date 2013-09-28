class onepassword_customisations(
  $person,
  $serial
) {
  require onepassword

  boxen::osx_defaults { 'Install 1Password license name':
    key => "License:Person",
    value => $person,
    domain => 'ws.agile.1Password',
    user => $::boxen_user,
    ensure => 'present',
    require => Class['onepassword']
  }

  boxen::osx_defaults { 'Install 1Password license name':
    key => "License:Serial",
    value => $serial,
    domain => 'ws.agile.1Password',
    user => $::boxen_user,
    ensure => 'present',
    require => Class['onepassword']
  }
}
