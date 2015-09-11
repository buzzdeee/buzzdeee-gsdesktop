# == Class: gsdesktop
#
# Full description of class gsdesktop here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'gsdesktop':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class gsdesktop (
  $gsapp_url = $::gsdesktop::params::gsapp_url,
  $gsapps = $::gsdesktop::params::gsapps,
  $package_name = $::gsdesktop::params::package_name,
  $package_ensure = $::gsdesktop::params::package_ensure,
  $service_name = $::gsdesktop::params::service_name,
  $service_ensure = $::gsdesktop::params::service_ensure,
  $service_enable = $::gsdesktop::params::service_enable,
  $service_flags = $::gsdesktop::params::service_flags,
) inherits gsdesktop::params {

  class { 'gsdesktop::install':
    package_name   => $package_name,
    package_ensure => $package_ensure,
    gsapp_url      => $gsapp_url,
    gsapps         => $gsapps,
  }

  class { 'gsdesktop::service':
    service_name   => $service_name,
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    service_flags  => $service_flags,
  }

  Class[gsdesktop::install] ~>
  Class[gsdesktop::service]

}
