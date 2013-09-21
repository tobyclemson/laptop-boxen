class rsa_securid(
  $identity,
  $password
) {
  $home_dir = "/Users/${::boxen_user}"
  $temp_dir = "$boxen_home/tmp"
  $securid_temp_dir = "$temp_dir/rsa_securid"
  $securid_token_dmg_url = "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMac412.dmg"
  $securid_utils_dmg_url = "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMacUtils412.dmg"
  $securid_utils_dmg = "$temp_dir/rsa_securid_mac_utils.dmg"
  $securid_utils_dmg_test = "test -f $securid_utils_dmg"
  $securid_utils_volume = "/Volumes/RSASecurIDUtils412"
  $securid_utils_volume_token_importer = "$securid_utils_volume/Tokenimporter"
  $securid_token_importer = "$temp_dir/tokenimporter"
  $securid_token_importer_test = "test -f $securid_token_importer"
  $securid_identity = "$temp_dir/tclemson-identity.sdtid"

  package { 'RSA SecurID':
    provider => 'pkgdmg',
    source => $securid_token_dmg_url,
    ensure => 'installed'
  }

  file { [$temp_dir, $securid_temp_dir]:
    ensure => 'directory',
  }

  exec { 'fetch-securid-utils':
    command => "wget $securid_utils_dmg_url -O $securid_utils_dmg",
    require => File[$securid_temp_dir],
    unless => $securid_utils_dmg_test
  }

  exec { 'open-securid-utils':
    command => "open $securid_utils_dmg",
    creates => $securid_utils_volume,
    require => Exec['fetch-securid-utils'],
    unless => $securid_token_importer_test
  }

  exec { 'copy-token-importer':
    command => "cp $securid_utils_volume_token_importer $securid_token_importer",
    creates => $securid_token_importer,
    require => Exec['copy-token-importer'],
    unless => $securid_token_importer_test
  }

  exec { 'unmount-securid-utils':
    command => "umount $securid_utils_volume",
    require => Exec['open-securid-utils', 'copy-token-importer'],
    unless => $securid_token_importer_test
  }

  file { 'create-identity-file':
    name => $securid_identity,
    content => $identity,
    ensure => 'present',
    require => File[$temp_dir]
  }

  exec { 'import-token':
    command => "$securid_token_importer -f $securid_identity -p $password",
    require => [
      File['create-identity-file'],
      Exec['copy-token-importer']
    ]
  }
}
