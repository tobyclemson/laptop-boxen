class onepassword_customisations(
  $person,
  $serial
) {
  require onepassword

  $home_dir = "/Users/${::boxen_user}"

  plistbuddy::add { 'Install 1Password license person':
    target_plist => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    add_path => ":'License':'Person'",
    type => 'string',
    value => $person,
  }

  plistbuddy::add { 'Install 1Password license serial':
    target_plist => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    add_path => ":'License':'Serial'",
    type => 'string',
    value => $serial,
  }
}
