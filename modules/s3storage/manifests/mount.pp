define s3storage::mount($aws_account, $root, $unless = undef) {
  $mount_dir = "${root}/${aws_account}/${title}"
  $cache_dir = "/tmp/s3storage-cache-${title}"
  $passwd_file = "${root}/s3storage-${aws_account}.creds"

  $mount_command = template('s3storage/mount.erb')

  exec { "test-mount-${title}":
    command => '/usr/bin/true',
    unless  => $unless,
  }

  file { $mount_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'staff',
    mode    => '0777',
    require => [
      Exec["test-mount-${title}"],
      File["${root}/${aws_account}"],
    ],
  }

  file { $cache_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'staff',
    mode    => '0770',
    require => Exec["test-mount-${title}"],
  }

  sudoers { "s3fs-${aws_account}-mount":
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => ['(ALL) NOPASSWD : /opt/boxen/homebrew/bin/s3fs'],
    type     => 'user_spec',
    require  => Exec["test-mount-${title}"],
  }

  exec { "mount ${title}":
    command => $mount_command,
    unless  => "test -n \"`/bin/df ${mount_dir} | awk '/s3fs/ { print \$1 }'`\"",
    require => [
      File[$mount_dir],
      File[$cache_dir],
      Package['s3fs'],
      File[$passwd_file],
      Sudoers["s3fs-${aws_account}-mount"],
      Exec["test-mount-${title}"],
    ],
  }
}
