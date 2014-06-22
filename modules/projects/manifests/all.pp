class projects::all {
  include_all_projects()

  file { 'code':
    ensure => 'directory',
    path   => "/Users/${::boxen_user}/Code",
  }
}
