class terminal_customisations {
  $home_dir = "/Users/${::boxen_user}"

  plistmerge { 'Add IR_Black profile':
    source_plist => "puppet:///modules/terminal_customisations/ir_black.profile.plist",
    target_plist => "${home_dir}/Library/Preferences/com.apple.Terminal.plist",
    merge_path => ":'Window Settings'",
  }

  boxen::osx_defaults { 'Use IR_Black in startup window':
    key => "Startup Window Settings",
    value => "IR_Black",
    domain => 'com.apple.Terminal',
    user => $::boxen_user,
    ensure => 'present',
    require => Plistmerge['Add IR_Black profile']
  }

  boxen::osx_defaults { 'Use IR_Black by default':
    key => "Default Window Settings",
    value => "IR_Black",
    domain => 'com.apple.Terminal',
    user => $::boxen_user,
    ensure => 'present',
    require => Plistmerge['Add IR_Black profile']
  }
}
