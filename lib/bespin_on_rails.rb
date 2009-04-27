module BespinOnRails
  class << self
    def enable
      require 'bespin_on_rails/view_helpers'
      ::ActionView::Base.send :include, BespinOnRails::Helpers::FormTagHelper
    end
  end
end
 
if defined?(Rails) and defined?(ActionController)
  BespinOnRails.enable
end

#
# Installes the plugins public files in the host application
# by creating a proper symlink. The host app can access the
# resources in /public/_plugins/<plugin_name>/...
#
def install_public_files(plugin_name)
  rails_public_plugins_path = "#{RAILS_ROOT}/public/_plugins"
  FileUtils.mkdir_p(rails_public_plugins_path)

  rails_public_plugin_path  = "#{rails_public_plugins_path}/#{plugin_name}"
  plugin_public_path        = "#{RAILS_ROOT}/vendor/plugins/#{plugin_name}/public"
  if (File.exist?(plugin_public_path))
    system "ln -s -f -h #{plugin_public_path} #{rails_public_plugin_path}"
  end
end
