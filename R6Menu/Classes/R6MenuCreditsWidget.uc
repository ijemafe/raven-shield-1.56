//=============================================================================
//  R6MenuCreditsWidget.uc : (add small description)
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2001/11/22 * Created by Alexandre Dionne
//=============================================================================
class R6MenuCreditsWidget extends R6MenuWidget
// MPF - Eric
	Config(R6Credits);

var R6WindowTextLabel			m_LMenuTitle; 
var R6WindowButton	            m_ButtonMainMenu;

var R6MenuCredits				m_ListOfCredits;
var Region                      m_RVideo;

var INT                         m_IBottomVideoY, m_IBottomVideoH, m_IRightVideoX, m_IRightVideoTextX, m_IRightVideoW, m_ILeftVideoW;

var config array<string>		CreditsName;

function Created()
{
    m_ListOfCredits = R6MenuCredits(CreateWindow(class'R6MenuCredits', m_RVideo.X, m_RVideo.Y, m_RVideo.W, m_RVideo.H, self));

	m_ButtonMainMenu = R6WindowButton(CreateControl( class'R6WindowButton', 10, 425, 250, 25, self));
    m_ButtonMainMenu.ToolTipString      = Localize("Tip","ButtonMainMenu","R6Menu");
	m_ButtonMainMenu.Text               = Localize("SinglePlayer","ButtonMainMenu","R6Menu");	
	m_ButtonMainMenu.Align              = TA_LEFT;
	m_ButtonMainMenu.m_buttonFont       = Root.Fonts[F_MainButton];
	m_ButtonMainMenu.ResizeToText();
    
    m_LMenuTitle = R6WindowTextLabel(CreateWindow(class'R6WindowTextLabel', 0, 18, WinWidth - 8, 25, self));
	m_LMenuTitle.Text = Localize("Credits","Title","R6Menu");
	m_LMenuTitle.Align               = TA_Right;
	m_LMenuTitle.m_Font              = Root.Fonts[F_MenuMainTitle];
	m_LMenuTitle.m_BGTexture         = None;
    m_LMenuTitle.m_bDrawBorders      = False;

    
    m_IBottomVideoY = m_RVideo.Y + m_RVideo.H;
    m_IBottomVideoH = 512 - m_IBottomVideoY;  
	
	// MPF - Eric
	LoadConfig(class'Actor'.static.GetModMgr().GetCreditsFile());
}

function Paint( Canvas C, FLOAT X, FLOAT Y)
{
	local R6WindowRootWindow R6WRoot;

	R6WRoot = R6WindowRootWindow(Root);

    //Top of video    
    DrawStretchedTextureSegment(C, 0,0,512,m_RVideo.Y,0,0,512,m_RVideo.Y,    R6WRoot.m_BGTexture[0]);
    DrawStretchedTextureSegment(C, 512,0,512,m_RVideo.Y,0,0,512,m_RVideo.Y,  R6WRoot.m_BGTexture[1]);
    
    //Sides of video 
    DrawStretchedTextureSegment(C, 0,m_RVideo.Y,m_ILeftVideoW,m_RVideo.H,0,m_RVideo.Y,m_ILeftVideoW,m_RVideo.H,    R6WRoot.m_BGTexture[0]);
    DrawStretchedTextureSegment(C, m_IRightVideoX,m_RVideo.Y,m_IRightVideoW,m_RVideo.H,m_IRightVideoTextX,m_RVideo.Y,m_IRightVideoW,m_RVideo.H,  R6WRoot.m_BGTexture[1]);


    //Bottom of Video
    DrawStretchedTextureSegment(C, 0,m_IBottomVideoY,512,m_IBottomVideoH,   0,m_IBottomVideoY,512,m_IBottomVideoH,    R6WRoot.m_BGTexture[0]);
    DrawStretchedTextureSegment(C, 512,m_IBottomVideoY,512,m_IBottomVideoH, 0,m_IBottomVideoY,512,m_IBottomVideoH,  R6WRoot.m_BGTexture[1]);
}

function ShowWindow()
{
    local float X, Y;
    
	GetLevel().m_bAllow3DRendering = false;

	// randomly update the background texture
    Root.SetLoadRandomBackgroundImage("Credits");

    Super.ShowWindow();

	if (m_ListOfCredits.Items.Next == None)
	{
		// read the file and fill all the credits array
		FillListOfCredits();
	}

	// reset credits scroll parameters
	m_ListOfCredits.ResetCredits();
}

function HideWindow()
{
	GetLevel().m_bAllow3DRendering = true;

	Super.HideWindow();
}

function FillListOfCredits()
{
	local R6WindowListBoxCreditsItem pItem;
	local string szTemp;
	local int i;

	for ( i =0; i < CreditsName.Length; i++)
	{
		pItem = R6WindowListBoxCreditsItem( m_ListOfCredits.Items.Append( class'R6WindowListBoxCreditsItem'));

		if (pItem != None)
		{
			pItem.Init( CreditsName[i]);
		}
	}
}

function Notify(UWindowDialogControl C, byte E)
{ 
    if( E == DE_Click )
    {
		if (C == m_ButtonMainMenu)
		{
            Root.ChangeCurrentWidget(MainMenuWidgetID);
        }
    }    
}

//=========================================================================================
// TO REMOVE FOR THE END OF THE PROJECT
//=========================================================================================
function WindowEvent(WinMessage Msg, Canvas C, float X, float Y, int Key) 
{
    switch( Msg )
    {
		case WM_KeyDown:
			if (Key == Root.Console.EInputKey.IK_GreyMinus)
			{
				if (m_ListOfCredits.m_fScrollSpeed > 0)
					m_ListOfCredits.m_fScrollSpeed = Max( 0, m_ListOfCredits.m_fScrollSpeed - 0.5);

#ifdefDEBUG
				log("Scroll speed: "$m_ListOfCredits.m_fScrollSpeed);
#endif
			}
			else if (Key == Root.Console.EInputKey.IK_GreyPlus)
			{
				m_ListOfCredits.m_fScrollSpeed += 0.5;
#ifdefDEBUG
				log("Scroll speed: "$m_ListOfCredits.m_fScrollSpeed);
#endif
			}
			else if (Key == Root.Console.EInputKey.IK_GreyStar)
			{
				m_ListOfCredits.m_bStopScroll = !m_ListOfCredits.m_bStopScroll;
			}
			break;
	}

	Super.WindowEvent( Msg, C, X, Y, Key);
}

defaultproperties
{
     m_IRightVideoX=570
     m_IRightVideoTextX=58
     m_IRightVideoW=454
     m_ILeftVideoW=70
     CreditsName(0)="[370]"
     CreditsName(1)="[T0]Tom Clancy's Rainbow Six 3"
     CreditsName(2)="[T0]Raven Shield"
     CreditsName(3)="[80]"
     CreditsName(4)="[T0]Creative Team"
     CreditsName(5)="[30]"
     CreditsName(6)="[T1]Producer"
     CreditsName(7)="[T2]Chadi Lebbos  [LeViaT]"
     CreditsName(8)="[20]"
     CreditsName(9)="[T1]Associate Producer"
     CreditsName(10)="[T2]Patrick Naud  [Dr.No]"
     CreditsName(11)="[20]"
     CreditsName(12)="[T1]Senior Producer"
     CreditsName(13)="[T2]Mathieu Ferland  [Tim]"
     CreditsName(14)="[20]"
     CreditsName(15)="[T1]Lead Game Designer / Manual Writer"
     CreditsName(16)="[T2]Michael McCoy  [Yuri]"
     CreditsName(17)="[20]"
     CreditsName(18)="[T1]Game Designers"
     CreditsName(19)="[T2]Daniel B�rub�  [Berlu]"
     CreditsName(20)="[T2]Maxime B�land  [M4X1M3]"
     CreditsName(21)="[20]"
     CreditsName(22)="[T1]Lead Programmer"
     CreditsName(23)="[T2]Eric B�gin  [Arsenic]"
     CreditsName(24)="[20]"
     CreditsName(25)="[T1]Programmers"
     CreditsName(26)="[T2]Alexandre Dionne  [Azimut]"
     CreditsName(27)="[T2]Aristomenis Kolokathis  [Rooster]"
     CreditsName(28)="[T2]Guillaume Borgia  [Gwigre]"
     CreditsName(29)="[T2]Jean-Fran�ois Dub�  [Deks]"
     CreditsName(30)="[T2]Joel Tremblay  [Alkoliq]"
     CreditsName(31)="[T2]John Bennett"
     CreditsName(32)="[T2]Patrick Garon  [Pago]"
     CreditsName(33)="[T2]Rima Brek  [Magnet]"
     CreditsName(34)="[T2]Serge Dor�  [Magic]"
     CreditsName(35)="[T2]Yannick Joly  [Thor]"
     CreditsName(36)="[20]"
     CreditsName(37)="[T1]Collaborating Programmers"
     CreditsName(38)="[T2]Chaouky Garam  [Iron]"
     CreditsName(39)="[T2]Hugo Allaire"
     CreditsName(40)="[T2]Julien Bouvrais  [Coyote]"
     CreditsName(41)="[20]"
     CreditsName(42)="[T1]Intern Programmers"
     CreditsName(43)="[T2]Cyrille Lauzon"
     CreditsName(44)="[T2]Lysanne Martin"
     CreditsName(45)="[T2]S�bastien Lussier"
     CreditsName(46)="[20]"
     CreditsName(47)="[T1]Lead Artist / Art Director"
     CreditsName(48)="[T2]Carol Bertrand  [-=Insane=-v0.7]"
     CreditsName(49)="[20]"
     CreditsName(50)="[T1]Artists"
     CreditsName(51)="[T2]Adrian Cheung  [7]"
     CreditsName(52)="[T2]Annie Richer"
     CreditsName(53)="[T2]Audran Guerard  [Trigga]"
     CreditsName(54)="[T2]Catherine Nolin"
     CreditsName(55)="[T2]Christian Sirois  [Shnookums]"
     CreditsName(56)="[T2]Danny Deslongchamps  [Dr.Terreur]"
     CreditsName(57)="[T2]Dany Marcoux  [DShadow]"
     CreditsName(58)="[T2]David Blazetich  [Cowboy]"
     CreditsName(59)="[T2]David Massicotte  [ArGh]"
     CreditsName(60)="[T2]Guillaume Blais  [Gizmo]"
     CreditsName(61)="[T2]Gwenael Heliou  [Biohazard]"
     CreditsName(62)="[T2]Hugo Desmeules  [Pointblank]"
     CreditsName(63)="[T2]Jean-Philippe Rajotte  [PAPAPIMP]"
     CreditsName(64)="[T2]John Bigorgne  [VipeRockInDaHouse]"
     CreditsName(65)="[T2]Karine Fortin"
     CreditsName(66)="[T2]Natasha Bouchard"
     CreditsName(67)="[T2]Patrick Daigle  [Kata]"
     CreditsName(68)="[T2]Sebastien Laporte  [GrosseBiere]"
     CreditsName(69)="[T2]Simon Marinof"
     CreditsName(70)="[T2]Wafaa BenHammou  [Xena]"
     CreditsName(71)="[20]"
     CreditsName(72)="[T1]Character Artist / Character Concept Artist"
     CreditsName(73)="[T2]Arman Akopian  [Guyjin]"
     CreditsName(74)="[20]"
     CreditsName(75)="[T1]Lead Animator"
     CreditsName(76)="[T2]Josef Sy  [Cujo]"
     CreditsName(77)="[20]"
     CreditsName(78)="[T1]Animators"
     CreditsName(79)="[T2]Alexandre Vinet  [Piral]"
     CreditsName(80)="[T2]Joseph Nasrallah [Max]"
     CreditsName(81)="[T2]Mathieu Huet  [Dogmeat]"
     CreditsName(82)="[T2]Thomas J Anderson  [Origamiboy_X]"
     CreditsName(83)="[20]"
     CreditsName(84)="[T1]Collaborating Animators"
     CreditsName(85)="[T2]Allan Treitz"
     CreditsName(86)="[T2]Patrick Pelletier"
     CreditsName(87)="[T2]Pierre-Sebastien Pouliot"
     CreditsName(88)="[T2]Sonia Pronovost"
     CreditsName(89)="[T2]Stephen Greenberg"
     CreditsName(90)="[T2]Veronique Lacombe"
     CreditsName(91)="[20]"
     CreditsName(92)="[T1]Lead Level Designer"
     CreditsName(93)="[T2]Carl Lavoie  [SAddam]"
     CreditsName(94)="[20]"
     CreditsName(95)="[T1]Level Designers"
     CreditsName(96)="[T2]Benoit Richer  [Amon]"
     CreditsName(97)="[T2]Eric Poulin  [6-PacK]"
     CreditsName(98)="[T2]Fran�ois Laperri�re"
     CreditsName(99)="[T2]Jason Arsenault  [F.Kastle]"
     CreditsName(100)="[T2]Jonathan Dumont  [Espinosa]"
     CreditsName(101)="[T2]Martin Dufour  [Thrashing dOnut]"
     CreditsName(102)="[T2]Philippe Lussier  [Cortez]"
     CreditsName(103)="[T2]R�mi Lacoste  [Krimpof]"
     CreditsName(104)="[T2]Yann Sylvestre  [Djedelyn]"
     CreditsName(105)="[20]"
     CreditsName(106)="[T1]Audio Designer"
     CreditsName(107)="[T2]Nicholas Duveau"
     CreditsName(108)="[20]"
     CreditsName(109)="[T1]QA Lead Testers"
     CreditsName(110)="[T2]Emmanuel-Yvan Ofo�  [Azazel1st]"
     CreditsName(111)="[T2]Fran�ois McCann  [Hellstrike]"
     CreditsName(112)="[T2]Marc Brouillette  [ZeGoBlynz]"
     CreditsName(113)="[20]"
     CreditsName(114)="[T1]QA Testers"
     CreditsName(115)="[T2]Alexandre Martel  [ZoltX]"
     CreditsName(116)="[T2]Allen Tremblay  [Requin]"
     CreditsName(117)="[T2]Antoine Thisdale  [Sykon]"
     CreditsName(118)="[T2]Charles Drolet-Demers  [Chuck]"
     CreditsName(119)="[T2]Christian Fortier [Hardcore]"
     CreditsName(120)="[T2]Christian Norton  [D-Chris]"
     CreditsName(121)="[T2]Daniel Sarrazin  [Dakiel]"
     CreditsName(122)="[T2]Dominic Colabelli [Gospic]"
     CreditsName(123)="[T2]Eric Laperri�re  [Cpt Rico]"
     CreditsName(124)="[T2]Eric St-Jean  [Elvis]"
     CreditsName(125)="[T2]Fr�d�ric Dufort  [Y@Z KaMiKaZe]"
     CreditsName(126)="[T2]Fr�d�ric Laporte  [Afrocon]"
     CreditsName(127)="[T2]Hanz Tabora  [Ghostrider]"
     CreditsName(128)="[T2]Jean-Fran�ois Dupuis  [Jee]"
     CreditsName(129)="[T2]Jimi Langlois  [GeXeNiZeR]"
     CreditsName(130)="[T2]Luc Plante  [Zartan]"
     CreditsName(131)="[T2]Marc-Andr� Dessureault  [Mad Martigan]"
     CreditsName(132)="[T2]Marc-Andr� Fillion  [Badou]"
     CreditsName(133)="[T2]Martin Langlois  [UstuR]"
     CreditsName(134)="[T2]Martin Tavernier  [Fox]"
     CreditsName(135)="[T2]Mathieu Fortin  [Myth]"
     CreditsName(136)="[T2]Mathieu Lachance  [Mad Dog]"
     CreditsName(137)="[T2]Nicholas Routhier  [Nyk]"
     CreditsName(138)="[T2]Patrick Sauvageau  [Patafro]"
     CreditsName(139)="[T2]Philippe Dion  [Eltaris]"
     CreditsName(140)="[T2]Raymond Brunette  [D-Bill]"
     CreditsName(141)="[T2]Robin Lee Gordon  [Bootyridah]"
     CreditsName(142)="[T2]Sebastien Martel  [Seabass]"
     CreditsName(143)="[T2]St�phane Pinard  [Neutrinoide Fractolytt]"
     CreditsName(144)="[T2]Sylvain Bordeleau  [Krasher]"
     CreditsName(145)="[T2]Yan Charron  [Slate]"
     CreditsName(146)="[T2]Yannick Francoeur  [Ya]"
     CreditsName(147)="[20]"
     CreditsName(148)="[T1]QA Config Testers"
     CreditsName(149)="[T2]David L�vesque  [SgtGhost]"
     CreditsName(150)="[T2]Jason Alleyne  [Fructose]"
     CreditsName(151)="[20]"
     CreditsName(152)="[T1]Data Manager"
     CreditsName(153)="[T2]Bruno Bellavance  [Bat-duck]"
     CreditsName(154)="[T2]Francis Tremblay  [chapter_9]"
     CreditsName(155)="[20]"
     CreditsName(156)="[T1]Lead Integrator / Localization"
     CreditsName(157)="[T2]Alexandre St-Louis  [Tiegman]"
     CreditsName(158)="[20]"
     CreditsName(159)="[T1]Localization Project Manager"
     CreditsName(160)="[T2]Jean-S�bastien Ferey  [LePiaf]"
     CreditsName(161)="[20]"
     CreditsName(162)="[T1]Technical Advisor"
     CreditsName(163)="[T2]Mike Grasso"
     CreditsName(164)="[20]"
     CreditsName(165)="[T1]Planning Coordinator"
     CreditsName(166)="[T2]Audrey Goyette  [Drexx]"
     CreditsName(167)="[20]"
     CreditsName(168)="[T1]Marketing Research Coordinator"
     CreditsName(169)="[T2]Jean-Fran�ois Poirier  [Boomer]"
     CreditsName(170)="[20]"
     CreditsName(171)="[T1]Storyboard"
     CreditsName(172)="[T2]Wayne Murray  [Wam!]"
     CreditsName(173)="[20]"
     CreditsName(174)="[T1]Making Of Director / Editing"
     CreditsName(175)="[T2]Miguel Angel Martin"
     CreditsName(176)="[20]"
     CreditsName(177)="[T1]Making Of Assistant"
     CreditsName(178)="[T2]Annemarie Gabrielle"
     CreditsName(179)="[80]"
     CreditsName(180)="[T0]UBI SOFT MONTREAL"
     CreditsName(181)="[30]"
     CreditsName(182)="[T1]CEO Ubi Soft Montreal"
     CreditsName(183)="[T2]Martin Tremblay"
     CreditsName(184)="[20]"
     CreditsName(185)="[T1]VP Studios"
     CreditsName(186)="[T2]Michel Cartier"
     CreditsName(187)="[20]"
     CreditsName(188)="[T1]VP Content"
     CreditsName(189)="[T2]Gregoire Gobbi "
     CreditsName(190)="[20]"
     CreditsName(191)="[T1]Director of Animation Studio"
     CreditsName(192)="[T2]Gilles Monteil"
     CreditsName(193)="[20]"
     CreditsName(194)="[T1]Director of Game Design / Level Design Studio"
     CreditsName(195)="[T2]Maxime B�langer  [Sexy Chocolate]"
     CreditsName(196)="[20]"
     CreditsName(197)="[T1]Director of Graphic Studio"
     CreditsName(198)="[T2]Jean-S�bastien Morin  [Postal]"
     CreditsName(199)="[20]"
     CreditsName(200)="[T1]Director of Programming Studio"
     CreditsName(201)="[T2]Nicolas Rioux"
     CreditsName(202)="[20]"
     CreditsName(203)="[T1]Director of Sound Studio"
     CreditsName(204)="[T2]J�r�mi Valiquette"
     CreditsName(205)="[20]"
     CreditsName(206)="[T1]Director of Quality Assurance"
     CreditsName(207)="[T2]Eric Tremblay"
     CreditsName(208)="[20]"
     CreditsName(209)="[T1]Director of Planning"
     CreditsName(210)="[T2]Henri Laporte"
     CreditsName(211)="[20]"
     CreditsName(212)="[T1]Marketing Research Group Manager"
     CreditsName(213)="[T2]Caroline Martin  [GUERIA]"
     CreditsName(214)="[20]"
     CreditsName(215)="[T1]Legal Affairs"
     CreditsName(216)="[T2]Julie Lachance"
     CreditsName(217)="[20]"
     CreditsName(218)="[T1]Sound Engineer"
     CreditsName(219)="[T2]Simon Pressey"
     CreditsName(220)="[20]"
     CreditsName(221)="[T1]Sound Integrator"
     CreditsName(222)="[T2]Sylvain C�t�  [skalve]"
     CreditsName(223)="[20]"
     CreditsName(224)="[T1]Sound Engineer"
     CreditsName(225)="[T2]Olivier Germain"
     CreditsName(226)="[20]"
     CreditsName(227)="[T1]Foley Artist"
     CreditsName(228)="[T2]Tchae Maesroch"
     CreditsName(229)="[20]"
     CreditsName(230)="[T1]Sound Engine Team (DARE)"
     CreditsName(231)="[T2]Alexandre Carlotti "
     CreditsName(232)="[T2]Jean-Fran�ois Guay  [Djef]"
     CreditsName(233)="[T2]Richard Malo"
     CreditsName(234)="[T2]Christian Lachance [Kaizer_Soze]"
     CreditsName(235)="[T2]St�phane Ronse"
     CreditsName(236)="[50]"
     CreditsName(237)="[T1]Music by Soundelux Design Music Goup"
     CreditsName(238)="[20]"
     CreditsName(239)="[T1]Music Composed by"
     CreditsName(240)="[T2]Bill Brown, Soundelux Design Music Goup"
     CreditsName(241)="[50]"
     CreditsName(242)="[T1]Ave Maria performed by"
     CreditsName(243)="[T2]No�lla Huet"
     CreditsName(244)="[20]"
     CreditsName(245)="[T1]Piano"
     CreditsName(246)="[T2]Jacques Drouin"
     CreditsName(247)="[50]"
     CreditsName(248)="[T1]Weapon Sound Design and Effects By"
     CreditsName(249)="[T1]DaneTracks inc."
     CreditsName(250)="[20]"
     CreditsName(251)="[T1]Supervising Sound Designer"
     CreditsName(252)="[T2]Richard Adrian, DaneTracks inc."
     CreditsName(253)="[20]"
     CreditsName(254)="[T1]Sound Designers"
     CreditsName(255)="[T2]Andrew Lackey"
     CreditsName(256)="[T2]Christopher Alba"
     CreditsName(257)="[T2]Eddie Kim"
     CreditsName(258)="[50]"
     CreditsName(259)="[T1]Ambiences & SFX Editor"
     CreditsName(260)="[T2]Andr� Chaput"
     CreditsName(261)="[20]"
     CreditsName(262)="[T1]Audio Post-Production"
     CreditsName(263)="[T2]Daran Nadra"
     CreditsName(264)="[T2]Nicholas Grimwood"
     CreditsName(265)="[20]"
     CreditsName(266)="[T1]Internal Technical Support"
     CreditsName(267)="[T2]Patrick Filion  [YtseJammer]"
     CreditsName(268)="[T2]Nicolas Davidts  [NickMaster]"
     CreditsName(269)="[T2]Steve Castonguay  [Acathla]"
     CreditsName(270)="[T2]Yanick Vezina  [GooSe]"
     CreditsName(271)="[80]"
     CreditsName(272)="[T0]RED STORM ENTERTAINMENT"
     CreditsName(273)="[30]"
     CreditsName(274)="[T1]Script Writer"
     CreditsName(275)="[T2]Richard Dansky"
     CreditsName(276)="[20]"
     CreditsName(277)="[T1]Producer (Game Cinematics)"
     CreditsName(278)="[T2]Heather Maxwell"
     CreditsName(279)="[20]"
     CreditsName(280)="[T1]Lead Artist (Intro & Outro)"
     CreditsName(281)="[T2]Demond Rogers"
     CreditsName(282)="[20]"
     CreditsName(283)="[T1]Animators / Modelers (Intro & Outro)"
     CreditsName(284)="[T2]Jeremy Brown"
     CreditsName(285)="[T2]Thomas DeVries"
     CreditsName(286)="[T2]Joseph Drust"
     CreditsName(287)="[T2]Jeff McFayden"
     CreditsName(288)="[T2]Pete Sekula"
     CreditsName(289)="[T2]Steve Wasaff"
     CreditsName(290)="[20]"
     CreditsName(291)="[T1]Artists (Cut Scenes)"
     CreditsName(292)="[T2]Kristian Hawkinson"
     CreditsName(293)="[T2]Dion Rogers"
     CreditsName(294)="[T2]Mikey Spano"
     CreditsName(295)="[T2]Michael Cosner"
     CreditsName(296)="[T2]Ray Tylak"
     CreditsName(297)="[20]"
     CreditsName(298)="[T1]Collaborations (Cut Scenes)"
     CreditsName(299)="[T2]Tim Alexander"
     CreditsName(300)="[T2]Yongha Hwang"
     CreditsName(301)="[T2]Kim McLean"
     CreditsName(302)="[T2]Suzanne Meiler"
     CreditsName(303)="[T2]John Michel"
     CreditsName(304)="[T2]Lucas Smith"
     CreditsName(305)="[T2]Eric Terry"
     CreditsName(306)="[20]"
     CreditsName(307)="[T2]Special Thanks to Red Storm Entertainment"
     CreditsName(308)="[T2]All the staff who participated in creating this wonderful series,"
     CreditsName(309)="[T2]for those who helped us in achieving this new title"
     CreditsName(310)="[T2]and to the RSE Testing Department for play-testing the game!"
     CreditsName(311)="[80]"
     CreditsName(312)="[T0]UBI SOFT INTERNATIONAL"
     CreditsName(313)="[30]"
     CreditsName(314)="[T1]President & CEO Ubi Soft"
     CreditsName(315)="[T2]Yves Guillemot"
     CreditsName(316)="[20]"
     CreditsName(317)="[T1]International Production Director"
     CreditsName(318)="[T2]Christine Burgess-Quemard"
     CreditsName(319)="[20]"
     CreditsName(320)="[T1]Editor-in-Chief"
     CreditsName(321)="[T2]Serge Hascoet"
     CreditsName(322)="[20]"
     CreditsName(323)="[T1]Editorial Content Manager"
     CreditsName(324)="[T2]Travis Getz"
     CreditsName(325)="[20]"
     CreditsName(326)="[T1]Editorial Coordination"
     CreditsName(327)="[T2]Didier Lord"
     CreditsName(328)="[T2]Lionel Raynaud"
     CreditsName(329)="[T2]Michel Pierfitte"
     CreditsName(330)="[T2]Sophie Pendari�s"
     CreditsName(331)="[20]"
     CreditsName(332)="[T1]Story Editor"
     CreditsName(333)="[T2]Alexis Nolent"
     CreditsName(334)="[50]"
     CreditsName(335)="[T0]Marketing Canada"
     CreditsName(336)="[20]"
     CreditsName(337)="[T1]Brand Manager"
     CreditsName(338)="[T2]Steve Gagn�"
     CreditsName(339)="[20]"
     CreditsName(340)="[T1]Trade Marketing Coordinator"
     CreditsName(341)="[T2]Danielle Lajoie"
     CreditsName(342)="[50]"
     CreditsName(343)="[T0]Marketing EMEA"
     CreditsName(344)="[20]"
     CreditsName(345)="[T1]EMEA Marketing Director"
     CreditsName(346)="[T2]Laurence Buisson-Nollent"
     CreditsName(347)="[20]"
     CreditsName(348)="[T1]EMEA Senior Marketing Group Manager"
     CreditsName(349)="[T2]Laura Hatton"
     CreditsName(350)="[20]"
     CreditsName(351)="[T1]EMEA Senior Brand Manager"
     CreditsName(352)="[T2]Cedrick Delmas"
     CreditsName(353)="[20]"
     CreditsName(354)="[T1]EMEA Brand Manager"
     CreditsName(355)="[T2]Alexis Bodard"
     CreditsName(356)="[20]"
     CreditsName(357)="[T1]Local Brand Managers"
     CreditsName(358)="[T2]Christian Born"
     CreditsName(359)="[T2]Evelyn de Vooght"
     CreditsName(360)="[T2]Javier Montoro"
     CreditsName(361)="[T2]Jim Hill"
     CreditsName(362)="[T2]Marcel Keij"
     CreditsName(363)="[T2]Michael Thielmann"
     CreditsName(364)="[T2]Soren Lass"
     CreditsName(365)="[T2]Stephane Catherine"
     CreditsName(366)="[T2]Valeria lodeserto"
     CreditsName(367)="[T2]Vanessa Leclercq"
     CreditsName(368)="[T2]Vera Shah"
     CreditsName(369)="[20]"
     CreditsName(370)="[T1]Manufacturing Department"
     CreditsName(371)="[T2]Alexandre Bolchert"
     CreditsName(372)="[T2]Laurent Lugbull"
     CreditsName(373)="[T2]Pierre Escaich"
     CreditsName(374)="[50]"
     CreditsName(375)="[T0]Marketing US"
     CreditsName(376)="[20]"
     CreditsName(377)="[T1]U.S. Vice-President of Marketing"
     CreditsName(378)="[T2]Tony Kee"
     CreditsName(379)="[20]"
     CreditsName(380)="[T1]U.S. Group Brand Manager"
     CreditsName(381)="[T2]Helene Juguet"
     CreditsName(382)="[20]"
     CreditsName(383)="[T1]U.S. Brand Managers"
     CreditsName(384)="[T2]Derek Chan"
     CreditsName(385)="[T2]Michael Jeffress"
     CreditsName(386)="[T2]Sean McCann"
     CreditsName(387)="[20]"
     CreditsName(388)="[T1]Public Relations"
     CreditsName(389)="[T2]Cassie Vogel"
     CreditsName(390)="[T2]Tiffany Spencer"
     CreditsName(391)="[T2]Tyrone Miller"
     CreditsName(392)="[20]"
     CreditsName(393)="[T1]Creative Services"
     CreditsName(394)="[T2]Allen Adler"
     CreditsName(395)="[T2]David Gene Oh"
     CreditsName(396)="[T2]Marc Fortier"
     CreditsName(397)="[T2]Melissa Wilks"
     CreditsName(398)="[80]"
     CreditsName(399)="[T0]UBI.COM"
     CreditsName(400)="[30]"
     CreditsName(401)="[T1]Canada"
     CreditsName(402)="[10]"
     CreditsName(403)="[T2]Alexis Rendon  [Neveish]"
     CreditsName(404)="[T2]Dominic Laroche"
     CreditsName(405)="[T2]Franc Hauselmann  [Terminator]"
     CreditsName(406)="[T2]Guillaume Plante  [shellghost]"
     CreditsName(407)="[T2]Karine Martel  [Karamba!]"
     CreditsName(408)="[T2]Luc Bouchard [walrus]"
     CreditsName(409)="[T2]Pierre-Luc Rigaux"
     CreditsName(410)="[T2]Philippe Lalande  [TheQ]"
     CreditsName(411)="[T2]Scott Schmeisser"
     CreditsName(412)="[20]"
     CreditsName(413)="[T1]Europe"
     CreditsName(414)="[10]"
     CreditsName(415)="[T2]Diane Peyredieu"
     CreditsName(416)="[T2]Marc Homayounpour"
     CreditsName(417)="[T2]Sebastien Puel"
     CreditsName(418)="[T2]Tanguy Imbert"
     CreditsName(419)="[20]"
     CreditsName(420)="[T1]US"
     CreditsName(421)="[10]"
     CreditsName(422)="[T2]David Macachor"
     CreditsName(423)="[T2]Joe Toledo"
     CreditsName(424)="[T2]John Billington"
     CreditsName(425)="[T2]Kurtis Buckmaster"
     CreditsName(426)="[T2]Sam Copur"
     CreditsName(427)="[80]"
     CreditsName(428)="[T0]TECHNICAL SUPPORT"
     CreditsName(429)="[30]"
     CreditsName(430)="[T1]North American Technical Support Manager"
     CreditsName(431)="[T2]Brent Wilkinson"
     CreditsName(432)="[20]"
     CreditsName(433)="[T1]Lead Technical Support Representative"
     CreditsName(434)="[T2]Trent Giardino"
     CreditsName(435)="[20]"
     CreditsName(436)="[T1]Technical Support Representative"
     CreditsName(437)="[T2]Bryan Marshall"
     CreditsName(438)="[T2]Chris Curtis"
     CreditsName(439)="[T2]Greg Bonifacio"
     CreditsName(440)="[T2]Harden Viers"
     CreditsName(441)="[T2]Jason Jennings"
     CreditsName(442)="[T2]Jean-Francis T�treault"
     CreditsName(443)="[T2]Jesse Haff"
     CreditsName(444)="[T2]Kirk Sanford"
     CreditsName(445)="[T2]Moye Daniel"
     CreditsName(446)="[80]"
     CreditsName(447)="[T0]SPECIAL THANKS"
     CreditsName(448)="[20]"
     CreditsName(449)="[T1]We gratefully acknowledge the assistance of"
     CreditsName(450)="[10]"
     CreditsName(451)="[T2]Andy Markel"
     CreditsName(452)="[T2]Axelle Verny"
     CreditsName(453)="[T2]Benoit Fouillet"
     CreditsName(454)="[T2]Chantal Cloutier"
     CreditsName(455)="[T2]Jenifer Groeling"
     CreditsName(456)="[T2]Katrina Medema"
     CreditsName(457)="[T2]Martin Carrier"
     CreditsName(458)="[T2]Mike Plotts"
     CreditsName(459)="[T2]Rich Kubiszewski"
     CreditsName(460)="[T2]Tom Moser - Navy SEAL consultant"
     CreditsName(461)="[T2]Tony Burke"
     CreditsName(462)="[T2]Vincent Paquet"
     CreditsName(463)="[T2]Xavier Neal"
     CreditsName(464)="[T2]Partnertrans (Germany)"
     CreditsName(465)="[T2]Orange Studio Di Vegetti Gabriele (Italy)"
     CreditsName(466)="[T2]DL Multimedia (Spain)"
     CreditsName(467)="[T2]Xavier Kemmlein (France)"
     CreditsName(468)="[T2]Eric Holweck (France)"
     CreditsName(469)="[T2]Bug Tracker (France)"
     CreditsName(470)="[30]"
     CreditsName(471)="[T2]Music featured in the cinematics"
     CreditsName(472)="[T2]performed by the Montreal Session Orchestra"
     CreditsName(473)="[T2]Conducted by Simon Leclerc"
     CreditsName(474)="[T2]Coordinated by John Stafford"
     CreditsName(475)="[30]"
     CreditsName(476)="[T2]Additional texture artwork by shaderlab.com"
     CreditsName(477)="[T2]Copyright � 2003 Randy 'ydnar' Reddig"
     CreditsName(478)="[30]"
     CreditsName(479)="[T2]Featured paintings courtesy of"
     CreditsName(480)="[T2]Olga's Gallery - Online Art Museum"
     CreditsName(481)="[T2]http://www.abcgallery.com/"
     CreditsName(482)="[30]"
     CreditsName(483)="[T2]Uses Bink Video Technology."
     CreditsName(484)="[T2]Copyright � 1991-2003 RAD Game Tools, Inc"
     CreditsName(485)="[40]"
     CreditsName(486)="[T2]Copyright � 2003 Red Storm Entertainment"
     CreditsName(487)="[T2]All Rights Reserved"
     CreditsName(488)="[20]"
     CreditsName(489)="[T2]The character models used in this game were in no way mistreated"
     CreditsName(490)="[T2]and all scenes in which they appeared were rendered under strict"
     CreditsName(491)="[T2]supervision with the utmost concern for their handling."
     CreditsName(492)="[10]"
     CreditsName(493)="[T2]The characters and incidents portrayed and the names herein are"
     CreditsName(494)="[T2]fictitious, and any similarity to the name, character or history"
     CreditsName(495)="[T2]of any person is entirely coincidental and unintentional."
     CreditsName(496)="[10]"
     CreditsName(497)="[T2]This game is protected pursuant to the provisions of the laws of"
     CreditsName(498)="[T2]the United States of America and other countries. Any"
     CreditsName(499)="[T2]unauthorized duplication and/or distribution of this game may"
     CreditsName(500)="[T2]result in civil liability and criminal prosecution."
     CreditsName(501)="[T2]Rated "M" for Mature."
     CreditsName(502)="[40]"
     CreditsName(503)="[T2]The whole team would like to express their sincere gratitude to"
     CreditsName(504)="[T2]their friends and families for understanting the sacrifice this"
     CreditsName(505)="[T2]project demanded. Undertaking a two and a half year journey cannot"
     CreditsName(506)="[T2]be done without support from loved ones. For being there in the"
     CreditsName(507)="[T2]best and worst times, for accepting our capricious temper after"
     CreditsName(508)="[T2]a 36 hour work day, we thank you all."
     CreditsName(509)="[20]"
     CreditsName(510)="[T2]Last but not least..."
     CreditsName(511)="[T2]Many Thanks to all the fans of the Rainbow Six series."
     CreditsName(512)="[T2]To all the webmasters, members of the community and anyone who"
     CreditsName(513)="[T2]ever played the game we thank you for you support. If you ever"
     CreditsName(514)="[T2]posted a comment about the game, good or bad, you somehow helped"
     CreditsName(515)="[T2]us making it a better, greater and more exciting experience."
     CreditsName(516)="[20]"
     CreditsName(517)="[T2]Created in the studios of Ubi Soft Entertainment"
     CreditsName(518)="[T2]Montr�al, Qu�bec, Canada from November 2000 to February 2003"
     CreditsName(519)="[20]"
     CreditsName(520)="[T2]Visit us at http://www.raven-shield.com"
     CreditsName(521)="[100]"
     CreditsName(522)="[T0]PERSONAL THANKS"
     CreditsName(523)="[30]"
     CreditsName(524)="[T2]NOTE: You may pause by pressing * on the numeric keypad"
     CreditsName(525)="[30]"
     CreditsName(526)="[T2]Jason A. thanks:"
     CreditsName(527)="[T2]Mom & Dad for supporting me and my bad habits at such an early age"
     CreditsName(528)="[T2]...Atari 2600. Michel for taking me to The Black Hole and Shawn to"
     CreditsName(529)="[T2]Star Wars when I was just 5 years old... you traumatized me for life."
     CreditsName(530)="[T2]Wafaa for her loving support in my bad habits...51' HDTV. "
     CreditsName(531)="[T2]Imagination... you never stop amazing me."
     CreditsName(532)="[30]"
     CreditsName(533)="[T2]Frank McCann would like to give a big THANKS to his Single Player"
     CreditsName(534)="[T2]team for their hard work, patience and professionalism. Also, on a"
     CreditsName(535)="[T2]more personal note, he would like to especially thank his beautiful"
     CreditsName(536)="[T2]Julie for standing by his side."
     CreditsName(537)="[30]"
     CreditsName(538)="[T2]Patrick Garon:"
     CreditsName(539)="[T2]... merci � ma famille et aux amis pr�sents et �loign�s (Caro, Lisa,"
     CreditsName(540)="[T2]Marianne, Nico, Phil, Tom). Je vous aime. Salut � Vancouver (Falko P,"
     CreditsName(541)="[T2]Marty R, Ian T, Luke M, Adam B). Et aussi � Dieu (peu importe qui"
     CreditsName(542)="[T2]elle est) et Jimbo (toujours pr�sent en nous) ..."
     CreditsName(543)="[30]"
     CreditsName(544)="[T2]Mike McCoy:"
     CreditsName(545)="[T2]I want to thank my family, Lynn, Olivia, and Clay, who supported me"
     CreditsName(546)="[T2]and sacrificed a lot during this project. Secondly, I want to thank"
     CreditsName(547)="[T2]Daniel and Maxime, who performed above and beyond the call of duty."
     CreditsName(548)="[T2]Finally, I want to thank UbiSoft and Red Storm for giving me this"
     CreditsName(549)="[T2]incredible opportunity. And tomorrow I'm making waffles!"
     CreditsName(550)="[30]"
     CreditsName(551)="[T2]Pat Naud:"
     CreditsName(552)="[T2]I'd like to thank my lovely girlfriend Stephanie for being so"
     CreditsName(553)="[T2]understanding, my parent for supporting me and buying that NES"
     CreditsName(554)="[T2]back in the 80's and Max for those lovely cafeine mints!"
     CreditsName(555)="[30]"
     CreditsName(556)="[T2]Gwigre remercie ses coll�gues de travaille pour l'avoir support�"
     CreditsName(557)="[T2]durant toute la dur�e du projet et s'excuse aupr�s de Merlin, de"
     CreditsName(558)="[T2]Biscuit et surtout de Marie pour s'�tre absent� trop souvent durant"
     CreditsName(559)="[T2]les deux derni�res ann�es."
     CreditsName(560)="[30]"
     CreditsName(561)="[T2]Chadi:"
     CreditsName(562)="[T2]Thanks to my beautiful wife Marie-El�ne, who's love, patience and"
     CreditsName(563)="[T2]support kept me going. Bhibik ktir habibt�!"
     CreditsName(564)="[30]"
     CreditsName(565)="[T2]Ben Richer:"
     CreditsName(566)="[T2]Merci � mes parents qui m'ont donn� la vie (donc la chance de"
     CreditsName(567)="[T2]faire ces maps), et � ma conjointe qui a r�ussi � me supporter"
     CreditsName(568)="[T2]tout ce temps. By the way, I'm the terrorist in the bank intro :)"
     CreditsName(569)="[30]"
     CreditsName(570)="[T2]Aristo:"
     CreditsName(571)="[T2]I would like to thank Penelope, my soon to be wife, for putting"
     CreditsName(572)="[T2]up with my crazy hours on this project. I also have not forgotten"
     CreditsName(573)="[T2]my friends William, Vince, Gina, Irene and Jerry. Kosta, Joanna,"
     CreditsName(574)="[T2]and Artemis your not loosing a sister, you're gaining a brother :)"
     CreditsName(575)="[T2]To Mom, Dad, and Maria, I love you guys."
     CreditsName(576)="[30]"
     CreditsName(577)="[T2]JF Dub�:"
     CreditsName(578)="[T2]Je voudrais remercier ma future femme Emilie pour son support"
     CreditsName(579)="[T2]moral, sa compr�hension et sa patience. Je voudrais aussi"
     CreditsName(580)="[T2]remercier mon chat Spoutnik, qui me reconnait malgr� le fait que"
     CreditsName(581)="[T2]je ne l'ai pas vu depuis plus de 6 mois :). Salut aussi �"
     CreditsName(582)="[T2]Louise, R�my, Julien, Marilou, F�lix, Caro, Martin, Pierre, je"
     CreditsName(583)="[T2]vous aime!"
     CreditsName(584)="[30]"
     CreditsName(585)="[T2]Max:"
     CreditsName(586)="[T2]I would like to thank my parents for supporting us during this"
     CreditsName(587)="[T2]awesome journey. I love you guys. Big hugs to my two Mikes, McCoy"
     CreditsName(588)="[T2]and Grasso, for teaching me so many things, about making games"
     CreditsName(589)="[T2]and even more importantly, about life. Thanks to Chad, for giving"
     CreditsName(590)="[T2]me the opportunity to work on this amazing game. Thumbs up to"
     CreditsName(591)="[T2]thinkgeek.com for dressing me, and for feeding some of us with their"
     CreditsName(592)="[T2]amazing caffeinated products. Rima, thanks for always being there"
     CreditsName(593)="[T2]for me. And pack your bags, we're going to D1sn3yl4nd!"
     CreditsName(594)="[T2]Editor's note: Max is the drunk dude with the green shirt"
     CreditsName(595)="[T2]at the beginning of the outro"
     CreditsName(596)="[30]"
     CreditsName(597)="[T2]Rima:"
     CreditsName(598)="[T2]First of all, thanks to RSE for creating this great license and"
     CreditsName(599)="[T2]to Ubi Soft for giving us the opportunity to develop Raven Shield."
     CreditsName(600)="[T2]Thanks to the whole team for all their dedication and countless"
     CreditsName(601)="[T2]efforts. Thanks to my family for being so understanding, and"
     CreditsName(602)="[T2]hopefully they will still remember what I look like when this is"
     CreditsName(603)="[T2]all over :) And finally, special thanks to Max, for all the"
     CreditsName(604)="[T2]incredible support and patience, you are the best."
     CreditsName(605)="[30]"
     CreditsName(606)="[T2]Simon wishes to thank his dudes, Jennifer, Martin, Melo,"
     CreditsName(607)="[T2]Pat and all the others."
     CreditsName(608)="[30]"
     CreditsName(609)="[T2]Thrashing dOnut:"
     CreditsName(610)="[T2]Je voudrais remercier tous ceux qui m'ont appuy�s pendant le projet:"
     CreditsName(611)="[T2]Christine, Flip, Le�a, mes parents, mes ami(e)s et sans oublier tout"
     CreditsName(612)="[T2]ceux qui ont pas cru en moi. I have to thanks my co-worker for being"
     CreditsName(613)="[T2]insane. Sanity would have ruined this project :)"
     CreditsName(614)="[30]"
     CreditsName(615)="[T2]Daniel "Berlu" Berube:"
     CreditsName(616)="[T2]I would like to thank my beautiful wife Lucie, my family, my friends,"
     CreditsName(617)="[T2]without forgetting Mini-Pouitte and Theodore. I also thank the great"
     CreditsName(618)="[T2]team for all its work, Red Storm and Ubi Soft which gave me the"
     CreditsName(619)="[T2]possibility to work on a challenging game from day one."
     CreditsName(620)="[30]"
     CreditsName(621)="[T2]David Massicotte:"
     CreditsName(622)="[T2]Thanks to K"
     CreditsName(623)="[30]"
     CreditsName(624)="[T2]Arsenic wants first to thanks his familly that he would like to see"
     CreditsName(625)="[T2]more often.  His best friends: Vince, Fred, Dub. His friends from"
     CreditsName(626)="[T2]university that he did put aside: Vigny, Bob, Jo, Marc, Isa, Caro,"
     CreditsName(627)="[T2]...and of course all the fans of the series.  I'm really sorry,"
     CreditsName(628)="[T2]but now, you'll be the one who won't sleep :) Have Fun!"
     CreditsName(629)="[30]"
     CreditsName(630)="[T2]Danny Deslongchamps:"
     CreditsName(631)="[T2]I would like to thank my Family and my Friend for there support,"
     CreditsName(632)="[T2]patience and love throughout this project,"
     CreditsName(633)="[T2]and God for is love and grace."
     CreditsName(634)="[30]"
     CreditsName(635)="[T2]Francis:"
     CreditsName(636)="[T2]People on this project are damn good!  Special thx to Midnight,"
     CreditsName(637)="[T2]M4X1M3, Mike McCoy, Rima and the all the programmers, u rule guys!"
     CreditsName(638)="[T2]Thx to Karine, Fran�ois (francky21), Carl, my parents."
     CreditsName(639)="[T2]I had to go far to live my dreams..."
     CreditsName(640)="[30]"
     CreditsName(641)="[T2]Alex Dionne:"
     CreditsName(642)="[T2]Un gros merci � Genevi�ve pour sa compr�hension et son amour "
     CreditsName(643)="[T2]tout au long de ce projet. Merci au NDG crew pour leur "
     CreditsName(644)="[T2]soutient et leurs encouragements."
     CreditsName(645)="[30]"
     CreditsName(646)="[T2]Yannick aimerait remercier en plus de sa famille, Val�rie"
     CreditsName(647)="[T2]et Jonas pour leur support, leur sourire et leur compr�hension"
     CreditsName(648)="[T2]tout au long du projet!"
     CreditsName(649)="[30]"
     CreditsName(650)="[T2]Christian Sirois is grateful for all the games that make our"
     CreditsName(651)="[T2]lunchtime go by faster. I also want to thank photography,"
     CreditsName(652)="[T2]mini skirts in hot summer days and Evelyne for her wonderful"
     CreditsName(653)="[T2]smile. Without forgetting to thank Arman's humor and the rest"
     CreditsName(654)="[T2]of the team. I hope we have the chance to work together again."
     CreditsName(655)="[T2]To all my family, including you NiNiE, many thanks for your support."
     CreditsName(656)="[30]"
     CreditsName(657)="[T2]Joel "Alkoliq" Tremblay:"
     CreditsName(658)="[T2]It's Over. I can't believe it!"
     CreditsName(659)="[T2]To the Rainbow Six team, you're the best!"
     CreditsName(660)="[T2]To my girlfriend, next time I say "I'll meet you at 6"..."
     CreditsName(661)="[T2]I will actually be there!"
     CreditsName(662)="[T2]To my parents, next time I say "I'll be there for supper"..."
     CreditsName(663)="[T2]I will actually make it."
     CreditsName(664)="[T2]To my judo partners, next time I say "See you wednesday"..."
     CreditsName(665)="[T2]I will be there!"
     CreditsName(666)="[T2]To my cat, next time I say "Did I give her food today?"..."
     CreditsName(667)="[T2]I Will give you food."
     CreditsName(668)="[T2]To my childern, next time I say ..."
     CreditsName(669)="[T2]Wait I don't have any childern yet!"
     CreditsName(670)="[T2]Max, thanks for the caffeinated peppermints,"
     CreditsName(671)="[T2]Helped a lot during those long nights."
     CreditsName(672)="[T2](I kept the Alkoliq name from university, not the habit)"
     m_RVideo=(X=70,Y=55,W=500,H=370)
}