define s3storage::account($aws_id, $aws_secret, $root, $group) {
  file { "${root}/${$title}":
    ensure  => directory,
    owner   => root,
    group   => $group,
    mode    => '0550',
    require => File[$root],
  }

  file { "${root}/s3storage-${title}.creds":
    content => template('s3storage/creds.erb'),
    owner   => root,
    group   => root,
    mode    => '0400',
  }
}
