class onepassword_customisations(
  $person,
  $serial
) {
  require onepassword

  $home_dir = "/Users/${::boxen_user}"

  plist::entry { 'Install 1Password license person':
    target => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    path => ":'License':'Person'",
    type => 'string',
    value => $person,
  }

  plist::entry { 'Install 1Password license serial':
    target => "${home_dir}/Library/Preferences/ws.agile.1Password.plist",
    path => ":'License':'Serial'",
    type => 'string',
    value => $serial,
  }
}
