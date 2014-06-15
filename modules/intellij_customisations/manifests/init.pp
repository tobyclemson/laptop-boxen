class intellij_customisations(
  $license,
) {
  require intellij

  $home_dir = "/Users/$::boxen_user"

  file { "$home_dir/Library/Preferences/IntelliJIdea13/idea13.key":
    ensure => 'present',
    content => $license
  }

  file { "$home_dir/Library/Preferences/IntelliJIdea13/disabled_plugins.txt":
    ensure => 'present',
    source => "puppet:///modules/intellij_customisations/disabled_plugins.txt"
  }
}
