# == Class: kibana4
#
# Configuration
#
class kibana4::config 
(
  $config_path = '/opt/kibana/config/kibana.yml',
)
{

  if $kibana4::config {

    file { 'kibana-config-file':
      ensure  => file,
      path    => "$config_path",
      owner   => 'kibana',
      group   => 'kibana',
      mode    => '0755',
      content => template('kibana4/kibana.yml.erb'),
      notify  => Service['kibana4'],
    }
  }

}
