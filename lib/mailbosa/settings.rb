require 'yaml'

module Mailbosa
    class Settings
        Conf = File.expand_path( '~/.config/mailbosa/settings.yml' )

        def initialize
            create_conf_dir( Conf )
            init_conf( Conf )

            @settings = self.read( Conf )
        end

        def read( file )
            YAML.load_file( file )
        end

        def []( key )
            @settings[ key ]
        end

        private

        def create_conf_dir( conf )
            dir = File::dirname( conf )

            unless File.exists?( dir )
                puts "creating conf dir in #{dir}"
                Dir.mkdir( dir, 0770 )
            end
        end

        def init_conf( conf )
            unless File.exists?( conf )
                puts "creating configuration file in #{conf}"
                %x( curl -s https://raw.githubusercontent.com/renich/mailbosa/master/config/settings.yml.example > #{Conf} )
            end
        end
    end
end
