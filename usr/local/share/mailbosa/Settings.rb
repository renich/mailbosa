module Mailbosa
    class Settings
        require 'yaml'

        Path = [
            '/home/renich/Projects/ruby/mailbosa/usr/local/etc/mailbosa/settings.yml',
            '/home/renich/Projects/ruby/mailbosa/etc/mailbosa/settings.yml'
        ]

        def initialize
            file = Path.select { |path| File.exists? path }
            @settings = self.read( file.first )
        end

        def read( file )
            YAML.load_file( file ).to_hash
        end

        def []( key )
            @settings[ key ]
        end
    end
end
