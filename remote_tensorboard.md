# Remote tensorboard


###### Forward remote port to local
```
LOCAL_PORT=6006
REMOTE_PORT=6006
ssh -p2002 -L $LOCAL_PORT:calvin.ece.utexas.edu:$REMOTE_PORT abora@calvin.ece.utexas.edu
```

###### Kill all dead ssh connections
```
pkill -o -u abora sshd
```

###### Now on remote do:
```
REMOTE_PORT=6006
tensorboard --logdir='/to/summaries/directory/' --port $REMOTE_PORT
```

###### Then on local, navigate to:
```
http://localhost:LOCAL_PORT
```
