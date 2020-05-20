//============================================================================//
//  CMagSubMac119.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class CMagSubMac119 extends SubMac119;

defaultproperties
{
     m_iClipCapacity=50
     m_iNbOfClips=4
     m_iNbOfExtraClips=2
     m_fMuzzleVelocity=21000.000000
     m_MuzzleScale=0.460559
     m_fFireSoundRadius=1400.000000
     m_fRateOfFire=0.050000
     m_pReticuleClass=Class'R6Weapons.R6CircleDotLineReticule'
     m_pBulletClass=Class'R6Weapons.ammo9mmParabellumNormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=2.158281,fShuffleAccuracy=2.719235,fWalkingAccuracy=4.078852,fWalkingFastAccuracy=16.825266,fRunningAccuracy=16.825266,fReticuleTime=0.289937,fAccuracyChange=8.295168,fWeaponJump=5.626541)
     m_fFireAnimRate=2.000000
     m_fFPBlend=0.553521
     m_EquipSnd=Sound'CommonSMG.Play_SMG_Equip'
     m_UnEquipSnd=Sound'CommonSMG.Play_SMG_Unequip'
     m_ReloadSnd=Sound'Mult_Mac11_Reloads.Play_Mac11_Reload'
     m_ReloadEmptySnd=Sound'Mult_Mac11_Reloads.Play_Mac11_ReloadEmpty'
     m_SingleFireStereoSnd=Sound'Mult_Mac11.Play_Ingram_SingleShots'
     m_FullAutoStereoSnd=Sound'Mult_Mac11.Play_Ingram_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Mult_Mac11.Stop_Ingram_AutoShots_Go'
     m_TriggerSnd=Sound'CommonSMG.Play_SMG_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdMAG9mmHigh"
}
