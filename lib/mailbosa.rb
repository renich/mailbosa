require 'mailbosa/settings'
require 'mailbosa/bootstrap'
require 'mailbosa/mail'

module Mailbosa extend Fallen
    def self.run
        # load email list
        @logger.debug( 'loading message to send.' )
        message = "From: #{Account}\n" + Mailbosa::Mail::message_file( Message )

        while running?
            # load recipients
            @logger.debug( 'loading email list.' )
            emails = Mailbosa::Mail::get_emails( Recipients )

            # laod sent 
            @logger.debug( 'loading sent email list.' )
            sent = Mailbosa::Mail::get_emails( Sent )

            # exclude alredy sent
            @logger.debug( 'comparing email list with sent list.' )
            emails.each_key { |k|
                if sent.has_key?( k )
                    sent[ k ].each { |s|
                        emails[ k ].delete( s )
                    }
                end

                emails.delete( k ) if emails[ k ].empty?
            }

            # check if finished
            @logger.debug( 'checking if email list is already sent.' )
            if emails.empty?
                @logger.info( 'Finished!' )
                @logger.close
                exit( 0 )
            end

            # get an email
            @logger.debug( 'picking an email from the pending list.' )
            group = emails.shift
            to_send = group[1].shift
            message = "To: #{to_send}\n" + message

            # send next
            @logger.info( "Sending email to: #{to_send}" )
            if Test == 0
                smtp = Mailbosa::Mail.new
                smtp.send( message, Account, to_send )
            end

            # mark it as sent
            begin
                @logger.debug( "appending #{to_send} to sent list." )
                sent[ group[0] ] << to_send
            rescue
                @logger.debug( "adding #{to_send} to sent list." )
                sent[ group[0] ] = [ to_send ]
            end

            # write sent file
            @logger.debug( 'writing sent list.' )
            File.write( Sent, Oj.dump( sent ) )

            # wait
            @logger.info( "sleeping for #{Delay} secconds" )
            sleep( Delay )
        end
    end
end
