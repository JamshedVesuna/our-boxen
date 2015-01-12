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

  include dropbox
  include keepassx
  include macvim
  include spotify
  include vagrant
  include virtualbox
  include wget

  include osx::dock::autohide
  include osx::dock::disable_dashboard
  include osx::finder::hide_hidden_files
  include osx::global::tap_to_click
  include osx::software_update

  package {
    [
      'rdiff-backup',
      'awscli',
      'ctags',
      'the_silver_searcher',
    ]:
        ensure => installed,
        provider => 'homebrew';
    [
      'cronos',
      'simple-crypt',
    ]:
        ensure => installed,
        provider => 'pip';
  }

  git::config::global {
    'user.name':
      value => 'JamshedVesuna';
    'user.email':
      value => 'jamshed.vesuna@gmail.com';
  }
}
