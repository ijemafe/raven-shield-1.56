//=============================================================================
// Snow.
//=============================================================================
class R6SnowEmitter4 extends R6WeatherEmitter
    placeable;

simulated function PostBeginPlay()
{
    Emitters[0].m_iUseFastZCollision = 1;
    Emitters[0].m_iPaused = 1;
}

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitterSnowWeather4
         MaxParticles=300
         UseCollision=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         AutomaticInitialSpawning=False
         FadeOutStartTime=1.000000
         FadeInEndTime=1.000000
         ParticlesPerSecond=100.000000
         InitialParticlesPerSecond=100.000000
         SecondsBeforeInactive=2678400.000000
         WarmupTicksPerSecond=300.000000
         Texture=Texture'R6SFX_T.Winter.Snow'
         FadeOutFactor=(W=2.000000,X=2.000000,Y=2.000000,Z=2.000000)
         StartLocationRange=(X=(Min=-1024.000000),Y=(Min=-512.000000,Max=512.000000),Z=(Min=150.000000,Max=350.000000))
         StartSizeRange=(X=(Min=0.500000,Max=1.500000),Y=(Min=0.500000,Max=1.500000),Z=(Min=0.500000,Max=1.500000))
         LifetimeRange=(Min=5.000000,Max=5.000000)
         StartVelocityRange=(X=(Min=200.000000,Max=500.000000),Y=(Min=-5.000000,Max=5.000000),Z=(Min=-350.000000,Max=-400.000000))
         Name="SpriteEmitterSnowWeather4"
     End Object
     Emitters(0)=SpriteEmitter'R6SFX.SpriteEmitterSnowWeather4'
}
