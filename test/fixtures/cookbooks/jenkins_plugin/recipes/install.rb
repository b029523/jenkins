include_recipe 'jenkins_server_wrapper::default'

# Test basic plugin installation
jenkins_plugin 'greenballs'

# Test installing a specific version
jenkins_plugin 'disk-usage' do
  version '0.23'
end

# Test installing a specific version with abnormal versioning
jenkins_plugin 'apache-httpcomponents-client-4-api' do
  version '4.5.3-2.0'
end

# Test installing from a URL
jenkins_plugin 'copy-to-slave' do
  source 'http://mirror.xmission.com/jenkins/plugins/copy-to-slave/1.4.3/copy-to-slave.hpi'
end

# Install a plugin with many deps
jenkins_plugin 'github-oauth' do
  install_deps true
end

# Skip this plugins deps
jenkins_plugin 'jquery-ui' do
  install_deps false
end

# plugin to disable
jenkins_plugin 'ansicolor' do
  action :install
end

# plugin to enable
jenkins_plugin 'jira-trigger' do
  action :install
end

# plugin to uninstall
jenkins_plugin 'confluence-publisher' do
  action :install
end

# Install with a wacky version number
jenkins_plugin 'build-monitor-plugin' do
  version '1.6+build.135'
  install_deps true

  action :install
  notifies :restart, 'service[jenkins]', :immediately
end
