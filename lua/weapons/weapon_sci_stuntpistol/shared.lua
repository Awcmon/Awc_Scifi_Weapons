//More of a template if anything.


AddCSLuaFile( "shared.lua" )
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




	
SWEP.Author				= "Awcmon"
SWEP.Slot				= 1
SWEP.SlotPos			= 2


SWEP.PrintName               = "USP LAM"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "Asymmetrical"                  
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"

//SWEP.UseHands = true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 57
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true





/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_Pistol.Single" )
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize        = 20
SWEP.Primary.DefaultClip    = 1000
SWEP.Primary.Ammo            = "pistol"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 0.05
SWEP.Primary.Damage			= 50
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.01
SWEP.Primary.Delay 			= 60/600



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

SWEP.DrawAnimSpeed 			= 3

SWEP.CanFireOnSprint		= 1





//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.1						//Maximum spread
SWEP.SpreadMinimum			= 0.01					//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 1						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 1					//Multiplied Amount: How much your raw velocity effects spread
SWEP.SpreadJumpMod			= 1.1						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.8					//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 1.1						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2					//Multiplied Amount: What rate does spread go back down to the minimum? 
SWEP.SpreadIncreaseRate		= 0.001						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 0.2					//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()				//Don't touch this either.


SWEP.VElements = {
	["Flashlight"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01", rel = "LAM_base", pos = Vector(0, 0.202, -1.879), angle = Angle(0, 0, 0), size = Vector(0.067, 0.067, 0.097), color = Color(32, 31, 31, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 7, bodygroup = {[4] = 2} },
	["Laser"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01", rel = "LAM_base", pos = Vector(0, -1.218, 0), angle = Angle(0, 0, 0), size = Vector(0.041, 0.041, 0.067), color = Color(128, 128, 128, 255), surpresslightning = false, material = "/phoenix_storms/gear", skin = 0, bodygroup = {} },
	["LAM_base"] = { type = "Model", model = "models/props_wasteland/controlroom_storagecloset001a.mdl", bone = "ValveBiped.base", rel = "", pos = Vector(0, 0.607, 3.244), angle = Angle(0, 180, 0), size = Vector(0.041, 0.054, 0.041), color = Color(64, 65, 65, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["Laser_beam"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01", rel = "Laser", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 4.992), color = Color(255, 0, 0, 64), surpresslightning = true, material = "/models/shiny", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["Flashlight"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "LAM_base", pos = Vector(0, 0.202, -0.811), angle = Angle(0, 0, 0), size = Vector(0.067, 0.067, 0.067), color = Color(32, 31, 31, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 7, bodygroup = {[4] = 2} },
	["Laser"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "LAM_base", pos = Vector(0, -1.218, 0), angle = Angle(0, 0, 0), size = Vector(0.041, 0.041, 0.067), color = Color(128, 128, 128, 255), surpresslightning = false, material = "/phoenix_storms/gear", skin = 0, bodygroup = {} },
	["LAM_base"] = { type = "Model", model = "models/props_wasteland/controlroom_storagecloset001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.402, 2.072, -1.435), angle = Angle(-0.408, 90.253, 96.454), size = Vector(0.041, 0.054, 0.041), color = Color(64, 65, 65, 255), surpresslightning = false, material = "phoenix_storms/gear", skin = 0, bodygroup = {} },
	["w_lightlens"] = { type = "Model", model = "models/props_phx/construct/metal_dome360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Flashlight", pos = Vector(0, 0, 2.779), angle = Angle(0, 0, 0), size = Vector(0.017, 0.009, 0.017), color = Color(160, 160, 160, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
	["w_laserdot"] = { type = "Model", model = "models/props_phx/ball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Laser", pos = Vector(0, 0, 2.779), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 0, 0, 255), surpresslightning = true, material = "/models/debug/debugwhite", skin = 0, bodygroup = {} },
	["Laser_beam"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Laser", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.009, 0.009, 0.782), color = Color(255, 0, 0, 64), surpresslightning = true, material = "/models/shiny", skin = 0, bodygroup = {} }
}










local TurnSmoother = 0
local ShouldTurn = 0
local eyeang2 = 0

	
function SWEP:SecondaryAttack()

	
	local pos = self.Owner:GetShootPos()
	local ang = self.Owner:GetAimVector()
	local tracedata = {}
	tracedata.start = pos
	tracedata.endpos = pos+(ang*64)
	tracedata.filter = self.Owner
	local trace = util.TraceLine(tracedata)
	if ( trace.HitWorld or trace.Entity:IsValid() ) then
	
		self.Weapon:EmitSound ("physics/flesh/flesh_impact_hard"..math.random(1,3)..".wav", 100, 100)
		local Vel = self.Owner:GetVelocity()
		self.Owner:SetVelocity(Vel/20 + Vector(0,0,200))
		self.Owner:SetLocalVelocity((self.Owner:GetAimVector() * -400))
		self.Owner:ViewPunch( Angle( math.Rand(10,-10), math.Rand(10, -10), math.Rand(20, -20) ) )
//		self.Owner:ViewPunch( Angle(0, 0, 0 ) )
		
		
		--[[Part of old turning function but for some odd reason didn't like SP
		if ((!game.SinglePlayer() && CLIENT) || (game.SinglePlayer())) then
			TurnSmoother = 0
			ShouldTurn = 1
			
			if ((!game.SinglePlayer() && CLIENT)) then
				eyeang2 = LocalPlayer():EyeAngles()
			else
				eyeang2 = self.Owner():EyeAngles()
			end
		end
		/*
		local eyeang2 = self.Owner:EyeAngles()
		eyeang2.yaw = eyeang2.yaw - 180
		self.Owner:SetEyeAngles( eyeang2 )
		*/
		
		]]--
	end
end

/* Part of old turning function but for some odd reason didn't like SP
function SWEP:OnThink()
	if ((!game.SinglePlayer() && CLIENT) || (game.SinglePlayer())) then
		if(ShouldTurn == 1 && TurnSmoother < 180) then
			//Val of 5 turns 36 times
			eyeang2.yaw = eyeang2.yaw + 9
			if ((!game.SinglePlayer() && CLIENT)) then
				LocalPlayer():SetEyeAngles( eyeang2 )
			else
				self.Owner:SetEyeAngles( eyeang2 )
			end
			TurnSmoother = TurnSmoother + 9
		elseif (TurnSmoother < 180) then
			TurnSmoother = 0
			ShouldTurn = 0
		end
	end
end
*/