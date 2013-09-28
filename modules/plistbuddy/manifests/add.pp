define plistbuddy::add(
  $target_plist = undef,
  $add_path = undef,
  $type = undef,
  $value = undef
) {
  $plistbuddy_cmd = '/usr/libexec/PlistBuddy'

  if ($target_plist == undef) or
     ($add_path == undef) or
     ($type == undef) or
     ($value == undef) {
    fail('Cannot set value in plist without target_plist, add_path, type and value attributes')
  }

  $add_cmd = "$plistbuddy_cmd -c \"Add $add_path $type $value\" $target_plist"
  $current_hash_cmd = "$plistbuddy_cmd -x -c \"Print $add_path\" $target_plist | md5"
  $new_hash_cmd = "echo \"$value\" | md5"

  exec { $add_cmd:
    unless => "echo \"[ \\\"\$($current_hash_cmd)\\\" == \\\"\$($new_hash_cmd)\\\" ]\" | bash"
  }
}
