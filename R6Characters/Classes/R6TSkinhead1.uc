//=============================================================================
//  R6TSkinhead1.uc : (add small description)
//  Copyright 2002 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2002/06/11 * Created by Guillaume Borgia
//=============================================================================
class R6TSkinhead1 extends R6TerroristPawn;

defaultproperties
{
     m_eTerroType=TTYPE_S1T1
     Mesh=SkeletalMesh'R6Terrorist_UKX.SkinheadMesh'
     Begin Object Class=KarmaParamsSkel Name=KarmaParamsSkel274
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
         Name="KarmaParamsSkel274"
     End Object
     KParams=KarmaParamsSkel'R6Characters.KarmaParamsSkel274'
}
