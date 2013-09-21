class rsa_securid(
  $identity,
  $password
) {
  $home_dir = "/Users/${::boxen_user}"
  $temp_dir = "$boxen_home/tmp/rsa_securid"
  $securid_utils_dmg = "$temp_dir/rsa_securid_mac_utils.dmg"
  $securid_utils_volume = "/Volumes/RSASecurIDUtils412"
  $securid_utils_volume_token_importer = "$securid_utils_volume/Tokenimporter"
  $securid_token_importer = "$temp_dir/tokenimporter"
  $securid_token_importer_test = "test -f $securid_token_importer"
  $securid_identity = "$temp_dir/tclemson-identity.sdtid"

  package { 'RSA SecurID':
    provider => 'pkgdmg',
    source => "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMac412.dmg",
    ensure => 'installed'
  }

  file { $temp_dir:
    ensure => 'directory',
    recurse => true
  }

  file { $securid_utils_dmg:
    source => "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMacUtils412.dmg",
    ensure => 'present',
    require => File[$temp_dir]
  }

  exec { 'open-securid-utils':
    command => "open $securid_utils_dmg",
    creates => $securid_utils_volume,
    require => File[$securid_utils_dmg],
    unless => $securid_token_importer_test
  }

  exec { 'copy-token-importer':
    command => "cp $securid_utils_volume_token_importer $securid_token_importer",
    creates => $securid_token_importer,
    require => Exec["open $securid_utils_dmg"],
    unless => $securid_token_importer_test
  }

  exec { 'unmount-securid-utils':
    command => "umount $securid_utils_volume",
    require => Exec['open-securid-utils', 'copy-token-importer'],
    unless => $securid_token_importer_test
  }

  file { $securid_identity:
    content => $identity,
    ensure => 'present'
  }

  exec { 'import-token':
    command => "$securid_token_importer -f $securid_identity -p $password",
  }
}
