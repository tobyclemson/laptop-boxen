class silverlight {
  package { 'Silverlight':
    provider => 'pkgdmg',
    source => "http://silverlight.dlservice.microsoft.com/download/D/6/6/D66CF013-1021-437B-9A65-983871CCB3E6/30317.00/Silverlight.dmg",
    ensure => 'installed'
  }
}
