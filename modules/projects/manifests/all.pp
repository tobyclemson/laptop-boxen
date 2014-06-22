class projects::all {
  include_all_projects()

  if !defined(File["/Users/${::boxen_user}/Code"]) {
    file { "/Users/${::boxen_user}/Code":
      ensure => 'directory',
      owner  => $::boxen_user,
      group  => 'staff',
      mode   => '0700',
      alias  => 'code',
    }
  }
}
