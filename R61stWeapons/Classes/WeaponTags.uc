class WeaponTags extends object
    abstract;

#exec OBJ LOAD FILE="..\StaticMeshes\R61stWeapons_SM.usx"  Package="R61stWeapons_SM"
#exec OBJ LOAD FILE=..\Animations\R61stItems_UKX.ukx PACKAGE=R61stItems_UKX

//====================================================
//  Pistols
//====================================================

#exec OBJ LOAD FILE=..\Animations\R61stPistol_UKX.ukx PACKAGE=R61stPistol_UKX

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistol92FS
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistol92FS TAG="TagCase"  BONE="Frame" X=5.197 Y=-7.707 Z=-12.329 YAW=55.086 PITCH=27.323 ROLL=62.386
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistol92FS TAG="TagMuzzle"  BONE="Frame" X=27.711 Y=-9.277 Z=-1.718 YAW=-7.91 PITCH=-1.264 ROLL=68.66
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistol92FS TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistol92FS TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolDesertEagles
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolDesertEagles TAG="TagCase"  BONE="Frame" X=6.067 Y=-6.69 Z=-13.231 YAW=55.28 PITCH=27.371 ROLL=62.641
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolDesertEagles TAG="TagMuzzle"  BONE="Frame" X=31.044 Y=-8.304 Z=-1.726 YAW=-7.873 PITCH=-1.063 ROLL=68.617
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolDesertEagles TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolDesertEagles TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolAPArmy
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolAPArmy TAG="TagMuzzle"  BONE="Frame" X=27.645 Y=-1.695 Z=9.176 YAW=-7.91 PITCH=-1.264 ROLL=4.66
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolAPArmy TAG="TagCase"  BONE="Frame" X=5.732 Y=-13.077 Z=6.95 YAW=55.086 PITCH=27.323 ROLL=-1.614
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolAPArmy TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolAPArmy TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolMk23
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMk23 TAG="TagMuzzle"  BONE="Frame" X=28.185 Y=-8.937 Z=-1.834 YAW=-7.91 PITCH=-1.264 ROLL=68.66
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMk23 TAG="TagCase"  BONE="Frame" X=5.067 Y=-7.602 Z=-13.201 YAW=55.086 PITCH=27.323 ROLL=62.385
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMk23 TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMk23 TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolUSP
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolUSP TAG="TagMuzzle"  BONE="Frame" X=24.973 Y=-9.132 Z=-1.852 YAW=-7.91 PITCH=-1.264 ROLL=68.66
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolUSP TAG="TagCase"  BONE="Frame" X=5.101 Y=-7.721 Z=-13.018 YAW=55.086 PITCH=27.323 ROLL=62.385
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolUSP TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolUSP TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolMicroUzi
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMicroUzi TAG="TagMuzzle"  BONE="Frame" X=26.097 Y=-8.311 Z=-1.992 YAW=-7.556 PITCH=-1.304 ROLL=68.649
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMicroUzi TAG="TagCase"  BONE="Frame" X=5.738 Y=-8.563 Z=-13.409 YAW=55.332 PITCH=21.994 ROLL=62.525
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMicroUzi TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolP228
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolP228 TAG="TagMuzzle"  BONE="Frame" X=24.824 Y=-9.386 Z=-1.645 YAW=-7.91 PITCH=-1.264 ROLL=68.66
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolP228 TAG="TagCase"  BONE="Frame" X=6.47 Y=-7.074 Z=-12.369 YAW=55.086 PITCH=27.323 ROLL=62.385
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolP228 TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolP228 TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolCZ61
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagCase"  BONE="Frame" X=7.001 Y=-9.244 Z=-14.809 YAW=56.967 PITCH=27.163 ROLL=57.887
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagMuzzle"  BONE="Frame" X=32.95 Y=-10.881 Z=-2.571 YAW=-3.235 PITCH=-4.796 ROLL=68.612
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagSlide"  BONE="Slide" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolSPP
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolSPP TAG="TagCase"  BONE="Frame" X=8.015 Y=-7.569 Z=-9.2 YAW=56.887 PITCH=27.02 ROLL=57.384
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolSPP TAG="TagMuzzle"  BONE="Frame" X=31.552 Y=-9.741 Z=-1.463 YAW=-3.017 PITCH=-5.204 ROLL=68.717
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolSPP TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolMac119
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMac119 TAG="TagCase"  BONE="Frame" X=8.079 Y=-8.324 Z=-12.825 YAW=56.887 PITCH=27.02 ROLL=57.384
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMac119 TAG="TagMuzzle"  BONE="Frame" X=28.293 Y=-10.427 Z=-1.604 YAW=-3.017 PITCH=-5.204 ROLL=68.717
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolMac119 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolSR2
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolSR2 TAG="TagCase"  BONE="Frame" X=7.116 Y=-7.743 Z=-8.642 YAW=56.782 PITCH=28.387 ROLL=57.619
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolSR2 TAG="TagMuzzle"  BONE="Frame" X=29.913 Y=-9.213 Z=-1.616 YAW=-3.102 PITCH=-4.885 ROLL=67.365
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolSR2 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stPistol_UKX.R61stPistolCZ61
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagCase"  BONE="Frame" X=7.001 Y=-9.244 Z=-14.809 YAW=56.967 PITCH=27.163 ROLL=57.887
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagMuzzle"  BONE="Frame" X=32.934 Y=-10.917 Z=-2.571 YAW=-3.235 PITCH=-4.796 ROLL=68.612
#exec MESH ATTACHNAME MESH=R61stPistol_UKX.R61stPistolCZ61 TAG="TagFrame"  BONE="Frame" YAW=128

//	DONE - save the UKX
#exec SAVEPACKAGE FILE=..\Animations\R61stPistol_UKX.ukx PACKAGE=R61stPistol_UKX

//====================================================
//  SubMachineGuns
//====================================================

#exec OBJ LOAD FILE=..\Animations\R61stSub_UKX.ukx PACKAGE=R61stSub_UKX

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMac119
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMac119 TAG="TagCase"  BONE="Frame" X=8.079 Y=-8.324 Z=-12.825 YAW=56.887 PITCH=27.02 ROLL=57.384
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMac119 TAG="TagMuzzle"  BONE="Frame" X=28.277 Y=-10.402 Z=-1.628 YAW=-3.017 PITCH=-5.204 ROLL=68.717
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMac119 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMicroUzi
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMicroUzi TAG="TagCase"  BONE="Frame" X=-0.654 Y=-13.46 Z=10.22 YAW=56.246 PITCH=-4.616 ROLL=-1.07
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMicroUzi TAG="TagMuzzle"  BONE="Frame" X=26.152 Y=-1.751 Z=8.175 YAW=-7.874 PITCH=-1.063 ROLL=4.618
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMicroUzi TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubUzi
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUzi TAG="TagCase"  BONE="Frame" X=7.552 Y=-8.922 Z=-14.517 YAW=56.975 PITCH=27.813 ROLL=57.628
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUzi TAG="TagMuzzle"  BONE="Frame" X=40.996 Y=-10.067 Z=-2.059 YAW=-2.985 PITCH=-4.935 ROLL=67.941
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUzi TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubCZ61
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubCZ61 TAG="TagCase"  BONE="Frame" X=7.0 Y=-9.242 Z=-14.809 YAW=56.967 PITCH=27.163 ROLL=57.887
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubCZ61 TAG="TagMuzzle"  BONE="Frame" X=32.95 Y=-10.879 Z=-2.57 YAW=-3.235 PITCH=-4.796 ROLL=68.612
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubCZ61 TAG="TagScope"  BONE="Frame" X=19.904 Y=-2.57 Z=16.5 YAW=-3.235 PITCH=-4.796 ROLL=4.612
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubCZ61 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMp510A2
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp510A2 TAG="TagCase"  BONE="Frame" X=8.671 Y=-11.045 Z=-25.967 YAW=57.382 PITCH=24.749 ROLL=56.964
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp510A2 TAG="TagMuzzle"  BONE="Frame" X=50.613 Y=-13.385 Z=-4.403 YAW=-2.221 PITCH=-5.827 ROLL=70.913
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp510A2 TAG="TagScope"  BONE="Frame" X=20.388 Y=-4.037 Z=20.267 YAW=-2.221 PITCH=-5.827 ROLL=6.913
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp510A2 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMP5A4
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5A4 TAG="TagCase"  BONE="Frame" X=8.855 Y=-11.146 Z=-26.54 YAW=56.899 PITCH=25.529 ROLL=56.894
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5A4 TAG="TagMuzzle"  BONE="Frame" X=51.186 Y=-13.594 Z=-4.362 YAW=-2.55 PITCH=-5.798 ROLL=70.124
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5A4 TAG="TagScope"  BONE="Frame" X=20.699 Y=-3.984 Z=20.307 YAW=-2.55 PITCH=-5.798 ROLL=6.124
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMP5A4 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMP5Sd5
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5SD5 TAG="TagCase"  BONE="Frame" X=7.515 Y=-11.587 Z=-24.117 YAW=57.029 PITCH=26.957 ROLL=56.893
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5SD5 TAG="TagMuzzle"  BONE="Frame" X=59.602 Y=-12.956 Z=-2.917 YAW=-2.576 PITCH=-5.596 ROLL=68.739
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5SD5 TAG="TagScope"  BONE="Frame" X=20.286 Y=-3.637 Z=20.191 YAW=-2.55 PITCH=-5.798 ROLL=6.124
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMP5Sd5 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMp5KPDW
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5KPDW TAG="TagCase"  BONE="Frame" X=-1.623 Y=-19.994 Z=11.16 YAW=61.948 PITCH=-4.269 ROLL=-5.454
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5KPDW TAG="TagMuzzle"  BONE="Frame" X=34.002 Y=-1.586 Z=10.716 YAW=-2.625 PITCH=-5.424 ROLL=4.307
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5KPDW TAG="TagScope"  BONE="Frame" X=13.577 Y=-2.225 Z=17.168 YAW=-2.55 PITCH=-5.798 ROLL=6.124
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMp5KPDW TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubM12S
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubM12S TAG="TagCase"  BONE="Frame" X=7.11 Y=-7.04 Z=-16.148 YAW=57.396 PITCH=26.09 ROLL=57.231
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubM12S TAG="TagMuzzle"  BONE="Frame" X=38.031 Y=-9.619 Z=-2.079 YAW=-2.535 PITCH=-5.418 ROLL=69.638
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubM12S TAG="TagScope"  BONE="Frame" X=9.902 Y=-2.079 Z=15.353 YAW=-2.535 PITCH=-5.418 ROLL=5.638
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubM12S TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubMTAR21
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMTAR21 TAG="TagMuzzle"  BONE="Frame" X=25.72 Y=-7.403 Z=-2.528 YAW=-2.773 PITCH=-3.995 ROLL=68.225
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMTAR21 TAG="TagCase"  BONE="Frame" X=5.885 Y=-6.766 Z=-6.782 YAW=57.996 PITCH=27.615 ROLL=58.865
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMTAR21 TAG="TagScope"  BONE="Frame" X=19.034 Y=-2.299 Z=14.707 YAW=-2.773 PITCH=-3.497 ROLL=4.225
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubMTAR21 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubP90
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubP90 TAG="TagCase"  BONE="Frame" X=-0.118 Y=-3.282 Z=2.189 YAW=-96.943 PITCH=-57.583 ROLL=30.266
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubP90 TAG="TagMuzzle"  BONE="Frame" X=29.164 Y=-8.405 Z=-2.206 YAW=-2.929 PITCH=-4.33 ROLL=68.743
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubP90 TAG="TagScope"  BONE="Frame" X=17.927 Y=-2.109 Z=19.716 YAW=-2.929 PITCH=-4.33 ROLL=4.743
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubP90 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubUMP
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUMP TAG="TagCase"  BONE="Frame" X=-2.753 Y=-14.8 Z=-22.907 YAW=62.009 PITCH=-4.3 ROLL=58.258
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUMP TAG="TagMuzzle"  BONE="Frame" X=46.627 Y=-13.5 Z=-2.41 YAW=-2.599 PITCH=-5.709 ROLL=68.343
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUMP TAG="TagScope"  BONE="Frame" X=18.143 Y=-2.41 Z=22.018 YAW=-2.599 PITCH=-5.709 ROLL=4.343
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubUMP TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubTMP
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubTMP TAG="TagCase"  BONE="Frame" X=6.346 Y=-7.491 Z=-7.939 YAW=57.817 PITCH=27.184 ROLL=59.09
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubTMP TAG="TagMuzzle"  BONE="Frame" X=30.199 Y=-8.62 Z=-2.579 YAW=-3.135 PITCH=-3.853 ROLL=68.671
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubTMP TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSub_UKX.R61stSubSR2
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubSR2 TAG="TagCase"  BONE="Frame" X=6.974 Y=-7.761 Z=-8.607 YAW=57.032 PITCH=27.903 ROLL=57.726
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubSR2 TAG="TagMuzzle"  BONE="Frame" X=29.819 Y=-9.115 Z=-1.829 YAW=-2.98 PITCH=-4.85 ROLL=67.858
#exec MESH ATTACHNAME MESH=R61stSub_UKX.R61stSubSR2 TAG="TagFrame"  BONE="Frame" YAW=128


//	DONE - save the UKX
#exec SAVEPACKAGE FILE=..\Animations\R61stSub_UKX.ukx PACKAGE=R61stSub_UKX

//====================================================
//  ShotGuns
//====================================================

#exec OBJ LOAD FILE="..\Animations\R61stShotgun_UKX.ukx" PACKAGE="R61stShotgun_UKX"

#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunUSAS12 TAG="TagCase"  BONE="Frame" X=8.788 Y=-9.752 Z=-22.61 YAW=57.271 PITCH=26.991 ROLL=57.249
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunUSAS12 TAG="TagMuzzle"  BONE="Frame" X=78.263 Y=-12.491 Z=-2.469 YAW=-2.552 PITCH=-5.313 ROLL=68.735
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunUSAS12 TAG="TagScope"  BONE="Frame" X=17.857 Y=-2.407 Z=25.158 YAW=-2.552 PITCH=-5.313 ROLL=4.735
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunUSAS12 TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunUSAS12 TAG="TagMagazine"  BONE="Magazine" YAW=128

#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunM1 TAG="TagCase"  BONE="Frame" X=9.353 Y=-12.952 Z=-30.997 YAW=56.832 PITCH=26.928 ROLL=56.527
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunM1 TAG="TagMuzzle"  BONE="Frame" X=67.59 Y=-15.037 Z=-3.432 YAW=-2.547 PITCH=-5.886 ROLL=68.736
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunM1 TAG="TagScope"  BONE="Frame" X=29.1 Y=-3.429 Z=20.1 YAW=-2.547 PITCH=-5.886 ROLL=4.736
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunM1 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunSPAS12 TAG="TagCase"  BONE="Frame" X=10.555 Y=-12.286 Z=-22.626 YAW=56.862 PITCH=26.504 ROLL=56.562
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunSPAS12 TAG="TagMuzzle"  BONE="Frame" X=85.626 Y=-16.255 Z=-2.741 YAW=-2.601 PITCH=-5.906 ROLL=68.81
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunSPAS12 TAG="TagScope"  BONE="Frame" X=26.276 Y=-2.595 Z=21.966 YAW=-2.601 PITCH=-5.906 ROLL=4.81
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunSPAS12 TAG="TagFrame"  BONE="Frame" YAW=128
#exec MESH ATTACHNAME MESH=R61stShotgun_UKX.R61stShotgunSPAS12 TAG="TagPump"  BONE="Pump" YAW=128

//	DONE - save the UKX
#exec SAVEPACKAGE FILE="..\Animations\R61stShotgun_UKX.ukx" PACKAGE="R61stShotgun_UKX"

//====================================================
//  Assault Rifles
//====================================================

#exec OBJ LOAD FILE="..\Animations\R61stAssault_UKX.ukx" PACKAGE="R61stAssault_UKX"

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultAK47
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK47 TAG="TagCase"  BONE="Frame" X=8.992 Y=-13.202 Z=-23.793 YAW=56.908 PITCH=26.983 ROLL=56.646
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK47 TAG="TagMuzzle"  BONE="Frame" X=66.108 Y=-13.804 Z=-3.116 YAW=-2.538 PITCH=-5.787 ROLL=68.336
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK47 TAG="TagScope"  BONE="Frame" X=26.098 Y=-3.681 Z=21.156 YAW=-2.538 PITCH=-5.787 ROLL=4.336
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK47 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultAK74
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK74 TAG="TagCase"  BONE="Frame" X=8.998 Y=-13.197 Z=-23.796 YAW=56.969 PITCH=27.032 ROLL=56.668
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK74 TAG="TagMuzzle"  BONE="Frame" X=76.759 Y=-13.824 Z=-3.281 YAW=-2.484 PITCH=-5.764 ROLL=68.289
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK74 TAG="TagScope"  BONE="Frame" X=26.086 Y=-3.686 Z=21.157 YAW=-2.538 PITCH=-5.787 ROLL=4.336
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAK74 TAG="TagFrame"  BONE="Frame" YAW=128


#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultTAR21
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultTAR21 TAG="TagCase"  BONE="Frame" X=12.01 Y=-13.304 Z=-6.871 YAW=56.948 PITCH=27.194 ROLL=56.797
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultTAR21 TAG="TagMuzzle"  BONE="Frame" X=48.568 Y=-15.549 Z=-2.896 YAW=-2.565 PITCH=-5.645 ROLL=68.493
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultTAR21 TAG="TagScope"  BONE="Frame" X=25.993 Y=-2.832 Z=23.16 YAW=-2.525 PITCH=-5.291 ROLL=4.488
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultTAR21 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultM82
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM82 TAG="TagMuzzle"  BONE="Frame" X=44.008 Y=-10.136 Z=-2.017 YAW=-2.969 PITCH=-5.271 ROLL=68.707
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM82 TAG="TagCase"  BONE="Frame" X=7.134 Y=-8.834 Z=1.897 YAW=56.881 PITCH=27.023 ROLL=57.298
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM82 TAG="TagScope"  BONE="Frame" X=15.221 Y=-2.135 Z=17.732 YAW=-2.969 PITCH=-5.271 ROLL=4.707
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM82 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultM4
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM4 TAG="TagCase"  BONE="Frame" X=8.26 Y=-10.804 Z=-22.415 YAW=56.958 PITCH=26.946 ROLL=56.805
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM4 TAG="TagMuzzle"  BONE="Frame" X=60.443 Y=-12.967 Z=-2.459 YAW=-2.594 PITCH=-5.666 ROLL=67.676
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM4 TAG="TagScope"  BONE="Frame" X=19.986 Y=-2.298 Z=19.095 YAW=-2.594 PITCH=-5.026 ROLL=3.676
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM4 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultM16A2
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM16A2 TAG="TagCase"  BONE="Frame" X=8.385 Y=-10.275 Z=-23.603 YAW=57.084 PITCH=27.372 ROLL=57.053
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM16A2 TAG="TagMuzzle"  BONE="Frame" X=79.541 Y=-12.609 Z=-2.425 YAW=-2.565 PITCH=-5.426 ROLL=68.337
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM16A2 TAG="TagScope"  BONE="Frame" X=21.014 Y=-2.355 Z=21.679 YAW=-2.565 PITCH=-5.426 ROLL=4.337
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM16A2 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultM14
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM14 TAG="TagCase"  BONE="Frame" X=10.262 Y=-22.627 Z=11.803 YAW=56.617 PITCH=27.403 ROLL=-7.628
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM14 TAG="TagMuzzle"  BONE="Frame" X=84.739 Y=-3.031 Z=16.576 YAW=-2.595 PITCH=-5.953 ROLL=4.245
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM14 TAG="TagScope"  BONE="Frame" X=21.844 Y=-3.031 Z=20.544 YAW=-2.595 PITCH=-5.953 ROLL=4.245
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultM14 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultL85A1
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultL85A1 TAG="TagCase"  BONE="Frame" X=8.01 Y=-7.436 Z=3.748 YAW=56.945 PITCH=27.185 ROLL=57.394
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultL85A1 TAG="TagMuzzle"  BONE="Frame" X=54.884 Y=-11.151 Z=-1.071 YAW=-2.944 PITCH=-5.18 ROLL=68.552
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultL85A1 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultGalilARM
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultGalilARM TAG="TagCase"  BONE="Frame" X=10.335 Y=-11.869 Z=-23.421 YAW=57.148 PITCH=27.381 ROLL=57.142
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultGalilARM TAG="TagMuzzle"  BONE="Frame" X=76.434 Y=-14.618 Z=-2.47 YAW=-2.557 PITCH=-5.356 ROLL=68.335
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultGalilARM TAG="TagScope"  BONE="Frame" X=18.45 Y=-2.47 Z=21.173 YAW=-2.557 PITCH=-5.356 ROLL=4.335
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultGalilARM TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultG3A3
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG3A3 TAG="TagCase"  BONE="Frame" X=7.31 Y=-12.034 Z=-16.7 YAW=56.958 PITCH=26.946 ROLL=56.805
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG3A3 TAG="TagMuzzle"  BONE="Frame" X=63.931 Y=-13.731 Z=-3.579 YAW=-2.594 PITCH=-5.666 ROLL=68.743
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG3A3 TAG="TagScope"  BONE="Frame" X=12.898 Y=-3.34 Z=20.041 YAW=-2.594 PITCH=-5.666 ROLL=4.743
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG3A3 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultG36K
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG36K TAG="TagCase"  BONE="Frame" X=10.805 Y=-12.816 Z=-23.98 YAW=57.269 PITCH=27.05 ROLL=57.289
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG36K TAG="TagMuzzle"  BONE="Frame" X=69.078 Y=-15.758 Z=-2.561 YAW=-2.572 PITCH=-5.275 ROLL=68.324
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultG36K TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultFNC
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFNC TAG="TagCase"  BONE="Frame" X=-18.914 Y=-11.096 Z=-9.662 YAW=125.405 PITCH=5.666 ROLL=91.256
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFNC TAG="TagMuzzle"  BONE="Frame" X=72.213 Y=-12.905 Z=-2.569 YAW=-2.594 PITCH=-5.666 ROLL=68.743
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFNC TAG="TagScope"  BONE="Frame" X=13.13 Y=-2.569 Z=19.741 YAW=-2.594 PITCH=-5.666 ROLL=4.743
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFNC TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultFAMASG2
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAMASG2 TAG="TagCase"  BONE="Frame" X=8.293 Y=-8.845 Z=7.774 YAW=57.131 PITCH=27.477 ROLL=57.793
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAMASG2 TAG="TagMuzzle"  BONE="Frame" X=49.327 Y=-10.796 Z=-1.864 YAW=-2.974 PITCH=-4.84 ROLL=68.29
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAMASG2 TAG="TagScope"  BONE="Frame" X=14.906 Y=-1.915 Z=22.669 YAW=-2.974 PITCH=-4.84 ROLL=4.29
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAMASG2 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultFAL
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAL TAG="TagCase"  BONE="Frame" X=8.807 Y=-11.324 Z=-19.092 YAW=56.958 PITCH=26.946 ROLL=56.805
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAL TAG="TagMuzzle"  BONE="Frame" X=82.881 Y=-12.996 Z=-2.971 YAW=-2.594 PITCH=-5.666 ROLL=68.743
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAL TAG="TagScope"  BONE="Frame" X=11.676 Y=-2.971 Z=20.194 YAW=-2.594 PITCH=-5.666 ROLL=4.743
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultFAL TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultAUG
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAUG TAG="TagCase"  BONE="Frame" X=6.625 Y=-7.596 Z=-4.116 YAW=56.782 PITCH=27.684 ROLL=56.78
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAUG TAG="TagMuzzle"  BONE="Frame" X=54.652 Y=-9.81 Z=-2.199 YAW=-2.652 PITCH=-5.603 ROLL=68.0
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultAUG TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stAssault_UKX.R61stAssaultType97
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultType97 TAG="TagCase"  BONE="Frame" X=4.217 Y=-3.95 Z=2.969 YAW=57.917 PITCH=27.643 ROLL=58.994
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultType97 TAG="TagMuzzle"  BONE="Frame" X=31.479 Y=-7.607 Z=-1.354 YAW=-2.932 PITCH=-3.892 ROLL=68.205
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultType97 TAG="TagScope"  BONE="Frame" X=10.528 Y=-1.273 Z=19.105 YAW=-2.931 PITCH=-3.893 ROLL=4.205
#exec MESH ATTACHNAME MESH=R61stAssault_UKX.R61stAssaultType97 TAG="TagFrame"  BONE="Frame" YAW=128

//	DONE - save the UKX
#exec SAVEPACKAGE FILE="..\Animations\R61stAssault_UKX.ukx" PACKAGE="R61stAssault_UKX"

//====================================================
//  Sniper Rifles
//====================================================

#exec OBJ LOAD FILE=..\Animations\R61stSniper_UKX.ukx PACKAGE=R61stSniper_UKX

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperAWCovert
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperAWCovert TAG="TagMuzzle"  BONE="Frame" X=103.133 Y=-13.614 Z=-2.172 YAW=-2.522 PITCH=-5.674 ROLL=68.731
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperAWCovert TAG="TagCase"  BONE="Frame" X=8.72 Y=-9.569 Z=-20.581 YAW=57.02 PITCH=26.957 ROLL=56.793
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperAWCovert TAG="TagThermal"  BONE="Frame" X=24.785 Y=-20.176 Z=-4.445 YAW=-2.522 PITCH=-5.674 ROLL=68.732
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperAWCovert TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperSSG3000
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperSSG3000 TAG="Tagcase"  BONE="Frame" X=2.202 Y=-11.443 Z=-18.501 YAW=59.978 PITCH=10.452 ROLL=58.132
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperSSG3000 TAG="Tagmuzzle"  BONE="Frame" X=94.244 Y=-12.745 Z=-2.144 YAW=-2.522 PITCH=-5.674 ROLL=68.731
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperSSG3000 TAG="TagThermal"  BONE="Frame" X=23.608 Y=-17.728 Z=-4.437 YAW=-2.522 PITCH=-5.674 ROLL=68.731
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperSSG3000 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperDragunov
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperDragunov TAG="TagCase"  BONE="Frame" X=7.508 Y=-8.049 Z=-23.843 YAW=57.02 PITCH=26.956 ROLL=56.793
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperDragunov TAG="TagMuzzle"  BONE="Frame" X=98.783 Y=-10.598 Z=-2.19 YAW=-2.522 PITCH=-5.674 ROLL=68.732
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperDragunov TAG="TagThermal"  BONE="Frame" X=19.907 Y=-17.716 Z=-4.18 YAW=-2.522 PITCH=-5.674 ROLL=68.732
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperDragunov TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperVSSVintorez
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperVSSVintorez TAG="TagCase"  BONE="Frame" X=6.853 Y=-8.903 Z=-25.672 YAW=57.603 PITCH=26.784 ROLL=57.067
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperVSSVintorez TAG="TagMuzzle"  BONE="Frame" X=70.841 Y=-10.242 Z=-2.399 YAW=-2.417 PITCH=-5.697 ROLL=68.966
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperVSSVintorez TAG="TagThermal"  BONE="Frame" X=23.139 Y=-17.079 Z=-4.873 YAW=-2.417 PITCH=-5.697 ROLL=68.966
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperVSSVintorez TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperM82A1
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperM82A1 TAG="TagMuzzle"  BONE="Frame" X=96.333 Y=-12.302 Z=-0.856 YAW=-3.357 PITCH=-5.738 ROLL=68.853
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperM82A1 TAG="TagCase"  BONE="Frame" X=9.717 Y=-13.438 Z=7.684 YAW=56.163 PITCH=26.829 ROLL=-7.269
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperM82A1 TAG="TagThermal"  BONE="Frame" X=17.537 Y=-18.998 Z=-3.087 YAW=-3.357 PITCH=-5.738 ROLL=68.853
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperM82A1 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperPSG1
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperPSG1 TAG="TagCase"  BONE="Frame" X=6.677 Y=-9.987 Z=-22.168 YAW=57.375 PITCH=26.77 ROLL=57.161
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperPSG1 TAG="TagMuzzle"  BONE="Frame" X=96.634 Y=-10.862 Z=-2.34 YAW=-2.423 PITCH=-5.404 ROLL=68.949
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperPSG1 TAG="TagThermal"  BONE="Frame" X=15.662 Y=-18.783 Z=-4.859 YAW=-2.423 PITCH=-5.404 ROLL=68.949
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperPSG1 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stSniper_UKX.R61stSniperWA2000
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperWA2000 TAG="TagCase"  BONE="Frame" X=10.941 Y=-11.747 Z=-5.278 YAW=57.013 PITCH=27.352 ROLL=56.95
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperWA2000 TAG="TagMuzzle"  BONE="Frame" X=71.359 Y=-14.245 Z=-1.797 YAW=-2.574 PITCH=-5.508 ROLL=68.348
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperWA2000 TAG="TagThermal"  BONE="Frame" X=21.637 Y=-21.142 Z=-4.148 YAW=-2.574 PITCH=-5.508 ROLL=68.348
#exec MESH ATTACHNAME MESH=R61stSniper_UKX.R61stSniperWA2000 TAG="TagFrame"  BONE="Frame" YAW=128


//	DONE - save the UKX
#exec SAVEPACKAGE FILE=..\Animations\R61stSniper_UKX.ukx PACKAGE=R61stSniper_UKX

//====================================================
//  LMGs
//====================================================

#exec OBJ LOAD FILE=..\Animations\R61stLMG_UKX.ukx PACKAGE=R61stLMG_UKX

#exec MESH CLEARATTACHTAGS MESH=R61stLMG_UKX.R61stLMGM249
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGM249 TAG="TagCase"  BONE="Frame" X=9.214 Y=-9.205 Z=-25.119 YAW=56.958 PITCH=26.947 ROLL=56.805
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGM249 TAG="TagMuzzle"  BONE="Frame" X=81.67 Y=-14.105 Z=-2.569 YAW=-2.593 PITCH=-5.666 ROLL=68.742
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGM249 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stLMG_UKX.R61stLMGRPD
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGRPD TAG="TagCase"  BONE="Frame" X=9.226 Y=-9.755 Z=-24.393 YAW=56.779 PITCH=27.426 ROLL=56.649
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGRPD TAG="TagMuzzle"  BONE="Frame" X=81.234 Y=-13.303 Z=-2.424 YAW=-2.607 PITCH=-5.734 ROLL=68.247
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGRPD TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stLMG_UKX.R61stLMGM60E4
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGM60E4 TAG="TagCase"  BONE="Frame" X=13.96 Y=-10.907 Z=-7.35 YAW=56.582 PITCH=26.893 ROLL=56.574
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGM60E4 TAG="TagMuzzle"  BONE="Frame" X=71.954 Y=-17.677 Z=-2.332 YAW=-2.833 PITCH=-5.853 ROLL=68.775
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMGM60E4 TAG="TagFrame"  BONE="Frame" YAW=128

#exec MESH CLEARATTACHTAGS MESH=R61stLMG_UKX.R61stLMG21E
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMG21E TAG="TagCase"  BONE="Frame" X=9.338 Y=-10.615 Z=-17.921 YAW=56.958 PITCH=26.947 ROLL=56.805
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMG21E TAG="TagMuzzle"  BONE="Frame" X=77.537 Y=-14.072 Z=-2.609 YAW=-2.593 PITCH=-5.666 ROLL=68.742
#exec MESH ATTACHNAME MESH=R61stLMG_UKX.R61stLMG21E TAG="TagFrame"  BONE="Frame" YAW=128


//	DONE - save the UKX
#exec SAVEPACKAGE FILE=..\Animations\R61stLMG_UKX.ukx PACKAGE=R61stLMG_UKX


//====================================================
//  Grenade
//====================================================

#exec OBJ LOAD FILE=..\Animations\R61stGrenade_UKX.ukx PACKAGE=R61stGrenade_UKX

#exec MESH CLEARATTACHTAGS MESH=R61stGrenade_UKX.R61stGrenade
#exec MESH ATTACHNAME MESH=R61stGrenade_UKX.R61stGrenade TAG="TagFrame"  BONE="Frame" YAW=128

//	DONE - save the UKX
#exec SAVEPACKAGE FILE=..\Animations\R61stGrenade_UKX.ukx PACKAGE=R61stGrenade_UKX


//====================================================
//  Item
//====================================================

#exec OBJ LOAD FILE=..\Animations\R61stItems_UKX.ukx PACKAGE=R61stItems_UKX

#exec MESH CLEARATTACHTAGS MESH=R61stItems_UKX.R61stItemAttachement
#exec MESH ATTACHNAME MESH=R61stItems_UKX.R61stItemAttachement TAG="TagFrame"  BONE="Frame" YAW=128

//	DONE - save the UKX
#exec SAVEPACKAGE FILE=..\Animations\R61stItems_UKX.ukx PACKAGE=R61stItems_UKX

defaultproperties
{
}
