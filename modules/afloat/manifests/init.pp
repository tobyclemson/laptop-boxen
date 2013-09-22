class afloat {
  package { 'afloat':
    provider => 'compressed_app',
    source => 'http://infinite-labs.net/afloat/download/private/Afloat.zip',
    ensure => 'installed'
  }
}
