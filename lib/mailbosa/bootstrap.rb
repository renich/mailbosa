require 'logger'
require 'oj'

module Mailbosa
    # get settings
    settings = Settings.new

    lib = File.expand_path( settings[:general][:lib] )
    URL = settings[:smtp][:url]
    Port = settings[:smtp][:port]
    SSL = settings[:smtp][:ssl]
    Domain = settings[:smtp][:domain]
    Account = settings[:smtp][:username]
    Password = settings[:smtp][:password]
    Delay = settings[:email][:timeframe] / settings[:email][:amount]
    Recipients = settings[:email][:list] % { lib: lib }
    Sent = settings[:email][:list_sent] % { lib: lib } 
    Message = settings[:email][:message] % { lib: lib }
    Test = settings[:general][:testing]

    # configure Oj
    Oj.default_options = { indent: 4 }

    # logger
    @logger = Logger.new( settings[:general][:log][:file] % { lib: lib }, 5, 1024 * 1024 * 1024 * 10 )
    @logger.progname = settings[:general][:log][:progname]
    @logger.level =  settings[:general][:log][:level]
    @logger.info( 'started!' )
end
