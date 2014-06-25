class projects::presentations {
  $presentation_dir = "/Users/${::boxen_user}/Code/presentations"

  file { $presentation_dir:
    ensure  => 'directory',
    require => File['code'],
  }

  repository { "${presentation_dir}/builder-pattern-presentation":
    source   => 'tobyclemson/builder-pattern-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }

  repository { "${presentation_dir}/testing-micro-service-architecture-presentation":
    source   => 'tobyclemson/testing-micro-service-architecture-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }

  repository { "${presentation_dir}/deployment-as-a-service-presentation":
    source   => 'tobyclemson/deployment-as-a-service-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }

  repository { "${presentation_dir}/scala-full-stack-dev-presentation":
    source   => 'tobyclemson/scala-full-stack-dev-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }

  repository { "${presentation_dir}/test-data-generation-and-verification-presentation":
    source   => 'tobyclemson/test-data-generation-and-verification-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }

  repository { "${presentation_dir}/tor-presentation":
    source   => 'tobyclemson/tor-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }

  repository { "${presentation_dir}/net-neutrality-presentation":
    source   => 'tobyclemson/net-neutrality-presentation',
    provider => 'git',
    require  => File[$presentation_dir],
  }
}
