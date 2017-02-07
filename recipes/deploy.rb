include_recipe 'runit'

file "#{node[:cocotoca][:cfg_path]}/pip-requirements.txt" do
  content node[:cocotoca][:pip_requirements].join("\n")
end

bash 'install cocotoca pip requirements' do
  code "pip install -U -r #{node[:cocotoca][:cfg_path]}/pip-requirements.txt"
  notifies :restart, 'runit_service[cocotoca]', :delayed
end

template "#{node[:cocotoca][:cfg_path]}/cocotoca.yaml" do
  source 'cocotoca.yaml.erb'
  notifies :restart, 'runit_service[cocotoca]', :delayed
end

runit_service 'cocotoca' do
  action [:enable]
  log true
  default_logger true
  sv_timeout node[:cocotoca][:runit][:svwait]
end
