module ChatEngine
  module Generators

    class MailersGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../../", __FILE__)

      def copy_views
        # directory 'path_to_install_directory', 'path_to_source_directory'
          directory 'app/mailers', 'app/mailers'
          # copy_file migration, "app/assets/javascripts/channels/chat_engine/#{name}"
      end

    end
  end
end