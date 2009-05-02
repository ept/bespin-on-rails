module BespinOnRails
  class << self
    def enable
      require 'bespin_on_rails/view_helpers'
      ::ActionView::Base.send :include, BespinOnRails::Helpers::FormTagHelper
    end
    
    def install_plugin_assets(plugin_name, target_path)
      # Precheck conditions
      raise "Plugin name required" unless plugin_name
      raise "Target path required" unless target_path
      raise "Taget does't exists"  unless File.exists?(target_path)
    
      # Create the plugins base path inside the hosts public folder
      plugins_public_base_path = "#{RAILS_ROOT}/public/_plugins"
      FileUtils.mkdir_p(plugins_public_base_path)
    
      # The source path
      source_path = "#{plugins_public_base_path}/#{plugin_name}"
    
      # Create the symlink if the source_path is not present
      # This allows for manual overrides
      unless File.exists?(source_path)
        system "ln -s #{target_path} #{source_path}"
      end
    end
  end
end
 
if defined?(Rails) and defined?(ActionController) and defined?(ActionView)
  BespinOnRails.install_plugin_assets('bespin-on-rails', File.expand_path(File.join(File.dirname(__FILE__), '..', 'public')))
  BespinOnRails.enable
end
