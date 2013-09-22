class sizeup_customisations(
  $license,
  $home_dir = "/Users/$::boxen_user",
) {
  $sizeup_settings_dir = "$home_dir/Library/Application Support/SizeUp"

  file { "$sizeup_settings_dir":
    ensure => 'directory'
  }

  file { "$sizeup_settings_dir/SizeUp.sizeuplicense":
    content => $license,
    ensure => 'present'
  }
}
