//Engineering tool
//Builds:
//Anti-dragonmine thumper
//Auto-turrets
//Destructable spawn-points
//
//Actions:
//Anti-dragonmine pulses

//Dependent on AR34 to load the font.


AddCSLuaFile( "shared.lua" )

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




		
SWEP.Slot				= 3
SWEP.SlotPos			= 10


SWEP.PrintName               = "Blazer-420-F.G.T"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "$420 pays it faggot. For Jango Fett anyways."           
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase"
SWEP.Category			= "Sci-fi Weapons"



/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_Galil.Single" )
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize        = 0
SWEP.Primary.DefaultClip    = 1000
//SWEP.Primary.Ammo            = "Battery"
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic    = true
SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 60/700




SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(0,0,0)

SWEP.VMOffsetRight 			= -1
SWEP.VMOffsetUp 			= 1.5
SWEP.VMOffsetForward 		= 0


SWEP.DrawAnimSpeed 			= 10

SWEP.CanFireOnSprint		= 1



SWEP.Energy = 1000

SWEP.RechargeDelay = 0.1			//Time it takes to regenerate one energy
SWEP.RechargeTimer = CurTime()

SWEP.ForwardDir = Vector(0,0,0)
SWEP.RightDir = Vector(0,0,0)


SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/Weapons/v_Grenade.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -0.427, 0) },
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(54.171, 0, 0) },
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01"] = { scale = Vector(1, 1, 1), pos = Vector(-0.498, -16.564, 2.773), angle = Angle(0, -43.934, 0) }
}



SWEP.VElements = {
	["Fuel_line"] = { type = "Model", model = "models/hunter/tubes/tube1x1x2.mdl", bone = "ValveBiped.Bip01", rel = "Chamber+", pos = Vector(0.871, 0.435, 0), angle = Angle(-0.982, 0, -90.246), size = Vector(0.009, 0.009, 0.108), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/fender_chrome", skin = 0, bodygroup = {} },
	["Screen_Data"] = { type = "Quad", bone = "ValveBiped.Bip01", rel = "Screen", pos = Vector(1.366, 0.194, 2.927), angle = Angle(-90, 0.439, 0.439), size = 0.09, draw_func = nil},
	["Chamber"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01", rel = "Flame_Unit+", pos = Vector(-1.308, 1.307, -0.872), angle = Angle(0, 90.245, 180), size = Vector(0.024, 0.159, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
	["Fuel_brace"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01", rel = "Fuel_line", pos = Vector(0, 0, 2.45), angle = Angle(0, 0, 0), size = Vector(0.037, 0.037, 0.05), color = Color(159, 160, 160, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["Chamber+"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01", rel = "Chamber", pos = Vector(2.18, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.024, 0.159, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
	["Screen"] = { type = "Model", model = "models/items/battery.mdl", bone = "ValveBiped.Bip01", rel = "Chamber", pos = Vector(0.584, 3.316, -0.585), angle = Angle(45.22, -180, 90), size = Vector(0.314, 0.314, 0.656), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["Flame_Unit+"] = { type = "Model", model = "models/hunter/blocks/cube1x1x05.mdl", bone = "ValveBiped.Bip01_R_Forearm", rel = "", pos = Vector(6.817, 0.462, -1.155), angle = Angle(3.52, 9.682, -29.928), size = Vector(0.037, 0.037, 0.037), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/dome", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["Wrench"] = { type = "Model", model = "models/weapons/w_models/w_wrench.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.107, 1.552, 0.518), angle = Angle(0, 0, 180), size = Vector(0.704, 0.704, 0.704), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["pipboy+"] = { type = "Model", model = "models/player/items/engineer/bet_pb.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(35.209, -11.393, -35.21), angle = Angle(-180, 111.845, -116.505), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


function SWEP:PrimaryAttack()

end

//Thruster_Sound = Sound("thrusters/Rocket00.wav")

//Blazer420RocketFgt = CreateSound(self.Owner, Thruster_Sound )

function SWEP:SecondaryAttack()
	if(SERVER) then
		if(self.Owner:IsValid() && self:IsValid()) then
		
//			Blazer420RocketFgt:Play() -- starts the sound
		
			if(self.Owner:KeyDown(IN_FORWARD)) then
//				print("Forward")
				self.ForwardDir = self.Owner:GetForward()*0.5
			elseif(self.Owner:KeyDown(IN_BACK) ) then
				self.ForwardDir = self.Owner:GetForward()*-0.5
			else
				self.ForwardDir = Vector(0,0,0)
			end
			
			if(self.Owner:KeyDown(IN_MOVERIGHT)) then
//				print("Right")
				self.RightDir = self.Owner:GetRight()*0.5
			elseif(self.Owner:KeyDown(IN_MOVELEFT) ) then
				self.RightDir = self.Owner:GetRight()*-0.5
			else
				self.RightDir = Vector(0,0,0)
			end
			
			self.Owner:SetLocalVelocity(self.Owner:GetVelocity()+(Vector(self.ForwardDir.x + self.RightDir.x,self.ForwardDir.y + self.RightDir.y,1)*15))
//			self.Owner:SetLocalVelocity(self.Owner:GetVelocity() + Vector(self.Owner:GetForward().x + self.Owner:GetRight().x*-1,self.Owner:GetForward().y + self.Owner:GetRight().y*-1,1)*20)
//			self.Owner:SetLocalVelocity(self.Owner:GetVelocity()+(self.Owner:GetUp()*150))
//			print(self.Owner:GetForward())
		end
	end
end

function SWEP:Think()
//	if(!self.Owner:IsValid()) then return end
//	if(!self.Owner:KeyDown(IN_ATTACK2)) then
//		Blazer420RocketFgt:Stop() -- stops the sound
//	end
end

