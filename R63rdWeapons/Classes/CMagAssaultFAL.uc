//============================================================================//
//  CMagAssaultFAL.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class CMagAssaultFAL extends AssaultFAL;

defaultproperties
{
     m_iClipCapacity=100
     m_iNbOfClips=2
     m_iNbOfExtraClips=1
     m_fMuzzleVelocity=50400.000000
     m_MuzzleScale=0.908490
     m_fFireSoundRadius=3360.000000
     m_fRateOfFire=0.092308
     m_pReticuleClass=Class'R6Weapons.R6RifleReticule'
     m_pBulletClass=Class'R6Weapons.ammo762mmNATONormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=0.648063,fShuffleAccuracy=2.537518,fWalkingAccuracy=3.806278,fWalkingFastAccuracy=15.700894,fRunningAccuracy=15.700894,fReticuleTime=1.760313,fAccuracyChange=4.856827,fWeaponJump=8.851613)
     m_fFireAnimRate=1.083333
     m_fFPBlend=0.297604
     m_EquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Equip'
     m_UnEquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Unequip'
     m_ReloadSnd=Sound'Assault_FAL_Reloads.Play_FAL_Reload'
     m_ReloadEmptySnd=Sound'Assault_FAL_Reloads.Play_FAL_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonAssaultRiffles.Play_Assault_ROF'
     m_SingleFireStereoSnd=Sound'Assault_FAL.Play_FAL_SingleShots'
     m_FullAutoStereoSnd=Sound'Assault_FAL.Play_FAL_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Assault_FAL.Stop_FAL_AutoShots_Go'
     m_TriggerSnd=Sound'CommonAssaultRiffles.Play_Assault_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdCMAG762mm"
     m_szMuzzleClass="R6WeaponGadgets.R63rdMuzzleAssault762"
}
