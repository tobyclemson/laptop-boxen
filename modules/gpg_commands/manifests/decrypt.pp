define gpg_commands::decrypt($destination, $source = $title) {
  exec { "decrypt ${source} to ${destination}":
    command => "gpg --output ${destination} -d ${source}",
    creates => $destination
  }
}
