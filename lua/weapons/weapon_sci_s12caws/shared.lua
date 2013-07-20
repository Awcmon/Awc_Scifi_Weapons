// Viewkick changes aimpos, viewpunch does not.
// Prop penetrating rounds at the cost of 5 rounds

// Used to fire in short, powerful, accurate bursts.


AddCSLuaFile( "shared.lua" )

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




SWEP.Slot				= 3
SWEP.SlotPos			= 10


SWEP.PrintName               = "S12 CAWS"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "This gun is the CAWS of many deaths."           
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"

SWEP.UseHands = true

SWEP.HoldType = "shotgun"
SWEP.ViewModelFOV = 57
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true




/*--------------------------
Primary Functions Init
---------------------------*/
//SWEP.Primary.Sound = Sound( "Weapon_AK47.Single" )
//SWEP.Primary.Sound = Sound( "Weapon_Shotgun.Single" )
SWEP.Primary.Sound = "weapons/shotgun/shotgun_fire6.wav"
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 12
SWEP.Primary.DefaultClip    = 120
SWEP.Primary.Ammo            = "smg1"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 14
SWEP.Primary.NumShots		= 18
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 60/100

SWEP.Secondary.Automatic 	= true
SWEP.Secondary.Delay 		= 60/200
SWEP.Secondary.Ammo			= "none"



SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(10,20,0)
SWEP.RecoilUp1 				= -6
SWEP.RecoilUp2				= 2
SWEP.RecoilSide1			= -2
SWEP.RecoilSide2			= 2
SWEP.RecoilRoll1			= -0.2
SWEP.RecoilRoll2			= 0.2

SWEP.VMOffsetRight 			= -3
SWEP.VMOffsetUp 			= 0
SWEP.VMOffsetForward 		= 0

SWEP.Damage 				= 5

SWEP.DrawAnimSpeed 			= 1.4

SWEP.CanFireOnSprint		= 0


//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.05						//Maximum spread
SWEP.SpreadMinimum			= 0.051						//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 1						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 1						//Multiplied Amount: How much your raw velocity effects spread USELESS
SWEP.SpreadJumpMod			= 1						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 1						//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 1						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 1						//Multiplied Amount: What rate does spread go back down to the minimum? USELESS
SWEP.SpreadIncreaseRate		= 1						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 1						//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()					//Don't touch this either.

SWEP.TracerName				= "none"

/*
SWEP.VElements = {
	["rail_frontmount"] = { type = "Model", model = "models/hunter/blocks/cube1x2x05.mdl", bone = "ValveBiped.Bip01", rel = "rail", pos = Vector(0, 5.9, -0.77), angle = Angle(0, 0, 90), size = Vector(0.032, 0.024, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_backmount2"] = { type = "Model", model = "models/hunter/triangles/1x05x1.mdl", bone = "ValveBiped.Bip01", rel = "rail_backmount", pos = Vector(0.693, 0, 1.1), angle = Angle(0, 90, 0), size = Vector(0.032, 0.032, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["barrel_compensator"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0.009, 0.8, 6.926), angle = Angle(0, 0, 0), size = Vector(0.041, 0.029, 0.247), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_backmount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, -2.079, -4.849), angle = Angle(90, 0, -90), size = Vector(0.032, 0.032, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/hunter/blocks/cube1x2x05.mdl", bone = "ValveBiped.Bip01", rel = "rail_backmount2", pos = Vector(0, 6.32, -0.02), angle = Angle(0, 0, 0), size = Vector(0.032, 0.118, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_detail"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01", rel = "rail", pos = Vector(0, -2.771, 0.55), angle = Angle(180, 90, 0), size = Vector(0.009, 0.05, 0.039), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} }
}
*/

//New S12 model 07.11.13
SWEP.VElements = {
	["tritiumglow+"] = { type = "Sprite", sprite = "sprites/glow04", bone = "ValveBiped.Bip01", rel = "tritium+", pos = Vector(0.319, 0, 0.4), size = { x = 0.7, y = 0.7 }, color = Color(0, 255, 200, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["tritium++"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01", rel = "rail_detail", pos = Vector(-2.106, -0.422, -0.601), angle = Angle(0, 180, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["tritium"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01", rel = "rail_detail", pos = Vector(8, 0, -0.35), angle = Angle(0, 180, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel_compensator"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0.009, 0.8, 6.926), angle = Angle(0, 0, 0), size = Vector(0.041, 0.029, 0.247), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/hunter/blocks/cube1x2x05.mdl", bone = "ValveBiped.Bip01", rel = "rail_backmount2", pos = Vector(0, 6.32, -0.02), angle = Angle(0, 0, 0), size = Vector(0.032, 0.118, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_detail"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01", rel = "rail", pos = Vector(0, -2.771, 0.55), angle = Angle(180, 90, 0), size = Vector(0.009, 0.05, 0.039), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_frontmount"] = { type = "Model", model = "models/hunter/blocks/cube1x2x05.mdl", bone = "ValveBiped.Bip01", rel = "rail", pos = Vector(0, 5.9, -0.77), angle = Angle(0, 0, 90), size = Vector(0.032, 0.024, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["ghostring"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01", rel = "rail_detail", pos = Vector(-2, 0, -0.281), angle = Angle(90, 0, 0), size = Vector(0.012, 0.012, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["rail_backmount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, -2.079, -4.849), angle = Angle(90, 0, -90), size = Vector(0.032, 0.032, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["tritium+"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01", rel = "rail_detail", pos = Vector(-2.106, 0.421, -0.601), angle = Angle(0, 180, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["tritiumglow"] = { type = "Sprite", sprite = "sprites/glow04", bone = "ValveBiped.Bip01", rel = "tritium", pos = Vector(0.319, 0, 0.2), size = { x = 0.7, y = 0.7 }, color = Color(0, 255, 200, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["tritiumglow++"] = { type = "Sprite", sprite = "sprites/glow04", bone = "ValveBiped.Bip01", rel = "tritium++", pos = Vector(0.319, 0, 0.4), size = { x = 0.7, y = 0.7 }, color = Color(0, 255, 200, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["rail_backmount2"] = { type = "Model", model = "models/hunter/triangles/1x05x1.mdl", bone = "ValveBiped.Bip01", rel = "rail_backmount", pos = Vector(0.693, 0, 1.1), angle = Angle(0, 90, 0), size = Vector(0.032, 0.032, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["tritiumglow+"] = { type = "Sprite", sprite = "sprites/glow04", bone = "ValveBiped.Bip01_R_Hand", rel = "tritium+", pos = Vector(0.319, 0, 0.4), size = { x = 0.7, y = 0.7 }, color = Color(0, 255, 200, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["tritium++"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail_detail", pos = Vector(-2.106, -0.422, -0.601), angle = Angle(0, 180, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["tritium"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail_detail", pos = Vector(8, 0, -0.35), angle = Angle(0, 180, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel_compensator"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(23.607, 0.791, -5.974), angle = Angle(0, 90, 97.666), size = Vector(0.041, 0.025, 0.104), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/hunter/blocks/cube1x2x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail_backmount2", pos = Vector(0, 6.32, -0.02), angle = Angle(0, 0, 0), size = Vector(0.032, 0.118, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_backmount2"] = { type = "Model", model = "models/hunter/triangles/1x05x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail_backmount", pos = Vector(0.693, 0, 1.1), angle = Angle(0, 90, 0), size = Vector(0.032, 0.032, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_frontmount"] = { type = "Model", model = "models/hunter/blocks/cube1x2x05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail", pos = Vector(0, 5.9, -0.77), angle = Angle(0, 0, 90), size = Vector(0.032, 0.024, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["ghostring"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail_detail", pos = Vector(-2, 0, -0.281), angle = Angle(90, 0, 0), size = Vector(0.012, 0.012, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["tritiumglow++"] = { type = "Sprite", sprite = "sprites/glow04", bone = "ValveBiped.Bip01_R_Hand", rel = "tritium++", pos = Vector(0.319, 0, 0.4), size = { x = 0.7, y = 0.7 }, color = Color(0, 255, 200, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["tritium+"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail_detail", pos = Vector(-2.106, 0.421, -0.601), angle = Angle(0, 180, 0), size = Vector(0.079, 0.079, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["tritiumglow"] = { type = "Sprite", sprite = "sprites/glow04", bone = "ValveBiped.Bip01_R_Hand", rel = "tritium", pos = Vector(0.319, 0, 0.2), size = { x = 0.7, y = 0.7 }, color = Color(0, 255, 200, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["rail_backmount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.086, 1.274, -6.908), angle = Angle(-5.202, 1.067, 177.419), size = Vector(0.032, 0.032, 0.032), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["rail_detail"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail", pos = Vector(0, -2.771, 0.55), angle = Angle(180, 90, 0), size = Vector(0.009, 0.05, 0.039), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} }
}

//Reloading
SWEP.LoadDelay = 0.55		//Time it takes to load another shell
SWEP.ReloadDelay = 0.8		//Time to wait after reload.
//Dynamic reloading vars
SWEP.IsReloading = 0
SWEP.StopReload = 0
SWEP.DoAfterReloadPump = 0
SWEP.LastLoadTime = CurTime()
SWEP.PumpTimer = CurTime()

//Pumping
SWEP.PumpDelay = 0.1		//Time to wait to pump after firing
//Dynamic pump vars
SWEP.DoAfterFirePump = 0

SWEP.ShellsLoaded = 0

function SWEP:PrimaryAttack()

	if(!self.Owner:IsValid()) then return end

	if( self.Owner:KeyDown(IN_SPEED) && self.CanFireOnSprint == 0) then return end
	if( self.IsReloading == 1) then
		self.StopReload = 1
		return
	end
	
	if( CurTime() < self.LastLoadTime + self.ReloadDelay) then return end
	
	self:OnPrimaryAttack()

	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	SpreadMod = self:CheckSpreadModifiers(self.SpreadWalkMod, self.SpreadJumpMod, self.SpreadCrouchMod, self.SpreadVelocityMod, self.SpreadSprintMod)
	self:ApplySpread()
	
	

	
	// Play shoot sound
	self:EmitSound( self.Primary.Sound )
	
	// Shoot the bullet
	self:SciShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone )
	
	
	//I HATE timers like this, but it was the easiest way to do this, so....
	timer.Simple( self.PumpDelay, function()
	
		if (CLIENT) then return end
	
		if(!self:IsValid()) then return end
		if(!self.Owner:IsValid()) then return end
		if(!self.Weapon:IsValid()) then return end
		self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
		self.Weapon:EmitSound("weapons/shotgun/shotgun_cock.wav")
	end)
	
	// Remove 1 bullet from our clip
	self:TakePrimaryAmmo( 1 )
	

	self.Owner:ViewPunch( Angle( math.Rand(self.RecoilUp1, self.RecoilUp2), math.Rand(self.RecoilSide1, self.RecoilSide2), math.Rand(self.RecoilRoll1, self.RecoilRoll2)*0.00001 ) )
	
	if ( self.Owner:IsNPC() ) then return end
	
	
	// In singleplayer this function doesn't get called on the client, so we use a networked float
	// to send the last shoot time. In multiplayer this is predicted clientside so we don't need to 
	// send the float.
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		self:SetNetworkedFloat( "LastShootTime", CurTime() )
	end
	

	
	
	
end


function SWEP:Reload()
	if (!self.Owner:IsValid()) then return end
	
//	if (CLIENT) then return end
	
	if(self.Owner:IsBot()) then
		if(self.IsReloading == 0 && self.Weapon:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0) then
			self.IsReloading = 1
			self.Weapon:SendWeaponAnim( ACT_VM_RELOAD )
			self.Weapon:EmitSound("weapons/shotgun/shotgun_reload"..math.random(1,3)..".wav")
//			self.Owner:DoReloadEvent()
			self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
			self.Weapon:SetClip1(  self.Weapon:Clip1() + 1 )
			self.LastLoadTime = CurTime()
		end
	elseif (!self.Owner:KeyDown(IN_ATTACK)) then
		if(self.IsReloading == 0 && self.Weapon:Clip1() < self.Primary.ClipSize && self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 && CurTime() > self.LastLoadTime + self.ReloadDelay) then
			self.IsReloading = 1
			self.Weapon:SendWeaponAnim( ACT_VM_RELOAD )
			self.Weapon:EmitSound("weapons/shotgun/shotgun_reload"..math.random(1,3)..".wav")
			self.DoAfterReloadPump = 1
//			self.Owner:DoReloadEvent()
			self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
			self.Weapon:SetClip1(  self.Weapon:Clip1() + 1 )
			self.LastLoadTime = CurTime()
		end
	end
	
end

/*---------------------------------------------------------
   Think does nothing
---------------------------------------------------------*/
function SWEP:Think()
//	if (CLIENT) then return end

	//Reloading think
	if(self.IsReloading == 1) then
		if(CurTime() > self.LastLoadTime + self.LoadDelay) then
			if((self.Weapon:Clip1() >= self.Primary.ClipSize) || self.StopReload == 1 || self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0) then
				self.IsReloading = 0
				self.StopReload = 0
				self.Weapon:SendWeaponAnim( ACT_SHOTGUN_RELOAD_FINISH )
//				self.Weapon:EmitSound("weapons/shotgun/shotgun_reload"..math.random(1,3)..".wav")
//				self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
//				self.Weapon:EmitSound("weapons/shotgun/shotgun_reload"..math.random(1,3)..".wav")
//				self.Owner:DoReloadEvent()
				self.LastLoadTime = CurTime()
			else
				self.LastLoadTime = CurTime()
				self.Weapon:SendWeaponAnim( ACT_SHOTGUN_RELOAD_FINISH )
				self.Weapon:SendWeaponAnim( ACT_VM_RELOAD )
				self.Weapon:EmitSound("weapons/shotgun/shotgun_reload"..math.random(1,3)..".wav")
//				self.Owner:DoReloadEvent()
				
				// Add ammo
				self.Owner:RemoveAmmo( 1, self.Primary.Ammo, false )
				self.Weapon:SetClip1(  self.Weapon:Clip1() + 1 )
			end
		end
	elseif((CurTime() > (self.LastLoadTime + (self.LoadDelay/2))) && self.DoAfterReloadPump == 1) then
		self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )
		self.Weapon:EmitSound("weapons/shotgun/shotgun_cock.wav")
		self.DoAfterReloadPump = 0
	end
	
	
	//Secondary func think
	if((self.ShellsLoaded > 0 && !self.Owner:KeyDown(IN_ATTACK2)) || (self.Owner:KeyDown(IN_ATTACK2) && self:Clip1() == 0 && self.ShellsLoaded > 0) || (self.Owner:KeyDown(IN_ATTACK2) && self.Owner:KeyDown(IN_SPEED) && self.ShellsLoaded > 0)) then
	
//		if ( !self:CanPrimaryAttack() ) then return end
	
		// Play shoot sound
		for i = 1, self.ShellsLoaded do
			self:EmitSound( self.Primary.Sound )
		end
		
		SpreadMod = self:CheckSpreadModifiers(self.SpreadWalkMod, self.SpreadJumpMod, self.SpreadCrouchMod, self.SpreadVelocityMod, self.SpreadSprintMod)
		self:ApplySpread()
		
		self.Owner:ViewPunch( Angle( math.Rand(self.RecoilUp1, self.RecoilUp2), math.Rand(self.RecoilSide1, self.RecoilSide2), math.Rand(self.RecoilRoll1, self.RecoilRoll2)*(self.ShellsLoaded*5) ) )
		self:SetNextSecondaryFire( CurTime() + 1.5 )
		self:SetNextPrimaryFire( CurTime() + 1.5 )
		
		if(SERVER) then
			self.Owner:SetLocalVelocity(self.Owner:GetVelocity() + self.Owner:GetAimVector()*((self.ShellsLoaded)*-100))
		end
		
		self:SciShootBullet( self.Primary.Damage*(self.ShellsLoaded), self.Primary.Recoil, self.Primary.NumShots, self.SpreadMinimum )
//		print("Fired!")
		
		//Bug where it sometimes fires twice for some odd reason and this eems to stop that damn bug.
		self.ShellsLoaded = 0

		
	end

end


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

function SWEP:SecondaryAttack()

	if( self.Owner:KeyDown(IN_SPEED) && self.CanFireOnSprint == 0) then return end
	if( self.IsReloading == 1) then
		self.StopReload = 1
		return
	end
	
	if( CurTime() < self.LastLoadTime + self.ReloadDelay) then return end
	
//	if ( !self:CanSecondaryAttack() ) then return end
//	if ( !self:CanPrimaryAttack() ) then return end
	
	if(self:Clip1() > 0) then
		self:SetNextSecondaryFire( CurTime() + self.Secondary.Delay )
		self:SetNextPrimaryFire( CurTime() + self.Secondary.Delay )
		
	//	print("wat")
//		self.Owner:ViewPunch( Angle( math.Rand(self.RecoilUp1, self.RecoilUp2), math.Rand(self.RecoilSide1, self.RecoilSide2), math.Rand(self.RecoilRoll1, self.RecoilRoll2)*self.ShellsLoaded ) )
	
//			if(self.Weapon:IsValid()) then 


		self.Weapon:SendWeaponAnim( ACT_SHOTGUN_PUMP )

		self.Weapon:EmitSound("weapons/shotgun/shotgun_cock.wav")
		
		if(SERVER) then
			self:TakePrimaryAmmo( 1 )
		end
		self.ShellsLoaded = self.ShellsLoaded + 1
	end
	
end
