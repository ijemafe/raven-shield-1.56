//=============================================================================
//  R6HWorkerAirport02.uc : (add small description)
//  Copyright 2002 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2002/01/11 * Created by Guillaume Borgia
//=============================================================================
class R6HWorkerAirport02 extends R6HWorkerAirport01;

#exec OBJ LOAD FILE=..\Animations\R6Hostage_UKX.ukx PACKAGE=R6Hostage_UKX

defaultproperties
{
     Begin Object Class=KarmaParamsSkel Name=KarmaParamsSkel208
         KConvulseSpacing=(Max=2.200000)
         KSkeleton="terroskel"
         KStartEnabled=True
         bHighDetailOnly=False
         KLinearDamping=0.500000
         KAngularDamping=0.500000
         KBuoyancy=1.000000
         KVelDropBelowThreshold=50.000000
         KFriction=0.600000
         KRestitution=0.300000
         KImpactThreshold=150.000000
         Name="KarmaParamsSkel208"
     End Object
     KParams=KarmaParamsSkel'R6Characters.KarmaParamsSkel208'
     Skins(0)=Texture'R6Characters_T.hostage.R6HWorkerAirport2'
}
