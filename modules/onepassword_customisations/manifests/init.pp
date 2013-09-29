class onepassword_customisations(
  $person,
  $serial
) {
  require onepassword

  $home_dir = "/Users/${::boxen_user}"
  $onepassword_plist = "${home_dir}/Library/Preferences/ws.agile.1Password.plist"

  plist::file { $onepassword_plist: }

  plist::entry { 'Install 1Password license person':
    target => $onepassword_plist,
    path => ":'License':'Person'",
    type => 'string',
    value => $person,
    require => Plist::File[$onepassword_plist]
  }

  plist::entry { 'Install 1Password license serial':
    target => $onepassword_plist,
    path => ":'License':'Serial'",
    type => 'string',
    value => $serial,
    require => Plist::File[$onepassword_plist]
  }
}
