//============================================================================//
//  CMagSubM12S.uc
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//============================================================================//


Class CMagSubM12S extends SubM12S;

defaultproperties
{
     m_iClipCapacity=100
     m_iNbOfClips=2
     m_iNbOfExtraClips=1
     m_fMuzzleVelocity=25800.000000
     m_MuzzleScale=0.504141
     m_fFireSoundRadius=1720.000000
     m_fRateOfFire=0.109091
     m_pReticuleClass=Class'R6Weapons.R6CircleDotLineReticule'
     m_pBulletClass=Class'R6Weapons.ammo9mmParabellumNormalFMJ'
     m_stAccuracyValues=(fBaseAccuracy=1.507128,fShuffleAccuracy=1.810734,fWalkingAccuracy=2.716101,fWalkingFastAccuracy=11.203915,fRunningAccuracy=11.203915,fReticuleTime=0.846812,fAccuracyChange=6.577107,fWeaponJump=5.377518)
     m_fFireAnimRate=0.916667
     m_fFPBlend=0.750000
     m_EquipSnd=Sound'CommonSMG.Play_SMG_Equip'
     m_UnEquipSnd=Sound'CommonSMG.Play_SMG_Unequip'
     m_ReloadSnd=Sound'Sub_M12_Reloads.Play_M12_Reload'
     m_ReloadEmptySnd=Sound'Sub_M12_Reloads.Play_M12_ReloadEmpty'
     m_ChangeROFSnd=Sound'CommonSMG.Play_SMG_ROF'
     m_SingleFireStereoSnd=Sound'Sub_M12.Play_M12_SingleShots'
     m_FullAutoStereoSnd=Sound'Sub_M12.Play_M12_AutoShots'
     m_FullAutoEndStereoSnd=Sound'Sub_M12.Stop_M12_AutoShots_Go'
     m_TriggerSnd=Sound'CommonSMG.Play_SMG_Trigger'
     m_szMagazineClass="R63rdWeapons.R63rdCMAG9mmUMP"
}
