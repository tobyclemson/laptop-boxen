class onepassword_customisations(
  $license,
) {
  require onepassword

  $home_dir = "/Users/${::boxen_user}"
  $one_password_dir = "${home_dir}/Library/Application Support/1Password 4"
  $one_password_license_dir = "${one_password_dir}/License"

  file { [$one_password_dir, $one_password_license_dir]:
    ensure => directory,
  }

  file { "${one_password_license_dir}/License.onepassword-license":
    ensure => 'present',
    content => $license,
    require => File[$one_password_license_dir],
  }
}
