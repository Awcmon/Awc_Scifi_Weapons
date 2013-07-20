//More of a template if anything.


AddCSLuaFile( "shared.lua" )
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




	
SWEP.Author				= "Awcmon"
SWEP.Slot				= 1
SWEP.SlotPos			= 1


SWEP.PrintName               = "DIY357"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "Mango Juice with a touch of dataDyne"                  
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"

SWEP.UseHands = true

SWEP.HoldType = "revolver"
SWEP.ViewModelFOV = 57
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true





/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_357.Single" )
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize        = 6
SWEP.Primary.DefaultClip    = 120
SWEP.Primary.Ammo            = "357"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 98
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.005
SWEP.Primary.Delay 			= 60/400



--Custom Vars
SWEP.Damage 				= 95


SWEP.RecoilUp1 				= -2.5
SWEP.RecoilUp2				= 0.5
SWEP.RecoilSide1			= -1
SWEP.RecoilSide2			= 1
SWEP.RecoilRoll1			= -1
SWEP.RecoilRoll2			= 1


SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(0,0,0)
SWEP.VMOffsetRight 			= 0
SWEP.VMOffsetUp 			= 0
SWEP.VMOffsetForward 		= 0

SWEP.DrawAnimSpeed 			= 2

SWEP.CanFireOnSprint		= 1





//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.3						//Maximum spread
SWEP.SpreadMinimum			= 0.005					//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 1.3						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 0.2					//Multiplied Amount: How much your raw velocity effects spread
SWEP.SpreadJumpMod			= 1.5						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.4					//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 1.2						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2					//Multiplied Amount: What rate does spread go back down to the minimum? 
SWEP.SpreadIncreaseRate		= 5						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 0.2					//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()				//Don't touch this either.










SWEP.VElements = {
	["Mount"] = { type = "Model", model = "models/props_c17/playground_teetertoter_stan.mdl", bone = "Python", rel = "", pos = Vector(0, -3.063, -0.944), angle = Angle(0, 0, 90.133), size = Vector(0.075, 0.252, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Screen_data"] = { type = "Quad", bone = "Base", rel = "Screen++", pos = Vector(0, 0, 0.103), angle = Angle(0, 90, 180), size = 0.005, draw_func = nil},
	["Screen++"] = { type = "Model", model = "models/hunter/plates/plate1x2.mdl", bone = "Base", rel = "Console", pos = Vector(0, 0, -0.21), angle = Angle(0, 0, 0), size = Vector(0.017, 0.017, 0.017), color = Color(89, 255, 0, 160), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["Console"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "Base", rel = "Mount", pos = Vector(0, 0.995, 0.497), angle = Angle(-92.158, 90.663, 0.324), size = Vector(0.034, 0.014, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/fender_chrome", skin = 0, bodygroup = {} },
	["brace"] = { type = "Model", model = "models/hunter/blocks/cube1x2x025.mdl", bone = "Base", rel = "Mount", pos = Vector(1.085, 0, 0.418), angle = Angle(0, 89.86, 90.976), size = Vector(0.016, 0.009, 0.027), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["Mount"] = { type = "Model", model = "models/props_c17/playground_teetertoter_stan.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.102, 0.949, -6.818), angle = Angle(0, -91.024, 0), size = Vector(0.075, 0.252, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Screen++"] = { type = "Model", model = "models/hunter/plates/plate1x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Console", pos = Vector(0, 0, -0.137), angle = Angle(0, 0, 0), size = Vector(0.017, 0.017, 0.017), color = Color(89, 255, 0, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["Screen_data"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "Screen++", pos = Vector(0, 0, -0.532), angle = Angle(0, 90, 180), size = 0.05, draw_func = nil},
	["Console_Apparatus"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Console", pos = Vector(0, 0, 2.651), angle = Angle(0, 0, 0), size = Vector(0.037, 0.037, 0.037), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
	["Console"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Mount", pos = Vector(0, 0.995, 0.497), angle = Angle(-92.158, 90.663, 0.324), size = Vector(0.034, 0.014, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/fender_chrome", skin = 0, bodygroup = {} },
	["brace"] = { type = "Model", model = "models/hunter/blocks/cube1x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Mount", pos = Vector(1.085, 0, 0.418), angle = Angle(0, 89.86, 90.976), size = Vector(0.016, 0.009, 0.027), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} }
}

function SWEP:OnInitialize()

	self.VElements["Screen_data"].draw_func = function( weapon )
             
        draw.SimpleText(""..weapon:Clip1(), "CV", -80, 80, Color(0,105,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
     
    end
		
end
/*
function SWEP:Reload()
 
	if self.ReloadingTime and CurTime() <= self.ReloadingTime then return end
 
	if ( self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
//		self.Owner:GetViewModel():SetPlaybackRate(2)
		self:DefaultReload( ACT_VM_RELOAD )
		self.Owner:GetViewModel():SetPlaybackRate(2)
   //             local AnimationTime = (self.Owner:GetViewModel():SequenceDuration()/2)
//				print( AnimationTime)
//                self.ReloadingTime = CurTime() + (0)
                self:SetNextPrimaryFire(CurTime() + (0))
                self:SetNextSecondaryFire(CurTime() + (0))
 
	end
 
end
*/

function SWEP:Reload()
	local ReloadSpeed = 2
	
	if (!self.Owner:IsValid()) then return end
	if(self.Owner:IsBot()) then
		self:DefaultReload( ACT_VM_RELOAD );
	elseif (!self.Owner:KeyDown(IN_ATTACK)) then
		if ( self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 ) then
		
			local AmmoToLoad = self.Primary.ClipSize - self:Clip1()
	//		self.Owner:GiveAmmo(AmmoToLoad, self:GetPrimaryAmmoType())
	//		self:SetClip1(math.Clamp(self.Owner:GetAmmoCount( self.Primary.Ammo ),0,self.Primary.ClipSize))
			self:SetClip1(math.Clamp(self:Clip1() + AmmoToLoad, 0, self:Clip1() + self.Owner:GetAmmoCount( self.Primary.Ammo )))
			self.Owner:RemoveAmmo(AmmoToLoad, self:GetPrimaryAmmoType())
			self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
			self.Owner:GetViewModel():SetPlaybackRate(ReloadSpeed)
			local AnimationTime = (self.Owner:GetViewModel():SequenceDuration()/ReloadSpeed)
			self:SetNextPrimaryFire(CurTime() + AnimationTime)
			self:SetNextSecondaryFire(CurTime() + AnimationTime)
	//		timer.Simple( AnimationTime, function()
	//			self.Owner:RemoveAmmo( self.Primary.ClipSize - self:Clip1(), self:GetPrimaryAmmoType() )
	//			self:SetClip1(math.Clamp(self.Owner:GetAmmoCount( self.Primary.Ammo ),0,6))
	//			self.Owner:RemoveAmmo( 6, self:GetPrimaryAmmoType() )
	//			print(self.Owner:GetAmmoCount( self.Primary.Ammo ))
	//		self.Weapon:SetClip1(6)
	//		end)
			
		end
	end
end
