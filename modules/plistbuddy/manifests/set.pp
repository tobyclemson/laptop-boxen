define plistbuddy::set(
  $target_plist = undef,
  $set_path = undef,
  $value = undef
) {
  $plistbuddy_cmd = '/usr/libexec/PlistBuddy'

  if ($target_plist == undef) or
     ($set_path == undef) or
     ($value == undef) {
    fail('Cannot set value in plist without target_plist, set_path and value attributes')
  }

  $set_cmd = "$plistbuddy_cmd -c \"Set $set_path $value\" $target_plist"
  $current_hash_cmd = "$plistbuddy_cmd -x -c \"Print $set_path\" $target_plist | md5"
  $new_hash_cmd = "echo \"$value\" | md5"

  exec { $set_cmd:
    unless => "echo \"[ \\\"\$($current_hash_cmd)\\\" == \\\"\$($new_hash_cmd)\\\" ]\" | bash"
  }
}
