//=============================================================================
//  R6TParamilitary01.uc : (add small description)
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2001/11/14 * Created by Guillaume Borgia
//=============================================================================
class R6TParamilitary01 extends R6TerroristPawn;

defaultproperties
{
     m_eTerroType=TTYPE_P1T1
     Mesh=SkeletalMesh'R6Terrorist_UKX.ParaMilitary01Mesh'
     Begin Object Class=KarmaParamsSkel Name=KarmaParamsSkel270
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
         Name="KarmaParamsSkel270"
     End Object
     KParams=KarmaParamsSkel'R6Characters.KarmaParamsSkel270'
}
