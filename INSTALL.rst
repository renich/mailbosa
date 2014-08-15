Install
=======

To install, the easy way is to just:

.. code-block:: bash

    # become root
    su -

    # clone the repo
    git clone https://github.com/renich/mailbosa.git

    # go into the directory
    cd mailbosa

    # put the files in place
    GIT_WORK_TREE=/ git checkout -f

    # remove what is not needed
    for f in Gemfile .gitignore INSTALL.rst LICENSE README.rst; do
        rm -f $f
    done

Start
-----

Once you have mailbosa installed, you just need to:

# put the email list in /var/lib/mailbosa/emails.json; in the following form:

.. code-block:: json

    {
        'category1': [
            'someone@example.tld',
            'someother@example.tld'
        ],

        'category2': [
            'other@someother.tld',
            'another@someother.tld'
        ]
    }

# start mailbosa

.. code-block:: bash
    
    mailbosa


Status
------

You can always check your status by using:

.. code-block:: bash

    tailf /var/log/mailbosa.log
