#/bin/sh

# parameters
SEARCH_FOLDER="data_DT-1100-110001_SingleMuon_Run2015D-PromptReco-v3_RECO_7_4_6_patch3_pt20_v1_MuAlSummer15b_NOFIDCUT*"
OUT_FOLDER="/store/group/alca_muonalign/$USER"
eosComm="/afs/cern.ch/project/eos/installation/0.3.84-aquamarine/bin/eos.select"

#List of objects (files or dir) to copy recursively
listfile=`ls -dR $SEARCH_FOLDER`

#For each of them you see if is a fle to copy or a DIR
for f in $listfile
do
    echo "1) The first is: $f"
    if [ -d "$f" ]
    then
       echo " -> IS a DIR!"
       echo "    $eosComm mkdir -p $OUT_FOLDER/$f"
       Mkdir=`$eosComm mkdir -p $OUT_FOLDER/$f`
       for ff in $f/*
       do   
            echo "  --> Descending: $ff"
            if [ -d "$ff" ]
            then
               echo "    --->  Another DIR!! I will just do nothing."
               echo "          $eosComm mkdir -p $OUT_FOLDER/$ff"
                Mkdir=`$eosComm mkdir -p $OUT_FOLDER/$ff`
            else
               echo "    --->  A file: I will copy it."
               echo "          cmsStage -f $ff $OUT_FOLDER/$f"
               stage=`cmsStage -f $ff $OUT_FOLDER/$f`
            fi
       done
    else
       echo " -> IS a FILE!"
       echo "cmsStage -f $f $OUT_FOLDER"
       stage=`cmsStage -f $f $OUT_FOLDER`
    fi
done
