portalctl
=========

Luminis 5 multi-server control script. It is intended to be run from the admin server.

To use, I recommend that you setup SSH key forwarding. The following directions apply to CentOS.

First, generate a private key:

ssh-keygen -t dsa

The default file location and name is fine. Passphrase is optional, but I would recommend against one.

Next, either copy the key manually to the .ssh/authorized_hosts file on each of the other servers, or better yet, use ssh-copy-id:

ssh-copy-id -i .ssh/id_dsa.pub SERVER_NAME

where SERVER_NAME is the hostname (probably best if fully qualified, ala casserver.mydomain.edu) of the server to which you want to be able to forward the key
