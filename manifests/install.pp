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

  if $gsapps {

    $gsapps.each |$app, $values| {
      archive::tar_gz { $app:
        ensure        => present,
        url           => "${gsapp_url}/${values['file']}",
        target        => '/usr/local/libexec/GNUstep',
        root_dir      => "${app}.app"
        digest_string => $values['sha512sum'],
        digest_type   => 'sha512',
        require       => Package[$package_name],
      }
    }
  }

}
