# Class: ruby
#
# This module installs a full rbenv-driven ruby stack
#
class ruby(
  $provider = $ruby::provider,
  $prefix   = $ruby::prefix,
  $user     = $ruby::user,
) {
  if $::osfamily == 'Darwin' {
    include boxen::config
  }

  include ruby::build

  $provider_class = "ruby::${provider}"
  include $provider_class

  if $::osfamily == 'Darwin' {
    file {
      "${boxen::config::envdir}/rbenv.sh":
        ensure => absent ;
      "${boxen::config::envdir}/ruby.sh":
        ensure => absent ;
      "${boxen::config::envdir}/ruby.fish":
        ensure => absent ;
    }

    boxen::env_script { 'ruby.sh':
      scriptname => 'ruby',
      extension => 'sh',
      content  => template('ruby/ruby.sh'),
      priority => 'higher',
    }

    boxen::env_script { 'ruby.fish':
      scriptname => 'ruby',
      extension => 'fish',
      content  => template('ruby/ruby.fish'),
      priority => 'higher',
    }
  }

  file { '/opt/rubies':
    ensure => directory,
    owner  => $user,
  }

  Class['ruby::build'] ->
    Ruby::Definition <| |> ->
    Class[$provider_class] ->
    Ruby <| |> ->
    Ruby_gem <| |>
}
