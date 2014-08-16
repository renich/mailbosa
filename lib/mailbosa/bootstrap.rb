require 'logger'
require 'oj'

module Mailbosa
    # get settings
    settings = Settings.new

    URL = settings[:smtp][:url]
    Port = settings[:smtp][:port]
    SSL = settings[:smtp][:ssl]
    Domain = settings[:smtp][:domain]
    Account = settings[:smtp][:username]
    Password = settings[:smtp][:password]
    Delay = settings[:email][:timeframe] / settings[:email][:amount]
    Recipients = File.expand_path( settings[:email][:list] )
    Sent = File.expand_path( settings[:email][:list_sent] )
    Message = File.expand_path( settings[:email][:message] )
    Test = settings[:general][:testing]

    # configure Oj
    Oj.default_options = { indent: 4 }

    # logger
    @logger = Logger.new( File.expand_path( settings[:general][:log][:file] ), 5, 1024 * 1024 * 1024 * 10 )
    @logger.progname = settings[:general][:log][:progname]
    @logger.level =  settings[:general][:log][:level]
    @logger.info( 'started!' )
end
