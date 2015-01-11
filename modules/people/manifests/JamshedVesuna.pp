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

  include spotify
  include dropbox
  include keepassx
  include macvim
  include virtualbox
  include python
  include wget

  package {
    [
      'rdiff-backup',
      'awscli',
      'ctags',
      'the_silver_searcher',
    ]:
      ensure => installed,
      provider => 'homebrew';
  }

  git::config::global {
    'user.name':
      value => 'JamshedVesuna';
    'user.email':
      value => 'jamshed.vesuna@gmail.com';
  }
}
