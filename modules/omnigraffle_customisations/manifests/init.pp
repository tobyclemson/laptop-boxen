class omnigraffle_customisations(
  $key,
  $owner
) {
  $username = $::boxen_user
  $containers_dir = "/Users/${username}/Library/Containers"
  $omni_container_dir = "${containers_dir}/com.omnigroup.OmniGraffle6"
  $data_dir = "${omni_container_dir}/Data"
  $library_dir = "${data_dir}/Library"
  $app_support_dir = "${library_dir}/Application Support"
  $omni_dir = "${app_support_dir}/Omni Group"
  $license_dir = "${omni_dir}/Software Licenses"

  file { [
      $containers_dir,
      $omni_container_dir,
      $data_dir,
      $library_dir,
      $app_support_dir,
      $omni_dir,
      $license_dir
    ]:
    ensure => 'directory',
  }

  file { "${license_dir}/Omnigraffle-762283.omnilicense":
    ensure  => 'present',
    content => template("omnigraffle_customisations/license.plist.erb"),
  }
}
