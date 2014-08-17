require 'fallen'
require 'oj' 

module Mailbosa extend Fallen
    class Mail
        require 'net/smtp'

        def initialize
            @smtp = Net::SMTP.new( URL, Port )
            @smtp.enable_starttls unless SSL == 0
        end

        def send
            @smtp.start( Domain, Account, Password, :login ) do
                @smtp.send_message( Message, Account, Account )
            end
        end

        def self.message_file( messageFile )
            begin
                File.open( messageFile, 'r' ) { |f| f.read }
            rescue Errno::ENOENT
                puts 'You, apparently, forgot to setup a message.'
                puts "Please, create the file #{messageFile} and press enter..."
                answer = gets

                retry
            end
        end

        def self.verify_email( email )
            email.match( /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}(?:\.[a-z]{2})?/ )
        end

        def self.get_emails( file )
            Oj.load_file( file, options: 'Hash' ) or {}
        end
    end
end
