//============================================================================//
//  CMagPistolAPArmy.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class CMagPistolAPArmy extends PistolAPArmy;

defaultproperties
{
     m_iClipCapacity=30
     m_iNbOfClips=2
     m_iNbOfExtraClips=2
     m_fMuzzleVelocity=39000.000000
     m_MuzzleScale=0.303341
     m_fFireSoundRadius=2600.000000
     m_fRateOfFire=0.100000
     m_pReticuleClass=Class'R6Weapons.R6CircleReticule'
     m_pBulletClass=Class'R6Weapons.ammo57x28mmNormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=1.605720,fShuffleAccuracy=1.690276,fWalkingAccuracy=2.112845,fWalkingFastAccuracy=8.715486,fRunningAccuracy=8.715486,fReticuleTime=0.870125,fAccuracyChange=9.175662,fWeaponJump=13.475526)
     m_fFPBlend=0.388165
     m_EquipSnd=Sound'CommonPistols.Play_Pistol_Equip'
     m_UnEquipSnd=Sound'CommonPistols.Play_Pistol_Unequip'
     m_ReloadSnd=Sound'Pistol_Belgian_Reloads.Play_Belgian_Reload'
     m_ReloadEmptySnd=Sound'Pistol_Belgian_Reloads.Play_Belgian_ReloadEmpty'
     m_SingleFireStereoSnd=Sound'Pistol_Belgian.Play_Belgian_SingleShots'
     m_EmptyMagSnd=Sound'Pistol_Belgian_Reloads.Play_Belgian_Chamber'
     m_TriggerSnd=Sound'CommonPistols.Play_Pistol_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAGPistolHigh"
}
