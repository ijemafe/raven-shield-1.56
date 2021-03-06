//=============================================================================
//  R6PrimaryWeaponDescription.uc : This is mainly to accelerate the foreach search 
//                           when populating menu lists
//  Copyright 2002 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2002/03/22 * Created by Alexandre Dionne
//=============================================================================


class R6PrimaryWeaponDescription extends R6Description;

var Array<INT>  m_ARangePercent;
var Array<INT>  m_ADamagePercent;
var Array<INT>  m_AAccuracyPercent;
var Array<INT>  m_ARecoilPercent;
var Array<INT>  m_ARecoveryPercent;

var Array<string> m_WeaponTags;     //This is used to find the correct class of weapon to spawn
var Array<string> m_WeaponClasses;  //Class of weapon to spawn according to the tagIg index in m_WeaponTags

var array<class>    m_MyGadgets;        //Array of R6WeaponGadgetDescription classes
var array<class>    m_Bullets; //Array of R6BulletDescription classes
var string          m_MagTag;   //To retreive the right texture for extra mag

defaultproperties
{
     m_MyGadgets(0)=Class'R6Description.R6DescWeaponGadgetNone'
     m_Bullets(0)=Class'R6Description.R6DescBulletNone'
     m_2DMenuTexture=Texture'R6TextureMenuEquipment.PrimaryNone1'
     m_2dMenuRegion=(W=129,H=77)
     m_NameTag="NONE"
}
