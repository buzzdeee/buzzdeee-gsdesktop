# private class, do not use directly
# takes care about defining the class parameter default values
class gsdesktop::params {
  $gsapp_url = 'puppet:///puppet_gsapps'
  $gsapps = undef
  $package_name = 'gnustep-desktop'
  $package_ensure = 'installed'
  $service_name = 'gdomap'
  $service_ensure = 'running'
  $service_enable = true
  $service_flags = undef
}
