define s3storage::root() {
  file { $title:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0555',
  }
}
