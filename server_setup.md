# Account setup on new servers

1. Add id_rsa.pub of mac to authorized keys in the server
    - On Mac : ```$ cat ~/.ssh/id_rsa.pub```
    - On server
      - concat the output to ```~/.ssh/authorized_keys```
      - ```chmod 700 ~/.ssh/authorized_keys```

2. Generate ssh key on server: ```$ ssh-keygen -t rsa```

3. Git setup on server:
    - Add id_rsa.pub of server to github ssh keys
        - On server : ```cat ~/.ssh/id_rsa.pub```
        - Use the output to add key to GitHub ssh keys
    - Proper commit accredition:

        ```shell
        $ git config --global user.name "AshishBora"
        $ git config --global user.email "ashish.dilip.bora@gmail.com"
        ```
