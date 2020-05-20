//============================================================================//
//  NormalSubUzi.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class NormalSubUzi extends SubUzi;

defaultproperties
{
     m_iClipCapacity=32
     m_iNbOfClips=7
     m_iNbOfExtraClips=3
     m_fMuzzleVelocity=24000.000000
     m_MuzzleScale=0.486750
     m_fFireSoundRadius=1600.000000
     m_pReticuleClass=Class'R6Weapons.R6CircleDotLineReticule'
     m_pBulletClass=Class'R6Weapons.ammo9mmParabellumNormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=1.485115,fShuffleAccuracy=1.969350,fWalkingAccuracy=2.954025,fWalkingFastAccuracy=12.185354,fRunningAccuracy=12.185354,fReticuleTime=0.709375,fAccuracyChange=6.134586,fWeaponJump=5.887317)
     m_fFPBlend=0.532827
     m_EquipSnd=Sound'CommonSMG.Play_SMG_Equip'
     m_UnEquipSnd=Sound'CommonSMG.Play_SMG_Unequip'
     m_ReloadSnd=Sound'Mult_Uzi_Reloads.Play_UZI_Reload'
     m_ReloadEmptySnd=Sound'Mult_Uzi_Reloads.Play_UZI_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonSMG.Play_SMG_ROF'
     m_SingleFireStereoSnd=Sound'Mult_Uzi.Play_UZI_SingleShots'
     m_FullAutoStereoSnd=Sound'Mult_Uzi.Play_UZI_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Mult_Uzi.Stop_UZI_AutoShots_Go'
     m_TriggerSnd=Sound'CommonSMG.Play_SMG_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAG9mmStraight"
}
