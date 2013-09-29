define plist::contents(
  $source = undef,
  $target = undef,
  $path   = undef,
  $check_key = undef
) {
  $plistbuddy_cmd = '/usr/libexec/PlistBuddy'
  $plist_random_id = fqdn_rand(10000000)
  $plist_tmp_file = "/tmp/plist_$plist_random_id.plist"

  if ($source == undef) or
     ($target == undef) or
     ($path == undef) or
     ($check_key == undef) {
    fail('Cannot merge plists without source, target, path and check_key attributes')
  }

  file { $plist_tmp_file:
    ensure => 'present',
    source => $source
  }

  $merge_cmd = "$plistbuddy_cmd -c \"Merge $plist_tmp_file $path\" $target"
  $current_hash_cmd = "$plistbuddy_cmd -x -c \"Print $path$check_key\" $target | md5"
  $new_hash_cmd = "$plistbuddy_cmd -x -c \"Print $check_key\" $plist_tmp_file | md5"

  exec { $merge_cmd:
    require => File[$plist_tmp_file],
    unless => "echo \"[ \\\"\$($current_hash_cmd)\\\" == \\\"\$($new_hash_cmd)\\\" ]\" | bash"
  }
}
