#/bin/sh

# parameters
SEARCH_FOLDER="data_CSC-1100-110001_CMSSW_926_SingMu_MuAlCalIsoMuv1_294927_297723_92X_dataRun2_Prompt_v5_shifted*"
OUT_FOLDER="/eos/cms/store/group/alca_muonalign/$USER/"
eosComm="eos"
#/afs/cern.ch/project/eos/installation/0.3.84-aquamarine/bin/eos.select"

#List of objects (files or dir) to copy recursively
listfile=`ls -dR $SEARCH_FOLDER`

#For each of them you see if is a fle to copy or a DIR
for f in $listfile
do
    echo "1) The first is: $f"
    if [ -d "$f" ]
    then
       echo " -> IS a DIR!"
       echo "    $eosComm mkdir -p $OUT_FOLDER/$f/"
       Mkdir=`$eosComm mkdir -p $OUT_FOLDER/$f/`
       for ff in $f/*
       do   
            echo "  --> Descending: $ff"
            if [ -d "$ff" ]
            then
               echo "    --->  Another DIR!! I will just do nothing."
               echo "          $eosComm mkdir -p $OUT_FOLDER/$ff/"
                Mkdir=`$eosComm mkdir -p $OUT_FOLDER/$ff/`
            else
               echo "    --->  A file: I will copy it."
               echo "          eos cp -f $ff $OUT_FOLDER/"
               stage=`eos cp $ff $OUT_FOLDER/`
            fi
       done
    else
       echo " -> IS a FILE!"
       echo "eos cp $f $OUT_FOLDER/"
       stage=`eos cp $f $OUT_FOLDER/`
    fi
done
