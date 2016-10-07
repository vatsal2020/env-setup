# Set PROTOBUF_INSTALL_ROOT to root folder for protobuf installation
cdw
mkdir protobuf
cd protobuf
PROTOBUF_INSTALL_ROOT=$(pwd)

# Download and untar protobuf
cd $PROTOBUF_INSTALL_ROOT
wget https://github.com/google/protobuf/releases/download/v3.0.2/protobuf-python-3.0.2.tar.gz
tar -xvzf protobuf-python-3.0.2.tar.gz

# make protobuf
cd protobuf-3.0.2
./configure --prefix=$PROTOBUF_INSTALL_ROOT
make -j 15
make install
ldconfig -C $PROTOBUF_INSTALL_ROOT/protobuf.cache

# Go to python/
cd python

# Add some lines to setup.cfg
echo "
[install]
install-base=$PROTOBUF_INSTALL_ROOT
install-purelib=$PROTOBUF_INSTALL_ROOT/lib 
install-platlib=$PROTOBUF_INSTALL_ROOT/lib 
install-scripts=$PROTOBUF_INSTALL_ROOT/scripts 
install-headers=$PROTOBUF_INSTALL_ROOT/include
install-data=$PROTOBUF_INSTALL_ROOT/data" >> setup.cfg

# Change environment variables accordingly
CUDA_HOME=/opt/apps/cuda/7.5/
echo "
export PYTHONPATH=\$PYTHONPATH:$PROTOBUF_INSTALL_ROOT/lib/
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/opt/apps/cuda/7.5/lib64/" >> ~/.bashrc
source ~/.bashrc

# Run setup
python setup.py build
python setup.py install

# If you want to load caffemodels saved in hdf5 format
pip install --user h5py