class silverlight {
  package { 'Silverlight':
    provider => 'pkgdmg',
    source => "http://go.microsoft.com/fwlink/?LinkID=229322",
    ensure => 'installed'
  }
}
