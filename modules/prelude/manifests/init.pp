class prelude {
  $home_dir = "/Users/${::luser}"

  repository { "$home_dir/.emacs.d":
    source   => 'bbatsov/prelude',
    provider => 'git',
  }
}