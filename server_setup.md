# Account setup on new servers

1. Add id_rsa.pub of local to authorized keys of the server
    - On Local : ```$ cat ~/.ssh/id_rsa.pub```
    - On server
        - Concat the output to ```$ ~/.ssh/authorized_keys```
        - ```$ chmod 700 ~/.ssh/authorized_keys```


3. Git setup on server:
    - Generate ssh key on server: ```$ ssh-keygen -t rsa```
    - Add id_rsa.pub of server to github ssh keys
        - On server : ```$ cat ~/.ssh/id_rsa.pub```
        - Use the output to add key to GitHub ssh keys
    - Proper commit accredition:

        ```shell
        $ git config --global user.name "AshishBora"
        $ git config --global user.email "ashish.dilip.bora@gmail.com"
        ```
    - Nice colors

        ```shell
        $ git config --global color.ui auto
        ```

