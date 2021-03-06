action :add do
  environment_name = new_resource.environment_variable.gsub(/ /,"_")
  if !new_resource.value.nil?
    Chef::Log.info("Adding #{environment_name}.sh to /etc/profile.d/")
    file_contents = "# This file was generated by Chef for #{node["fqdn"]}\n"
    file_contents += "export #{environment_name}='#{new_resource.value}'"
    resource = file "/etc/profile.d/#{environment_name}.sh" do
      owner "root"
      group "root"
      mode "0755"
      content file_contents
      action :nothing
    end
    node.set['magic_shell']['environment'][environment_name] = new_resource.value

    resource.run_action(:create)
    new_resource.updated_by_last_action(true) if resource.updated_by_last_action?
  end
end

action :remove do
  environment_name = new_resource.environment_variable.gsub(/ /,"_")
  Chef::Log.info("Removing #{environment_name}.sh from /etc/profile.d/")
  resource = file "/etc/profile.d/#{environment_name}.sh" do
    action :nothing
  end

  resource.run_action(:delete)
  new_resource.updated_by_last_action(true) if resource.updated_by_last_action?
end
