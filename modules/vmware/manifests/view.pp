class vmware::view(
  $download_url = 'https://download3.vmware.com/software/view/viewclients/VMware-View-Client-1.7.0-941674.dmg'
) {
  package { 'vmware-view':
    source => $download_url,
    provider => 'appdmg',
    ensure => 'installed'
  }
}
