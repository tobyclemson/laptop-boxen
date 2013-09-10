class zsh_customisations {
  require ohmyzsh

  $home_dir = "/Users/${::luser}"
  $zsh_custom_dir = "$home_dir/.zsh-custom"
  $zsh_ohmyzsh_dir = "$home_dir/.oh-my-zsh"
  
  file { $zsh_custom_dir:
    ensure => 'directory',
  }

  file { "$zsh_custom_dir/default.zsh-theme":
    ensure => 'present',
    source => "puppet:///modules/zsh_customisations/default.zsh-theme",
    require => File[$zsh_custom_dir],
  }

  file { "$home_dir/.zshrc":
    ensure => 'present',
    content => template('zsh_customisations/.zshrc.erb'),
  }
}
