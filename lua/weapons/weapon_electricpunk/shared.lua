//More of a template if anything.


AddCSLuaFile( "shared.lua" )
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




	
SWEP.Author				= "Awcmon"
SWEP.Slot				= 3
SWEP.SlotPos			= 1


SWEP.PrintName               = "Electric Punk"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "City 17 Ghettoes"                  
SWEP.Spawnable                = false          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = false           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"


SWEP.HoldType = "smg"
SWEP.ViewModelFOV = 57
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true





/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_SMG1.Single" )
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 100
SWEP.Primary.DefaultClip    = 300
SWEP.Primary.Ammo            = "357"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 95
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.005
SWEP.Primary.Delay 			= 60/800



--Custom Vars
SWEP.Damage 				= 70


SWEP.RecoilUp1 				= -2.5
SWEP.RecoilUp2				= 0.5
SWEP.RecoilSide1			= -1
SWEP.RecoilSide2			= 1
SWEP.RecoilRoll1			= -1
SWEP.RecoilRoll2			= 1


SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(15,0,0)
SWEP.VMOffsetRight 			= 0
SWEP.VMOffsetUp 			= 0
SWEP.VMOffsetForward 		= 0

SWEP.DrawAnimSpeed 			= 1.5

SWEP.CanFireOnSprint		= 0


SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01"] = { scale = Vector(1, 1, 1), pos = Vector(3.144, -1.32, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["dial"] = { type = "Model", model = "models/props_c17/TrapPropeller_Lever.mdl", bone = "ValveBiped.base", rel = "dialstart", pos = Vector(0, 0.305, 0), angle = Angle(0, 0, 0), size = Vector(0.092, 0.072, 0.092), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
	["dialstart"] = { type = "Model", model = "models/props_c17/clock01.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, -1.933, -7.206), angle = Angle(0, 0, -180), size = Vector(0.021, 0.021, 0.021), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
	["sodacan"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, -2.401, -3.931), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 1.003), color = Color(50, 50, 41, 255), surpresslightning = false, material = "", skin = 2, bodygroup = {} },
	["glow"] = { type = "Sprite", sprite = "Sprites/glow04", bone = "ValveBiped.base", rel = "battery", pos = Vector(1.049, 0.305, 5.136), size = { x = 4.444, y = 4.444 }, color = Color(0, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["chamber"] = { type = "Model", model = "models/Items/combine_rifle_ammo01.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, -2.313, 4.4), angle = Angle(0, 0, -180), size = Vector(0.402, 0.402, 0.402), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ammocount"] = { type = "Quad", bone = "ValveBiped.clip", rel = "", pos = Vector(0, -7.513, -5.625), angle = Angle(0, -180, -180), size = 0.05, draw_func = nil},
	["glow+"] = { type = "Sprite", sprite = "Sprites/glow04", bone = "ValveBiped.base", rel = "battery", pos = Vector(-2.231, 0.305, 5.136), size = { x = 4.444, y = 4.444 }, color = Color(0, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, 0, 3.967), angle = Angle(0, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(30, 30, 30, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glow++"] = { type = "Sprite", sprite = "Sprites/glow04", bone = "ValveBiped.base", rel = "chamber", pos = Vector(0, 0.105, 3.918), size = { x = 4.306, y = 4.306 }, color = Color(255, 119, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}


SWEP.WElements = {
	["sodacan"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.924, 1.536, -7.35), angle = Angle(-100, 0, 0), size = Vector(0.5, 0.5, 1.003), color = Color(50, 50, 50, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glow"] = { type = "Sprite", sprite = "Sprites/glow04", bone = "ValveBiped.Bip01_R_Hand", rel = "battery", pos = Vector(1.049, 0.305, 5.136), size = { x = 4.444, y = 4.444 }, color = Color(0, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.93, 1.593, -6.161), angle = Angle(0, -90, -98.062), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["ammocount"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "chamber", pos = Vector(-9.62, 1.463, 3.144), angle = Angle(-180, 90, -90), size = 0.05, draw_func = nil},
	["glow+"] = { type = "Sprite", sprite = "Sprites/glow04", bone = "ValveBiped.Bip01_R_Hand", rel = "battery", pos = Vector(-2.231, 0.305, 4.566), size = { x = 4.444, y = 4.444 }, color = Color(0, 255, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["chamber"] = { type = "Model", model = "models/Items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10, 0, -10), angle = Angle(0, 0, 0), size = Vector(0.305, 0.305, 0.542), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glow++"] = { type = "Sprite", sprite = "Sprites/glow04", bone = "ValveBiped.Bip01_R_Hand", rel = "chamber", pos = Vector(0, 0.105, 3.918), size = { x = 4.306, y = 4.306 }, color = Color(255, 119, 0, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}

local SpinAng = 1

function SWEP:OnThink()
	if (!self.VElements) then return end
	
	if (CLIENT) then
		SpinAng = SpinAng + 10
		self.VElements["chamber"].angle.y = SpinAng
	end

end

