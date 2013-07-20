//Secondary attack then Primary attack to throw the Dragon on the ground as a mine.
//Model made by BFG.


AddCSLuaFile( "shared.lua" )

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




		
SWEP.Slot				= 3
SWEP.SlotPos			= 10


SWEP.PrintName               = "Dragon"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "dataDyne"           
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"


SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_galil.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true


/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_Galil.Single" )
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 300
SWEP.Primary.Ammo            = "smg1"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 60/700




SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(15,15,0)
SWEP.RecoilUp1 				= -1
SWEP.RecoilUp2				= 1
SWEP.RecoilSide1			= -1
SWEP.RecoilSide2			= 1
SWEP.RecoilRoll1			= -1
SWEP.RecoilRoll2			= 1

SWEP.VMOffsetRight 			= -1
SWEP.VMOffsetUp 			= 1.5
SWEP.VMOffsetForward 		= 0

SWEP.Damage 				= 70

SWEP.DrawAnimSpeed 			= 1.2

SWEP.CanFireOnSprint		= 0


//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.02						//Maximum spread
SWEP.SpreadMinimum			= 0.01						//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 1.2						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 0.2						//Multiplied Amount: How much your raw velocity effects spread USELESS
SWEP.SpreadJumpMod			= 1.2						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.4						//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 1.8						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2						//Multiplied Amount: What rate does spread go back down to the minimum? USELESS
SWEP.SpreadIncreaseRate		= 0.00025						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 0.8						//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this.
SWEP.LastAtt 				= CurTime()					//Don't touch this either.

SWEP.ViewModelBoneMods = {
	["v_weapon.handle"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

/*
SWEP.VElements = {
	["Energy_Ribbon_light"] = { type = "Model", model = "models/Items/battery.mdl", bone = "v_weapon.Right_Arm", rel = "Energy_Ribbon", pos = Vector(0, -0.125, -4.625), angle = Angle(0, 90.28, 0.28), size = Vector(0.204, 0.204, 0.861), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["swivel"] = { type = "Model", model = "models/props_lab/filecabinet02.mdl", bone = "v_weapon.Right_Arm", rel = "Grip_and_explosive", pos = Vector(0.501, -0.838, 1.172), angle = Angle(90, 90, 0), size = Vector(0.041, 0.041, 0.041), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["Frontrail_mount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "v_weapon.Right_Arm", rel = "Backrail_mount", pos = Vector(8.126, 0, -0.06), angle = Angle(0, 180, 0), size = Vector(0.032, 0.016, 0.043), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["Backrail_mount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "v_weapon.galil", rel = "", pos = Vector(0, -1.619, 0), angle = Angle(90.403, -89.865, 0), size = Vector(0.028, 0.016, 0.039), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["Energy_Ribbon"] = { type = "Model", model = "models/hunter/tubes/tube2x2x4.mdl", bone = "v_weapon.galil", rel = "", pos = Vector(0, -0.875, 3.625), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["Rail"] = { type = "Model", model = "models/hunter/blocks/cube1x2x1.mdl", bone = "v_weapon.Right_Arm", rel = "Backrail_mount", pos = Vector(3.9, 0, 0.483), angle = Angle(0, 90, 0), size = Vector(0.016, 0.061, 0.016), color = Color(130, 130, 130, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
	["Grip_and_explosive"] = { type = "Model", model = "models/hunter/misc/roundthing3.mdl", bone = "v_weapon.galil", rel = "", pos = Vector(0, 0, 6.131), angle = Angle(0, 0, 0), size = Vector(0.028, 0.016, 0.188), color = Color(150, 151, 150, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} }
}
*/

//New Dragon Model 07.11.13
SWEP.VElements = {
//	["scope"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon.Right_Arm", rel = "Backrail_mount", pos = Vector(-0.159, 0, -1.002), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
//	["handle"] = { type = "Model", model = "models/hunter/blocks/cube1x2x025.mdl", bone = "v_weapon.Right_Arm", rel = "Backrail_mount", pos = Vector(-0.88, 0, 3.349), angle = Angle(0, 90, 89.5), size = Vector(0.023, 0.078, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
//	["Frontrail_mount"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box90_4.mdl", bone = "v_weapon.Right_Arm", rel = "Backrail_mount", pos = Vector(0.092, 0, 7.546), angle = Angle(0, 90, 0), size = Vector(0.012, 0.037, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
//	["Backrail_mount"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box_4.mdl", bone = "v_weapon.galil", rel = "", pos = Vector(0, -2.26, 0.079), angle = Angle(0, -89.865, 0), size = Vector(0.043, 0.024, 0.043), color = Color(180, 180, 180, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
//	["scope_lens"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "v_weapon.galil", rel = "scope", pos = Vector(0, 0, 0.111), angle = Angle(180, 0, 0), size = Vector(0.01, 0.009, 0.01), color = Color(0, 255, 141, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "v_weapon.galil", rel = "", pos = Vector(0, -1.872, 2.967), angle = Angle(90, 90, 0), size = Vector(0.009, 0.043, 0.052), color = Color(100, 100, 100, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["Grip_and_explosive"] = { type = "Model", model = "models/hunter/misc/roundthing3.mdl", bone = "v_weapon.galil", rel = "", pos = Vector(0, 0.259, 6.696), angle = Angle(0, 0, 0), size = Vector(0.034, 0.016, 0.164), color = Color(150, 151, 150, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} }
}

/*
SWEP.WElements = {
	["Energy_Ribbon_light"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Energy_Ribbon", pos = Vector(0, -0.125, -4.625), angle = Angle(0, 90.28, 0.28), size = Vector(0.204, 0.204, 0.861), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Frontrail_mount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Backrail_mount", pos = Vector(8.126, 0, -0.06), angle = Angle(0, 180, 0), size = Vector(0.032, 0.016, 0.043), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["Backrail_mount"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.47, 0.138, -6.316), angle = Angle(-180, 0.141, 0), size = Vector(0.028, 0.016, 0.039), color = Color(180, 180, 180, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["Energy_Ribbon"] = { type = "Model", model = "models/hunter/tubes/tube2x2x4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.194, 0, -5.417), angle = Angle(180, 90.311, 90.311), size = Vector(0.009, 0.009, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
	["Rail"] = { type = "Model", model = "models/hunter/blocks/cube1x2x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Backrail_mount", pos = Vector(3.9, 0, 0.483), angle = Angle(0, 90, 0), size = Vector(0.016, 0.061, 0.016), color = Color(130, 130, 130, 255), surpresslightning = false, material = "phoenix_storms/metalfloor_2-3", skin = 0, bodygroup = {} },
	["Grip_and_explosive"] = { type = "Model", model = "models/hunter/misc/roundthing3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(13.51, 0, -3.225), angle = Angle(0.312, 90.311, 90.311), size = Vector(0.052, 0.028, 0.194), color = Color(150, 151, 150, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} }
}
*/

SWEP.WElements = {
//	["scope"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Backrail_mount", pos = Vector(-0.159, 0, -1.002), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
//	["scope_lens+"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, 0, 1.467), angle = Angle(0, 0, 0), size = Vector(0.01, 0.009, 0.01), color = Color(0, 255, 141, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
//	["handle"] = { type = "Model", model = "models/hunter/blocks/cube1x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Backrail_mount", pos = Vector(-0.88, 0, 3.349), angle = Angle(0, 90, 89.5), size = Vector(0.023, 0.078, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
//	["Frontrail_mount"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box90_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Backrail_mount", pos = Vector(0.092, 0, 7.546), angle = Angle(0, 90, 0), size = Vector(0.012, 0.037, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
//	["Backrail_mount"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rail", pos = Vector(-4.373, 0, -0.574), angle = Angle(90, 180, 0), size = Vector(0.043, 0.024, 0.043), color = Color(180, 180, 180, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
//	["scope_lens"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, 0, 0.111), angle = Angle(180, 0, 0), size = Vector(0.01, 0.009, 0.01), color = Color(0, 255, 141, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/props_phx/trains/tracks/track_2x.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.727, 0.899, -6.5), angle = Angle(-10, 0, 0), size = Vector(0.009, 0.043, 0.052), color = Color(100, 100, 100, 255), surpresslightning = false, material = "models/props_canal/canal_bridge_railing_01c", skin = 0, bodygroup = {} },
	["Grip_and_explosive"] = { type = "Model", model = "models/hunter/misc/roundthing3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.364, 1, -4.6), angle = Angle(1.023, 90, 100), size = Vector(0.052, 0.019, 0.215), color = Color(150, 151, 150, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} }
}

function SWEP:SecondaryAttack()

	if (SERVER) then
		
		local dragon = ents.Create("sent_sci_dragonmine")
			dragon:SetPos(self.Owner:GetShootPos() + self.Owner:GetAimVector() * 50 + self.Owner:GetRight()*10)
			dragon:SetAngles(self.Owner:EyeAngles())
			dragon:SetOwner(self.Owner)
//			dragon.DragonOwner = self:GetOwner()
		dragon:Spawn()
		
		local phys = dragon:GetPhysicsObject()
		phys:ApplyForceCenter(self.Owner:GetAimVector() * 5000)
		
		if(self.Weapon:IsValid() && self.Owner:IsValid()) then
			self.Owner:StripWeapon("weapon_sci_dragon")
		end
	end
end
