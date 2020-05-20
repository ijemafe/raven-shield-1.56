//============================================================================//
//  NormalAssaultG3A3.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class NormalAssaultG3A3 extends AssaultG3A3;

defaultproperties
{
     m_iClipCapacity=20
     m_iNbOfClips=6
     m_iNbOfExtraClips=3
     m_fMuzzleVelocity=47400.000000
     m_MuzzleScale=0.812218
     m_fFireSoundRadius=3160.000000
     m_fRateOfFire=0.109091
     m_pReticuleClass=Class'R6Weapons.R6RifleReticule'
     m_pBulletClass=Class'R6Weapons.ammo762mmNATONormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=0.870009,fShuffleAccuracy=2.248988,fWalkingAccuracy=3.373482,fWalkingFastAccuracy=13.915612,fRunningAccuracy=13.915612,fReticuleTime=1.126562,fAccuracyChange=5.556921,fWeaponJump=12.602019)
     m_fFireAnimRate=0.916667
     m_EquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Equip'
     m_UnEquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Unequip'
     m_ReloadSnd=Sound'Assault_G3A3_Reloads.Play_G3A3_Reload'
     m_ReloadEmptySnd=Sound'Assault_G3A3_Reloads.Play_G3A3_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonAssaultRiffles.Play_Assault_ROF'
     m_SingleFireStereoSnd=Sound'Assault_G3A3.Play_G3A3_SingleShots'
     m_FullAutoStereoSnd=Sound'Assault_G3A3.Play_G3A3_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Assault_G3A3.Stop_G3A3_AutoShots_Go'
     m_TriggerSnd=Sound'CommonAssaultRiffles.Play_Assault_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAG762mm2"
     m_szMuzzleClass="R6WeaponGadgets.R63rdMuzzleAssault762"
}
