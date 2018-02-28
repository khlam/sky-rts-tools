#!/bin/bash


# Part A, Build SCAII core and move glues
cd SCAII/
#git checkout dev
cargo build
rm -rf ~/.scaii/

mkdir ~/.scaii
mkdir ~/.scaii/bin

cp target/debug/libscaii_core.so ~/.scaii/bin/
cp -r glue ~/.scaii/

# Part B.5 make dirs
mkdir ~/.scaii/backends
mkdir ~/.scaii/backends/bin
mkdir ~/.scaii/backends/sky-rts
mkdir ~/.scaii/backends/sky-rts/maps
mkdir ~/.scaii/glue/python/scaii/env/sky_rts

# Part B, Build  Sky-RTS 
cd ../Sky-RTS/
#git checkout dev
cd backend/
cargo build
cp target/debug/libbackend.so ~/.scaii/backends/bin/libsky-rts.so
cd ..
cp -r game_wrapper/python/* ~/.scaii/glue/python/scaii/env/sky_rts/

cp backend/lua/* ~/.scaii/backends/sky-rts/maps

export PYTHONPATH=$PYTHONPATH:/home/khlam/.scaii/bin:/home/khlam/.scaii/glue/python/ 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/khlam/.scaii/bin/