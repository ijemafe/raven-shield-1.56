//=============================================================================
//  R6GameServices.uc : This class is used to manage server lists.
//  Copyright 2001 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2002/02/20 * Created by John Bennett
//============================================================================//

class R6ServerList extends R6AbstractGameService
	native;

//enum ECDKEY_PLAYER_STATUS
//{
//	ECDKEY_PLAYER_UNKNOWN,
//	ECDKEY_PLAYER_INVALID,
//	ECDKEY_PLAYER_VALID
//};

enum eSortCategory
{
    eSG_Favorite,
    eSG_Locked,
    eSG_Dedicated,
//#ifdefR6PUNKBUSTER
	eSG_PunkBuster,
//#endif
    eSG_PingTime,
    eSG_Name,
    eSG_GameType,
    eSG_GameMode,
    eSG_Map,
    eSG_NumPlayers
};

//--------------------------------------------------------------
// Structures - If any of the fields of these structures are
// changed (or if fields are added), the structure definitions 
// in R6GameService.h must also be changed.
//--------------------------------------------------------------

const K_GlobalID_size = 16;

struct stValidationResponse
{
    var INT     iReqID;
    var PlayerController.ECDKEYST_STATUS eStatus;
    var BOOL    bSuceeded;
    var BOOL    bTimeout;
    var BYTE    ucGlobalID[K_GlobalID_size];
};

// An IP address. TODO - structure definition copied from IpDrv
// need to find a way to access the original definition.

struct IpAddr
{
	var int Addr;
	var int Port;
};


struct stRemotePlayers
{
    var string szAlias;
    var INT    iPing;
    var INT    iGroupID;
    var INT    iLobbySrvID;
    var INT    iSkills;
    var INT    iRank;
    var string szTime;
};

struct stGameTypeAndMap
{
    var string szMap;
//    var string szGameLoc;
    var string szGameType;
};

struct stGameData
{
    var BOOL        bUsePassword;
    var BOOL        bDedicatedServer;
//    var INT         iTimeMap;
    var INT         iRoundsPerMatch;
    var INT         iRoundTime;
    var INT         iBetTime;
    var INT         iBombTime;
    var BOOL        bShowNames;
    var BOOL        bInternetServer;
    var BOOL        bFriendlyFire;
    var BOOL        bAutoBalTeam;
    var BOOL        bTKPenalty;
    var BOOL        bRadar;
    var BOOL        bAdversarial;
    var BOOL        bRotateMap;
    var BOOL        bAIBkp;
    var BOOL        bForceFPWeapon;
//#ifdef R6PUNKBUSTER
    var BOOL        bPunkBuster;
//#endif R6PUNKBUSTER
    var INT         iNumMaps;
    var INT         iNumTerro;
    var INT         iPort;

    var string      szName;
    var string      szModName; // MPF
    var INT         iMaxPlayer; 
    var INT         iNbrPlayer;
	var string      szGameDataGameType;
    var string      szGameType;
    var string      szCurrentMap;
    var string      szMessageOfDay;
    var string      szGameVersion;
    // Variable portion of game data buffer
//    var array<string> mapList;
    var array<stGameTypeAndMap> gameMapList;
    // List of remote players, filled only for selected server
    var array<stRemotePlayers> playerList;
    // Data used only if setting self up as a server
    var string      szPassword;

};

struct stGameServer
{
    // Basic information on server
    var INT         iGroupID;
    var INT         iLobbySrvID;
    var INT         iBeaconPort;
//    var INT         iID;
    var INT         iPing;
    var string      szIPAddress;
    var string      szAltIPAddress;
    var BOOL        bUseAltIP;

    // flags - used mostly for menus
    var BOOL        bDisplay;    // Display to user in server list
    var BOOL        bFavorite;
    var BOOL        bSameVersion;
    var string      szOptions;

    // Fixed portion of game data buffer
    var stGameData  sGameData;
};

struct stFilterSettings
{
    var BOOL    bDeathMatch;
    var BOOL    bTeamDeathMatch;
    var BOOL    bDisarmBomb;
    var BOOL    bHostageRescueAdv;
    var BOOL    bEscortPilot;
    var BOOL    bMission;
    var BOOL    bTerroristHunt;
    var BOOL    bTerroristHuntAdv;//MissionPack1    // MPF
    var BOOL    bScatteredHuntAdv;//MissionPack1
    var BOOL    bCaptureTheEnemyAdv;//MissionPack1
    var BOOL    bKamikaze;//MissionPack1 for MissionPack2
    var BOOL    bHostageRescueCoop;
    var BOOL    bDefend;
    var BOOL    bRecon;
    var BOOL    bSquadDeathMatch;
    var BOOL    bSquadTeamDeathMatch;
    var BOOL    bDebugGameMode;
    var BOOL    bUnlockedOnly;
    var BOOL    bFavoritesOnly;
    var BOOL    bDedicatedServersOnly;
    var BOOL    bServersNotEmpty;
    var BOOL    bServersNotFull;
    var BOOL    bResponding;
    var BOOL    bSameVersion;
//#ifdef R6PUNKBUSTER
    var BOOL    bPunkBusterServerOnly;
//#endif R6PUNKBUSTER    
    var string  szHasPlayer;
    var INT     iFasterThan;

};
//------------------
// Member Lists
//------------------

var array<string>           m_favoriteServersList;
var array<stGameServer>     m_GameServerList;
var array<stValidationResponse> m_ValidResponseList;
var array<stValidationResponse> m_ModValidResponseList;
var array<int>              m_GSLSortIdx;

//------------------
// Member Variables
//------------------

// Detailed information on the selected server

var INT              m_iSelSrvIndex;

// Filter Settings

var config stFilterSettings m_Filters;

// Beacon receiver

var ClientBeaconReceiver    m_ClientBeacon;

// Information on server

var BOOL m_bDedicatedServer;

var BOOL m_bServerListChanged;       // Flag to indicate that a change in the server list was detected
var BOOL m_bServerInfoChanged;       // Flag to indicate that a change in the server info was detected

// Detailed information on a game the user wishes to create

var stGameServer    m_CrGameSrvInfo;

var string m_szGameVersion;          // Game version as indicated in R6RSVersion.h

var BOOL m_bIndRefrInProgress;       // Individual refresh in progress
var INT  m_iIndRefrIndex;            // Index of server on which we are doing an individual refresh

var config BOOL m_bSavePWSave;              // Save password saved value
var config BOOL m_bAutoLISave;              // Auto login saved value

//-----------------------------
// Native Function definitions
// ----------------------------

native(1222) final function       NativeInitFavorites();
native(1223) final function       NativeUpdateFavorites();
native(1225) final function   INT NativeGetPingTime( coerce string IpAddr );
native(1202) final function   INT NativeGetPingTimeOut();
native(1278) final function   INT NativeGetMilliSeconds ();
native(1206) final function	  SortServers( INT _iSortType, BOOL _bAscending);
native(1236) final function       NativeResetSvrContainer();
native(1229) final function       NativeFillSvrContainer();
native(1291) final function       NativeSetOwnSvrPort( INT iPort );
native(1292) final function   INT NativeGetOwnSvrPort();
native(1351) final function   INT NativeGetLobbyID();
native(1352) final function   INT NativeGetGroupID();
native(1355) final function   INT NativeGetMaxPlayers();
native(1314) final function   INT GetDisplayListSize();

//=============================================================================
// Returns the values that will be displayed in the server list
//=============================================================================
function getServerListItem( INT iSortIdx, OUT stGameServer _stGameServer)
{
    Local INT index;

    index = m_GSLSortIdx[iSortIdx];

	_stGameServer.bFavorite					= m_GameServerList[index].bFavorite;
	_stGameServer.bSameVersion				= m_GameServerList[index].bSameVersion;
    _stGameServer.szIPAddress				= m_GameServerList[index].szIPAddress;
    _stGameServer.iPing						= m_GameServerList[index].iPing;

    _stGameServer.sGameData.szName			= m_GameServerList[index].sGameData.szName;
    _stGameServer.sGameData.szCurrentMap	= m_GameServerList[index].sGameData.szCurrentMap;
    _stGameServer.sGameData.iMaxPlayer		= m_GameServerList[index].sGameData.iMaxPlayer;
    _stGameServer.sGameData.iNbrPlayer		= m_GameServerList[index].sGameData.iNbrPlayer;
    _stGameServer.sGameData.szGameDataGameType= m_GameServerList[index].sGameData.szGameDataGameType;
	_stGameServer.sGameData.bUsePassword	= m_GameServerList[index].sGameData.bUsePassword;
	_stGameServer.sGameData.bDedicatedServer = m_GameServerList[index].sGameData.bDedicatedServer;
//#ifdefR6PUNKBUSTER
	_stGameServer.sGameData.bPunkBuster		= m_GameServerList[index].sGameData.bPunkBuster;
//#endif
}



//=============================================================================
// Set the "display" flag for each of the servers based on the current filter
// settings.
//=============================================================================

function UpdateFilters()
{
	local R6ModMgr pModMgr;
    local INT i,j;
    local BOOL bFound, bIsRavenShield;
    local string szCurrentMod;

	pModMgr = class'Actor'.static.GetModMgr();
	szCurrentMod = pModMgr.m_pCurrentMod.m_szKeyWord;
	bIsRavenShield = pModMgr.IsRavenShield();

    for ( i = 0; i < m_GameServerList.length; i++)
    {

        // By default, we display the server, then look for resaons to omit it from the list

        m_GameServerList[i].bDisplay = TRUE;

        // First check game mode filters

        if ( !m_Filters.bDeathMatch && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_DeathmatchMode" )
            m_GameServerList[i].bDisplay = FALSE;
            
        if ( !m_Filters.bTeamDeathMatch && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_TeamDeathmatchMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bDisarmBomb && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_BombAdvMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bHostageRescueAdv && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_HostageRescueAdvMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bEscortPilot && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_EscortAdvMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bMission && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_MissionMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bTerroristHunt && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_TerroristHuntCoopMode")
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bHostageRescueCoop && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_HostageRescueCoopMode" )   // TODO
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bDefend && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_DefendCoopMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bRecon && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_ReconCoopMode" )
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bSquadDeathMatch && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_SquadDeathmatch" )    // TODO
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bSquadTeamDeathMatch && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_SquadTeamDeathmatch" )  // TODO
            m_GameServerList[i].bDisplay = FALSE;

        if ( !m_Filters.bDebugGameMode && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_NoRulesMode" )
            m_GameServerList[i].bDisplay = FALSE;

		if ( !bIsRavenShield ) // This is suppose to be derivate in a class like the menu stuff... for the sdk
        {
			// Thoses 2 conditions not supposed to happen there
			// if is a Ravenshield server or the ModName is different than the current mod name
			if ( (m_GameServerList[i].sGameData.szModName == "") ||
				!(m_GameServerList[i].sGameData.szModName ~= szCurrentMod) )
        {
				m_GameServerList[i].bDisplay = FALSE;
				continue;
			}

            if ( !m_Filters.bTerroristHuntAdv && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_TerroristHuntAdvMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( !m_Filters.bScatteredHuntAdv && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_ScatteredHuntAdvMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( !m_Filters.bCaptureTheEnemyAdv && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_CaptureTheEnemyAdvMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( !m_Filters.bKamikaze && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_KamikazeMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( !m_Filters.bDebugGameMode && m_GameServerList[i].sGameData.szGameDataGameType == "RGM_NoRulesMode" )
                m_GameServerList[i].bDisplay = FALSE;
        }
        else
        {
			if ( (m_GameServerList[i].sGameData.szModName != "") &&	!(m_GameServerList[i].sGameData.szModName ~= szCurrentMod) )
			{
				m_GameServerList[i].bDisplay = FALSE;
				continue;
			}

            if ( m_GameServerList[i].sGameData.szGameDataGameType == "RGM_TerroristHuntAdvMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( m_GameServerList[i].sGameData.szGameDataGameType == "RGM_ScatteredHuntAdvMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( m_GameServerList[i].sGameData.szGameDataGameType == "RGM_CaptureTheEnemyAdvMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( m_GameServerList[i].sGameData.szGameDataGameType == "RGM_KamikazeMode" )  
                m_GameServerList[i].bDisplay = FALSE;

            if ( m_GameServerList[i].sGameData.szGameDataGameType == "RGM_NoRulesMode" )
                m_GameServerList[i].bDisplay = FALSE;
        }
        
        // Has Player 
        if ( m_Filters.szHasPlayer != "" )
        {
            bFound = FALSE;
            for ( j = 0; j < m_GameServerList[i].sGameData.playerList.length; j++)
            {
                if ( InStr( Caps( m_GameServerList[i].sGameData.playerList[j].szAlias ), Caps( m_Filters.szHasPlayer ) ) != -1 )
                    bFound = TRUE;
            }
            if ( !bFound )
                m_GameServerList[i].bDisplay = FALSE;
        }

        // unlockedOnly
        if ( m_Filters.bUnlockedOnly &&  m_GameServerList[i].sGameData.bUsePassword )
            m_GameServerList[i].bDisplay = FALSE;

        // Favorites only
        if( m_Filters.bFavoritesOnly && !m_GameServerList[i].bFavorite)
            m_GameServerList[i].bDisplay = FALSE;

        // Dedicated servers only

        if ( m_Filters.bDedicatedServersOnly && !m_GameServerList[i].sGameData.bDedicatedServer )
            m_GameServerList[i].bDisplay = FALSE;

        // Server Not Empty
        if ( m_Filters.bServersNotEmpty  && ( m_GameServerList[i].sGameData.iNbrPlayer == 0 ) )
            m_GameServerList[i].bDisplay = FALSE;

        // Server Not Full
        if ( m_Filters.bServersNotFull && ( m_GameServerList[i].sGameData.iNbrPlayer >= m_GameServerList[i].sGameData.iMaxPlayer ) )
            m_GameServerList[i].bDisplay = FALSE;

//#ifdef R6PUNKBUSTER
        if ( m_Filters.bPunkBusterServerOnly && !m_GameServerList[i].sGameData.bPunkBuster )
            m_GameServerList[i].bDisplay = FALSE;
//#endif R6PUNKBUSTER    

        // Responding

        if ( m_Filters.bResponding && m_GameServerList[i].iPing >= 1000 )   // 1000 = ping time when server does not respond
            m_GameServerList[i].bDisplay = FALSE;

        // Faster Than

        if ( m_Filters.iFasterThan > 0 && m_GameServerList[i].iPing > m_Filters.iFasterThan)
            m_GameServerList[i].bDisplay = FALSE;

        // Same Version
        if ( m_Filters.bSameVersion &&  !m_GameServerList[i].bSameVersion )
            m_GameServerList[i].bDisplay = FALSE;
    }
}


//=============================================================================
// IsAFavorite - Checks if the passed server is a member of the 
// favorite server list.
//=============================================================================
function BOOL IsAFavorite( string szIPAddress )
{
    local INT  i;
    local BOOL bFound;

    bFound = FALSE;

    for ( i = 0; i < m_favoriteServersList.length && !bFound; i++ )
    {
        if ( szIPAddress == m_favoriteServersList[i] )
        {
            bFound = TRUE;
        }
    }
    
    return bFound;
}

//=============================================================================
// AddToFavorites - Add the server to the list of favorite servers.  This
// list is kept in an ini file (r6gameservice.ini).  The function argument is
// the index of the server in the list of servers: m_GameServerList.
//=============================================================================
function AddToFavorites( INT sortedListIdx )
{
    local INT  i;
    local BOOL found;
    local INT  serverListIndex;

    serverListIndex = m_GSLSortIdx[sortedListIdx];

    m_GameServerList[serverListIndex].bFavorite = TRUE;

    // Just check to make sure the server is not already in the list

    found = FALSE;
    for ( i = 0; i < m_favoriteServersList.length && !found; i++ )
    {
        if (  m_GameServerList[serverListIndex].szIPAddress == m_favoriteServersList[i])
            found = TRUE;
    }
    
    // If not found, add to list and update ini file.

    if ( !found )
    {
        m_favoriteServersList[m_favoriteServersList.length] = m_GameServerList[serverListIndex].szIPAddress;
        NativeUpdateFavorites();
    }
}


//=============================================================================
// DelFromFavorites - Remove the server from the list of favorite servers.  This
// list is kept in an ini file (r6gameservice.ini).  The function argument is
// the index of the server in the list of servers: m_GameServerList.
//=============================================================================
function DelFromFavorites( INT sortedListIdx )
{
    local INT  i;
    local INT  favoritesListIndex;
    local BOOL found;
    local INT  serverListIndex;

    serverListIndex = m_GSLSortIdx[sortedListIdx];

    m_GameServerList[serverListIndex].bFavorite = FALSE;

    // Go through the list to find the correct server to remove

    found = FALSE;
    for ( i = 0; i < m_favoriteServersList.length && !found; i++ )
    {
        if (  m_GameServerList[serverListIndex].szIPAddress == m_favoriteServersList[i])
        {
            found = TRUE;
            favoritesListIndex = i;
        }
    }
    if ( found )
    {
        m_favoriteServersList.Remove(favoritesListIndex, 1); // Remove this server from list
        NativeUpdateFavorites();                        // Update the ini file
    }

}

//=============================================================================
// SetSelectedServer: Set the selcted server to the passed value
//=============================================================================
function SetSelectedServer( INT iServerListIndex)
{
    if ( iServerListIndex > m_GameServerList.length || m_GameServerList.length == 0 )  // Check index is valid
        return;

    m_iSelSrvIndex = m_GSLSortIdx[iServerListIndex];
}

//=============================================================================
// SetGameVersionRelease: Sets the member variables used to hold the game 
// version name and the game release name
//=============================================================================
function Created()
{
    m_szGameVersion = class'Actor'.static.GetGameVersion();
}
//=============================================================================
// getSvrData: Get the gamedata of a server from the ClientBeaconReceiver class
//=============================================================================
function stGameData getSvrData( INT iBeaconIdx )
{
    local stGameData    sGameData;
    local stGameTypeAndMap sMapAndGame;
    local stRemotePlayers remPlayer;
    local INT             j;

    sGameData.bUsePassword      = m_ClientBeacon.GetLocked(iBeaconIdx);
    sGameData.bDedicatedServer  = m_ClientBeacon.GetDedicated(iBeaconIdx);
    sGameData.iRoundsPerMatch    = m_ClientBeacon.GetRoundsPerMap(iBeaconIdx);    
//    sGameData.iTimeMap          = m_ClientBeacon.GetMapTime(iBeaconIdx)/60.0;
    sGameData.iRoundTime        = m_ClientBeacon.GetRoundTime(iBeaconIdx);
    sGameData.iBetTime          = m_ClientBeacon.GetBetTime(iBeaconIdx);
    sGameData.iBombTime         = m_ClientBeacon.GetBombTime(iBeaconIdx);
    sGameData.bShowNames        = m_ClientBeacon.GetShowEnemyNames(iBeaconIdx);
    sGameData.bInternetServer   = m_ClientBeacon.GetInternetServer(iBeaconIdx);
    sGameData.bFriendlyFire     = m_ClientBeacon.GetFriendlyFire(iBeaconIdx);
    sGameData.bAutoBalTeam      = m_ClientBeacon.GetAutoBalanceTeam(iBeaconIdx);
    sGameData.bRadar            = m_ClientBeacon.GetRadar(iBeaconIdx);
    sGameData.bTKPenalty        = m_ClientBeacon.GetTKPenalty(iBeaconIdx);
    sGameData.iPort             = m_ClientBeacon.GetPortNumber(iBeaconIdx);
    sGameData.szGameDataGameType= m_ClientBeacon.GetCurrGameType(iBeaconIdx);
    sGameData.szName            = m_ClientBeacon.GetSvrName(iBeaconIdx);
    sGameData.szModName         = m_ClientBeacon.GetModName(iBeaconIdx); // MPF 
    sGameData.iNumTerro         = m_ClientBeacon.GetNumTerrorists(iBeaconIdx);
    sGameData.bAIBkp            = m_ClientBeacon.GetAIBackup(iBeaconIdx);
    sGameData.bRotateMap        = m_ClientBeacon.GetRotateMap(iBeaconIdx);
    sGameData.bForceFPWeapon    = m_ClientBeacon.GetForceFirstPersonWeapon(iBeaconIdx);
//#ifdef R6PUNKBUSTER
    sGameData.bPunkBuster       = m_ClientBeacon.GetPunkBusterEnabled(iBeaconIdx);
//#endif R6PUNKBUSTER

    sGameData.szGameVersion     = m_ClientBeacon.GetServerGameVersion(iBeaconIdx);

//    if ( sGameData.szName == "" )  // If no name, use computer name
//    {
//        sGameData.szName      = m_ClientBeacon.GetBeaconText(iBeaconIdx);
//        sGameData.szName      = left(sGameData.szName, InStr(sGameData.szName, " "));  // TODO Replace this with
//                                                                 // server name entered in menus
//    }

    sGameData.iMaxPlayer   = m_ClientBeacon.GetMaxPlayers(iBeaconIdx);
    sGameData.iNbrPlayer   = m_ClientBeacon.GetNumPlayers(iBeaconIdx);
    sGameData.szCurrentMap = m_ClientBeacon.GetFirstMapName(iBeaconIdx);

    sGameData.gameMapList.Remove(0, sGameData.gameMapList.length);
    for ( j = 0; j < m_ClientBeacon.GetMapListSize(iBeaconIdx); j++ ) 
    {
        sMapAndGame.szMap        = m_ClientBeacon.GetOneMapName(iBeaconIdx,j);
        sMapAndGame.szGameType   = m_ClientBeacon.GetGameType(iBeaconIdx,j);
//        sMapAndGame.szGameLoc    = m_ClientBeacon.GetGameName(iBeaconIdx,j);
        sGameData.gameMapList[j] = sMapAndGame;
//        sGameData.mapList[j] = m_ClientBeacon.GetOneMapName(iBeaconIdx,j);
    }

    sGameData.playerList.Remove(0, sGameData.playerList.length);
    for ( j = 0; j < m_ClientBeacon.GetPlayerListSize(iBeaconIdx); j++ ) 
    {
        remPlayer.szAlias = m_ClientBeacon.GetPlayerName(iBeaconIdx,j);
        remPlayer.szTime  = m_ClientBeacon.GetPlayerTime(iBeaconIdx,j);
        remPlayer.iPing   = m_ClientBeacon.GetPlayerPingTime(iBeaconIdx,j);
        remPlayer.iSkills  = m_ClientBeacon.GetPlayerKillCount(iBeaconIdx,j);
        sGameData.playerList[j] = remPlayer;
    }

//    sGameData.gameNameList.Remove(0, sGameData.gameNameList.length);
//    for ( j = 0; j < m_ClientBeacon.GetGameNameListSize(iBeaconIdx); j++ ) 
//    {
//        sGameData.gameNameList[j] = m_ClientBeacon.GetGameName(iBeaconIdx,j);
//    }


    return sGameData;
}


//=============================================================================
// Simple bubble sort to list servers in order of ping time
//=============================================================================

function SortPlayersByKills( BOOL _bAscending, INT _iIdx )
{

    local INT     i;
    local INT     j;
    local BOOL   bSwap;
    local INT     iListSize;
    local stRemotePlayers tempPlayer;

    iListSize = m_GameServerList[_iIdx].sGameData.playerList.length;

    for ( i = 0; i < iListSize - 1; i++)
    {
        for ( j = 0; j < iListSize - 1 - i; j++ )
        {
            if ( _bAscending )
                bSwap =  m_GameServerList[_iIdx].sGameData.playerList[j].iSkills > 
                         m_GameServerList[_iIdx].sGameData.playerList[j + 1].iSkills;
            else
                bSwap =  m_GameServerList[_iIdx].sGameData.playerList[j].iSkills <
                         m_GameServerList[_iIdx].sGameData.playerList[j + 1].iSkills;

            if ( bSwap )
            {
                tempPlayer = m_GameServerList[_iIdx].sGameData.playerList[j];
                m_GameServerList[_iIdx].sGameData.playerList[j] = m_GameServerList[_iIdx].sGameData.playerList[j + 1];
                m_GameServerList[_iIdx].sGameData.playerList[j + 1] = tempPlayer;
            }
        }
    }

}
function INT GetTotalPlayers()
{
    local INT i;
    local INT iTotal;
    local INT iMaxPlayers;

    iTotal = 0;
    iMaxPlayers = NativeGetMaxPlayers();

    for ( i = 0; i < m_GameServerList.Length; i++ )
    {
        if ( m_GameServerList[i].sGameData.iNbrPlayer <= iMaxPlayers && m_GameServerList[i].sGameData.iNbrPlayer > 0 )
            iTotal += m_GameServerList[i].sGameData.iNbrPlayer;
    }

    return iTotal;
}

defaultproperties
{
}
