module StaticContent
  class Engine < ::Rails::Engine
    isolate_namespace StaticContent
    engine_name "static_content"

    initializer 'static_content.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        ActionView::Base.send :include, StaticContent::ContentHelper
      end
    end


  end
end
