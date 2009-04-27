module BespinOnRails
  module Helpers
    module FormTagHelper
      def bespin_include_tag
        code  = ''
        code << javascript_tag('var djConfig = { parseOnLoad: false, isDebug: false, debugAtAllCosts: false };')
        code << javascript_include_tag('/_plugins/bespin-on-rails/dojo/dojo.js')
        code << javascript_include_tag('/_plugins/bespin-on-rails/bespin/editor/embed.js')
      end
      
      def bespin_editor_tag(name, content = nil, options = {})
        render :partial => 'bespin_on_rails/bespin_editor_tag', 
          :locals => {
            :name         => name,
            :content      => content,
            :editor_style => options[:editor_style],
            :language     => options[:language] || 'html',
            :settings     => options[:settings] || {}
          }
      end
    end
  end
end