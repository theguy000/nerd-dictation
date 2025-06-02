
#######
Hacking
#######

While contributions to this repository a welcome,
features which may be personal for your own usage should be implemented in your own user configuration.

*If unsure, open an issue with the suggestion.*


Code Base
=========

This code base is designed to be easily hacked on.

- Single file code-base (the contents of ``nerd-dictation``).
- Only built in modules are used (besides ``vosk`` for speech to text).
- So far this has only tested on Linux/X11
  *(support for other platforms may be added in the future).*


Conventions
===========

Style
-----

- Auto formatting is handled with black by running:
  ``black nerd-dictation``
- Ensure correct type annotations by running:
  ``mypy --strict nerd-dictation``.
- Check for errors with:
  ``pylint nerd-dictation --disable=C0103,C0111,C0301,C0302,C0415,E0401,E0611,I1101,R0801,R0902,R0903,R0912,R0913,R0914,R0915,R1705,W0212,W0703``


Technical Details
=================

- All messages should be displayed via the ``sys.stderr``
  the main reason for this is it allows the text itself to be written to the ``sys.stdout``
  without other messages being mixed in.
  This works as no messages should be printed to the output when everything is working properly.

- It is important for the recording to start as soon as possible so the recording does not start
  after the user has begun speaking.
  Some operations including importing ``vosk`` are delayed for this reason.


Building the .deb Package
=========================

Prerequisites
-------------

Install the necessary build tools:

.. code-block:: bash

  sudo apt-get install build-essential debhelper devscripts dh-virtualenv python3-all python3-setuptools python3-stdeb equivs

Build Command
-------------

To build the Debian package, run the following command from the root of the repository:

.. code-block:: bash

  dpkg-buildpackage -us -uc -b

Alternatively, you can use the provided Makefile:

.. code-block:: bash

  make deb

Output
------

The built ``.deb`` package will typically be found in the parent directory (``../``).
