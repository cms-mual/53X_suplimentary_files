# MuAlSupplementaryFiles

Setting up muon alignment in 74X:

The following bash commands will set up alignment in 74X. 

        cmsrel CMSSW_7_4_6_patch3
        cd CMSSW_7_4_6_patch3/src/
        cmsenv
        git clone https://github.com/cms-mual/Alignment.git -b CMSSW_7_4_X
        git clone https://github.com/cms-mual/TrackingTools.git -b CMSSW_7_4_X
        scram b -j 16
        
You may find in usefull to make these softlinks for editing commonly used files:

        ln -s Alignment/MuonAlignmentAlgorithms/scripts/createJobs.py
        ln -s Alignment/MuonAlignmentAlgorithms/python/gather_cfg.py
        ln -s Alignment/MuonAlignmentAlgorithms/python/align_cfg.py

Running a test job:

The following instructions will copy a list of needed files into your CMSSW_7_4_6_patch3/src directory and run a test job. Navigate your CMSSW_7_4_6_patch3/src directory before running. Be sure to change youremail.tamu.edu in the createJobs command if you wish.

        git clone https://github.com/cms-mual/MuAlSupplementaryFiles.git -b CMSSW_7_4_X
        cp MuAlSupplementaryFiles/* .
        cmsenv
        ./createJobs.py mc_DT-1100-110001_DESRUN2_74_V4_7_4_6_patch3_abridged_ 3 initialMuonGeometry-DESRUN2_74_V4.db singleMuonGun_RECO_Consolidated_1359Files_Blocks5_abridged.py --inputInBlocks -s mc_DT-1100-110001_DESRUN2_74_V4_7_4_6_patch3_abridged.sh --validationLabel mc_DT-1100-110001_DESRUN2_74_V4_7_4_6_patch3_abridged_ --b --user_mail youremail.tamu.edu --minTrackPt 30 --maxTrackPt 200 --maxDxy 0.2 --minNCrossedChambers 1 --residualsModel pureGaussian --peakNSigma 2. --station123params 110001 --station4params 100001 --cscparams 100001 --useResiduals 1100 --noCSC --mapplots --curvatureplots --segdiffplots --extraPlots --globalTag DESRUN2_74_V4 --createAlignNtuple --gprcd inertGlobalPositionRcd --gprcdconnect sqlite_file:inertGlobalPositionRcd.db --noCleanUp
        . mc_DT-1100-110001_DESRUN2_74_V4_7_4_6_patch3_abridged.sh

