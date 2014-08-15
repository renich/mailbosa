require 'yaml'

module Mailbosa
    class Settings
        Path = [
            File.expand_path( '~/.config/mailbosa/settings.yml' )
        ]

        def initialize
            file = Path.select { |path| File.exists?( path ) }
            @settings = self.read( file.first )
        end

        def read( file )
            YAML.load_file( file )
        end

        def []( key )
            @settings[ key ]
        end
    end
end
