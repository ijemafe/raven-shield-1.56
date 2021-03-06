//=============================================================================
//  R6ClaymoreUnit.uc : (add small description)
//  Copyright 2002 Ubi Soft, Inc. All Rights Reserved.
//
//  Revision history:
//    2002/03/09 * Created by Rima Brek
//=============================================================================
class R6ClaymoreUnit extends R6DemolitionsUnit;

function HurtPawns()
{
    local R6InteractiveObject anObject;
    local R6Pawn              aPawn;
    local R6Pawn              aPawnInstigator;
    local R6DemolitionsUnit   aDemoUnit;

    local FLOAT               fDistFromGrenade;
    local vector              vExplosionMomentum;

	local vector			  vActorDir;
	local vector			  vFacingDir;
    local INT                 _iHealth;
    local INT                 _PawnsHurtCount;
    local BOOL                _bCompilingStats;

    local Controller          aC;
    local R6PlayerController  aPC;

    aPawnInstigator = R6Pawn(Instigator);
    _bCompilingStats = R6AbstractGameInfo(Level.Game).m_bCompilingStats;
    //Destroy demo units within range
    foreach VisibleCollidingActors( class'R6DemolitionsUnit', aDemoUnit, m_fKillBlastRadius, Location )
    {
        if(aDemoUnit != self)
            aDemoUnit.DestroyedByImpact();
    }

    vFacingDir = vector(rotation + rot(0,32768,0));
	
    foreach VisibleCollidingActors(class'R6InteractiveObject', anObject, m_fExplosionRadius, Location )
	{
		// claymore explodes towards its frontal hemisphere...
		vActorDir = anObject.Location - Location;
		vActorDir.Z = 0;
		vActorDir = Normal(vActorDir);

        // Distance from grenade
        fDistFromGrenade = VSize( anObject.Location - Location );

        if((fDistFromGrenade > m_fKillBlastRadius * 0.5) && ((vActorDir dot vFacingDir) < 0.741181))
			continue;	
		
		if( fDistFromGrenade <= m_fExplosionRadius )
		{
    		DistributeDamage(anObject, Location);
		}
	}

    //log("Claymore Facing Dir: "$vFacingDir);
    foreach CollidingActors( class'R6Pawn', aPawn, m_fExplosionRadius, Location )
    {
		// check for friendly fire if multiplayer		
		if( (Level.NetMode != NM_Standalone) 
		   && ( (!aPawnInstigator.m_bCanFireFriends  && aPawnInstigator.IsFriend(aPawn))  
			   || (!aPawnInstigator.m_bCanFireNeutrals && aPawnInstigator.IsNeutral(aPawn)) )
		  )
		  	  continue;		
		
        // Don't affect dead pawns...
        if( aPawn.m_eHealth != HEALTH_Dead )
        {
            if( aPawn.PawnCanBeHurtFrom(Location) )
            {
                // Distance from grenade
                fDistFromGrenade = VSize( aPawn.Location - Location );
	            // claymore explodes towards its frontal hemisphere...
	            vActorDir = aPawn.location - location;
	            vActorDir.Z = 0;
	            vActorDir = Normal(vActorDir);
         
                // If the pawn is inside the kill radius... kill him    0.741181 = 25 degrees
                if((fDistFromGrenade <= m_fKillBlastRadius * 0.5 ) || // too close to the mine, he dies
                   (((vActorDir dot vFacingDir) > 0.741181) && (fDistFromGrenade <= m_fKillBlastRadius)))  //close and in front of the mine he dies too
                {
                    // Temporary momentum, quarter of distance from grenade...
                    vExplosionMomentum = (aPawn.location - Location) * 0.25f;

				    // Should damage a specific body part (eBoneTarget) - need to be implemented in R6Pawn
				    aPawn.ServerForceKillResult(4);  //Force R6TakeDamage to kill the pawn
				    aPawn.R6TakeDamage( m_iEnergy, m_iEnergy, aPawnInstigator, aPawn.Location , vExplosionMomentum, 0);
				    aPawn.ServerForceKillResult(0);  //Reset Kill to Normal
                    if((aPawnInstigator != none) && !aPawnInstigator.IsFriend(aPawn))
                    {		
                        _PawnsHurtCount++;
                        R6AbstractGameInfo(Level.Game).IncrementRoundsFired(aPawnInstigator, _bCompilingStats);
                    }               
                
                    #ifdefDEBUG if( bShowLog ) log( "Pawn " $ aPawn $ " was killed by a grenade !" ); #endif
                }
                // If not killed, add it to a list of damaged pawns.  This has to 
                // be done because we need to do a trace to the bone that will be
                // hit, and Trace can't be used inside of a VisibleCollidingActors loop.
                else if((vActorDir dot vFacingDir) > 0.741181)
                {
                    _iHealth = aPawn.m_eHealth;
		            DistributeDamage(aPawn, location);
                    if ((_iHealth != aPawn.m_eHealth) && 
                          (aPawnInstigator != none) && !aPawnInstigator.IsFriend(aPawn))
                    {
                        _PawnsHurtCount++;
                        R6AbstractGameInfo(Level.Game).IncrementRoundsFired(aPawnInstigator, _bCompilingStats);
                    }
                }
            }
        }
    }
		
    if (_PawnsHurtCount==0)
    {
        R6AbstractGameInfo(Level.Game).IncrementRoundsFired(aPawnInstigator, _bCompilingStats);
    }
    // Controller shake
    for( aC=Level.ControllerList; aC!=none; aC=aC.NextController )
    {
        if(aC.Pawn!=none && aC.Pawn.m_ePawnType==PAWN_Rainbow && aC.Pawn.IsAlive())
        {
            aPC = R6PlayerController(aC);
            if( aPC != none )
            {
			    fDistFromGrenade = VSize( Location - aPC.Pawn.Location );
                if(fDistFromGrenade<m_fShakeRadius)
                {
                    aPC.R6Shake( 1.0f, m_fShakeRadius-fDistFromGrenade, 0.05f );
                    aPC.ClientPlaySound(m_sndEarthQuake, SLOT_SFX);
                }
            }
        }
    }
}

defaultproperties
{
     m_sndExplodeMetal=Sound'Gadget_Claymore.Play_Claymore_Expl_Metal'
     m_sndExplodeDirt=Sound'Gadget_Claymore.Play_Claymore_Expl_Dirt'
     m_pExplosionParticles=Class'R6SFX.R6ClaymoreMineEffect'
     m_pExplosionLight=Class'R6SFX.R6GrenadeLight'
     m_iEnergy=2000
     m_fExplosionRadius=700.000000
     m_fKillBlastRadius=400.000000
     m_szAmmoName="Claymore Mine"
     StaticMesh=StaticMesh'R63rdWeapons_SM.Items.R63rdClaymore'
}
