Install
=======

To install, the easy way is to just:

.. code-block:: bash

    # execute make install as root
    su -c 'make install'


Start
-----

Once you have mailbosa installed, you just need to:

# put the email list in /var/lib/mailbosa/emails.json; in the following form:

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

# edit configuration
First, copy /usr/local/etc/mailbosa/settings.yml.example into /usr/local/etc/mailbosa/settings.yml
Now, You need to add your gmail credentials to /usr/local/etc/mailbosa/settings.yml

# start mailbosa

.. code-block:: bash
    
    mailbosa


Status
------

You can always check your status by using:

.. code-block:: bash

    tailf /var/log/mailbosa/main.log
