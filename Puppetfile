# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Used to manage archive files. Required.
mod "archive",
  :ref => "3d37b476685c94a45d771466b473a220b8b9d3b4",
  :git => "https://github.com/camptocamp/puppet-archive.git"

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.3.5"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.100"
github "git",        "1.3.6"
github "homebrew",   "1.6.0"
github "hub",        "1.2.0"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.3"
github "nodejs",     "3.5.0"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.6"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "java",             "1.1.2"
github "intellij",         "1.4.0"
github "eclipse",          "2.2.0"
github "chrome",           "1.1.2"
github "firefox",          "1.1.5"
github "alfred",           "1.1.7"
github "zsh",              "1.0.0"
github "osx",              "2.2.0"
github "sizeup",           "1.0.0"
github "dpkg",             "1.0.0"
github "vagrant",          "3.0.0"
github "virtualbox",       "1.0.9"
github "sublime_text_2",   "1.1.2"
github "skype",            "1.0.7"
github "adium",            "1.2.0"
github "vlc",              "1.0.5"
github "heroku",           "2.1.1"
github "caffeine",         "1.0.0"
github "libreoffice",      "4.1.3"
github "postgresql",       "2.2.2"
github "sysctl",           "1.0.0"
github "mysql",            "1.2.0"
github "evernote",         "2.0.4"
github "omnigraffle",      "1.3.0"
github "onepassword",      "1.1.0"
github "dropbox",          "1.2.0"
github "emacs",            "1.1.0"
github "wget",             "1.0.0"
github "screen",           "1.0.0"
github "mongodb",          "1.2.0"
github "autojump",         "1.0.0"
github "kindle",           "1.0.1"
github "googledrive",      "1.0.2"
github "couchdbx",         "1.3.0"
github "steam",            "1.0.1"
github "scons",            "1.0.0"
github "clojure",          "1.2.0"
github "ctags",            "1.0.0"
github "python",           "1.3.0"
github "textmate",         "1.1.0"
github "tmux",             "1.0.2"
github "transmission",     "1.0.0"
github "cyberduck",        "1.0.1"
github "keyremap4macbook", "1.1.0"
github "hipchat",          "1.1.0"
github "macdefaults",      "0.0.1", :repo => "pebbleit/puppet-macdefaults"
github "ohmyzsh",          "0.0.1", :repo => "haelmy/puppet-ohmyzsh"
github "gpgtools",         "1.2.0", :repo => "envato/puppet-gpgtools"
github "lync",             "1.3.0", :repo => "dieterdemeyer/puppet-lync"
