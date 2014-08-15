Install
=======

To install, the easy way is to just:

.. code-block:: bash

    gem install --source https://github.com/renich/mailbosa/tree/gem mailbosa


Start
-----

Once you have mailbosa installed, you just need to:

# create the ~/.mailbosa directory 

.. code-block:: bash

    mkdir -m 700 ~/.mailbosa


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

.. code-block:: txt

    Subject: test message
    
    Hello, this is a test email from me.


# edit configuration
First, copy config/settings.yml.example (from github) to ~/.config/mailbosa/settings.yml
Now, You need to add your gmail credentials to ~/.config/mailbosa/settings.yml


# start mailbosa

.. code-block:: bash
    
    mailbosa


Status
------

You can always check your status by using:

.. code-block:: bash

    tailf ~/.mailbosa/main.log
