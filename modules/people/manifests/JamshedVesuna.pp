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
  include wget

  include osx::global::tap_to_click
  include osx::dock::clear_dock
  include osx::dock::autohide
  # include osx::finder::show_hidden_files
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
