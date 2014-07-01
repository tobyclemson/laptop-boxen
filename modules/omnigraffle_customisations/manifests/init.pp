class omnigraffle_customisations(
  $key,
  $owner
) {
  $username = $::boxen_user
  $omni_dir = "/Users/${username}/Library/Application Support/Omni Group"
  $license_dir = "${omni_dir}/Software Licenses"

  file { [$omni_dir, $license_dir]:
    ensure => 'directory',
  }

  file { "${license_dir}/Omnigraffle-503655.omnilicense":
    ensure  => 'present',
    content => template("omnigraffle_customisations/license.plist.erb"),
  }
}
