class intellij_customisations(
  $user,
  $license
) {
  require intellij

  $home_dir = "/Users/$::boxen_user"

  file { "$home_dir/Library/Preferences/IntelliJIdea12/idea12.key":
    ensure => 'present',
    content => template('intellig_customisations/idea12.key.erb')
  }

  file { "$home_dir/Library/Preferences/IntelliJIdea12/disabled_plugins.txt":
    ensure => 'present',
    source => "puppet:///modules/intellij_customisations/disabled_plugins.txt"
  }
}
