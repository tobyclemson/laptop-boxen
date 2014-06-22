define s3storage::mount($aws_account, $root) {
  $mount_dir = "${root}/${aws_account}/${title}"
  $cache_dir = "/tmp/s3storage-cache-${title}"
  $passwd_file = "${root}/s3storage-${aws_account}.creds"

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
    commands => [
      "(ALL) NOPASSWD : /opt/boxen/homebrew/bin/s3fs ${title} ${mount_dir} -o passwd_file=${passwd_file} -o allow_other -o use_cache=${cache_dir}"
    ],
    type     => 'user_spec',
  }

  exec { "mount ${title}":
    command => "sudo /opt/boxen/homebrew/bin/s3fs ${title} ${mount_dir} -o passwd_file=${passwd_file} -o allow_other -o use_cache=${cache_dir}",
    onlyif  => "test -n \"`/bin/df ${mount_dir} | awk '/s3fs/ { print \$1 }'`\"",
    require => [
      File[$mount_dir],
      File[$cache_dir],
      Package['s3fs'],
      File[$passwd_file],
      Sudoers["s3fs-${aws_account}-mount"]
    ],
  }
}
