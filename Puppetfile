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

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.3.2"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "java",           "1.1.2"
github "intellij",       "1.3.0"
github "chrome",         "1.1.1"
github "firefox",        "1.1.3"
github "alfred",         "1.1.2"
github "zsh",            "1.0.0"
github "osx",            "1.6.0"
github "sizeup",         "1.0.0"
github "dpkg",           "1.0.0"
github "vagrant",        "2.0.10"
github "virtualbox",     "1.0.5"
github "sublime_text_2", "1.1.2"
github "skype",          "1.0.4"
github "vlc",            "1.0.4"
github "heroku",         "2.0.0"
github "caffeine",       "1.0.0"
github "libreoffice",    "4.1.1"
github "postgresql",     "2.0.1"
github "sysctl",         "1.0.0"
github "mysql",          "1.1.5"
github "evernote",       "2.0.4"
github "omnigraffle",    "1.2.0"
github "onepassword",    "1.0.2"
github "dropbox",        "1.1.1"
github "emacs",          "1.1.0"
github "wget",           "1.0.0"
github "screen",         "1.0.0"
github "mongodb",        "1.0.4"
github "autojump",       "1.0.0"
github "kindle",         "1.0.1"
github "googledrive",    "1.0.2"
github "couchdbx",       "1.3.0"
github "scons",          "1.0.0"
github "clojure",        "1.2.0"
github "ctags",          "1.0.0"
github "python",         "1.2.1"
github "textmate",       "1.1.0"
github "tmux",           "1.0.2"
github "transmission",   "1.0.0"
github "ohmyzsh",        "0.0.1", :repo => "haelmy/puppet-ohmyzsh"
github "macdefaults",    "0.0.1", :repo => "pebbleit/puppet-macdefaults"
