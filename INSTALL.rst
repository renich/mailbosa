Install
=======

To install, there are a few methods:

.. code-block:: bash

    # method 1 (binary install)
    curl -O https://raw.githubusercontent.com/renich/mailbosa/master/builds/mailbosa-latest.gem
    gem install mailbosa-latest.gem

    # method 2 (roll your own)
    git clone https://github.com/renich/mailbosa.git
    cd mailbosa
    make all

Start
-----

Once you have mailbosa installed, you just need to:

# create the ~/.mailbosa directories 

.. code-block:: bash

    mkdir -m 700 ~/.config/mailbosa
    mkdir -m 700 ~/.mailbosa


# edit configuration

First, copy config/settings.yml.example (from github) to ~/.config/mailbosa/settings.yml. 

.. code-block:: bash

    curl https://raw.githubusercontent.com/renich/mailbosa/gem/config/settings.yml.example > ~/.config/mailbosa/settings.yml

Now, You need to add your gmail credentials to ~/.config/mailbosa/settings.yml. Also, when you're certain everything is fine, set testing to 0.


# put the email list in ~/.mailbosa/emails.json; in the following form:

.. code-block:: json

    {
        "category1": [
            "someone@example.tld",
            "someother@example.tld"
        ],

        "category2": [
            "other@someother.tld",
            "another@someother.tld"
        ]
    }


# create the email in ~/.mailbosa/message.txt; in the following form:

    Subject: test message
    
    Hello, this is a test email from me.



# start mailbosa

.. code-block:: bash
    
    mailbosa


Status
------

You can always check your status by using:

.. code-block:: bash

    tailf ~/.mailbosa/main.log
