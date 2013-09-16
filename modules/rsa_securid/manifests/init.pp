class rsa_securid {
  package { 'RSA SecurID':
    provider => 'pkgdmg',
    source => "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMac412.dmg",
    ensure => 'installed'
  }
}
