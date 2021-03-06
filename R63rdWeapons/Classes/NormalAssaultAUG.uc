//============================================================================//
//  NormalAssaultAUG.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class NormalAssaultAUG extends AssaultAUG;

defaultproperties
{
     m_iClipCapacity=30
     m_iNbOfClips=6
     m_iNbOfExtraClips=3
     m_fMuzzleVelocity=55800.000000
     m_MuzzleScale=0.571236
     m_fFireSoundRadius=3720.000000
     m_fRateOfFire=0.092308
     m_pReticuleClass=Class'R6Weapons.R6RifleReticule'
     m_pBulletClass=Class'R6Weapons.ammo556mmNATONormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=1.016334,fShuffleAccuracy=2.058766,fWalkingAccuracy=3.088149,fWalkingFastAccuracy=12.738612,fRunningAccuracy=12.738612,fReticuleTime=0.833125,fAccuracyChange=5.891619,fWeaponJump=10.163571)
     m_fFireAnimRate=1.083333
     m_fFPBlend=0.193497
     m_EquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Equip'
     m_UnEquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Unequip'
     m_ReloadSnd=Sound'Assault_AUG_Reloads.Play_Aug_Reload'
     m_ReloadEmptySnd=Sound'Assault_AUG_Reloads.Play_Aug_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonAssaultRiffles.Play_Assault_ROF'
     m_SingleFireStereoSnd=Sound'Assault_AUG.Play_Aug_SingleShots'
     m_FullAutoStereoSnd=Sound'Assault_AUG.Play_Aug_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Assault_AUG.Stop_Aug_AutoShots_Go'
     m_TriggerSnd=Sound'CommonAssaultRiffles.Play_Assault_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAG556mm"
     m_szMuzzleClass="R6WeaponGadgets.R63rdMuzzleAssault556"
}
