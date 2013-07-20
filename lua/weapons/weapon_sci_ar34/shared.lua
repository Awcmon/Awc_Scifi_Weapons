


AddCSLuaFile( "shared.lua" )
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




		
SWEP.Author				= "Awcmon"
SWEP.Slot				= 2
SWEP.SlotPos			= 1


if (CLIENT) then
	//Garry made a new way to do fonts. :C
	//Since it doesn't aliasize like it should since it's a .ttf, we have to do it make it huge then resize it later....
	surface.CreateFont( "CV",
	{
		font      = "coolvetica",
		size      = ScreenScale(200),
		weight    = 500,
		antialias 	= true,
		blursize 	= 0,
		scanlines 	= 0,
		underline 	= false,
		italic 		= false,
		strikeout 	= false,
		symbol 		= false,
		rotary 		= false,
		shadow 		= false,
		additive 	= false,
		outline 	= false
	}

	)
end


SWEP.PrintName               = "AR34"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "Carrington Institute"           
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"

/* obsolete 07.13.13
SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_famas.mdl"
//SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_rif_famas.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
*/
SWEP.UseHands = true

SWEP.HoldType = "ar2"
//SWEP.ViewModelFOV = 56.614173228346
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_rif_famas.mdl"
SWEP.WorldModel = "models/weapons/w_rif_famas.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}

SWEP.VElements = {
	["scope++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0.094, 0, 0.763), angle = Angle(-90.43, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
	["ammocounter+"] = { type = "Quad", bone = "v_weapon", rel = "ammocounter", pos = Vector(0, 0.5, 0), angle = Angle(180, -180, -180), size = 0.0032, draw_func = nil},
	["Screen"] = { type = "Model", model = "models/hunter/blocks/cube075x2x025.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.061, -3.401, 9.199), angle = Angle(0, 0, 16), size = Vector(0.023, 0.032, 0.023), color = Color(0, 0, 0, 255), surpresslightning = false, material = "Debug/debugdrawflat", skin = 0, bodygroup = {} },
	["scope++++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, -0.144), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["ammocounter"] = { type = "Quad", bone = "v_weapon", rel = "Screen", pos = Vector(0, 0, -0.171), angle = Angle(180, 0, 1), size = 0.007, draw_func = nil},
	["scope+"] = { type = "Model", model = "models/hunter/blocks/cube05x1x025.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0.694, 1.463), angle = Angle(0, 0, 90), size = Vector(0.021, 0.035, 0.046), color = Color(50, 50, 50, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.048, -5.651, 9.545), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(25, 25, 25, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 0), angle = Angle(180, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope+++"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 1.988), angle = Angle(0, 0, 180), size = Vector(0.075, 0.075, 0.254), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x1.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 3.112), angle = Angle(0, 0, 180), size = Vector(0.014, 0.014, 0.014), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, -0.091, 1.125), angle = Angle(180, 0, -90.475), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} }
}

/*obsolete 07.13.13
SWEP.VElements = {
	["scope++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0.094, 0, 0.763), angle = Angle(-90.43, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
	["ammocounter+"] = { type = "Quad", bone = "v_weapon", rel = "Screen", pos = Vector(0, 0.282, -0.065), angle = Angle(180, 0, 0.001), size = 0.0022, draw_func = nil},
	["Screen"] = { type = "Model", model = "models/hunter/blocks/cube075x2x025.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.061, -2.375, 6.88), angle = Angle(0, 0, 8.647), size = Vector(0.016, 0.028, 0.009), color = Color(0, 0, 0, 255), surpresslightning = false, material = "Debug/debugdrawflat", skin = 0, bodygroup = {} },
	["scope++++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, -0.144), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["ammocounter"] = { type = "Quad", bone = "v_weapon", rel = "Screen", pos = Vector(0, -0.074, -0.062), angle = Angle(180, 0, 0), size = 0.0049, draw_func = nil},
	["scope+"] = { type = "Model", model = "models/hunter/blocks/cube05x1x025.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0.694, 1.463), angle = Angle(0, 0, 90), size = Vector(0.021, 0.035, 0.046), color = Color(50, 50, 50, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.048, -4.384, 8.074), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(25, 25, 25, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 0), angle = Angle(180, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope+++"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 1.988), angle = Angle(0, 0, 180), size = Vector(0.075, 0.075, 0.254), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x1.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 3.112), angle = Angle(0, 0, 180), size = Vector(0.014, 0.014, 0.014), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, -0.091, 1.125), angle = Angle(180, 0, -90.475), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} }
}
*/

/*
SWEP.VElements = {
	["scope++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0.094, 0, 0.763), angle = Angle(-90.43, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
	["scope+"] = { type = "Model", model = "models/hunter/blocks/cube05x1x025.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0.694, 1.463), angle = Angle(0, 0, 90), size = Vector(0.021, 0.035, 0.046), color = Color(50, 50, 50, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["Screen"] = { type = "Model", model = "models/hunter/blocks/cube075x2x025.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.061, -2.375, 6.88), angle = Angle(0, 0, 8.647), size = Vector(0.016, 0.028, 0.009), color = Color(0, 0, 0, 255), surpresslightning = false, material = "Debug/debugdrawflat", skin = 0, bodygroup = {} },
	["scope+++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 0), angle = Angle(180, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon.famas", rel = "", pos = Vector(0.048, -4.384, 8.074), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(25, 25, 25, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["ammocounter+"] = { type = "Quad", bone = "v_weapon", rel = "Screen", pos = Vector(0, 0.082, -0.065), angle = Angle(180, 0, 0.001), size = 0.022, draw_func = nil},
	["ammocounter"] = { type = "Quad", bone = "v_weapon", rel = "Screen", pos = Vector(0, -0.874, -0.062), angle = Angle(180, 0, 0), size = 0.049, draw_func = nil},
	["scope++++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, -0.144), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.039), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 1.988), angle = Angle(0, 0, 180), size = Vector(0.075, 0.075, 0.254), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x1.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, 0, 3.112), angle = Angle(0, 0, 180), size = Vector(0.014, 0.014, 0.014), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "v_weapon", rel = "scope", pos = Vector(0, -0.091, 1.125), angle = Angle(180, 0, -90.475), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} }
}
*/

/* Obsolete as of 07.11.13
SWEP.WElements = {
	["scope++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.706, 0, -8.62), angle = Angle(180, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
	["scope+++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.881, 0, -8.337), angle = Angle(90, 0, 0), size = Vector(0.014, 0.014, 0.009), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope+++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.786, 0.268, -8.419), angle = Angle(0, 0, 90), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
	["scope+++"] = { type = "Model", model = "models/hunter/tubes/tube4x4x1to2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.875, 0, -8.332), angle = Angle(90, 0, 0), size = Vector(0.009, 0.009, 0.059), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.243, 0, -8.325), angle = Angle(180, 0, 0), size = Vector(0.014, 0.014, 0.009), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.061, 0, -8.332), angle = Angle(90, 0, 0), size = Vector(0.017, 0.017, 0.017), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.881, 0, -8.332), angle = Angle(90, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} }
}
*/

//Updated WModel 07.11.13
SWEP.WElements = {
	["scope++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.094, 0, 0.763), angle = Angle(-90.43, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} },
	["scope+"] = { type = "Model", model = "models/hunter/blocks/cube05x1x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0, 0.694, 1.463), angle = Angle(0, 0, 90), size = Vector(0.021, 0.035, 0.046), color = Color(50, 50, 50, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, 0, 3.181), angle = Angle(0, 0, 0), size = Vector(0.012, 0.012, 0.012), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope++++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.091, 0.899, -10), angle = Angle(-10, 0, 0), size = Vector(0.012, 0.012, 0.012), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.273, 0.899, -8.75), angle = Angle(100, 180, 0), size = Vector(0.039, 0.039, 0.039), color = Color(25, 25, 25, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++++"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, 0, 0.25), angle = Angle(180, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(77, 184, 255, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["scope+++"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, 0, 1.988), angle = Angle(0, 0, 180), size = Vector(0.075, 0.075, 0.254), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope++++"] = { type = "Model", model = "models/hunter/tubes/tube2x2x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, 0, 3.112), angle = Angle(0, 0, 180), size = Vector(0.014, 0.014, 0.014), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/props_debris/building_template010a", skin = 0, bodygroup = {} },
	["scope+++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "scope", pos = Vector(0, -0.091, 1.125), angle = Angle(180, 0, -90.475), size = Vector(0.016, 0.016, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/weapons/v_stunbaton/w_shaft01a", skin = 0, bodygroup = {} }
}

/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_FAMAS.Single" )
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 36
SWEP.Primary.DefaultClip    = 360
SWEP.Primary.Ammo            = "smg1"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= .2
SWEP.Primary.Damage			= 25
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.Delay 			= 60/1100

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"





SWEP.RecoilUp1 				= -1
SWEP.RecoilUp2				= 0.2
SWEP.RecoilSide1			= -0.2
SWEP.RecoilSide2			= 0.2
SWEP.RecoilRoll1			= -0.5
SWEP.RecoilRoll2			= 0.5

SWEP.VMOffsetRight 			= -2.5
SWEP.VMOffsetUp 			= 1
SWEP.VMOffsetForward 		= -4

SWEP.SprintPos 				= Vector(0,0,4)
SWEP.SprintAngle 			= Angle(15,5,0)



SWEP.DrawAnimSpeed 			= 1.6

SWEP.CanFireOnSprint		= 0


//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.015						//Maximum spread
SWEP.SpreadMinimum			= 0.01					//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 1.3						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 0.2					//Multiplied Amount: How much your raw velocity effects spread
SWEP.SpreadJumpMod			= 1.4						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.4					//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 2.5						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2					//Multiplied Amount: What rate does spread go back down to the minimum?
SWEP.SpreadIncreaseRate		= 0.00005						//Added amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 0.4					//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()				//Don't touch this either.



function SWEP:OnInitialize()


	

	self.VElements["ammocounter"].draw_func = function( weapon )
             
        draw.SimpleText(""..weapon:Clip1(), "CV", 0, 0, Color(0,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
     
    end
		
	self.VElements["ammocounter+"].draw_func = function( weapon )
             
        draw.SimpleText(""..math.Round(self:Ammo1()/36), "CV", 0, 0, Color(0,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
     
    end
end


function SWEP:SecondaryAttack()

end

	
/*
function SWEP:TranslateFOV(oldfov)
	if self.Owner:KeyDown(IN_ATTACK2) then 
	return  oldfov - 35
	else
	return oldfov
	end
	
end
*/



//Zoom
local FOVSlide = 0

function SWEP:TranslateFOV(oldfov)

	if self.Owner:KeyDown(IN_ATTACK2) then 
//	FOVSlide = math.Approach(FOVSlide, 50, 0.5)
	FOVSlide = math.Approach(FOVSlide, 50, 60*FrameTime())
	return  oldfov - FOVSlide
	else
//	FOVSlide = math.Approach(FOVSlide, 0, 0.5)
	FOVSlide = math.Approach(FOVSlide, 0, 60*FrameTime())
	return oldfov - FOVSlide
	end
	
end




function SWEP:PrimaryAttack()

	if( self.Owner:KeyDown(IN_SPEED) && self.CanFireOnSprint == 0) then return end
	
	if( self.Owner:KeyDown(IN_ATTACK2) ) then
		self:BurstFire()
	else
		self:FullAuto()
	end
	
	
	
end

//Dynamic
local BurstAmt = 0					//The thing that stores how many bullets are currently fired
local ShouldBurst = 0				//Handles whether it should burst or not
local BurstTimer = CurTime()		//Just a secondary timer

//Static
local BurstDelay = 60/1100			//Time between each shot in the burst
local TotalBurstDelay = 0.4	//Time in seconds before you can shoot again
local BurstBulletAmt = 3			//Bullets in a burst

function SWEP:FullAuto()

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
	
	self:OnPrimaryAttack()
	

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

function SWEP:BurstFire()
	if ( !self:CanPrimaryAttack() ) then return end
	
	BurstAmt = 0
	
	ShouldBurst = 1
	
	BurstTimer = CurTime()
	
	self:SetNextPrimaryFire( CurTime() + TotalBurstDelay )
	

end

function SWEP:BurstFireShootBullet()
	if ( !self:CanPrimaryAttack() ) then return end

	//Make it so that it doesn't suffer any accuracy penalties when burst firing
	SpreadMod = 1
	self.CurSpread = self.SpreadMinimum/2
	
	self:EmitSound( self.Primary.Sound )
	
	// Shoot the bullet
	self:SciShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone )
	
	
	// Remove 1 bullet from our clip
	self:TakePrimaryAmmo( 1 )
	
	BurstAmt = BurstAmt + 1
	
	BurstTimer = CurTime()

end

function SWEP:OnThink()

	if(self.Weapon:Clip1() <= 0) then
		BurstAmt = BurstBulletAmt
//		ShouldBurst = 0
	end

	if(ShouldBurst == 1) then
	if(CurTime() > (BurstTimer + BurstDelay)) then
		self:BurstFireShootBullet()
	end
		
		//Once all the bullets have been shot
		if(BurstAmt >= BurstBulletAmt) then
		
			ShouldBurst = 0
			
			
//			self.Owner:ViewPunch( Angle( math.Rand(self.RecoilUp1, self.RecoilUp2), math.Rand(self.RecoilSide1, self.RecoilSide2), math.Rand(self.RecoilRoll1, self.RecoilRoll2)*0.00001 ) )
			
//			self:SetNextPrimaryFire( CurTime() + TotalBurstDelay )

			
			if ( self.Owner:IsNPC() ) then return end
			
			// In singleplayer this function doesn't get called on the client, so we use a networked float
			// to send the last shoot time. In multiplayer this is predicted clientside so we don't need to 
			// send the float.
			if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
				self:SetNetworkedFloat( "LastShootTime", CurTime() )
		//		self:SetNetworkedFloat( "RecoilPitch", RecoPitch )
			end
		end
		
	end
end


local CrosshairSmoother = 0

local TrigRotator1 = 0

function SWEP:DrawHUD()

	local CT = CurTime()

	local RecTime = CT - self.Weapon:GetNetworkedFloat( "LastShootTime" )
	local RecoverScale = (1 - RecTime/self.CoolDownTime)
	
	TrigRotator1 = TrigRotator1 + FrameTime()*0.5
	
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
	
	//Fancy ass Trig rotator craps
	if self.Owner:KeyDown(IN_ATTACK2) then 
		local traceRes = self.Owner:GetEyeTrace()
		if(traceRes.Entity:IsNPC() || traceRes.Entity:IsPlayer()) then
			surface.SetDrawColor( 255, 0, 0, 255 )
		else
			surface.SetDrawColor( 0, 255, 255, 255 )
		end
	
		surface.DrawLine( (math.cos((TrigRotator1 * math.pi))*200)+(ScrW()/2), (math.sin((TrigRotator1 * math.pi))*200)+(ScrH()/2), (math.cos((TrigRotator1 * math.pi) - (0.5*math.pi))*200)+(ScrW()/2), (math.sin((TrigRotator1 * math.pi) - (0.5*math.pi))*200)+(ScrH()/2) )
		
		surface.DrawLine( (math.cos((TrigRotator1 * math.pi) - math.pi)*200)+(ScrW()/2), (math.sin((TrigRotator1 * math.pi) - math.pi)*200)+(ScrH()/2), (math.cos((TrigRotator1 * math.pi) - (1.5*math.pi))*200)+(ScrW()/2), (math.sin((TrigRotator1 * math.pi) - (1.5*math.pi))*200)+(ScrH()/2) )
		
//		surface.DrawLine( (math.cos((TrigRotator1*2 * math.pi) - (math.pi*0.5))*100)+(ScrW()/2), (math.sin((TrigRotator1*2 * math.pi) - (math.pi*0.5))*100)+(ScrH()/2), (math.cos((TrigRotator1*2 * math.pi) - (1*math.pi))*100)+(ScrW()/2), (math.sin((TrigRotator1*2 * math.pi) - (1*math.pi))*100)+(ScrH()/2) )
		
//		surface.DrawLine( (math.cos((TrigRotator1*2 * math.pi) - (math.pi*1.5))*100)+(ScrW()/2), (math.sin((TrigRotator1*2 * math.pi) - (math.pi*1.5))*100)+(ScrH()/2), (math.cos((TrigRotator1*2 * math.pi) - (2*math.pi))*100)+(ScrW()/2), (math.sin((TrigRotator1*2 * math.pi) - (2*math.pi))*100)+(ScrH()/2) )
		surface.SetFont("CV")
		surface.SetTextColor( 0, 255, 255, 155 )
		surface.SetTextPos( ScrW()/1.45, ScrH()/2 ) 
		surface.DrawText( self:Clip1() )
		
	end
	
//	print(eyeTrace)
	
	
	
end

/*
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
*/
