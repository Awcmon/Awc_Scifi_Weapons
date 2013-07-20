//inspired from the Murumasa in Megaman Battle Network 3 and Team Fortress 2
//Jacked code from Fists swep.

AddCSLuaFile( "shared.lua" )

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false



SWEP.Slot				= 3
SWEP.SlotPos			= 10


SWEP.PrintName               = "Murumasa"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "Left by a master..."           
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase"
SWEP.Category			= "Sci-fi Weapons"

SWEP.UseHands = true

SWEP.HoldType = "melee2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
/*SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(3.174, -3.175, 10.793), angle = Angle(-20.952, 0, 0) }
}*/

/*--------------------------
Primary Functions Init
---------------------------*/
//SWEP.Primary.Sound = Sound( "Weapon_AK47.Single" )
SWEP.Primary.Sound = Sound( "Weapon_Crowbar.Single" )
SWEP.HitSound = Sound( "Weapon_Crowbar.Melee_Hit" )
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 120
SWEP.Primary.Ammo            = "smg1"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 10
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 0.3




SWEP.SprintPos 				= Vector(-10,-20,-10)
SWEP.SprintAngle 			= Angle(0,0,-90)
SWEP.RecoilUp1 				= -2
SWEP.RecoilUp2				= 2
SWEP.RecoilSide1			= -2
SWEP.RecoilSide2			= 2
SWEP.RecoilRoll1			= -2
SWEP.RecoilRoll2			= 2

SWEP.VMOffsetRight 			= 3
SWEP.VMOffsetUp 			= 1
SWEP.VMOffsetForward 		= -3

SWEP.DrawAnimSpeed 			= 5

SWEP.CanFireOnSprint		= 0

SWEP.HitDistance 			= 100


//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.1						//Maximum spread
SWEP.SpreadMinimum			= 0.003						//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 1.2						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 0.2						//Multiplied Amount: How much your raw velocity effects spread USELESS
SWEP.SpreadJumpMod			= 1.3						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.5						//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 2						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2						//Multiplied Amount: What rate does spread go back down to the minimum? USELESS
SWEP.SpreadIncreaseRate		= 0.005						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 5.5						//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()					//Don't touch this either.


function SWEP:PrimaryAttack()

	if( self.Owner:KeyDown(IN_SPEED) && self.CanFireOnSprint == 0) then return end
	
//	self:OnPrimaryAttack()
	
//	print(self.CurSpread)


//	RecoPitch = RecoPitch - 1

	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end

	self.Owner:EmitSound( self.Primary.Sound )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self:SendWeaponAnim( ACT_VM_HITCENTER )

//	timer.Simple( 0.05, function()
		if ( !IsValid( self ) || !IsValid( self.Owner ) || !self.Owner:GetActiveWeapon() || self.Owner:GetActiveWeapon() != self ) then return end
		
		local tr = util.TraceLine( {
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.HitDistance,
			filter = self.Owner
		} )

		if ( !IsValid( tr.Entity ) ) then 
			tr = util.TraceHull( {
				start = self.Owner:GetShootPos(),
				endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * (self.HitDistance + (( 100 - self.Owner:Health())*2)),
				filter = self.Owner,
				mins = self.Owner:OBBMins() / 1,
				maxs = self.Owner:OBBMaxs() / 1
			} )
		end

		if ( tr.Hit ) then self.Owner:EmitSound( self.HitSound ) end

		if ( IsValid( tr.Entity ) && ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() ) ) then
			local dmginfo = DamageInfo()
			dmginfo:SetDamage( self.Primary.Damage + (((100 - self.Owner:Health())^3)/1000) )
//			print( self.Primary.Damage + (((100 - self.Owner:Health())^3)/1000) )
			dmginfo:SetInflictor( self )
			dmginfo:SetDamageForce( self.Owner:GetAimVector()*10 )
			local attacker = self.Owner
			if ( !IsValid( attacker ) ) then attacker = self end
			dmginfo:SetAttacker( attacker )
		
			if (SERVER) then 
				tr.Entity:TakeDamageInfo( dmginfo )
			end
		end
		
//	end )
	
end

function SWEP:SecondaryAttack()
	if(self.Owner:IsValid()) then
		if(SERVER) then
			self.Owner:EmitSound( self.Primary.Sound )
			self.Owner:SetHealth(1)
		end
	end

end

function SWEP:Think()

	self.Owner:SetWalkSpeed( 250 +(((100 - self.Owner:Health())^3)/1000))
	self.Owner:SetRunSpeed( 500 +(((100 - self.Owner:Health())^3)/1000))
end

function SWEP:SpeedReset()
	if (self.Owner) then
		if (self.Owner:IsValid()) then
			self.Owner:SetWalkSpeed(250)
			self.Owner:SetRunSpeed(500)
		end
	end
end

function SWEP:Holster()
	self:SpeedReset()
	
	return true
end

