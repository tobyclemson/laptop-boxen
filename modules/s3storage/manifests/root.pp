define s3storage::root() {
  file { $title:
    ensure => 'directory',
    owner  => $::boxen_user,
    group  => 'staff',
    mode   => '0555',
  }
}
