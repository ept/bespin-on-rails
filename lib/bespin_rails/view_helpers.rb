module BespinRails
  module ViewHelpers

    def bespin_include_tag
      '<script>var djConfig = { parseOnLoad: false, isDebug: false, debugAtAllCosts: false };</script>
      <script src="/_plugins/bespin_rails/dojo/dojo.js"></script>
      <script src="/_plugins/bespin_rails/bespin/editor/embed.js"></script>'
    end

    def bespin_editor_tag(name, content = nil, options = {})
      render :partial => 'bespin_rails/bespin_editor_tag', :locals => options.merge!(:name => name, :content => content)
    end

  end
end