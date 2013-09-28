class onepassword_customisations(
  $name,
  $key
) {
  require onepassword

  boxen::osx_defaults { 'Install 1Password license name':
    key => "License:Person",
    value => $name,
    domain => 'ws.agile.1Password',
    user => $::boxen_user,
    ensure => 'present',
    require => Class['onepassword']
  }

  boxen::osx_defaults { 'Install 1Password license name':
    key => "License:Serial",
    value => $key,
    domain => 'ws.agile.1Password',
    user => $::boxen_user,
    ensure => 'present',
    require => Class['onepassword']
  }
}
