define plist::file(
  $target = $title
) {
  file { $target:
    replace => 'no',
    ensure => 'present',
    source => "puppet:///modules/plist/blank.plist",
  }
}
