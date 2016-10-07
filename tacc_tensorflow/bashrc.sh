# -*- shell-script -*-
# TACC startup script: ~/.bashrc version 2.1 -- 12/17/2013


# This file is NOT automatically sourced for login shells.
# Your ~/.profile can and should "source" this file.

# Note neither ~/.profile nor ~/.bashrc are sourced automatically by
# bash scripts. However, a script inherits the environment variables
# from its parent shell.  Both of these facts are standard bash
# behavior.
#
# In a parallel mpi job, this file (~/.bashrc) is sourced on every
# node so it is important that actions here not tax the file system.
# Each nodes' environment during an MPI job has ENVIRONMENT set to
# "BATCH" and the prompt variable PS1 empty.

#################################################################
# Optional Startup Script tracking. Normally DBG_ECHO does nothing
if [ -n "$SHELL_STARTUP_DEBUG" ]; then
  DBG_ECHO "${DBG_INDENT}~/.bashrc{"
fi

############
# SECTION 1
#
# There are three independent and safe ways to modify the standard
# module setup. Below are three ways from the simplest to hardest.
#   a) Use "module save"  (see "module help" for details).
#   b) Place module commands in ~/.modules
#   c) Place module commands in this file inside the if block below.
#
# Note that you should only do one of the above.  You do not want
# to override the inherited module environment by having module
# commands outside of the if block[3].

if [ -z "$__BASHRC_SOURCED__" -a "$ENVIRONMENT" != BATCH ]; then
  export __BASHRC_SOURCED__=1

  ##################################################################
  # **** PLACE MODULE COMMANDS HERE and ONLY HERE.              ****
  ##################################################################

  # module load git
  # For Caffe load Cuda 7.0
  # module load cuda/7.0
  # module load intel/14.0.1.106
  # module load cmake
  module load hdf5

  # For tensorflow load cuda 7.5
  # module load cuda/7.5
  # module load gcc/4.9.1
  # module load cuda/7.5
  # module load git/2.7.0
  # module spider tensorflow
  # module load python/2.7.12
  module load gcc/4.9.1 cuda/7.5 cudnn/4.0 python/2.7.12 mkl/11.3 tensorflow/0.9.0
fi


############
# SECTION 2
#
# Please set or modify any environment variables inside the if block
# below.  For example, modifying PATH or other path like variables
# (e.g LD_LIBRARY_PATH), the guard variable (__PERSONAL_PATH___)
# prevents your PATH from having duplicate directories on sub-shells.

#if [ -z "$__PERSONAL_PATH__" ]; then
#  export __PERSONAL_PATH__=1

  ###################################################################
  # **** PLACE Environment Variables including PATH here.        ****
  ###################################################################

  # export PATH=$HOME/bin:$PATH

#fi
# For Caffe/Torch
#PROTOC_PATH=/work/01932/dineshj/caffe_deps/protobuf-2.5.0/install/bin/:$PROTOC_PATH
#PROTOBUF_LIBRARY=/work/01932/dineshj/caffe_deps/protobuf-2.5.0/install/bin/:$PROTBUF_LIBRARY
#BOOST_BIN_PATH=/work/01932/dineshj/caffe_deps/boost_1_55_0/install/bin/:$BOOST_BIN_PATH
#OPENCV_BUILD_PATH=/work/01932/dineshj/opencv-bleeding/build/:$OPENCV_BUILD_PATH
#LOCAL_BINS=/work/01932/dineshj/local/bin/:$LOCAL_BINS
#OPENCV_LIBRARY_PATH=/work/01932/dineshj/opencv-bleeding/build/lib/:$OPENCV_LIBRARY_PATH
#BOOST_LIBRARY_PATH=/work/01932/dineshj/caffe_deps/boost_1_55_0/install/lib/:$BOOST_LIBRARY_PATH
#SNAPPY_LIBRARY_PATH=/work/01932/dineshj/caffe_deps/snappy-1.1.3/install/lib/:$SNAPPY_LIBRARY_PATH
#LOCAL_LIBS=/work/01932/dineshj/local/libs/:$LOCAL_LIBS

#LOCAL_BIN=/work/01932/dineshj/CS381V/caffe_install_scripts/install/bin/:$LOCAL_BIN
#LOCAL_INC=/work/01932/dineshj/CS381V/caffe_install_scripts/install/include/:$LOCAL_INC
#LOCAL_LIB=/work/01932/dineshj/CS381V/caffe_install_scripts/install/lib/:$LOCAL_LIB
#MKL_INC=/opt/apps/intel/13/composer_xe_2013_sp1.1.106/mkl/include/:$MKL_INC
#MKL_LIB=/opt/apps/intel/13/composer_xe_2013_sp1.1.106/mkl/lib/intel64/:$MKL_LIB

# For tensorflow
CUDA_HOME=/opt/apps/cuda/7.5/
#export ROLLER_SCRATCH=/work/01813/roller/maverick

########################
# SECTION 3
#
# Controling the prompt: Suppose you want stampede1(14)$  instead of
# login1.stampede(14)$
#
if [ -n "$PS1" ]; then
   myhost=$(hostname -f)              # get the full hostname
   myhost=${myhost%.tacc.utexas.edu}  # remove .tacc.utexas.edu
   first=${myhost%%.*}                # get the 1st name (e.g. login1)
   SYSHOST=${myhost#*.}               # get the 2nd name (e.g. stampede)
   first5=$(expr substr $first 1 5)   # get first 5 character from $first
   if [ "$first5" = "login" ]; then
     num=$(expr $first : '[^0-9]*\([0-9]*\)') # get the number
     HOST=${SYSHOST}$num                      # HOST -> stampede1
   else
     # first is not login1 so take first letter of system name
     L=$(expr substr $SYSHOST 1 1 | tr '[:lower:]' '[:upper:]')

     #  If host is c521-101.stampeded then
     HOST=$L$first      # HOST  -> Sc521-101
   fi
   PS1='$HOST(\#)\$ '   # Prompt either stampede1(14)$ or Sc521-101(14)$
fi


#####################################################################
# **** Place any else below.                                     ****
#####################################################################

# alias m="more"
# alias bls='/bin/ls'   # handy alias for listing a large directory.

#alias matlab='/work/apps/matlab/2014b/bin/matlab'
#alias emacs='emacs -nw'
#alias slurm_me='showq -u dineshj'
#alias tmux="TERM=xterm-256color tmux"
#alias python='/work/01932/dineshj/CS381V/caffe_install_scripts/anaconda/bin/python'
#alias ipython='/work/01932/dineshj/anaconda/bin/ipython'
#alias zbstorch='/work/01932/dineshj/local_pkgs/zbs-torch/zbstudio.sh'

##########
# Umask
#
# If you are in a group that wishes to share files you can use
# "umask". to make your files be group readable.  Placing umask here
# is the only reliable place for bash and will insure that it is set
# in all types of bash shells.

# umask 022

###################################
# Optional Startup Script tracking

if [ -n "$SHELL_STARTUP_DEBUG" ]; then
  DBG_ECHO "${DBG_INDENT}}"
fi

export LM_LICENSE_FILE=$HOME/engr.txt:$LM_LICENSE_FILE
export EDITOR=vim:$EDITOR

# For Caffe
#export PROJECTPATH=/work/01932/dineshj/projects/slowLearn/src/:$PROJECTPATH
#export ACTIVEPATH=/work/01932/dineshj/projects/active/:$ACTIVEPATH
#export CAFFEPATH=/work/01932/dineshj/caffe2/:$CAFFEPATH

#----------------------------------------------------------------------------

# For Caffe/Torch
#export PATH=$LOCAL_BINS:$BOOST_BIN_PATH:$PROTOC_PATH:$OPENCV_BUILD_PATH:/work/01932/dineshj/anaconda/bin/:$PATH
#export PATH=$LOCAL_BIN:$LOCAL_INC:$MKL_INC:/work/01932/dineshj/CS381V/caffe_install_scripts/anaconda/bin/:/work/apps/matlab/2013a/bin/glnxa64/:/work/01932/dineshj/CS381V/caffe_install_scripts/caffe/build/tools/:$PATH
#export PATH=$PATH:/home/01932/dineshj/tools/tmux-1.9a/bin/:/work/01932/dineshj/torch_cuda/bin/:$PATH
#export PATH=/work/04004/aish/torch_cuda/bin/:$PATH
#export PATH=/usr/bin/:/work/04004/aish/visionproject/NLOR/external/caffe-natural-language-object-retrieval/build/tools/:/work/01932/dineshj/CS381V/:$PATH
export PATH=/usr/local/sbin/:/usr/local/bin/:/usr/sbin/:/usr/bin/:/sbin/:/bin/:$PATH
#export PATH=/work/04004/aish/libs/protobuf/lib/:$PATH

# For tensorflow
#export PATH="$ROLLER_SCRATCH/packages/python/bin:$PATH"
#export PATH="$ROLLER_SCRATCH/packages/bazel/src/bazel/output:$PATH"
export PATH=/opt/apps/gcc4_9/python/2.7.12/bin/:$PATH

#-----------------------------------------------------------------------------

# For Caffe
#export LD_LIBRARY_PATH=$LOCAL_LIB:$MKL_LIB:/work/01932/dineshj/CS381V/caffe_install_scripts/anaconda/lib/:/usr/lib/:$LD_LIBRARY_PATH;
export LD_LIBRARY_PATH=/lib64/:/usr/lib64/$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/01932/dineshj/tools/libevent-2.0.22/lib/

# For Torch
#export LD_LIBRARY_PATH=/work/04004/aish/libs/libcudnn_v4/include/:/work/04004/aish/libs/libcudnn_v4/lib64/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/work/04004/aish/libs/protobuf/lib/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=$LOCAL_LIBS:/home/01932/dineshj/special_libs/:$SNAPPY_LIBRARY_PATH:$HDF5_LIBRARY_PATH:$OPENCV_LIBRARY_PATH:$BOOST_LIBRARY_PATH:$TACC_CUDA_LIB:$TACC_HDF5_LIB:$LD_LIBRARY_PATH:/opt/apps/intel/15/composer_xe_2015.3.187/compiler/lib/:/opt/apps/intel15/composer_xe_2015.3.187/compiler/lib/intel64/:/work/01932/dineshj/anaconda/lib/:/lib64/:/usr/lib64:/usr/lib/:$LD_LIBRARY_PATH

# For tensorflow
export LD_LIBRARY_PATH=/opt/apps/cuda/7.5/lib64/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ROLLER_SCRATCH/packages/cudnn/lib64"
#export LD_LIBRARY_PATH="$ROLLER_SCRATCH/packages/python/lib:$LD_LIBRARY_PATH"

# For Torch
#export LD_RUN_PATH=/work/04004/aish/libs/protobuf/lib/:$LD_RUN_PATH

#----------------------------------------------------------------------------

# For Caffe
#export PYTHONPATH=/work/01932/dineshj/caffe2/python/:$PYTHONPATH
#export PYTHONPATH=/work/01932/dineshj/CS381V/caffe_install_scripts/caffe/python/:$PYTHONPATH
#export PYTHONPATH=/work/04004/aish/visionproject/NLOR/external/caffe-natural-language-object-retrieval/python/:$PYTHONPATH

# For Tensorflow
export PYTHONPATH=$PROTOBUF_INSTALL_ROOT/lib/:$PYTHONPATH

#----------------------------------------------------------------------------

# For Torch
#export TORCHPATH=/work/04004/aish/torch_cuda/:/work/01932/dineshj/torch_cuda/:$TORCHPATH
export MATLAB_ROOT=/work/apps/matlab/2014b/:$MATLAB_ROOT

