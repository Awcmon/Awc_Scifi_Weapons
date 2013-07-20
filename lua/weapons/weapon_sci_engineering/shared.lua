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




		
SWEP.Slot				= 5
SWEP.SlotPos			= 10


SWEP.PrintName               = "Engineering Tool"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "Empires pls"           
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

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 60/700




SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(0,10,0)

SWEP.VMOffsetRight 			= -1
SWEP.VMOffsetUp 			= 1.5
SWEP.VMOffsetForward 		= 0


SWEP.DrawAnimSpeed 			= 10

SWEP.CanFireOnSprint		= 1



SWEP.Energy = 1000

SWEP.RechargeDelay = 0.1			//Time it takes to regenerate one energy
SWEP.RechargeTimer = CurTime()

//SWEP.UseHands = true

SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 60.15503875969
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/Weapons/v_Grenade.mdl"
//SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01"] = { scale = Vector(1.026, 1.026, 1.026), pos = Vector(17.222, -30, 6.111), angle = Angle(14.762, -60.477, -30) },
	["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -0.427, 0) },
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(54.171, 0, 0) },
	["ValveBiped.Grenade_body"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}



SWEP.VElements = {
	["screen_data"] = { type = "Quad", bone = "ValveBiped.Bip01", rel = "screen", pos = Vector(-0.25, -1, -0.824), angle = Angle(0, 0, 180), size = 0.0081, draw_func = nil},
	["pipboy"] = { type = "Model", model = "models/player/items/engineer/bet_pb.mdl", bone = "ValveBiped.Bip01", rel = "Flame_Unit+", pos = Vector(80, -32, 80), angle = Angle(8.876, 87.78, -97.644), size = Vector(0.5, 0.515, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["screen"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01", rel = "pipboy", pos = Vector(0, -21.748, 45.319), angle = Angle(-54.097, 44.271, 146.796), size = Vector(0.09, 0.057, 0.395), color = Color(147, 255, 0, 255), surpresslightning = true, material = "phoenix_storms/white", skin = 0, bodygroup = {} },
	["Flame_Unit+"] = { type = "Model", model = "models/hunter/blocks/cube1x1x05.mdl", bone = "ValveBiped.Bip01_R_Forearm", rel = "", pos = Vector(-30.247, -59.617, -35.069), angle = Angle(-19.726, -19.726, 73.972), size = Vector(0.037, 0.037, 0.037), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/dome", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["Wrench"] = { type = "Model", model = "models/weapons/w_models/w_wrench.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.107, 1.552, 0.518), angle = Angle(0, 0, 180), size = Vector(0.704, 0.704, 0.704), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["pipboy+"] = { type = "Model", model = "models/player/items/engineer/bet_pb.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(35.209, -11.393, -35.21), angle = Angle(-180, 111.845, -116.505), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}




function SWEP:GetEnergy()
	return self.Energy

end



function SWEP:OnInitialize()

//	self.Energy = 0
	
	if((game.SinglePlayer()) || (!game.SinglePlayer() && CLIENT)) then
		self.VElements["screen_data"].draw_func = function( weapon )
					 
			draw.SimpleText(""..self:Clip1(), "CV", 0, 0, Color(0,105,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			 
		end
	end
end




/*---------------------------------------------------------
	PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()


	if(self:Clip1() > 100) then
		self:SetClip1( self:Clip1() - 100)
	end
end

function SWEP:SecondaryAttack()
//	self.Owner:SetAmmo( self.Energy, "Battery" )
	if(self:Clip1() >= 50) then
		self:SetClip1( self:Clip1() - 50)
		self:EmitSound("/ambient/energy/ion_cannon_shot"..math.random(1,3)..".wav")
		util.ScreenShake(self:GetPos(), 30, 20, 1, 900 )
		if (SERVER) then
		
			local proximity_ents = ents.FindInSphere(self:GetPos(),1000)
			
//			local dragons = ents.FindByClass("sent_sci_dragonmine")
			
			for k, v in pairs(proximity_ents) do
				if(v:IsValid()) then
					if(v.RemoteDetonate) then
						v.RemoteDetonate = 1
					end
				end
			end
				
			
		end
	end
end

function SWEP:Think()

//	if(SERVER) then
	if(self:Clip1() < 200) then
		if(self.RechargeTimer + self.RechargeDelay <= CurTime()) then
		
			self:SetClip1( self:Clip1() + 1 )
			self.RechargeTimer = CurTime()
		end
	end
		
//		print(self:Clip1())
//	end

	/*
	if(self.Energy < 1000) then
		self.Energy = self.Energy + 1
	end
	*/
//	self.Owner:SetAmmo( self.Energy, "Battery" )
	
end

