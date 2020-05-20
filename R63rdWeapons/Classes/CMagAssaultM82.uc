//============================================================================//
//  CMagAssaultM82.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class CMagAssaultM82 extends AssaultM82;

defaultproperties
{
     m_iClipCapacity=100
     m_iNbOfClips=2
     m_iNbOfExtraClips=1
     m_fMuzzleVelocity=55800.000000
     m_MuzzleScale=0.571236
     m_fFireSoundRadius=3720.000000
     m_fRateOfFire=0.080000
     m_pReticuleClass=Class'R6Weapons.R6RifleReticule'
     m_pBulletClass=Class'R6Weapons.ammo556mmNATONormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=1.104203,fShuffleAccuracy=1.944535,fWalkingAccuracy=2.916803,fWalkingFastAccuracy=12.031814,fRunningAccuracy=12.031814,fReticuleTime=0.968125,fAccuracyChange=6.367109,fWeaponJump=8.322622)
     m_fFireAnimRate=1.250000
     m_fFPBlend=0.339580
     m_EquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Equip'
     m_UnEquipSnd=Sound'CommonAssaultRiffles.Play_Assault_Unequip'
     m_ReloadSnd=Sound'Assault_M82_Reloads.Play_M82_Reload'
     m_ReloadEmptySnd=Sound'Assault_M82_Reloads.Play_M82_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonAssaultRiffles.Play_Assault_ROF'
     m_SingleFireStereoSnd=Sound'Assault_M82.Play_M82_SingleShots'
     m_FullAutoStereoSnd=Sound'Assault_M82.Play_M82_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Assault_M82.Stop_M82_AutoShots_Go'
     m_TriggerSnd=Sound'CommonAssaultRiffles.Play_Assault_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdCMAG556mm"
     m_szMuzzleClass="R6WeaponGadgets.R63rdMuzzleAssault556"
}
