Mailbosa
========
Mail + Babosa = Mailbosa!

This email client is intended for the automated sending of an email to a list; in a longer period of time.

Basically, you give it an email and it should send if over the course of a pre-configured time. You tell it how many mails to send
in which period of time; using your own email account.

It will send one email at a time. 


Rationalization
---------------
Sometimes, I need to send email to a number of people that are not in any mailing list.

For example, I need to contact all the government poeple in my town to inform them about FOSS; so they know about it and consider it
in their implementations and law-making.

Also, I want to provide a tool to my friends to make this task easier. 


TODO
----
Things I want to work on:

Error checking:
    The software does little checking and this should be imrpoved.

systemd:
    I want this app to be systemd friendly. 

GUI:
    I'd like to use GTK+ 3 for a GUI in the future. I am considering: https://github.com/mvz/ruby-gir-ffi


TODO!
--------
Things I don't, currently, want to implement:

multi-threading:
    This is not needed since mailbosa is intended to emulate me sending email. I do not think we need threads for this.
