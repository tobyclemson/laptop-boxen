define s3storage::mount($aws_account, $root) {
  $mount_dir = "${root}/${aws_account}/${title}"
  $cache_dir = "/tmp/s3storage-cache-${title}"
  $passwd_file = "${root}/s3storage-${aws_account}.creds"

  $mount_command = template('s3storage/mount.erb')

  file { $mount_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'staff',
    mode    => '0777',
    require => File["${root}/${aws_account}"]
  }

  file { $cache_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'staff',
    mode    => '0770',
  }

  sudoers { "s3fs-${aws_account}-mount":
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => ["(ALL) NOPASSWD : ${mount_command}"],
    type     => 'user_spec',
  }

  exec { "mount ${title}":
    command => $mount_command,
    unless  => "test -n \"`/bin/df ${mount_dir} | awk '/s3fs/ { print \$1 }'`\"",
    require => [
      File[$mount_dir],
      File[$cache_dir],
      Package['s3fs'],
      File[$passwd_file],
      Sudoers["s3fs-${aws_account}-mount"]
    ],
  }
}
