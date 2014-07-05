define s3storage::unmount($aws_account, $root, $unless = undef) {
  $mount_dir = "${root}/${aws_account}/${title}"

  exec { "test-unmount-${title}":
    command => '/usr/bin/true',
    unless  => $unless,
  }

  sudoers { "s3fs-${aws_account}-unmount":
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      "(ALL) NOPASSWD : /sbin/umount ${mount_dir}"
    ],
    type     => 'user_spec',
    require  => Exec["test-unmount-${title}"],
  }

  exec { "unmount ${title}":
    command => "sudo /sbin/umount ${mount_dir}",
    onlyif  => "test -n \"`/bin/df ${mount_dir} | awk \'/s3fs/ { print \$1 }\'`\"",
    require => [
      Sudoers["s3fs-${aws_account}-unmount"],
      Exec["test-unmount-${title}"],
    ]
  }
}
