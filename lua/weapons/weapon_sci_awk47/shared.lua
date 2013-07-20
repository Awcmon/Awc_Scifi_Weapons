// Viewkick changes aimpos, viewpunch does not.
// Prop penetrating rounds at the cost of 5 rounds

// Used to fire in short, powerful, accurate bursts.


AddCSLuaFile( "shared.lua" )

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false





SWEP.PrintName			= "AK47"			
SWEP.Author				= "Awcmon"
SWEP.Slot				= 3
SWEP.SlotPos			= 10


SWEP.PrintName               = "AK47"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "Gorilla warfare"           
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"

SWEP.UseHands = true

SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
//SWEP.ViewModel = "models/weapons/v_rif_ak47.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

/*
SWEP.ViewModelBoneMods = {
	["v_weapon.Hands_parent"] = { scale = Vector(1, 1, 1), pos = Vector(-2.85, 0, 0), angle = Angle(0, 0, 0) },
	["v_weapon.AK47_Parent"] = { scale = Vector(1, 1, 1), pos = Vector(-2.85, 0, 0), angle = Angle(0, 0, 0) }
}
*/

//2.062
/*
SWEP.VElements = {
	["knife"] = { type = "Model", model = "models/weapons/w_knife_t.mdl", bone = "v_weapon.AK47_Parent", rel = "", pos = Vector(0, 2.477, 11.696), angle = Angle(0, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
*/

SWEP.WElements = {
	["knife"] = { type = "Model", model = "models/weapons/w_knife_t.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(22.273, 0.741, -5.909), angle = Angle(78.75, 0.001, -180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}



/*--------------------------
Primary Functions Init
---------------------------*/
//SWEP.Primary.Sound = Sound( "Weapon_AK47.Single" )
SWEP.Primary.Sound = Sound( "Weapon_AK47.Single" )
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 120
SWEP.Primary.Ammo            = "smg1"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 85
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 60/600




SWEP.SprintPos 				= Vector(0,0,-3)
SWEP.SprintAngle 			= Angle(0,0,-90)
SWEP.RecoilUp1 				= -2
SWEP.RecoilUp2				= 2
SWEP.RecoilSide1			= -2
SWEP.RecoilSide2			= 2
SWEP.RecoilRoll1			= -2
SWEP.RecoilRoll2			= 2

SWEP.VMOffsetRight 			= 3
SWEP.VMOffsetUp 			= 1
SWEP.VMOffsetForward 		= -4

SWEP.Damage 				= 70

SWEP.DrawAnimSpeed 			= 0.8

SWEP.CanFireOnSprint		= 1


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







