define plistbuddy::merge(
  $source_plist = undef,
  $target_plist = undef,
  $merge_path   = undef,
  $affected_key = undef
) {
  $plistbuddy_cmd = '/usr/libexec/PlistBuddy'
  $plist_random_id = fqdn_rand(10000000)
  $plist_tmp_file = "/tmp/plist_$plist_random_id.plist"

  if ($source_plist == undef) or
     ($target_plist == undef) or
     ($merge_path == undef) or
     ($affected_key == undef) {
    fail('Cannot merge plists without source_plist, target_plist, merge_path and affected_key attributes')
  }

  file { $plist_tmp_file:
    ensure => 'present',
    source => $source_plist
  }

  $merge_cmd = "$plistbuddy_cmd -c \"Merge $plist_tmp_file $merge_path\" $target_plist"
  $current_hash_cmd = "$plistbuddy_cmd -x -c \"Print $merge_path$affected_key\" $target_plist"
  $new_hash_cmd = "$plistbuddy_cmd -x -c \"Print $affected_key\" $plist_tmp_file"

  exec { $merge_cmd:
    require => File[$plist_tmp_file],
    unless => "echo \"[ \"\$($current_hash_cmd)\" == \"\$($new_hash_cmd)\" ]\" | bash"
  }
}
