# require 'date'

module ChatEngine
    module Generators

        class ChannelsGenerator < Rails::Generators::Base
            source_root File.expand_path("../../templates", __FILE__)

            desc "Creates a Myengine initializer and copys template files to your application."

            # def copy_initializer
            #   template "chat_engine.rb", "config/initializers/chat_engine.rb"
            # end
            def copy_channels

                # get an array of the migrations in your engine's db/migrate/
                # folder:

                migrations = Dir[ChatEngine::Engine.root.join("app/assets/javascripts/channels/chat_engine/*.js")]
                migrations.each_with_index do |migration, i|

                # The migrations will be created with the same timestamp if you
                # create them all at once. So if you have more than one migration
                # in your engine, add one second to the second migration's file
                # timestamp and a third second to the third migration's timestamp
                # and so on:

                # seconds = (DateTime.now.strftime("%S").to_i + i).to_s
                # seconds = seconds.to_s.length == 2 ? seconds : "0#{seconds}"
                # timestamp = (DateTime.now.strftime "%Y%m%d%H%M") + seconds

                # get the filename from the engine migration minus the timestamp:
                # name = migration.split("/").last.split("_")[1..-1].join("_")

                name = migration.split("/").last
                # puts name

                # See if a the name of your engine migration is already in your
                # host app's db/migrate folder:

                if Rails.root.join("app/assets/javascripts/channels/chat_engine/*#{name}").exist?

                    # do nothing:
                    puts "Migration #{name} has already been copied to your app"
                else

                    # copy your engine migration over to the host app with a new
                    # timestamp:
                    copy_file migration, "app/assets/javascripts/channels/chat_engine/#{name}"
                end
            end
        end

    end
end
