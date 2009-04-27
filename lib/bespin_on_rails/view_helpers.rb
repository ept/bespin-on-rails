module BespinOnRails
  module ViewHelpers

    def bespin_include_tag
      '<script>var djConfig = { parseOnLoad: false, isDebug: false, debugAtAllCosts: false };</script>
      <script src="/_plugins/bespin-on-rails/dojo/dojo.js"></script>
      <script src="/_plugins/bespin-on-rails/bespin/editor/embed.js"></script>'
    end

    def bespin_editor_tag(name, content = nil, options = {})
      render :partial => 'bespin_on_rails/bespin_editor_tag', :locals => options.merge!(:name => name, :content => content)
    end

  end
end