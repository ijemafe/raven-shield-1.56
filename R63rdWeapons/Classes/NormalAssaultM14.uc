//============================================================================//
//  NormalAssaultM14.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class NormalAssaultM14 extends AssaultM14;

defaultproperties
{
     m_iClipCapacity=20
     m_iNbOfClips=6
     m_iNbOfExtraClips=3
     m_fMuzzleVelocity=51180.000000
     m_MuzzleScale=0.934488
     m_fFireSoundRadius=3412.000000
     m_fRateOfFire=0.082759
     m_pReticuleClass=Class'R6Weapons.R6RifleReticule'
     m_pBulletClass=Class'R6Weapons.ammo762mmNATONormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=0.599449,fShuffleAccuracy=2.600717,fWalkingAccuracy=3.901075,fWalkingFastAccuracy=16.091934,fRunningAccuracy=16.091934,fReticuleTime=1.311250,fAccuracyChange=5.361854,fWeaponJump=12.948974)
     m_fFireAnimRate=1.208333
     m_EquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Equip'
     m_UnEquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Unequip'
     m_ReloadSnd=Sound'Assault_M14_Reloads.Play_M14_Reload'
     m_ReloadEmptySnd=Sound'Assault_M14_Reloads.Play_M14_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonAssaultRiffles.Play_Assault_ROF'
     m_SingleFireStereoSnd=Sound'Assault_M14.Play_M14_SingleShots'
     m_FullAutoStereoSnd=Sound'Assault_M14.Play_M14_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Assault_M14.Stop_M14_AutoShots_Go'
     m_TriggerSnd=Sound'CommonAssaultRiffles.Play_Assault_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAG762mm2"
     m_szMuzzleClass="R6WeaponGadgets.R63rdMuzzleAssault762"
}
