class plist::blank(
  $target
) {
  file { $target:
    replace => 'no',
    ensure => 'present',
    source => "puppet:///modules/plist/blank.plist",
  }
}
