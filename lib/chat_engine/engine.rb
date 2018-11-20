module ChatEngine
  class Engine < ::Rails::Engine
    isolate_namespace ChatEngine
    require 'toastr-rails'
    require 'paperclip'
    require 'cancancan'
  end
end
