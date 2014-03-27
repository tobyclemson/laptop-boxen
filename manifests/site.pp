require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # os defaults
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::key_repeat_rate
  class { 'osx::global::key_repeat_delay': delay => 10 }

  include osx::dock::autohide
  class { 'osx::dock::icon_size': size => 36 }

  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::unhide_library

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx

  git::config::global { 'user.email':
    value  => 'tobyclemson@gmail.com'
  }

  git::config::global { 'user.name':
    value  => 'Toby Clemson'
  }

  git::config::global { 'push.default':
    value => 'current'
  }

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'gnupg',
      'gpgme',
      'tree',
      'sbt',
      'ctags-exuberant'
    ]:
  }

  file { "${boxen::config::srcdir}/laptop-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  # languages
  include java
  include clojure
  include python

  include nodejs::v0_4
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  ruby::version { '1.8.7': }
  ruby::version { '1.9.2': }
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }

  class { 'ruby::global':
    version => '1.9.3'
  }

  nodejs::module { 'coffee-script':
    node_version => 'v0.10',
    ensure => '1.6.3',
  }

  # browsers
  include chrome
  include chrome::dev
  include firefox

  # general development tools
  include vagrant
  include virtualbox
  include heroku
  class { 'intellij':
    edition => 'ultimate',
    version => '13'
  }
  include intellij_customisations
  include eclipse::java

  # databases
  include postgresql
  include mysql
  include mongodb
  include couchdbx
  include oracle_sqldeveloper

  # text editors
  include emacs
  include emacs_customisations
  include prelude
  include textmate
  include sublime_text_2

  # system utilities
  include alfred
  include alfred_customisations
  include caffeine
  # include afloat
  include sizeup
  include sizeup_customisations
  include onepassword
  # include onepassword_customisations
  include rsa_securid
  include silverlight
  include keyremap4macbook
  include keyremap4macbook::login_item
  # include gpgtools
  include vmware::view
  include lync

  # command line enhancements
  include terminal_customisations
  include zsh
  include zsh_customisations
  include screen
  include dpkg
  include wget
  include autojump
  include scons
  include ctags
  include tmux

  # miscellaneous
  include arduino

  # applications
  include steam
  include evernote
  include omnigraffle::pro
  include dropbox
  include googledrive
  include kindle
  include skype
  include adium
  include transmission
  include vlc
  include cyberduck
  include hipchat
  include libreoffice
  class { 'libreoffice::languagepack': locale => 'en-GB' }
}
