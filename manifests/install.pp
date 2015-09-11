# private class, do not use directly
# takes care about installation of the package
# and additionall app wrappers for GWorkspace
class gsdesktop::install (
  $package_name,
  $package_ensure,
  $gsapp_url,
  $gsapps,
) {

  package { $package_name:
    ensure => $package_ensure,
  }

  $gsapps.each |Hash $app| {
    archive { $app['file']:
      ensure        => present,
      url           => "puppet:///puppet_gsapps/${app['file']}",
      target        => '/usr/local/libexec/GNUstep',
      digest_string => $app['sha512sum'],
      digest_type   => 'sha512',
      require       => Package[$package_name],
    }
  }

}
