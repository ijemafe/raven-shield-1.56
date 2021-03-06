//============================================================================//
//  SubMTAR21.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class SubMTAR21 extends R6SubMachineGun
    Abstract;

#exec OBJ LOAD FILE="..\StaticMeshes\R63rdWeapons_SM.usx"  Package="R63rdWeapons_SM"

defaultproperties
{
     m_pBulletClass=Class'R6Weapons.ammo9mmParabellum'
     m_pEmptyShells=Class'R6SFX.R6Shell9mmParabellum'
     m_pMuzzleFlash=Class'R6SFX.R6MuzzleFlashSub'
     m_stWeaponCaps=(bSingle=1,bFullAuto=1,bCMag=1,bSilencer=1,bLight=1,bMiniScope=1)
     m_pFPHandsClass=Class'R61stWeapons.R61stHandsSubMTAR21'
     m_pFPWeaponClass=Class'R61stWeapons.R61stSubMTAR21'
     m_eGripType=GRIP_P90
     m_WithScopeSM=StaticMesh'R63rdWeapons_SM.SubGuns.R63rdMTAR21ForScope'
     m_HUDTexture=Texture'R6HUD.HUDElements'
     m_PawnWaitAnimLow="StandP90Low_nt"
     m_PawnWaitAnimHigh="StandP90High_nt"
     m_PawnWaitAnimProne="ProneP90_nt"
     m_PawnFiringAnim="StandFireP90"
     m_PawnFiringAnimProne="ProneFireP90"
     m_PawnReloadAnim="StandReloadAug"
     m_PawnReloadAnimTactical="StandTacReloadAug"
     m_PawnReloadAnimProne="ProneReloadAug"
     m_PawnReloadAnimProneTactical="ProneTacReloadAug"
     m_vPositionOffset=(X=-5.500000,Y=-4.500000,Z=5.500000)
     m_HUDTexturePos=(W=32.000000,X=200.000000,Y=288.000000,Z=100.000000)
     m_NameID="SubMTAR21"
     StaticMesh=StaticMesh'R63rdWeapons_SM.SubGuns.R63rdMTAR21'
}
