class afloat(
  $simbl_download_url = 'http://www.culater.net/dl/files/SIMBL-0.9.9.zip',
  $afloat_download_url = 'http://infinite-labs.net/afloat/download/private/Afloat.zip',
  $cache_dir = "$::boxen_home/cache"
) {
  $afloat_cache_dir = "$cache_dir/afloat"
  $afloat_installer_dir = "$afloat_cache_dir/Afloat 2.4/Afloat Installer (2.4).app"
  $simbl_support_dir = "$home_dir/Library/Application Support/SIMBL"
  $simbl_plugins_dir = "$simbl_support_dir/Plugins"

  package { 'simbl':
    source => $simbl_download_url,
    provider => 'compressed_pkg',
    ensure => 'installed'
  }

  file { $afloat_cache_dir:
    ensure => 'directory'
  }

  archive { 'afloat':
    ensure => present,
    url => $afloat_download_url,
    checksum => false,
    src_target => $afloat_cache_dir,
    extension => 'zip',
    target => $afloat_cache_dir,
    require => File[$afloat_cache_dir]
  }

  file { [$simbl_support_dir, $simbl_plugins_dir]:
    ensure => 'directory'
  }

  file { "$simbl_plugins_dir/Afloat.bundle":
    source => "file://$afloat_installer_dir/Contents/Afloat.bundle",
    recurse => true,
    ensure => 'present',
    require => [
      File[$simbl_plugins_dir],
      Archive['afloat']
    ]
  }
}
