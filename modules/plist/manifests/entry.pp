define plist::entry(
  $target = undef,
  $path = undef,
  $type = undef,
  $value = undef
) {
  $plistbuddy_cmd = '/usr/libexec/PlistBuddy'

  if ($target == undef) or
     ($path == undef) or
     ($type == undef) or
     ($value == undef) {
    fail('Cannot set entry in plist without target, path, type and value attributes')
  }

  $add_cmd = "$plistbuddy_cmd -c \"Add $path $type\" \"$target\""
  $set_cmd = "$plistbuddy_cmd -c \"Set $path $value\" \"$target\""
  $exists_cmd = "$plistbuddy_cmd -c \"Print $path\" \"$target\" 2>&1 | grep -vq \"Does Not Exist\""

  $current_hash_cmd = "$plistbuddy_cmd -c \"Print $path\" \"$target\" | md5"
  $new_hash_cmd = "echo \"$value\" | md5"

  exec { $add_cmd:
    unless => $exists_cmd
  }

  exec { $set_cmd:
    unless => "echo \"[ \\\"\$($current_hash_cmd)\\\" == \\\"\$($new_hash_cmd)\\\" ]\" | bash",
    require => Exec[$add_cmd]
  }
}
