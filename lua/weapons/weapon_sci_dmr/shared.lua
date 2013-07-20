//Dependant on AR34 to be loaded since it needs the font in there.


AddCSLuaFile( "shared.lua" )
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

if (CLIENT) then
	//Garry made a new way to do fonts. :C
	//Since it doesn't aliasize like it should since it's a .ttf, we have to do it make it huge then resize it later....
	surface.CreateFont( "CV25",
	{
		font      = "coolvetica",
		size      = ScreenScale(25),
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




	
SWEP.Author				= "Awcmon"
SWEP.Slot				= 4
SWEP.SlotPos			= 1


SWEP.PrintName               = "DMR"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "More OP close quarters than you'd think."                  
SWEP.Spawnable                = true          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase_bullet"
SWEP.Category			= "Sci-fi Weapons"


SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_snip_g3sg1.mdl"
//SWEP.ViewModel = "models/weapons/cstrike/c_snip_g3sg1.mdl"
SWEP.WorldModel = "models/weapons/w_snip_g3sg1.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true






/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_G3SG1.Single" )
SWEP.Primary.Automatic = false
SWEP.Primary.ClipSize        = 20
SWEP.Primary.DefaultClip    = 60
SWEP.Primary.Ammo            = "ar2"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 95
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.005
SWEP.Primary.Delay 			= 60/600



--Custom Vars
SWEP.Damage 				= 70


SWEP.RecoilUp1 				= -0.5
SWEP.RecoilUp2				= 0.5
SWEP.RecoilSide1			= -1
SWEP.RecoilSide2			= 1
SWEP.RecoilRoll1			= -1
SWEP.RecoilRoll2			= 1


SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(10,-15,0)
SWEP.VMOffsetRight 			= 0
SWEP.VMOffsetUp 			= 0
SWEP.VMOffsetForward 		= 0

SWEP.DrawAnimSpeed 			= 1.5

SWEP.CanFireOnSprint		= 0


//Custom spread system-- TOO CUSTOMIZABLE!!!
//SWEP.Primary.Cone is useless now. :D
SWEP.SpreadMaximum			= 0.2						//Maximum spread
SWEP.SpreadMinimum			= 0.0025					//Kinda pointless I guess, but still kinda needed.
SWEP.SpreadWalkMod			= 3						//Multiplied Amount: How much mashing WASD effects your spread
SWEP.SpreadVelocityMod		= 0.2					//Multiplied Amount: How much your raw velocity effects spread
SWEP.SpreadJumpMod			= 2						//Multiplied Amount: How much being in the air effects spread
SWEP.SpreadCrouchMod		= 0.3					//Multiplied Amount: How much crouching effects spread
SWEP.SpreadSprintMod		= 2						//Multiplied Amount: How much sprinting effects spread
SWEP.SpreadRecoverRate		= 0.2					//Multiplied Amount: What rate does spread go back down to the minimum? 
SWEP.SpreadIncreaseRate		= 0.025						//Multiplied amount: How much does it increase when you shoot?
SWEP.CoolDownTime 			= 0.4					//Play around with it until you get what you want
SWEP.CurSpread				= 0.01						//Don't touch this...
SWEP.LastAtt 				= CurTime()				//Don't touch this either.

SWEP.TracerName				= "effect_sci_smoketrail"


SWEP.VElements = {
	["ammocount"] = { type = "Quad", bone = "v_weapon.g3sg1_Parent", rel = "", pos = Vector(0, 5.174, -1.53), angle = Angle(-0, 0, 180), size = 0.0035, draw_func = nil},
	["combinecartridge"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "v_weapon.g3sg1_Parent", rel = "", pos = Vector(0, 5.056, -1.499), angle = Angle(136.212, 90, 0), size = Vector(0.223, 0.254, 0.223), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["combinecartridge+"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "v_weapon.g3sg1_Parent", rel = "", pos = Vector(0, 3.818, -2.51), angle = Angle(-71.875, 90, 0), size = Vector(0.223, 0.254, 0.223), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["rail"] = { type = "Model", model = "models/Items/battery.mdl", bone = "v_weapon.g3sg1_Parent", rel = "", pos = Vector(0, 4.056, 1.475), angle = Angle(0, -90, 0), size = Vector(0.685, 0.234, 1.498), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.WElements = {
	["ammocount"] = { type = "Quad", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.825, 0, -5.726), angle = Angle(0, 90, -90), size = 0.05, draw_func = nil},
	["rail"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.711, 0.268, -4.419), angle = Angle(-90, 0, 0), size = Vector(0.685, 0.234, 2.128), color = Color(200, 200, 200, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["combinecartridge+"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.118, 0.287, -4.77), angle = Angle(-83.669, 0, 0), size = Vector(0.223, 0.254, 0.223), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["combinecartridge"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.849, 0, -5.875), angle = Angle(81.388, 0, 0), size = Vector(0.223, 0.254, 0.223), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


function SWEP:OnInitialize()


	

	self.VElements["ammocount"].draw_func = function( weapon )
             
        draw.SimpleText(""..weapon:Clip1(), "CV", 0, 0, Color(0,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
     
    end
		
end


local FOVSlide = 0

function SWEP:TranslateFOV(oldfov)

	if self.Owner:KeyDown(IN_ATTACK2) then 
//	FOVSlide = math.Approach(FOVSlide, 55, 0.5)
	FOVSlide = math.Approach(FOVSlide, 55, 60*FrameTime())
	return  oldfov - FOVSlide
	else
//	FOVSlide = math.Approach(FOVSlide, 0, 0.5)
	FOVSlide = math.Approach(FOVSlide, 0, 60*FrameTime())
	return oldfov - FOVSlide
	end
	
end

function SWEP:AdjustMouseSensitivity()
	return (1-(FOVSlide/80))
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
	
	surface.SetDrawColor( 0, 255, 255, 255 )

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
	//If user is sc0p1ng
	if self.Owner:KeyDown(IN_ATTACK2) then 
	
		local traceRes = self.Owner:GetEyeTrace()
		if((traceRes.Entity:IsNPC() || traceRes.Entity:IsPlayer()) && traceRes.Entity:IsValid()) then
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
		
		surface.SetFont("CV25")
		surface.SetTextColor( 0, 255, 255, 155 )
		surface.SetTextPos( ScrW()/2, ScrH()/1.4 ) 
//		surface.DrawText( "Range: "..((hitpos-self.Owner:GetPos()):Length()*(3/4))/(25.4) )
		surface.DrawText( "Yaw: "..math.Round((self.Owner:EyeAngles().yaw + 180), 0) )
	end
	
//	print(eyeTrace)
	
	
	
end
