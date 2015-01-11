class people::jamshedvesuna {

  $home     = "/Users/${::boxen_user}"
  $scripts  = "${home}/scripts"

  file { $scripts:
    ensure  => directory
  }

  repository {
    "${scripts}/dotfiles":
      source  => 'altoduo/dotfiles',
      require => File[$scripts];
  }
}
