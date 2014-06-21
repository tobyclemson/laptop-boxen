class s3storage {
  package { 's3fs': }

  exec { 'copy-fuse4x':
    command => 'sudo /bin/cp -rfX /opt/boxen/homebrew/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions',
    require => Package['s3fs'],
    creates => '/Library/Extensions/fuse4x.kext',
  }

  exec { 'sudo /bin/chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x':
    unless  => "ls -l /Library/Extensions/fuse4x.kext/Support/load_fuse4x | cut -d' ' -f 1 | grep 's' 2>/dev/null",
    require => [
      Package['s3fs'],
      Exec['copy-fuse4x']
    ],
  }
}
