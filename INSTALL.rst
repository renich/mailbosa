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
