define plistmerge(
  $source_plist = undef,
  $target_plist = undef,
  $merge_path   = undef
) {
  $plistbuddy_cmd = '/usr/libexec/PlistBuddy'
  $plist_random_id = fqdn_rand(100)
  $plist_tmp_file = "/tmp/plist_$plist_random_id.plist"

  if ($source_plist == undef) or ($target_plist == undef) or ($merge_path == undef) {
    fail('Cannot merge plists without source_plist, target_plist and merge_path attributes')
  }

  file { $plist_tmp_file: 
    ensure => 'present',
    source => $source_plist
  }

  $merge_command = "$plistbuddy_cmd -c \"Merge $plist_tmp_file $merge_path\" $target_plist"

  exec { $merge_command:
    require => File[$plist_tmp_file]
  }
}