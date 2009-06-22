module BespinOnRails
  module Helpers
    module FormTagHelper
      def bespin_include_tag
        javascript_tag('var djConfig = { parseOnLoad: false, isDebug: false, debugAtAllCosts: false };') +
        javascript_include_tag('/javascripts/dojo-1.3.1.js') +
        javascript_include_tag('/javascripts/bespin-2.3.js')
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
