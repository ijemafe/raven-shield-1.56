//============================================================================//
//  NormalAssaultFNC.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class NormalAssaultFNC extends AssaultFNC;

defaultproperties
{
     m_iClipCapacity=30
     m_iNbOfClips=6
     m_iNbOfExtraClips=3
     m_fMuzzleVelocity=57900.000000
     m_MuzzleScale=0.609290
     m_fFireSoundRadius=3860.000000
     m_fRateOfFire=0.092308
     m_pReticuleClass=Class'R6Weapons.R6RifleReticule'
     m_pBulletClass=Class'R6Weapons.ammo556mmNATONormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=0.698086,fShuffleAccuracy=2.472488,fWalkingAccuracy=3.708732,fWalkingFastAccuracy=15.298520,fRunningAccuracy=15.298520,fReticuleTime=1.083625,fAccuracyChange=5.118038,fWeaponJump=9.479536)
     m_fFireAnimRate=1.083333
     m_fFPBlend=0.247776
     m_EquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Equip'
     m_UnEquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Unequip'
     m_ReloadSnd=Sound'Assault_FNC_Reloads.Play_FNC_Reload'
     m_ReloadEmptySnd=Sound'Assault_FNC_Reloads.Play_FNC_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonAssaultRiffles.Play_Assault_ROF'
     m_SingleFireStereoSnd=Sound'Assault_FNC.Play_FNC_SingleShots'
     m_FullAutoStereoSnd=Sound'Assault_FNC.Play_FNC_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Assault_FNC.Stop_FNC_AutoShots_Go'
     m_TriggerSnd=Sound'CommonAssaultRiffles.Play_Assault_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAG556mm"
     m_szMuzzleClass="R6WeaponGadgets.R63rdMuzzleAssault556"
}
