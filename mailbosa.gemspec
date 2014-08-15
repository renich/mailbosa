require 'rake'

Gem::Specification.new do |s|
    s.name                  = "mailbosa"
    s.version               = "0.0.1"
    s.licenses              = ['GPLv3']
    s.executables           = "mailbosa"
    s.require_paths         = ['lib']
    s.date                  = %q{2014-08-15}
    s.authors               = ["Renich Bon Ciric"]
    s.email                 = %q{renich@woralelandia.com}
    s.homepage              = %q{http://github.com/renich/mailbosa}
    s.summary               = %q{a slug that sends email in your name; with your own email account}
    s.description           = %q{This email client is intended for the automated sending of an email to a list; in a longer period of time.

Basically, you give it an email and it should send if over the course of a pre-configured time. You tell it how many mails to send in which period of time; using your own email account.

It will send one email at a time.}
    s.files                 = FileList[
        'bin/mailbosa',
        'lib/*',
        'lib/mailbosa/*',
        'config/settings.yml.example',
    ].to_a

    # dependencies
    s.add_runtime_dependency( 'fallen', '>= 0.0.3' )
    s.add_runtime_dependency( 'logger', '>= 1.2.8' )
    s.add_runtime_dependency( 'oj', '>= 2.9.9' )
end
