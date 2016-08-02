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
      archive { "/usr/local/libexec/GNUstep/${app}.app":
        ensure        => present,
        source        => "${gsapp_url}/${values['file']}",
        extract       => true,
        extract_path  => '/usr/local/libexec/GNUstep',
        creates       => "/usr/local/libexec/GNUstep/${app}.app",
        checksum      => $values['sha512sum'],
        checksum_type => 'sha512',
        require       => Package[$package_name],
      }
    }
  }

}
