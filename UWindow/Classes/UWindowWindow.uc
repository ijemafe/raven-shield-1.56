//=============================================================================
// UWindowWindow - the parent class for all Window objects
//=============================================================================
class UWindowWindow extends UWindowBase;

#exec TEXTURE IMPORT NAME=BlackTexture FILE=TEXTURES\Black.PCX
#exec TEXTURE IMPORT NAME=WhiteTexture FILE=TEXTURES\White.PCX ALPHA=1

// Dimensions, offset relative to parent.
var float				WinLeft;
var float				WinTop;
var float				WinWidth;
var float				WinHeight;
var float				OrgXOffset;
var float				OrgYOffset;

// Relationships to other windows
var UWindowWindow		ParentWindow;			// Parent window
var UWindowWindow		FirstChildWindow;		// First child window - bottom window first
var UWindowWindow		LastChildWindow;		// Last child window - WinTop window first
var UWindowWindow		NextSiblingWindow;		// sibling window - next window above us
var UWindowWindow		PrevSiblingWindow;		// previous sibling window - next window below us
var UWindowWindow		ActiveWindow;			// The child of ours which is currently active
var UWindowRootWindow	Root;					// The root window
var UWindowWindow		OwnerWindow;			// Some arbitary owner window
var UWindowWindow		ModalWindow;			// Some window we've opened modally.

var string				ToolTipString;			// Allows any window to have a tooltip

var bool				bWindowVisible;
var bool				bNoClip;				// Clipping disabled for this window?
var bool				bMouseDown;				// Pressed down in this window?
var bool				bRMouseDown;			// Pressed down in this window?
var bool				bMMouseDown;			// Pressed down in this window?
var bool				bAlwaysBehind;			// Window doesn't bring to front on click.
var bool				bAcceptsFocus;			// Accepts key messages
var bool				bAlwaysAcceptsFocus;	// Accepts key messages all the time
var bool				bAlwaysOnTop;			// Always on top
var bool				bLeaveOnscreen;			// Window is left onscreen when UWindow isn't active.
var bool				bUWindowActive;			// Is UWindow active?
var bool				bTransient;				// Never the active window. Used for combo dropdowns7
var bool				bAcceptsHotKeys;		// Does this window accept hotkeys?
var bool				bIgnoreLDoubleClick;
var bool				bIgnoreMDoubleClick;
var bool				bIgnoreRDoubleClick;
var bool                m_bNotDisplayBkg;       // Not display the back ground (to avoid heritance of paint(){})
var BOOL				m_bPreCalculatePos;

var float				ClickTime;
var float				MClickTime;
var float				RClickTime;
var float				ClickX;
var float				ClickY;
var float				MClickX;
var float				MClickY;
var float				RClickX;
var float				RClickY;

var UWindowLookAndFeel	LookAndFeel;

var Region	ClippingRegion;

var Region              m_BorderTextureRegion;
var Texture             m_BorderTexture;
var color               m_BorderColor;
var int                 m_BorderStyle; //Will be cast in ErenderStyle

#ifdefDEBUG
var BOOL m_bDisplayCheckKeyFocus;
#endif

struct MouseCursor
{
	var Texture tex;
	var int HotX;
	var int HotY;
	var byte WindowsCursor;
};

var MouseCursor Cursor;

enum WinMessage
{
	WM_LMouseDown,
	WM_LMouseUp,
	WM_MMouseDown,
	WM_MMouseUp,
	WM_RMouseDown,
	WM_RMouseUp,
	WM_MouseWheelDown,
	WM_MouseWheelUp,
	WM_KeyUp,
	WM_KeyDown,
	WM_KeyType,
	WM_Paint	// Window needs painting
};

enum eR6MenuWidgetMessage
{
    MWM_UBI_LOGIN_SUCCESS,  // Login performed successfully
    MWM_UBI_LOGIN_FAIL,     // Login attempted and failed
    MWM_UBI_LOGIN_SKIPPED,  // Login not attempted (already logged in)
    MWM_CDKEYVAL_SKIPPED,   // CD Key validation skipped
    MWM_CDKEYVAL_SUCCESS,   // CD Key validation successfull
    MWM_CDKEYVAL_FAIL,      // CD Key validation failed
    MWM_UBI_JOINIP_SUCCESS, // Join IP procedure successfull
    MWM_UBI_JOINIP_FAIL,    // Join IP procedure failed
    MWM_QUERYSERVER_SUCCESS,// Query server procedure successfull
    MWM_QUERYSERVER_FAIL,   // Query server procedure failed
    MWM_QUERYSERVER_TRYAGAIN
};

// Dialog messages
const DE_Created = 0;
const DE_Change	 = 1;
const DE_Click	 = 2;
const DE_Enter	 = 3;
const DE_Exit	 = 4;
const DE_MClick	 = 5;
const DE_RClick	 = 6;
const DE_EnterPressed = 7;
const DE_MouseMove = 8;
const DE_MouseLeave = 9;
const DE_LMouseDown = 10;
const DE_DoubleClick = 11;
const DE_MouseEnter = 12;
const DE_HelpChanged = 13;
const DE_WheelUpPressed = 14;
const DE_WheelDownPressed = 15;

#ifdefDEBUG
function string GetNotifyMsg( byte E)
{
	switch(E)
	{
		case DE_Created:			return "DE_Created";
		case DE_Change:				return "DE_Change";
		case DE_Click:				return "DE_Click";
		case DE_Enter:				return "DE_Enter";
		case DE_Exit:				return "DE_Exit";
		case DE_MClick:				return "DE_MClick";
		case DE_RClick:				return "DE_RClick";
		case DE_EnterPressed:		return "DE_EnterPressed";
		case DE_MouseMove:			return "DE_MouseMove";
		case DE_MouseLeave:			return "DE_MouseLeave";
		case DE_LMouseDown:			return "DE_LMouseDown";
		case DE_DoubleClick:		return "DE_DoubleClick";
		case DE_MouseEnter:			return "DE_MouseEnter";
		case DE_HelpChanged:		return "DE_HelpChanged";
		case DE_WheelUpPressed:		return "DE_WheelUpPressed";
		case DE_WheelDownPressed:	return "DE_WheelDownPressed";
		default: return "Not define";
	}
}
#endif

// Ideally Key would be a EInputKey but I can't see that class here.
function WindowEvent(WinMessage Msg, Canvas C, float X, float Y, int Key) 
{
	switch(Msg)
	{
	case WM_Paint:
		Paint(C, X, Y);
		PaintClients(C, X, Y);
		break;
	case WM_LMouseDown:
		if(!Root.CheckCaptureMouseDown())
		{
			if(!MessageClients(Msg, C, X, Y, Key)) 
				LMouseDown(X, Y);
		}
		break;	
	case WM_LMouseUp:
		if(!Root.CheckCaptureMouseUp())
		{
			if(!MessageClients(Msg, C, X, Y, Key))
				LMouseUp(X, Y);
		}
		break;	
	case WM_RMouseDown:
		if(!MessageClients(Msg, C, X, Y, Key)) RMouseDown(X, Y);
		break;	
	case WM_RMouseUp:
		if(!MessageClients(Msg, C, X, Y, Key)) RMouseUp(X, Y);
		break;	
	case WM_MMouseDown:
		if(!MessageClients(Msg, C, X, Y, Key)) MMouseDown(X, Y);
		break;	
	case WM_MMouseUp:
		if(!MessageClients(Msg, C, X, Y, Key)) MMouseUp(X, Y);
		break;	
	case WM_MouseWheelDown:
		if(!MessageClients(Msg, C, X, Y, Key)) MouseWheelDown(X, Y);
		break;	
	case WM_MouseWheelUp:
		if(!MessageClients(Msg, C, X, Y, Key)) MouseWheelUp(X, Y);
		break;	
	case WM_KeyDown:
		if(!PropagateKey(Msg, C, X, Y, Key))
			KeyDown(Key, X, Y);
		break;	
	case WM_KeyUp:
		if(!PropagateKey(Msg, C, X, Y, Key))
			KeyUp(Key, X, Y);
		break;	
	case WM_KeyType:
		if(!PropagateKey(Msg, C, X, Y, Key))
			KeyType(Key, X, Y);
		break;	
	default:
		break;
	}
}

function SaveConfigs()
{

	// Implemented in a child class
}

final function PlayerController GetPlayerOwner()
{
	return Root.Console.ViewportOwner.Actor;
}

final function LevelInfo GetLevel()
{
#ifdefDEBUG
    if(Root == None)
        log("GetLevel() Root == None");
    else if(Root.Console == None)
        log("GetLevel() Root.Console == None");
    else if(Root.Console.ViewportOwner == None)
        log("GetLevel() Root.Console.ViewportOwner == None");
    else if(Root.Console.ViewportOwner.Actor == None)
        log("GetLevel() Root.Console.ViewportOwner.Actor == None");
    else if(Root.Console.ViewportOwner.Actor.Level == None)
        log("GetLevel() Root.Console.ViewportOwner.Actor.Level == None");
#endif

	return Root.Console.ViewportOwner.Actor.Level;
}

final function FLOAT GetTime()
{
    return class'Actor'.static.GetTime();
}

final function LevelInfo GetEntryLevel()
{
	return Root.Console.ViewportOwner.Actor.GetEntryLevel();
}

final function UWindowWindow GetButtonsDefinesUnique( class<UWindowWindow> WndClass)
{
	local UWindowWindow Child;

	Child = Root.FindChildWindow(WndClass, True);

	if ( Child == None)
	{
		Child = Root.CreateWindow( WndClass, 0, 0, 0, 0, none, True);
	}

	return Child;
}

function Resized()
{
	// Implemented in a child class
}

function BeforePaint(Canvas C, float X, float Y)
{
	// Implemented in a child class
}

function AfterPaint(Canvas C, float X, float Y)
{
	// Implemented in a child class
}

function Paint(Canvas C, float X, float Y)
{
	// Implemented in a child class
}

function Click(float X, float Y)
{
	// Implemented in a child class
}


function MClick(float X, float Y)
{
	// Implemented in a child class
}

function RClick(float X, float Y)
{
	// Implemented in a child class
}

function DoubleClick(float X, float Y)
{
	// Implemented in a child class
}

function MDoubleClick(float X, float Y)
{
	// Implemented in a child class
}

function RDoubleClick(float X, float Y)
{
	// Implemented in a child class
}

function BeginPlay()
{
	// Implemented in a child class
}

//function BeforeCreate()
//{
	// Implemented in a child class
//}

function Created()
{
	// Implemented in a child class
}

//function AfterCreate()
//{
	// Implemented in a child class
//}


function MouseEnter()
{
	if(ToolTipString != "") ToolTip(ToolTipString);
	// Implemented in a child class

}

function Activated()
{
	// Implemented in a child class
}

function Deactivated()
{
	// Implemented in a child class
}


function MouseLeave()
{
	bMouseDown = False;
	bMMouseDown = False;
	bRMouseDown = False;
	if(ToolTipString != "") ToolTip("");

}

function MouseMove(float X, float Y)
{
}

function KeyUp(int Key, float X, float Y)
{
	// Implemented in child class
}

function KeyDown(int Key, float X, float Y)
{
	// Implemented in child class
}

//return true to break the chaining of input
//a window should return true when it uses the incomming input
function bool HotKeyDown(int Key, float X, float Y)
{
	// Implemented in child class
	return False;
}

function bool HotKeyUp(int Key, float X, float Y)
{
	// Implemented in child class
	return False;
}

function bool MouseUpDown( INT Key, FLOAT X, FLOAT Y)
{
	return False;
}

function KeyType(int Key, float X, float Y)
{
	// Implemented in child class
}

function ProcessMenuKey(int Key, string KeyName)
{
	// Implemented in child class
}

function KeyFocusEnter()
{
	// Implemented in child class
}

function KeyFocusExit()
{
	// Implemented in child class
}


function RMouseDown(float X, float Y) 
{
	ActivateWindow(0, False);
	bRMouseDown = True;
}

function RMouseUp(float X, float Y) 
{
	if(bRMouseDown)
	{
		if(!bIgnoreRDoubleClick && Abs(X-RClickX) <= 1 && Abs(Y-RClickY) <= 1 && GetTime() < RClickTime + 0.400)
		{
			RDoubleClick(X, Y);
			RClickTime = 0;
		}
		else
		{
			RClickTime = GetTime();
			RClickX = X;
			RClickY = Y;
			RClick(X, Y);
		}
	}
	bRMouseDown = False;

}

function MMouseDown(float X, float Y) 
{
	ActivateWindow(0, False);
	/* DEBUG
	HideWindow();
	*/
	bMMouseDown = True;
}

function MMouseUp(float X, float Y) 
{
	if(bMMouseDown)
	{
		if(!bIgnoreMDoubleClick && Abs(X-MClickX) <= 1 && (Y-MClickY)<=1 && GetTime() < MClickTime + 0.400)
		{
			MDoubleClick(X, Y);
			MClickTime = 0;
		}
		else
		{
			MClickTime = GetTime();
			MClickX = X;
			MClickY = Y;
			MClick(X, Y);
		}
	}
	bMMouseDown = False;
}

function MouseWheelDown(FLOAT X, FLOAT Y)
{

}

function MouseWheelUp(FLOAT X, FLOAT Y)
{

}


function LMouseDown(float X, float Y)
{
	ActivateWindow(0, False);
	bMouseDown = True;
}

function LMouseUp(float X, float Y)
{    
    
	if(bMouseDown)
	{      

		if(!bIgnoreLDoubleClick && Abs(X-ClickX) <= 1 && (Y-ClickY) <= 1 && GetTime() < ClickTime + 0.400)
		{
            DoubleClick(X, Y);
			ClickTime = 0;
		}
		else
		{
			ClickTime = GetTime();
			ClickX = X;
			ClickY = Y;
			Click(X, Y);
		}
	}
	bMouseDown = False;
}

function FocusWindow()
{
	if(Root.FocusedWindow != None && Root.FocusedWindow != Self)
	{
		Root.FocusedWindow.FocusOtherWindow(Self);
	}

	Root.FocusedWindow = Self;
}

function FocusOtherWindow(UWindowWindow W)
{
}

function EscClose()
{
	Close();
}

function Close(optional bool bByParent)
{
	local UWindowWindow Prev, Child;

	for(Child = LastChildWindow;Child != None;Child = Prev)
	{
		Prev = Child.PrevSiblingWindow;
		Child.Close(True);
	}
	SaveConfigs();
	if(!bByParent)
		HideWindow();
}

final function SetSize(float W, float H)
{
	if(WinWidth != W || WinHeight != H)
	{
		WinWidth = W;
		WinHeight = H;
		Resized();
	}
}

function Tick(float Delta)
{
}

final function DoTick(float Delta)
{
	local UWindowWindow Child;

	Tick(Delta);

	Child = FirstChildWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;

		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;

		if(bUWindowActive || Child.bLeaveOnscreen)
		{
			Child.DoTick(Delta);
		}

		Child = Child.NextSiblingWindow;
	}
}

final function PaintClients(Canvas C, float X, float Y)
{
	local float   OrgX, OrgY;   
	local float   ClipX, ClipY; 
	local UWindowWindow Child;

	OrgX = C.OrgX;
	OrgY = C.OrgY;
	ClipX = C.ClipX;
	ClipY = C.ClipY;

	Child = FirstChildWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;

		C.SetPos(0,0);
		C.Style = GetPlayerOwner().ERenderStyle.STY_Normal;
		C.SetDrawColor(255,255,255);
		C.SpaceX = 0;
		C.SpaceY = 0;

//        log("Child is :"$Child);
		Child.BeforePaint(C, X - Child.WinLeft, Y - Child.WinTop);

		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;

		if(bUWindowActive || Child.bLeaveOnscreen)
		{

			C.OrgX = C.OrgX + Child.WinLeft*Root.GUIScale;
			C.OrgY = C.OrgY + Child.WinTop*Root.GUIScale;

			if(!Child.bNoClip)
			{
				C.ClipX = FMin(WinWidth - Child.WinLeft, Child.WinWidth)*Root.GUIScale;
				C.ClipY = FMin(WinHeight - Child.WinTop, Child.WinHeight)*Root.GUIScale;
                //R6CODE
                C.HalfClipX = C.ClipX * 0.5;
                C.HalfClipY = C.ClipY * 0.5;
                //EndR6CODE

				// Translate to child's co-ordinate system
				Child.ClippingRegion.X = ClippingRegion.X - Child.WinLeft;
				Child.ClippingRegion.Y = ClippingRegion.Y - Child.WinTop;
				Child.ClippingRegion.W = ClippingRegion.W;
				Child.ClippingRegion.H = ClippingRegion.H;

				if(Child.ClippingRegion.X < 0)
				{
					Child.ClippingRegion.W += Child.ClippingRegion.X;
					Child.ClippingRegion.X = 0;
				}

				if(Child.ClippingRegion.Y < 0)
				{
					Child.ClippingRegion.H += Child.ClippingRegion.Y;
					Child.ClippingRegion.Y = 0;
				}

				if(Child.ClippingRegion.W > Child.WinWidth - Child.ClippingRegion.X)
				{
					Child.ClippingRegion.W = Child.WinWidth - Child.ClippingRegion.X;
				}

				if(Child.ClippingRegion.H > Child.WinHeight - Child.ClippingRegion.Y)
				{
					Child.ClippingRegion.H = Child.WinHeight - Child.ClippingRegion.Y;
				}
			}

			if(Child.ClippingRegion.W > 0 && Child.ClippingRegion.H > 0) 
			{		
				if (!Child.m_bPreCalculatePos)
				{
					Child.WindowEvent(WM_Paint, C, X - Child.WinLeft, Y - Child.WinTop, 0);
					Child.AfterPaint(C, X - Child.WinLeft, Y - Child.WinTop);
				}

				Child.m_bPreCalculatePos = false;
			}
	
			C.OrgX = OrgX;
			C.OrgY = OrgY;
		}

		Child = Child.NextSiblingWindow;
	}

	C.ClipX = ClipX;
	C.ClipY = ClipY;
    //R6CODE
    C.HalfClipX = C.ClipX * 0.5;
    C.HalfClipY = C.ClipY * 0.5;
    //EndR6CODE
}

final function UWindowWindow FindWindowUnder(float X, float Y)
{
	local UWindowWindow Child;

	// go from Topmost downwards
	Child = LastChildWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;

		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;

		if(bUWindowActive || Child.bLeaveOnscreen)
		{
			if((X >= Child.WinLeft) && (X <= Child.WinLeft+Child.WinWidth) &&
			   (Y >= Child.WinTop) && (Y <= Child.WinTop+Child.WinHeight) &&
			   (!Child.CheckMousePassThrough(X-Child.WinLeft, Y-Child.WinTop)))
			{
				return Child.FindWindowUnder(X - Child.WinLeft, Y - Child.WinTop);
			}
		}
	
		Child = Child.PrevSiblingWindow;
	}

	// Doesn't correspond to any children - it's us.
	return Self;
}

//===============================================================================
// ApplyResolutionOnWindowsPos: Change windows position base on current root resolution
//===============================================================================
function ApplyResolutionOnWindowsPos(FLOAT X, FLOAT Y)
{
	local UWindowWindow Child;
	local FLOAT fX, fY;

	// go from Topmost downwards
	Child = LastChildWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;

		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;

//		log("Child:"@Child@bUWindowActive);

		if (Root.m_bScaleWindowToRoot)
			return;

		if(bUWindowActive || Child.bLeaveOnscreen)
		{
			fX = (Root.WinWidth - 640) * 0.5;
			fY = (Root.WinHeight - 480) * 0.5;

			if (Child.OrgXOffset != fX)
			{
				Child.WinLeft -= Child.OrgXOffset;
				Child.OrgXOffset = fX;
				Child.WinLeft += Child.OrgXOffset;
			}

			if (Child.OrgYOffset != fY)
			{
				Child.WinTop -= Child.OrgYOffset;
				Child.OrgYOffset = fY;
				Child.WinTop += Child.OrgYOffset;
			}
		}

		Child = Child.PrevSiblingWindow;
	}
}


//final function bool PropagateKey(WinMessage Msg, Canvas C, float X, float Y, int Key)
function bool PropagateKey(WinMessage Msg, Canvas C, float X, float Y, int Key)
{
	local UWindowWindow Child;

	// Check from WinTopmost for windows which accept focus
	Child = LastChildWindow;

	// HACK for always on top windows...need a better solution
	if(ActiveWindow != None && Child != ActiveWindow && !Child.bTransient)
		Child = ActiveWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;

		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;

		if((bUWindowActive || Child.bLeaveOnscreen) && Child.bAcceptsFocus)
		{
			//log("Sending keystrokes to:  "$Child);

			Child.WindowEvent(Msg, C, X - Child.WinLeft, Y - Child.WinTop, Key);
			return True;		
		}
		//else
			//Log("Ignoring child:  "$Child);
		Child = Child.PrevSiblingWindow;
	}

	return False;
}


final function UWindowWindow CheckKeyFocusWindow()
{
	local UWindowWindow Child;

	// Check from WinTopmost for windows which accept key focus
	Child = LastChildWindow;
#ifdefDEBUG
	if (Root.m_bDisplayCheckKeyFocus)
	{
		log("--> Child = LastChildWindow:"@LastChildWindow@self);
		log("ActiveWindow"@ActiveWindow);
	}
#endif
	if(ActiveWindow != None && Child != ActiveWindow && !Child.bTransient)
		Child = ActiveWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;
#ifdefDEBUG
		if (Root.m_bDisplayCheckKeyFocus)
			log("---> bLeaveOnScreen:"@bLeaveOnScreen@self);
#endif
		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;
#ifdefDEBUG
		if (Root.m_bDisplayCheckKeyFocus)
			log("----> bUWindowActive:"@bUWindowActive@Child);
#endif
		if(bUWindowActive || Child.bLeaveOnscreen)
		{
#ifdefDEBUG
			if (Root.m_bDisplayCheckKeyFocus)
				log("----> Child.bAcceptsFocus:"@Child.bAcceptsFocus);
#endif
			if(Child.bAcceptsFocus)
			{
#ifdefDEBUG
				if (Root.m_bDisplayCheckKeyFocus)
					log("----> ActiveWindow: "@ActiveWindow@"|||||||| Child.bAcceptsFocus:"@Child);
#endif
				return Child.CheckKeyFocusWindow();
			}
		}
		Child = Child.PrevSiblingWindow;
	}
#ifdefDEBUG
	Root.m_bDisplayCheckKeyFocus = false;
#endif
	return Self;
}

final function bool MessageClients(WinMessage Msg, Canvas C, float X, float Y, int Key)
{
	local UWindowWindow Child;

	// go from topmost downwards
	Child = LastChildWindow;

	while(Child != None)
	{
		Child.bUWindowActive = bUWindowActive;

		if(bLeaveOnScreen)
			Child.bLeaveOnscreen = True;

		if(bUWindowActive || Child.bLeaveOnscreen)
		{
			if((X >= Child.WinLeft) && (X <= Child.WinLeft+Child.WinWidth) &&
			   (Y >= Child.WinTop) && (Y <= Child.WinTop+Child.WinHeight)  &&
			   (!Child.CheckMousePassThrough(X-Child.WinLeft, Y-Child.WinTop))) 
			{
				Child.WindowEvent(Msg, C, X - Child.WinLeft, Y - Child.WinTop, Key);
				return True;
			}
		}
	
		Child = Child.PrevSiblingWindow;
	}

	return False;
}

//This will turn a window Active, it uses recursion through the genealogy
//tree of a window to activate all parents, but set the focus only on the
//topmost window
final function ActivateWindow(int Depth, bool bTransientNoDeactivate)
{
	if(Self == Root)
	{
		if(Depth == 0)
			FocusWindow();
		return;
	}

	if(WaitModal()) return;

#ifdefDEBUG
	if (Root.m_bDisplayCheckKeyFocus) log("ActivateWindow Window "$Self);
#endif

	if(!bAlwaysBehind)
	{
		ParentWindow.HideChildWindow(Self);
		ParentWindow.ShowChildWindow(Self);
	}
	
	if(!(bTransient || bTransientNoDeactivate))
	{
		if(ParentWindow.ActiveWindow != None && ParentWindow.ActiveWindow != Self)
		{
			ParentWindow.ActiveWindow.Deactivated();
		}

		ParentWindow.ActiveWindow = Self;
		ParentWindow.ActivateWindow(Depth + 1, False);

		Activated();
	}
	else
	{
		ParentWindow.ActivateWindow(Depth + 1, True);
	}

	if(Depth == 0)
		FocusWindow();
}
//Bring a window to top
final function BringToFront()
{
	if(Self == Root)
		return;

	if(!bAlwaysBehind && !WaitModal())
	{
		ParentWindow.HideChildWindow(Self);
		ParentWindow.ShowChildWindow(Self);
	}
	ParentWindow.BringToFront();
}

//Sets a window yo back so it doesn't have focus
final function SendToBack()
{
	ParentWindow.HideChildWindow(Self);
	ParentWindow.ShowChildWindow(Self, True);
}

final function HideChildWindow(UWindowWindow Child)
{
	local UWindowWindow Window;

	if(!Child.bWindowVisible) return;
	Child.bWindowVisible = False;

	if(Child.bAcceptsHotKeys)
		Root.RemoveHotkeyWindow(Child);

	// Check WinTopmost
	if(LastChildWindow == Child) 
	{
		LastChildWindow = Child.PrevSiblingWindow;
		if(LastChildWindow != None)
		{
			LastChildWindow.NextSiblingWindow = None;
		}
		else
		{
			FirstChildWindow = None;
		}
	} 
	else if(FirstChildWindow == Child) // Check bottommost
	{ 
		FirstChildWindow = Child.NextSiblingWindow;
		if(FirstChildWindow != None)
		{
			FirstChildWindow.PrevSiblingWindow = None;
		}
		else
		{
			LastChildWindow = None;
		}
	} 
	else 
	{
		// you mean I have to go looking for it???
		Window = FirstChildWindow;
		while(Window != None)
		{
			if(Window.NextSiblingWindow == Child)
			{
				Window.NextSiblingWindow = Child.NextSiblingWindow;
				Window.NextSiblingWindow.PrevSiblingWindow = Window;
				break;
			}
			Window = Window.NextSiblingWindow;
		}
	}

	// Set the active window
	ActiveWindow = None;
	Window = LastChildWindow;
	while(Window != None)
	{
		if(!Window.bAlwaysOnTop)
		{
			ActiveWindow = Window;
			break;
		}
		Window = Window.PrevSiblingWindow;
	}
	if(ActiveWindow == None) ActiveWindow = LastChildWindow;
}

//Allow a window to have focus
final function SetAcceptsFocus()
{
#ifdefDEBUG
	if (Root.m_bDisplayCheckKeyFocus) log("SetAcceptsFocus for "$self);
#endif
	if(bAcceptsFocus) 
	{
#ifdefDEBUG
		if (Root.m_bDisplayCheckKeyFocus) log("You set accepts focus again on "@self@" window. Maybe the link of acceptsfocus chain are broken?");
#endif
//		return;
	}

	bAcceptsFocus = True;

	if(Self != Root)
	{
		ParentWindow.SetAcceptsFocus();
	}
}

final function CancelAcceptsFocus()
{
#ifdefDEBUG
	if (Root.m_bDisplayCheckKeyFocus) log("CancelAcceptsFocus for "$self);
#endif
	if ((!bAcceptsFocus) || (bAlwaysAcceptsFocus))
		return;
#ifdefDEBUG
	if (Root.m_bDisplayCheckKeyFocus) log("CancelAcceptsFocus go");
#endif
	bAcceptsFocus = false;

	if(Self != Root)
	{
		ParentWindow.CancelAcceptsFocus();
	}
}

final function GetMouseXY(out float X, out float Y)
{
	local UWindowWindow P;

	X = Int(Root.MouseX*Root.m_fWindowScaleX);
	Y = Int(Root.MouseY*Root.m_fWindowScaleY);

	P = Self;
	while(P != Root)
	{	
		X = X - P.WinLeft;
		Y = Y - P.WinTop;
		P = P.ParentWindow;
	}
}


//Conversion of coordinates since a window coordinadinate is always relative to it's parent
final function GlobalToWindow(float GlobalX, float GlobalY, out float WinX, out float WinY)
{
	local UWindowWindow P;

	WinX = GlobalX;
	WinY = GlobalY;

	P = Self;
	while(P != Root)
	{		
		WinX -= P.WinLeft;
		WinY -= P.WinTop;
		P = P.ParentWindow;
	}
}

final function WindowToGlobal(float WinX, float WinY, out float GlobalX, out float GlobalY)
{
	local UWindowWindow P;

	GlobalX = WinX;
	GlobalY = WinY;

	P = Self;
	while(P != Root)
	{		
		GlobalX += P.WinLeft;
		GlobalY += P.WinTop;
		P = P.ParentWindow;
	}
}

final function ShowChildWindow(UWindowWindow Child, optional bool bAtBack)
{
	local UWindowWindow W;
	
#ifdefDEBUG
	if (Root.m_bDisplayCheckKeyFocus)
	{
		log("ShowChildWindow: Child"@Child@self);
	}
#endif

	if(!Child.bTransient) ActiveWindow = Child;

	if(Child.bWindowVisible) return;
	Child.bWindowVisible = True;

	if(Child.bAcceptsHotKeys)
		Root.AddHotkeyWindow(Child);

	if(bAtBack)
	{
		if(FirstChildWindow == None)
		{
			Child.NextSiblingWindow = None;
			Child.PrevSiblingWindow = None;
			LastChildWindow = Child;
			FirstChildWindow = Child;
		}
		else
		{
			FirstChildWindow.PrevSiblingWindow = Child;
			Child.NextSiblingWindow = FirstChildWindow;
			Child.PrevSiblingWindow = None;
			FirstChildWindow = Child;
		}
	}
	else
	{
		W = LastChildWindow;
		while(True) 
		{
			if((Child.bAlwaysOnTop) || (W == None) || (!W.bAlwaysOnTop))
			{
				if(W == None)
				{	
					if(LastChildWindow == None)
					{
						// We're the only window
						Child.NextSiblingWindow = None;
						Child.PrevSiblingWindow = None;
						LastChildWindow = Child;
						FirstChildWindow = Child;
					}
					else
					{
						// We feel off the end of the list, we're the bottom (first) child window.
						Child.NextSiblingWindow = FirstChildWindow;
						Child.PrevSiblingWindow = None;
						FirstChildWindow.PrevSiblingWindow = Child;
						FirstChildWindow = Child;
					}
				}
				else
				{
					// We're either the new topmost (last) or we need to be inserted in the list.

					Child.NextSiblingWindow = W.NextSiblingWindow;
					Child.PrevSiblingWindow = W;
					if(W.NextSiblingWindow != None)
					{
						W.NextSiblingWindow.PrevSiblingWindow = Child;
					}
					else
					{
						LastChildWindow = Child;
					}
					W.NextSiblingWindow = Child;
				}
				
				// We're done.
				break;
			}
			
			W = W.PrevSiblingWindow;
		}
	}
}

function ShowWindow()
{
	ParentWindow.ShowChildWindow(Self);
	WindowShown();
}

function HideWindow()
{
	WindowHidden();
	ParentWindow.HideChildWindow(Self);
}

final function UWindowWindow CreateWindow(class<UWindowWindow> WndClass, float X, float Y, float W, float H, optional UWindowWindow OwnerW, optional bool bUnique, optional name ObjectName)
{
	local UWindowWindow Child;

	if(bUnique)
	{
		Child = Root.FindChildWindow(WndClass, True);

		if(Child != None)
		{
			Child.ShowWindow();
			Child.BringToFront();
			return Child;
		}
	}

	if(ObjectName != '')
		Child = New(None, string(ObjectName)) WndClass;
	else
		Child = New(None) WndClass;

	Child.BeginPlay();
	Child.WinTop = INT(Y);
	Child.WinLeft = INT(X);
	Child.WinWidth = INT(W);
	Child.WinHeight = INT(H);
	Child.Root = Root;
	Child.ParentWindow = Self;
	Child.OwnerWindow = OwnerW;
	if(Child.OwnerWindow == None)
		Child.OwnerWindow = Self;
	Child.Cursor = Cursor;
	Child.bAlwaysBehind = False;
	Child.LookAndFeel = LookAndFeel;
//	Child.BeforeCreate();
	Child.Created();

	// Now add it at the WinTop of the Z-Order and then adjust child list.
	ShowChildWindow(Child);

//	Child.AfterCreate();

	return Child;
}

final function DrawHorizTiledPieces( Canvas C, float DestX, float DestY, float DestW, float DestH, TexRegion T1, TexRegion T2, TexRegion T3, TexRegion T4, TexRegion T5, float Scale )
{
	local TexRegion Pieces[5], R;
	local int PieceCount;
	local int j;
	local float X, L;

	Pieces[0] = T1; if(T1.T != None) PieceCount = 1;
	Pieces[1] = T2; if(T2.T != None) PieceCount = 2;
	Pieces[2] = T3; if(T3.T != None) PieceCount = 3;
	Pieces[3] = T4; if(T4.T != None) PieceCount = 4;
	Pieces[4] = T5; if(T5.T != None) PieceCount = 5;

	j = 0;
	X = DestX;
	while( X < DestX + DestW )
	{
		L = DestW - (X - DestX);
		R = Pieces[j];
		DrawStretchedTextureSegment( C, X, DestY, FMin(R.W*Scale, L), R.H*Scale, R.X, R.Y, FMin(R.W, L/Scale), R.H, R.T );
		X += FMin(R.W*Scale, L);
		j = (j+1)%PieceCount;
	}
}

final function DrawVertTiledPieces( Canvas C, float DestX, float DestY, float DestW, float DestH, TexRegion T1, TexRegion T2, TexRegion T3, TexRegion T4, TexRegion T5, float Scale )
{
	local TexRegion Pieces[5], R;
	local int PieceCount;
	local int j;
	local float Y, L;

	Pieces[0] = T1; if(T1.T != None) PieceCount = 1;
	Pieces[1] = T2; if(T2.T != None) PieceCount = 2;
	Pieces[2] = T3; if(T3.T != None) PieceCount = 3;
	Pieces[3] = T4; if(T4.T != None) PieceCount = 4;
	Pieces[4] = T5; if(T5.T != None) PieceCount = 5;

	j = 0;
	Y = DestY;
	while( Y < DestY + DestH )
	{
		L = DestH - (Y - DestY);
		R = Pieces[j];
		DrawStretchedTextureSegment( C, DestX, Y, R.W*Scale, FMin(R.H*Scale, L), R.X, R.Y, R.W, FMin(R.H, L/Scale), R.T );
		Y += FMin(R.H*Scale, L);
		j = (j+1)%PieceCount;
	}
}


final function DrawClippedTexture( Canvas C, float X, float Y, texture Tex )
{
	DrawStretchedTextureSegment( C, X, Y, Tex.USize, Tex.VSize, 0, 0, Tex.USize, Tex.VSize, Tex);
}

final function DrawStretchedTexture( Canvas C, float X, float Y, float W, float H, texture Tex )
{
	DrawStretchedTextureSegment( C, X, Y, W, H, 0, 0, Tex.USize, Tex.VSize, Tex);
}

final function DrawStretchedTextureSegment( Canvas C, float X, float Y, float W, float H, 
									  float tX, float tY, float tW, float tH, texture Tex ) 
{
/* R6CODE
	local float OrgX, OrgY, ClipX, ClipY;

	OrgX = C.OrgX;
	OrgY = C.OrgY;
	ClipX = C.ClipX;
	ClipY = C.ClipY;

	C.SetOrigin(OrgX + ClippingRegion.X*Root.GUIScale, OrgY + ClippingRegion.Y*Root.GUIScale);
	C.SetClip(ClippingRegion.W*Root.GUIScale, ClippingRegion.H*Root.GUIScale);

	C.SetPos((X - ClippingRegion.X)*Root.GUIScale, (Y - ClippingRegion.Y)*Root.GUIScale);
	C.DrawTileClipped( Tex, W*Root.GUIScale, H*Root.GUIScale, tX, tY, tW, tH);
	
	C.SetClip(ClipX, ClipY);
	C.SetOrigin(OrgX, OrgY);
*/
    C.DrawStretchedTextureSegmentNative(X, Y, W, H, tX, tY, tW, tH, Root.GUIScale, ClippingRegion, Tex);
}

final function DrawStretchedTextureSegmentRot( Canvas C, float X, float Y, float W, float H, 
											   float tX, float tY, float tW, float tH, texture Tex, float fTexRotation) 
{
	local float OrgX, OrgY, ClipX, ClipY;

	OrgX = C.OrgX;
	OrgY = C.OrgY;
	ClipX = C.ClipX;
	ClipY = C.ClipY;

	C.SetOrigin(OrgX + ClippingRegion.X*Root.GUIScale, OrgY + ClippingRegion.Y*Root.GUIScale);
	C.SetClip(ClippingRegion.W*Root.GUIScale, ClippingRegion.H*Root.GUIScale);

	C.SetPos((X - ClippingRegion.X)*Root.GUIScale, (Y - ClippingRegion.Y)*Root.GUIScale);
	C.DrawTile( Tex, W*Root.GUIScale, H*Root.GUIScale, tX, tY, tW, tH, fTexRotation);

	C.SetClip(ClipX, ClipY);
	C.SetOrigin(OrgX, OrgY);
}

//R6CODE
function DrawSimpleBorder(Canvas C)
{
    //Draw Buttons Contour
    C.Style = m_BorderStyle;

    C.SetDrawColor(m_BorderColor.R, m_BorderColor.G, m_BorderColor.B);

    //Top
    DrawStretchedTextureSegment(C, 0, 0, WinWidth, m_BorderTextureRegion.H , m_BorderTextureRegion.X, m_BorderTextureRegion.Y, m_BorderTextureRegion.W, m_BorderTextureRegion.H, m_BorderTexture);
    //Bottom
    DrawStretchedTextureSegment(C, 0, WinHeight  - m_BorderTextureRegion.H, WinWidth, m_BorderTextureRegion.H , m_BorderTextureRegion.X, m_BorderTextureRegion.Y, m_BorderTextureRegion.W, m_BorderTextureRegion.H, m_BorderTexture);
    //Left
    DrawStretchedTextureSegment(C, 0, m_BorderTextureRegion.H, m_BorderTextureRegion.W, WinHeight - (2* m_BorderTextureRegion.H), m_BorderTextureRegion.X, m_BorderTextureRegion.Y, m_BorderTextureRegion.W, m_BorderTextureRegion.H, m_BorderTexture);
    //Right
    DrawStretchedTextureSegment(C, WinWidth - m_BorderTextureRegion.W, m_BorderTextureRegion.H, m_BorderTextureRegion.W, WinHeight - (2* m_BorderTextureRegion.H), m_BorderTextureRegion.X, m_BorderTextureRegion.Y, m_BorderTextureRegion.W, m_BorderTextureRegion.H, m_BorderTexture);
}

function DrawSimpleBackGround(Canvas C, FLOAT X, FLOAT Y, FLOAT W, FLOAT H, Color _BGColor, optional BYTE Alpha)
{
	local Texture BGTexture;
	local Region  BGTextureRegion;
	local Color   BGColor;

    BGTexture		  = Texture'R6MenuTextures.Gui_BoxScroll';
    BGTextureRegion.X = 77;
	BGTextureRegion.Y = 31;
	BGTextureRegion.W = 8;
	BGTextureRegion.H = 8;

	C.Style = ERenderStyle.STY_Alpha;

	C.SetDrawColor( _BGColor.R, _BGColor.G, _BGColor.B, Alpha);

    DrawStretchedTextureSegment( C, X, Y, W, H, 
                                    BGTextureRegion.X, BGTextureRegion.Y, BGTextureRegion.W, BGTextureRegion.H, BGTexture );
}
//End R6Code

final function ClipText(Canvas C, float X, float Y, coerce string S, optional bool bCheckHotkey)
{
/* R6CODE
	local float OrgX, OrgY, ClipX, ClipY;

	OrgX = C.OrgX;
	OrgY = C.OrgY;
	ClipX = C.ClipX;
	ClipY = C.ClipY;

	C.SetOrigin(OrgX + ClippingRegion.X*Root.GUIScale, OrgY + ClippingRegion.Y*Root.GUIScale);
	C.SetClip(ClippingRegion.W*Root.GUIScale, ClippingRegion.H*Root.GUIScale);

    C.Style = ERenderStyle.STY_Alpha;
	C.SetPos((X - ClippingRegion.X)*Root.GUIScale, (Y - ClippingRegion.Y)*Root.GUIScale);
	C.DrawTextClipped(S, bCheckHotKey);

	C.SetClip(ClipX, ClipY);
	C.SetOrigin(OrgX, OrgY);
*/
    C.ClipTextNative(X, Y, S, Root.GUIScale, ClippingRegion, bCheckHotKey);
}

final function int WrapClipText(Canvas C, float X, float Y, coerce string S, optional bool bCheckHotkey, optional int Length, optional int PaddingLength, optional bool bNoDraw)
{
	local float W, H, Xdefault;
	local int SpacePos, CRPos, WordPos, TotalPos;
	local string Out, Temp, Padding;
	local bool bCR, bSentry;
	local int i;
	local int NumLines;
	local float pW, pH;

    Xdefault = X;

	// replace \\n's with Chr(13)'s
	i = InStr(S, "\\n");
	while(i != -1)
	{
		S = Left(S, i) $ Chr(13) $ Mid(S, i + 2);
		i = InStr(S, "\\n");
	}

	i = 0;
	bSentry = True;
	Out = "";
	NumLines = 1;
	while( bSentry && Y < WinHeight )
	{
		// Get the line to be drawn.
		if(Out == "")
		{
			i++;
			if (Length > 0)
				Out = Left(S, Length);
			else
				Out = S;
		}

		// Find the word boundary.
		SpacePos = InStr(Out, " ");
		CRPos = InStr(Out, Chr(13));
		
		bCR = False;
		if(CRPos != -1 && (CRPos < SpacePos || SpacePos == -1))
		{
			WordPos = CRPos;
			bCR = True;
		}
		else
		{
			WordPos = SpacePos;
		}
		
		// Get the current word.
		C.SetPos(0, 0);
		if(WordPos == -1)
			Temp = Out;
		else
			Temp = Left(Out, WordPos)$" ";
		TotalPos += WordPos;

		TextSize(C, Temp, W, H);

		// Calculate draw offset.
		if ( (Mid(Out, Len(Temp)) == "") && (PaddingLength > 0) )
		{
			Padding = Mid(S, Length, PaddingLength);
			TextSize(C, Padding, pW, pH);
			if(W + X + pW > WinWidth && X > 0)
			{
				X = Xdefault;//X = 0;
                Y += H;
				NumLines++;
			}
		}
		else
		{
			if(W + X > WinWidth && X > 0)
			{
				X = Xdefault;//X = 0;
				Y += H;
				NumLines++;
			}
		}

		// Draw the line.
		if(!bNoDraw)
			ClipText(C, X, Y, Temp, bCheckHotKey);

		// Increment the draw offset.
		X += W;
		if(bCR)
		{
			X = Xdefault;//X =0;
			Y += H;
			NumLines++;
		}
		Out = Mid(Out, Len(Temp));
		if ((Out == "") && (i > 0))
			bSentry = False;
	}
	return NumLines;
}

final function ClipTextWidth(Canvas C, float X, float Y, coerce string S, float W)
{
	//ClipText(C, X, Y, S);
	local float OrgX, OrgY, ClipX, ClipY, finalWidth;

	OrgX = C.OrgX;
	OrgY = C.OrgY;
	ClipX = C.ClipX;
	ClipY = C.ClipY;

	finalWidth = Min( W , WinWidth*Root.GUIScale);

	C.SetOrigin(OrgX + ClippingRegion.X*Root.GUIScale, OrgY + ClippingRegion.Y*Root.GUIScale);
	C.SetClip(finalWidth, ClippingRegion.H*Root.GUIScale);

	C.SetPos((X - ClippingRegion.X)*Root.GUIScale, (Y - ClippingRegion.Y)*Root.GUIScale);
	C.DrawTextClipped(S, false);

	C.SetClip(ClipX, ClipY);
	C.SetOrigin(OrgX, OrgY);
}

/*
final function DrawClippedActor( Canvas C, float X, float Y, Actor A, bool WireFrame, rotator RotOffset, vector LocOffset )
{
	local vector MeshLoc;
	local float FOV;

	FOV = GetPlayerOwner().FOVAngle * Pi / 180;
	
	MeshLoc.X = 4 / tan(FOV/2);
	MeshLoc.Y = 0;
	MeshLoc.Z = 0;

	A.SetRotation(RotOffset);
	A.SetLocation(MeshLoc + LocOffset);

	C.DrawClippedActor(A, WireFrame, ClippingRegion.W * Root.GUIScale, ClippingRegion.H * Root.GUIScale, C.OrgX + ClippingRegion.X * Root.GUIScale, C.OrgY + ClippingRegion.Y * Root.GUIScale, True);
}
*/
final function DrawUpBevel( Canvas C, float X, float Y, float W, float H, Texture T)
{
	local Region R;

	R = LookAndFeel.BevelUpTL;
	DrawStretchedTextureSegment( C, X, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpT;
	DrawStretchedTextureSegment( C, X+LookAndFeel.BevelUpTL.W, Y, 
									W - LookAndFeel.BevelUpTL.W
									- LookAndFeel.BevelUpTR.W,
									R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpTR;
	DrawStretchedTextureSegment( C, X + W - R.W, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );
	
	R = LookAndFeel.BevelUpL;
	DrawStretchedTextureSegment( C, X, Y + LookAndFeel.BevelUpTL.H,
									R.W,  
									H - LookAndFeel.BevelUpTL.H
									- LookAndFeel.BevelUpBL.H,
									R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpR;
	DrawStretchedTextureSegment( C, X + W - R.W, Y + LookAndFeel.BevelUpTL.H,
									R.W,  
									H - LookAndFeel.BevelUpTL.H
									- LookAndFeel.BevelUpBL.H,
									R.X, R.Y, R.W, R.H, T );

	
	R = LookAndFeel.BevelUpBL;
	DrawStretchedTextureSegment( C, X, Y + H - R.H, R.W, R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpB;
	DrawStretchedTextureSegment( C, X + LookAndFeel.BevelUpBL.W, Y + H - R.H, 
									W - LookAndFeel.BevelUpBL.W
									- LookAndFeel.BevelUpBR.W,
									R.H, R.X, R.Y, R.W, R.H, T );

	R = LookAndFeel.BevelUpBR;
	DrawStretchedTextureSegment( C, X + W - R.W, Y + H - R.H, R.W, R.H, R.X, R.Y, 
									R.W, R.H, T );

	R = LookAndFeel.BevelUpArea;
	DrawStretchedTextureSegment( C, X + LookAndFeel.BevelUpTL.W,
	                                Y + LookAndFeel.BevelUpTL.H,
									W - LookAndFeel.BevelUpBL.W
									- LookAndFeel.BevelUpBR.W,
									H - LookAndFeel.BevelUpTL.H
									- LookAndFeel.BevelUpBL.H,
									R.X, R.Y, R.W, R.H, T );
	
}

final function DrawMiscBevel( Canvas C, float X, float Y, float W, float H, Texture T, int BevelType)
{
	local Region R;

C.Style = ERenderStyle.STY_Alpha;
    /*
    //left corners
	R = LookAndFeel.MiscBevelTL[BevelType];
	DrawStretchedTextureSegment( C, X, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );
*/

    /*
    //the lines on the top and the bottom of the edit box
	R = LookAndFeel.MiscBevelT[BevelType];
	DrawStretchedTextureSegment( C, X+LookAndFeel.MiscBevelTL[BevelType].W, Y, 
									W - LookAndFeel.MiscBevelTL[BevelType].W
									- LookAndFeel.MiscBevelTR[BevelType].W,
									R.H, R.X, R.Y, R.W, R.H, T );
*/
/*
    //right corners 
	R = LookAndFeel.MiscBevelTR[BevelType];
	DrawStretchedTextureSegment( C, X + W - R.W, Y, R.W, R.H, R.X, R.Y, R.W, R.H, T );
    */
/*
    //left lines border
	R = LookAndFeel.MiscBevelL[BevelType];
	DrawStretchedTextureSegment( C, X, Y + LookAndFeel.MiscBevelTL[BevelType].H,
									R.W,  
									H - LookAndFeel.MiscBevelTL[BevelType].H
									- LookAndFeel.MiscBevelBL[BevelType].H,
									R.X, R.Y, R.W, R.H, T );

    //right lines border
	R = LookAndFeel.MiscBevelR[BevelType];
	DrawStretchedTextureSegment( C, X + W - R.W, Y + LookAndFeel.MiscBevelTL[BevelType].H,
									R.W,  
									H - LookAndFeel.MiscBevelTL[BevelType].H
									- LookAndFeel.MiscBevelBL[BevelType].H,
									R.X, R.Y, R.W, R.H, T );
*/
/*	
	R = LookAndFeel.MiscBevelBL[BevelType];
	DrawStretchedTextureSegment( C, X, Y + H - R.H, R.W, R.H, R.X, R.Y, R.W, R.H, T );
    */

    /*
	R = LookAndFeel.MiscBevelB[BevelType];
	DrawStretchedTextureSegment( C, X + LookAndFeel.MiscBevelBL[BevelType].W, Y + H - R.H, 
									W - LookAndFeel.MiscBevelBL[BevelType].W
									- LookAndFeel.MiscBevelBR[BevelType].W,
									R.H, R.X, R.Y, R.W, R.H, T );
                                    */
/*
	R = LookAndFeel.MiscBevelBR[BevelType];
	DrawStretchedTextureSegment( C, X + W - R.W, Y + H - R.H, R.W, R.H, R.X, R.Y, 
									R.W, R.H, T );
*/
    C.SetDrawColor( 31, 34, 39);
	R = LookAndFeel.MiscBevelArea[BevelType];
	DrawStretchedTextureSegment( C, X + LookAndFeel.MiscBevelTL[BevelType].W,
	                                Y + LookAndFeel.MiscBevelTL[BevelType].H,
									W - LookAndFeel.MiscBevelBL[BevelType].W
									- LookAndFeel.MiscBevelBR[BevelType].W,
									H - LookAndFeel.MiscBevelTL[BevelType].H
									- LookAndFeel.MiscBevelBL[BevelType].H,
									R.X, R.Y, R.W, R.H, T );
  
}

final function string RemoveAmpersand(string S)
{
	local string Result;
	local string Underline;

	ParseAmpersand(S, Result, Underline, False);

	return Result;
}

final function byte ParseAmpersand(string S, out string Result, out string Underline, bool bCalcUnderline)
{
	local string Temp;
	local int Pos, NewPos;
	local int i;
	local byte HotKey;
	
	HotKey = 0;
	Pos = 0;
	Result = "";
	Underline = "";

	while(True)
	{
		Temp = Mid(S, Pos);

		NewPos = InStr(Temp, "&");
		
		if(NewPos == -1) break;
		Pos += NewPos;

		if(Mid(Temp, NewPos + 1, 1) == "&")
		{
			// It's a double &, lets add one to the output.
			Result = Result $ Left(Temp, NewPos) $ "&";
			
			if(bCalcUnderline) 
				Underline = Underline $ " ";

			Pos++;
		}
		else
		{
			if(HotKey == 0)
				HotKey = Asc(Caps(Mid(Temp, NewPos + 1, 1)));

			Result = Result $ Left(Temp, NewPos);
			
			if(bCalcUnderline)
			{
				for(i=0;i<NewPos - 1;i++) 
					Underline = Underline $ " ";
				Underline = Underline $ "_";
			}
		}

		Pos++;
	}
	Result = Result $ Temp;

	return HotKey;
}

final function bool MouseIsOver()
{
	return (Root.MouseWindow == Self);
}

function ToolTip(string strTip) 
{
	if(ParentWindow != Root) ParentWindow.ToolTip(strTip);
}


// Sets mouse window for mouse capture.
final function SetMouseWindow()
{
	Root.MouseWindow = Self;
}

function Texture GetLookAndFeelTexture()
{
	return ParentWindow.GetLookAndFeelTexture();
}

function bool IsActive()
{
	return ParentWindow.IsActive();
}

function SetAcceptsHotKeys(bool bNewAccpetsHotKeys)
{
	if(bNewAccpetsHotKeys && !bAcceptsHotKeys && bWindowVisible)
		Root.AddHotkeyWindow(Self);
	
	if(!bNewAccpetsHotKeys && bAcceptsHotKeys && bWindowVisible)
		Root.RemoveHotkeyWindow(Self);

	bAcceptsHotKeys = bNewAccpetsHotKeys;
}

final function UWindowWindow GetParent(class<UWindowWindow> ParentClass, optional bool bExactClass)
{
	local UWindowWindow P;

	P = ParentWindow;
	while(P != Root)
	{
		if(bExactClass)
		{
			if(P.Class == ParentClass)
				return P;
		}
		else
		{
			if(ClassIsChildOf(P.Class, ParentClass))
				return P;
		}
		P = P.ParentWindow;
	}

	return None;
}

final function UWindowWindow FindChildWindow(class<UWindowWindow> ChildClass, optional bool bExactClass)
{
	local UWindowWindow Child, Found;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
	{
		if(bExactClass)
		{
			if(Child.Class == ChildClass) return Child;
		}
		else
		{
			if(ClassIsChildOf(Child.Class, ChildClass)) return Child;
		}

		Found = Child.FindChildWindow(ChildClass);
		if(Found != None) return Found;
	}

	return None;
}

function GetDesiredDimensions(out float W, out float H)
{
	local float MaxW, MaxH, TW, TH;
	local UWindowWindow Child, Found;
	
	MaxW = 0;
	MaxH = 0;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
	{
		Child.GetDesiredDimensions(TW, TH);
		//Log("Calling: "$GetPlayerOwner().GetItemName(string(Child)));
		

		if(TW > MaxW) MaxW = TW;
		if(TH > MaxH) MaxH = TH;
	}
	W = MaxW;
	H = MaxH;
	//Log(GetPlayerOwner().GetItemName(string(Self))$": DesiredHeight: "$H);
}

final function string TextSize(Canvas C, string Text, out float W, out float H, optional INT _TotalWidth, optional INT _SpaceWidth)
{
	local string szResult;

	C.SetPos(0, 0);
	szResult = C.TextSize(Text, W, H, _TotalWidth, _SpaceWidth);
	W = W / Root.GUIScale;
	H = H / Root.GUIScale;

	return szResult;
}

function ResolutionChanged(float W, float H)
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
	{
		Child.ResolutionChanged(W, H);
	}
}

function ShowModal(UWindowWindow W)
{
	ModalWindow = W;
	W.ShowWindow();
	W.BringToFront();		
}

function bool WaitModal()
{
	if(ModalWindow != None && ModalWindow.bWindowVisible)
		return True;

	ModalWindow = None;

	return False;
}

function WindowHidden()
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.WindowHidden();
}

function WindowShown()
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.WindowShown();
}

// Should mouse events at these co-ordinates be passed through to underlying windows?
function bool CheckMousePassThrough(float X, float Y)
{
	return False;
}

final function bool WindowIsVisible()
{
	if(Self == Root)
		return True;

	if(!bWindowVisible)
		return False;
	return ParentWindow.WindowIsVisible();
}

function SetParent(UWindowWindow NewParent)
{
	HideWindow();
	ParentWindow = NewParent;
	ShowWindow();
}

function UWindowMessageBox MessageBox(string Title, string Message, MessageBoxButtons Buttons, MessageBoxResult ESCResult, optional MessageBoxResult EnterResult, optional int TimeOut)
{
	local UWindowMessageBox W;
	local UWindowFramedWindow F;
	
	W = UWindowMessageBox(Root.CreateWindow(class'UWindowMessageBox', 100, 100, 100, 100, Self));
	W.SetupMessageBox(Title, Message, Buttons, ESCResult, EnterResult, TimeOut);
	F = UWindowFramedWindow(GetParent(class'UWindowFramedWindow'));

	if(F!= None)
		F.ShowModal(W);
	else
		Root.ShowModal(W);

	return W;
}

//Overload this function to process the message box result.
function MessageBoxDone(UWindowMessageBox W, MessageBoxResult Result)
{
}

function PopUpBoxDone( MessageBoxResult Result, ePopUpID _ePopUpID)
{
}

function SendMessage( eR6MenuWidgetMessage eMessage )
{
}

function NotifyQuitUnreal()
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.NotifyQuitUnreal();
}

function NotifyBeforeLevelChange()
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.NotifyBeforeLevelChange();
}

function NotifyAfterLevelChange()
{
	local UWindowWindow Child;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.NotifyAfterLevelChange();
}

function NotifyWindow(UWindowWindow C, byte E)
{
	// Implemented in child class
}

function SetCursor(MouseCursor C)
{
	local UWindowWindow Child;

	Cursor = C;

	for(Child = LastChildWindow;Child != None;Child = Child.PrevSiblingWindow)
		Child.SetCursor(C);
}

final function ReplaceText(out string Text, string Replace, string With)
{
	local int i;
	local string Input;
		
	Input = Text;
	Text = "";
	i = InStr(Input, Replace);
	while(i != -1)
	{	
		Text = Text $ Left(Input, i) $ With;
		Input = Mid(Input, i + Len(Replace));	
		i = InStr(Input, Replace);
	}
	Text = Text $ Input;
}

function StripCRLF(out string Text)
{
	ReplaceText(Text, Chr(13)$Chr(10), "");
	ReplaceText(Text, Chr(13), "");
	ReplaceText(Text, Chr(10), "");
}

// This is implemented over here because we need an access for the console 
function SetServerOptions()
{
    // implemented in child class
}

//===========================================================================================
// MenuLoadProfile: A profile was load
//===========================================================================================
function MenuLoadProfile( BOOL _bServerProfile)
{
    // implemented in child class
}

function SetBorderColor( Color _NewColor)
{
    // implemented in child class
}

defaultproperties
{
     m_BorderStyle=1
     m_BorderTexture=Texture'UWindow.WhiteTexture'
     m_BorderTextureRegion=(W=1,H=1)
     m_BorderColor=(B=255,G=255,R=255)
}
