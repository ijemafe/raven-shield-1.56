//=============================================================================
//  R6RainbowLightWinter.uc : Light Winter Rainbow Pawn
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2001/07/26 * Created by Rima Brek
//
//============================================================================//
class R6RainbowLightWinter extends R6RainbowPawn;

defaultproperties
{
     m_eArmorType=ARMOR_Light
     Mesh=SkeletalMesh'R6Rainbow_UKX.LightWinterMesh'
     Begin Object Class=KarmaParamsSkel Name=KarmaParamsSkel234
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
         Name="KarmaParamsSkel234"
     End Object
     KParams=KarmaParamsSkel'R6Characters.KarmaParamsSkel234'
     Skins(0)=Texture'R6Characters_T.Rainbow.R6RLightWinter'
     Skins(1)=Texture'R6Characters_T.Rainbow.R6RLightWinterHead'
     Skins(2)=FinalBlend'R6Characters_T.Rainbow.R6RGogglesFB'
     Skins(5)=Texture'R61stWeapons_T.Hands.R61stHandsWinter'
}
