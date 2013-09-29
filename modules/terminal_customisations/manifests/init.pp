class terminal_customisations {
  $home_dir = "/Users/${::boxen_user}"

  plist::contents { 'IR_Black profile':
    source => "puppet:///modules/terminal_customisations/ir_black.profile.plist",
    target => "${home_dir}/Library/Preferences/com.apple.Terminal.plist",
    path => ":'Window Settings'",
    check_key => ":'IR_Black'",
  }

  boxen::osx_defaults { 'Use IR_Black in startup window':
    key => "Startup Window Settings",
    value => "IR_Black",
    domain => 'com.apple.Terminal',
    user => $::boxen_user,
    ensure => 'present',
    require => Plist::Contents['IR_Black profile']
  }

  boxen::osx_defaults { 'Use IR_Black by default':
    key => "Default Window Settings",
    value => "IR_Black",
    domain => 'com.apple.Terminal',
    user => $::boxen_user,
    ensure => 'present',
    require => Plist::Contents['IR_Black profile']
  }
}
