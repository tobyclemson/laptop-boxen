define s3storage::unmount($aws_account, $root) {
  $mount_dir = "${root}/${aws_account}/${title}"

  sudoers { "s3fs-${aws_account}-unmount":
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => [
      "(ALL) NOPASSWD : /sbin/umount ${mount_dir}"
    ],
    type     => 'user_spec',
  }

  exec { "unmount ${title}":
    command => "sudo /sbin/umount ${mount_dir}",
    unless  => "test -n \"`/bin/df ${mount_dir} | awk \'/s3fs/ { print \$1 }\'`\"",
    require => Sudoers["s3fs-${aws_account}-unmount"]
  }

  File[$mount_dir] {
    ensure  => absent,
    path    => $mount_dir,
    backup  => false,
    force   => true,
    require => Exec["unmount ${title}"],
  }
}
