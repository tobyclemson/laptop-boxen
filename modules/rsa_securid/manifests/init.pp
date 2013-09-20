class rsa_securid($identity = '') {
  $home_dir = "/Users/${::luser}"

  package { 'RSA SecurID':
    provider => 'pkgdmg',
    source => "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMac412.dmg",
    ensure => 'installed'
  }

  file { '$home_dir/tclemson-identity.sdtid':
    content => $identity,
    ensure => 'present'
  }

  file { '$home_dir/boxen_home':
    content => $::boxen_home,
    ensure => 'present'
  }
}
