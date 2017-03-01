# Account setup on new servers

1. SSH setup
    - Generate ssh key on server: ```$ ssh-keygen -t rsa```
    - Add public key of local to authorized keys of the server
        - On Local : ```$ cat ~/.ssh/id_rsa.pub```
        - On server
            - Concat the output to ```$ ~/.ssh/authorized_keys```
            - ```$ chmod 700 ~/.ssh/authorized_keys```

3. Git setup on server:
    - Generate ssh key on server if not done already: ```$ ssh-keygen -t rsa```

    - Add id_rsa.pub of server to github ssh keys
        - On server : ```$ cat ~/.ssh/id_rsa.pub```
        - Use the output to add key to GitHub ssh keys
    - Proper commit accredition:

        ```shell
        $ git config --global user.name "AshishBora"
        $ git config --global user.email "ashish.dilip.bora@gmail.com"
        ```

4. Nice colors

    ```shell
    $ git config --global color.ui auto
    ```

    ```shell
    export CLICOLOR=1
    export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;31:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.py=01;33';
    ```


5. ```ls``` aliases

    ```shell
    alias ll="ls -XGFlash"
    alias ls="ls -XGF --color"
    alias la="ls -Xa"
    ```
