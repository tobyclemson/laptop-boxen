define plist::file(
  $target = $title,
  $mode = '0644'
) {
  file { $target:
    replace => 'no',
    ensure => 'present',
    source => "puppet:///modules/plist/blank.plist",
    mode => $mode,
  }
}
