define s3storage::root() {
  file { $title:
    ensure => 'directory',
    owner  => 'root',
    group  => 'staff',
    mode   => '0555',
  }
}
