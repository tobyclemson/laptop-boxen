class prelude {
  $home_dir = "/Users/${::luser}"

  # emacs flyspell uses aspell
  package { 'aspell': }

  repository { "$home_dir/.emacs.d":
    source   => 'bbatsov/prelude',
    provider => 'git',
  }
}
