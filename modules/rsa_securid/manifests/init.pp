class rsa_securid(
  $identity,
  $password
) {
  $home_dir = "/Users/${::boxen_user}"
  $temp_dir = "$boxen_home/tmp"

  $securid_temp_dir = "$temp_dir/rsa_securid"

  $securid_token_dmg_url = "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMac412.dmg"
  $securid_token_importer = "$securid_temp_dir/tokenimporter"
  $securid_token_importer_test = "test -f $securid_token_importer"

  $securid_utils_dmg_url = "ftp://ftp.rsasecurity.com/pub/agents/RSASecurIDMacUtils412.dmg"
  $securid_utils_dmg = "$securid_temp_dir/rsa_securid_mac_utils.dmg"
  $securid_utils_dmg_test = "test -f $securid_utils_dmg"

  $securid_utils_volume = "/Volumes/RSASecurIDUtils412"
  $securid_utils_volume_token_importer = "$securid_utils_volume/Tokenimporter"
  $securid_utils_volume_test = "test -e $securid_utils_volume"

  $securid_identity = "$securid_temp_dir/tclemson-identity.sdtid"
  $securid_identity_installed_receipt = "$securid_temp_dir/token-installed"
  $securid_identity_installed_test = "test -f $securid_identity_installed_receipt"

  package { 'rsa-securid':
    provider => 'pkgdmg',
    source => $securid_token_dmg_url,
    ensure => 'installed'
  }

  file { [$temp_dir, $securid_temp_dir]:
    ensure => 'directory',
  }

  exec { 'fetch-securid-utils':
    command => "wget $securid_utils_dmg_url -O $securid_utils_dmg",
    require => [Package['wget'], File[$securid_temp_dir]],
    unless => $securid_utils_dmg_test,
  }

  exec { 'open-securid-utils':
    command => "hdiutil attach $securid_utils_dmg -nobrowse",
    creates => $securid_utils_volume,
    require => Exec['fetch-securid-utils'],
    unless => $securid_token_importer_test
  }

  exec { 'copy-token-importer':
    command => "cp $securid_utils_volume_token_importer $securid_token_importer",
    creates => $securid_token_importer,
    require => Exec['open-securid-utils'],
    unless => $securid_token_importer_test
  }

  exec { 'unmount-securid-utils':
    command => "umount $securid_utils_volume",
    require => Exec['copy-token-importer'],
    onlyif => $securid_utils_volume_test
  }

  exec { 'create-identity-file':
    command => "echo '$identity' > $securid_identity",
    unless => $securid_identity_installed_test,
    require => File[$securid_temp_dir]
  }

  exec { 'import-token':
    command => "$securid_token_importer -f $securid_identity -p $password",
    unless => $securid_identity_installed_test,
    require => [
      Exec['create-identity-file', 'copy-token-importer'],
      Package['rsa-securid']
    ]
  }

  file { 'token-imported-receipt':
    name => $securid_identity_installed_receipt,
    ensure => 'present',
    content => '',
    require => Exec['import-token']
  }
}
