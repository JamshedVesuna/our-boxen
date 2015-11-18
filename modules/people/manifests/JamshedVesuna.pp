class people::jamshedvesuna {

  /* Notes:
      Other programs installed:

      Other:
        Macvim updated to 7.4.769: "brew upgrade mvim"
  */
  $home     = "/Users/${::boxen_user}"
  $scripts  = "${home}/scripts"
  $tmp      = "${home}/tmp"

  file { $scripts:
    ensure  => directory
  }

  file { $tmp:
    ensure  => directory
  }

  repository {
    "${scripts}/dotfiles":
      source  => 'altoduo/dotfiles',
      require => File[$scripts];
  }

  include brewcask
  include chrome
  include cmake
  include dropbox
  include keepassx
  include macvim
  include seil
  include seil::login_item
  include skype
  include spectacle
  include spotify
  include tmux
  /*include vagrant*/
  include virtualbox
  include wget

  include osx::dock::autohide
  include osx::dock::disable_dashboard
  include osx::finder::hide_hidden_files
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::software_update

  class {
  'osx::global::key_repeat_delay':
    delay => 15; /* Default is 35 */
  'osx::global::key_repeat_rate':
    rate => 2  /* Default is 0 */
  }

  seil::bind { 'keyboard bindings':
    mappings => { 'capslock' => 53 }
  }

  class { 'ruby::global':
    version => '1.9.3'
  }

  class { 'vagrant':
    version => '1.7.4'
  }

  $version = "1.9.3"
  ruby_gem { "tugboat for ${version}":
    gem          => 'tugboat',
    version      => '~> 0.2.0',
    ruby_version => $version,
  }

  package {
    [
      'awscli',
      'ctags',
      'go',
      'markdown',
      'nmap',
      'protobuf',
      'rdiff-backup',
      'the_silver_searcher',
    ]:
        ensure => installed,
        provider => 'homebrew';
    [
      'slack',
    ]:
      ensure => installed,
      provider => 'brewcask';
    [
      'cronos',
      'dropbox',
      'eve',
      'grip',
      'ipdb',
      'ipython',
      'joblib',
      'line_profiler',
      'matplotlib',
      'numpy',
      'pep8',
      'scikit-learn',
      'scipy',
      'simple-crypt',
      'tweepy',
      'virtualenv',
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
