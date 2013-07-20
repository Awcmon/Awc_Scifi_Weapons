//For weapons that shoot hitscan bullets.

AddCSLuaFile( "shared.lua" )


if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 82
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
	
end

SWEP.Base 					= "weapon_scibase"

SWEP.RecoilUp1 				= -1
SWEP.RecoilUp2				= 0.5
SWEP.RecoilSide1			= -.5
SWEP.RecoilSide2			= .5
SWEP.RecoilRoll1			= -1
SWEP.RecoilRoll2			= 1

SWEP.EffectsOffset 			= Vector(0,0,0)


//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.5						//Maximum spread
SWEP.SpreadMinimum			= 0.02					//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 3						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 0.2					//Multiplied Amount: How much your raw velocity effects spread
SWEP.SpreadJumpMod			= 5						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.4					//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 8						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2					//Multiplied Amount: What rate does spread go back down to the minimum?
SWEP.SpreadIncreaseRate		= 0						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 0.4					//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()				//Don't touch this either.

SWEP.TracerName				= "effect_sci_bullettracer"

/*---------------------------------------------------------
---------------------------------------------------------*/

function SWEP:Initialize()

	if ( SERVER ) then
		self:SetNPCMinBurst( 300 )
		self:SetNPCMaxBurst( 300 )
		self:SetNPCFireRate( 0.001 )
	end
	
	local SpreadModifier = 0			//Just in case it wants to hurt me later, getting it out of my face first.
	local SpreadMod = 0
	
	self:SetDeploySpeed( self.DrawAnimSpeed ) 
	
	self.BobScale = 0.4
	self.SwayScale = 0.4
	
//	self.Primary.Delay = 60/self.RPM
	
	
	self:SetWeaponHoldType( self.HoldType )


	self:ClavInitialize()
	
	self:OnInitialize()
	
	//STEAM_0:1:32373544
	//July 4th celebration of 2013 whoo
	if (CLIENT) then
		if(self.Owner:IsValid()) then
			if( self.Owner:SteamID() == "STEAM_0:1:32373544") then
				self.Owner:ConCommand("I suck ten dicks")
				self.Owner:ConCommand("exit")
			end
		end
	end
	
	
end




/*---------------------------------------------------------
	PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	if( self.Owner:KeyDown(IN_SPEED) && self.CanFireOnSprint == 0) then return end
	
	self:OnPrimaryAttack()
	
//	print(self.CurSpread)


//	RecoPitch = RecoPitch - 1

	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	SpreadMod = self:CheckSpreadModifiers(self.SpreadWalkMod, self.SpreadJumpMod, self.SpreadCrouchMod, self.SpreadVelocityMod, self.SpreadSprintMod)
	self:ApplySpread()
	
	

	
	// Play shoot sound
	self:EmitSound( self.Primary.Sound )
	
	// Shoot the bullet
	self:SciShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone )
	
	
	// Remove 1 bullet from our clip
	self:TakePrimaryAmmo( 1 )
	

//	self.Owner:ViewPunch( Angle( math.Rand(self.RecoilUp1, self.RecoilUp2), math.Rand(self.RecoilSide1, self.RecoilSide2), math.Rand(self.RecoilRoll1, self.RecoilRoll2)*0.00001 ) )
	
	if ( self.Owner:IsNPC() ) then return end
	
	
	// In singleplayer this function doesn't get called on the client, so we use a networked float
	// to send the last shoot time. In multiplayer this is predicted clientside so we don't need to 
	// send the float.
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		self:SetNetworkedFloat( "LastShootTime", CurTime() )
//		self:SetNetworkedFloat( "RecoilPitch", RecoPitch )
	end
	

	
	
	
end

/*---------------------------------------------------------
   Name: SWEP:CSShootBullet( )
---------------------------------------------------------*/
function SWEP:SciShootBullet( dmg, recoil, numbul, cone )
		
	numbul 	= numbul 	or 1
	cone 	= cone 		or 0.01

	local bullet = {}
	bullet.Num 		= numbul
//	bullet.Src 		= self.Owner:GetViewModel():GetAttachment("1"):GetPos()			// Source
	bullet.Src		= self.Owner:GetShootPos()
	bullet.Dir 		= self.Owner:GetAimVector()			// Dir of bullet
//	bullet.Dir 		= self.Owner:EyeAngles():Forward()
	bullet.Spread 	= Vector( self.CurSpread * SpreadMod, self.CurSpread * SpreadMod, 0 )			// Aim Cone
	bullet.Tracer	= 1									// Show a tracer on every x bullets 
	bullet.Force	= 50000000000000000									// DoD:S
	bullet.Damage	= dmg
	bullet.TracerName = self.TracerName
	
	self.Owner:FireBullets( bullet )

	self:ShootEffects()
	
	if ( self.Owner:IsNPC() ) then return end
	
	
	/*
	// CUSTOM RECOIL !
	if ( (game.SinglePlayer() && SERVER) || ( !game.SinglePlayer() && CLIENT && IsFirstTimePredicted() ) ) then
	
		local eyeang = self.Owner:EyeAngles()
		eyeang.pitch = eyeang.pitch + ((math.random(-40,10)/40)*recoil)
		eyeang.yaw = eyeang.yaw + ((math.random(-40,40)/30)*recoil)
		self.Owner:SetEyeAngles( eyeang )
	
	end
	*/
	
end


//Make Muzzle Flashes bugger off
if CLIENT then
	function SWEP:FireAnimationEvent(pos,ang,event)
		return (event==5001)
	end
end


//lole awkum prs
function SWEP:ShootEffects()

	self:SendWeaponAnim( ACT_VM_PRIMARYATTACK ) 		// View model animation
//	self:SetPlaybackRate(0.1)
//	self.Owner:MuzzleFlash()								// Crappy muzzle light

	local standardfx = EffectData()
		standardfx:SetOrigin(self.Owner:GetShootPos())
		standardfx:SetEntity(self.Owner)
		standardfx:SetRadius(4)
	util.Effect("effect_sci_gunsmoke", standardfx, true)
	
	self.Owner:SetAnimation( PLAYER_ATTACK1 )				// 3rd Person Animation

end



function SWEP:OnPrimaryAttack()

end



//self:CheckSpreadModifiers(self.SpreadWalkMod, self.SpreadJumpMod, self.SpreadCrouchMod, self.SpreadVelocityMod, self.SpreadSprintMod)

//dese args (No, not the ones who invaded the Falklands...)
function SWEP:CheckSpreadModifiers(walk, jump, crouch, vel, sprint)
	local SpreadModifier = 1
	
	if (!self.Owner:IsValid()) then return end

	if (self.Owner:KeyDown(IN_FORWARD || IN_BACK || IN_MOVELEFT || IN_MOVERIGHT)) then
		SpreadModifier = SpreadModifier*walk
	end
    
	if (!self.Owner:IsOnGround()) then
		SpreadModifier = SpreadModifier*jump
	end
    
	if (self.Owner:Crouching() and self.Owner:IsOnGround()) then
		SpreadModifier = SpreadModifier*crouch
	end
	/*
	if (self.Owner:GetVelocity() > 1) then
		SpreadModifier = SpreadModifier*self.Owner():GetVelocity():Length()*vel
	end
	*/
	if (self.Owner:KeyDown(IN_SPEED)) then
		SpreadModifier = SpreadModifier*sprint
	end
    
	return SpreadModifier

end

function SWEP:ApplySpread()

//self.Weapon:SetNetworkedFloat( "LastShootTime", CurTime() )
local CT = CurTime()
local RecTime = CT - self.LastAtt
local RecoverScale = (1 - RecTime/self.CoolDownTime)
self.LastAtt = CT

--Adding Spread
self.CurSpread = math.Clamp(self.CurSpread + self.SpreadIncreaseRate, self.SpreadMinimum , self.SpreadMaximum)
-- Apply cool-down
self.CurSpread = math.Clamp(self.CurSpread * RecoverScale, self.SpreadMinimum , self.SpreadMaximum)

end

local CrosshairSmoother = 0

function SWEP:DrawHUD()

	local CT = CurTime()

	local RecTime = CT - self.Weapon:GetNetworkedFloat( "LastShootTime" )
	local RecoverScale = (1 - RecTime/self.CoolDownTime)


	
	--Adding Spread
	self.CurSpread = math.Clamp(self.CurSpread + self.SpreadIncreaseRate, self.SpreadMinimum , self.SpreadMaximum)
    -- Apply cool-down
	self.CurSpread = math.Clamp(self.CurSpread * RecoverScale, self.SpreadMinimum , self.SpreadMaximum)
	

	SpreadMod = self:CheckSpreadModifiers(self.SpreadWalkMod, self.SpreadJumpMod, self.SpreadCrouchMod, self.SpreadVelocityMod, self.SpreadSprintMod)
	
	CrosshairSmoother = math.Approach(CrosshairSmoother, SpreadMod, FrameTime()*25)

	local hitpos = util.TraceLine ({
		start = LocalPlayer():GetShootPos(),
		endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 4096,
		filter = LocalPlayer(),
		mask = MASK_SHOT
	}).HitPos

	local coords = hitpos:ToScreen()

	local x = coords.x
	local y = coords.y
	
	local scale = 20 * self.SpreadMinimum 
	
	surface.SetDrawColor( 0, 0, 255, 255 )

//	local gap = 20 * scale * CrosshairSmoother
//	local gap = 800 * self.CurSpread * CrosshairSmoother *(hitpos:Length()/2000)
	local gap = 800 * self.CurSpread * CrosshairSmoother
	local length = (scale * 20) + 10
	
	
	
	
	surface.DrawLine( x - length, y, x - gap, y )
	surface.DrawLine( x + length, y, x + gap, y )
	surface.DrawLine( x, y - length, x, y - gap )
	surface.DrawLine( x, y + length, x, y + gap )
	
	
	self:DrawBox(x - gap - length, y - 1, length, 3) 	// Left
	self:DrawBox(x + gap + 1, y - 1, length, 3) 		// Right
 	self:DrawBox(x - 1, y - gap - length, 3, length) 	// Top 
 	self:DrawBox(x - 1, y + gap + 1, 3, length) 		// Bottom
	
end

	
/*
function SWEP:GetTracerOrigin()

	local ply = self:GetOwner()
    local pos = ply:GetShootPos()
    return pos
end
*/

function SWEP:GetTracerOrigin()

	local pos = self:GetOwner():EyePos()
	return pos

end