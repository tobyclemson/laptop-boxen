define s3storage::unmount($aws_account, $root) {
  $mount_dir = "${root}/${aws_account}/${title}"

  exec { "unmount ${title}":
    command => "sudo /sbin/umount ${mount_dir}",
    unless  => "test -n \"`/bin/df ${mount_dir} | awk \'/s3fs/ { print \$1 }\'`\""
  }

  file { "rm ${mount_dir}":
    ensure  => absent,
    path    => $mount_dir,
    backup  => false,
    force   => true,
    require => Exec["unmount ${title}"],
  }
}
