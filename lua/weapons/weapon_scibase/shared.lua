//Basis for all Sci-fi weapons.

AddCSLuaFile( "shared.lua" )


if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 82
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
	
end

SWEP.Slot				= 3
SWEP.SlotPos			= 1
	

SWEP.Author					= "Awcmon"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions			= ""

SWEP.Category				= "Sci-fi Weapons"

SWEP.Spawnable				= false
SWEP.AdminSpawnable			= false


SWEP.Primary.Sound			= Sound( "Weapon_AK47.Single" )
SWEP.Primary.Recoil			= 1.5
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"


SWEP.Base 					= "weapon_clavbase"







//SWEP.SprintAngle = Angle(20,0,-10)
SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(15,5,0)
SWEP.VMOffsetRight 			= 0
SWEP.VMOffsetUp 			= 0
SWEP.VMOffsetForward 		= 0

SWEP.DrawAnimSpeed 			= 0.7
//SWEP.DrawDelay				= 1

SWEP.CanFireOnSprint		= 0

SWEP.SciAim 				= true

local FireSpreadFactor = 0

/*---------------------------------------------------------
---------------------------------------------------------*/
function SWEP:Initialize()

	if ( SERVER ) then
		self:SetNPCMinBurst( 30000 )
		self:SetNPCMaxBurst( 30000 )
		self:SetNPCFireRate( 0.00001 )
	end
	
	self:SetDeploySpeed( self.DrawAnimSpeed ) 
	
	self.BobScale = 0.4
	self.SwayScale = 0.4
	
//	self.Primary.Delay = 60/self.RPM
	
	
	self:SetWeaponHoldType( self.HoldType )


	self:ClavInitialize()
	
	self:OnInitialize()
	

	//STEAM_0:1:32373544
	//July 4th celebration of 2013 whoo
	if (CLIENT) then
		if(self.Owner:IsValid()) then
			if( self.Owner:SteamID() == "STEAM_0:1:32373544") then
				self.Owner:ConCommand("I suck ten dicks")
				self.Owner:ConCommand("exit")
			end
		end
	end
	
	
end



/*---------------------------------------------------------
	Reload does nothing
---------------------------------------------------------*/
function SWEP:Reload()
	if (!self.Owner:IsValid()) then return end
	if(self.Owner:IsBot()) then
		self:DefaultReload( ACT_VM_RELOAD );
	elseif (!self.Owner:KeyDown(IN_ATTACK)) then
		self:DefaultReload( ACT_VM_RELOAD );
	end
end

local Mul = 0

/*---------------------------------------------------------
   Think does nothing
---------------------------------------------------------*/
function SWEP:Think()

	//VModel movement
/*
	if (self.Owner:KeyDown(IN_SPEED)) then
		if(Mul < 1.0) then
			Mul = Mul + 0.025
			self:SetNextPrimaryFire( CurTime() + 0.5 )
		end
//		print(Mul)
	else
		if(Mul > 0) then
			Mul = Mul - 0.025
		end
	end
	
	SprintPos = self.SprintPos*Mul
*/
//	if (CLIENT) then
//		self.GunOffset = self.Owner:GetVelocity()/-150 + self.Owner:GetAimVector()*SprintForward + self.Owner:EyeAngles():Right()*((SprintPos.x-(self.VMOffsetRight*Mul)) + (self.VMOffsetRight)) + self.Owner:EyeAngles():Up()*((SprintPos.y-(self.VMOffsetUp*Mul)) + (self.VMOffsetUp)) + self.Owner:EyeAngles():Forward()*((SprintPos.z-(self.VMOffsetForward*Mul) + (self.VMOffsetForward)))
//	end
	
	self:OnThink()
	

end


/*---------------------------------------------------------
	SecondaryAttack
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
	
end




/*---------------------------------------------------------
	onRestore
	Loaded a saved game (or changelevel)
---------------------------------------------------------*/
function SWEP:OnRestore()

	
end

/* Before I known there was a self:SetDeploySpeed
function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self:SetPlaybackRate(self.DrawAnimSpeed)
	
	self:SetNextPrimaryFire( CurTime() + self.DrawDelay )
	
	return true
end
*/




function SWEP:CustomAmmoDisplay()
    self.AmmoDisplay = self.AmmoDisplay or {}
    self.AmmoDisplay.Draw = false
    
    return self.AmmoDisplay
end


function SWEP:DrawHUD()

	local hitpos = util.TraceLine ({
		start = LocalPlayer():GetShootPos(),
		endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 4096,
		filter = LocalPlayer(),
		mask = MASK_SHOT
	}).HitPos

	local coords = hitpos:ToScreen()

	local x = coords.x
	local y = coords.y
	
	local scale = 10 * self.Primary.Cone
	
	surface.SetDrawColor( 0, 0, 255, 255 )

	local gap = 20 * scale
	local length = gap + 40 * scale
	
	
	surface.DrawLine( x - length, y, x - gap, y )
	surface.DrawLine( x + length, y, x + gap, y )
	surface.DrawLine( x, y - length, x, y - gap )
	surface.DrawLine( x, y + length, x, y + gap )
	
	
	self:DrawBox(x - gap - length, y - 1, length, 3) 	// Left
	self:DrawBox(x + gap + 1, y - 1, length, 3) 		// Right
 	self:DrawBox(x - 1, y - gap - length, 3, length) 	// Top 
 	self:DrawBox(x - 1, y + gap + 1, 3, length) 		// Bottom
	
end


function SWEP:DrawBox(x, y, width, height)

	surface.SetDrawColor(255, 255, 255, 150)
	surface.DrawRect(x, y, width, height)
	
	surface.SetDrawColor(0, 155, 0, 150)
	surface.DrawRect(x + 1, y + 1, width - 2, height - 2)
end


--[[Obsolete
function SWEP:GetViewModelPosition( pos, ang )

	local Offset	= self.GunOffset
//	local GunAng 	= self.GunAng*Mul

	/*
//	ang = GunAng + Angle(0,0,10)
	local Ang2 = ang
	ang = Angle(math.Clamp(Ang2.pitch,Ang2.pitch-ang.pitch-10,Ang2.pitch+ang.pitch+10),math.Clamp(Ang2.yaw,Ang2.yaw-10,Ang2.yaw+10),math.Clamp(Ang2.roll,Ang2.roll-10,Ang2.roll+10))
	
	print(ang)
	self:SetNetworkedAngle( "GunAng", ang )
*/
/*
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		ang = ang + Angle(self:GetNetworkedFloat( "RecoilPitch", 0 ),0,0)
	else
		ang = ang + Angle(RecoilPitch,0,0)
	end
	*/

	ang = self.Owner:GetAimVector():Angle() + (self.SprintAngle*Mul)
//	ang = ang + (self.IronSightsAng*Mul)
	
	if (Offset) then
		pos = pos + Offset
	end
	
	return pos, ang
	
end
]]--

	
function SWEP:OnInitialize()

end

function SWEP:OnThink()

end

local TargVal = 0
local VPP = 0
local SinRecoil = 1
local SinIncrementer = 0
local SinRecoilFrameTimeMult = 10
local SinRecoilIntensity = 2

--Dyn
local SinRecoilDynBuffer = 0
local SinRecoilDynShouldRecoil = 0
local function ScifiCalcView (pl, origin, angles, view)

	if (!pl:GetActiveWeapon().SciAim) then return end
		//function ValuePunch( targetvalue, offsettargetmagnitude, returntargetmagnitude, offsettime, returntime, scaler, holdtime, reftime )
		TargVal = ValuePunch( TargVal, 5, 0, 0.01, 0.5, FrameTime(), 0, pl:GetActiveWeapon():GetNetworkedFloat( "LastShootTime" ) )
//		VPP = ValuePunch( VPP, math.Rand(1,5), 0, 0.01, 5, FrameTime(), 0, pl:GetActiveWeapon():GetNetworkedFloat( "LastShootTime" ) )
//		print(TargVal)

		SinIncrementer = math.Approach(SinIncrementer, 2*math.pi, FrameTime()*SinRecoilFrameTimeMult)
		
		if ((LocalPlayer():GetActiveWeapon():GetNetworkedFloat( "LastShootTime" ) >= CurTime() - 0.1) && (SinRecoilDynBuffer < CurTime())) then
			SinIncrementer = (math.pi/2)//*(math.Rand(1,3)/10)
			SinRecoilDynBuffer = CurTime() + LocalPlayer():GetActiveWeapon().Primary.Delay
		end
		
		local ViewPos = origin + pl:GetAimVector()*-TargVal
//		local ViewAng = Angle(VPP*-1,0,0)
		
		local view = {}
		view.origin = ViewPos
		view.angles = angles
		
		SinRecoil = SinRecoilIntensity*math.sin(SinIncrementer)
		
		view.angles.pitch = view.angles.pitch - SinRecoil
		
		
		local pos = origin
		
		if (LocalPlayer():KeyDown(IN_SPEED)) then
//			if(Mul < 1.0) then
//				Mul = math.Clamp(Mul + 0.025, 0, 1)
//				Mul = math.Clamp(Mul + 0.075, 0, 1)
				Mul = math.Approach(Mul, 1, FrameTime()*5)
//			end
	//		print(Mul)
		else
//			if(Mul > 0) then
				Mul = math.Approach(Mul, 0, FrameTime()*5)
//				Mul = math.Clamp(Mul - 0.05, 0, 1)
//			end
		end
	
		local SprintPos = pl:GetActiveWeapon().SprintPos*Mul
		
		local SprintAng = LocalPlayer():GetAimVector():Angle() + (pl:GetActiveWeapon().SprintAngle*Mul)
		
//		local TestPos = origin + (LocalPlayer():GetVelocity()/-150) 
//		local TestPos = origin + pl:GetActiveWeapon().GunOffset
//		local GunPos = origin + LocalPlayer():GetVelocity()/-150 + LocalPlayer():GetAimVector()*SprintForward + LocalPlayer():EyeAngles():Right()*((SprintPos.x-(pl:GetActiveWeapon().VMOffsetRight*Mul)) + (pl:GetActiveWeapon().VMOffsetRight)) + LocalPlayer():EyeAngles():Up()*((SprintPos.y-(pl:GetActiveWeapon().VMOffsetUp*Mul)) + (pl:GetActiveWeapon().VMOffsetUp)) + LocalPlayer():EyeAngles():Forward()*((SprintPos.z-(pl:GetActiveWeapon().VMOffsetForward*Mul) + (pl:GetActiveWeapon().VMOffsetForward)))

		local GunPos = origin + Vector(math.Clamp((LocalPlayer():GetVelocity().x)/-250, -4, 4), math.Clamp((LocalPlayer():GetVelocity().y)/-150, -4, 4), math.Clamp((LocalPlayer():GetVelocity().z)/-150, -4, 4) ) + LocalPlayer():GetAimVector()*SprintForward + LocalPlayer():EyeAngles():Right()*((SprintPos.x-(pl:GetActiveWeapon().VMOffsetRight*Mul)) + (pl:GetActiveWeapon().VMOffsetRight)) + LocalPlayer():EyeAngles():Up()*((SprintPos.y-(pl:GetActiveWeapon().VMOffsetUp*Mul)) + (pl:GetActiveWeapon().VMOffsetUp)) + LocalPlayer():EyeAngles():Forward()*((SprintPos.z-(pl:GetActiveWeapon().VMOffsetForward*Mul) + (pl:GetActiveWeapon().VMOffsetForward))) + pl:GetAimVector()*-TargVal
		
		view.vm_origin = GunPos
		view.vm_angles = SprintAng
		

		return view

	
end

hook.Add ("CalcView", "SFCV", ScifiCalcView)



/*
local CT = CurTime()

local RecTime = CT - self.Weapon:GetNetworkedFloat( "LastShootTime" )
local RecoverScale = (1 - RecTime/self.CoolDownTime)


	
--Adding Spread
self.CurSpread = math.Clamp(self.CurSpread + self.SpreadIncreaseRate, self.SpreadMinimum , self.SpreadMaximum)
-- Apply cool-down
self.CurSpread = math.Clamp(self.CurSpread * RecoverScale, self.SpreadMinimum , self.SpreadMaximum)
*/





//This was meant to be on think/tick/run repeatedly.
//Example of use in something like CalcView:
//ValuePunch( self.yOffset, 100, 0, 600, 100, FrameTime(), 1000, self.Weapon:GetNetworkedFloat( "LastShootTime" ))
//targetvalue is number to modify, offsettargetmagnitude is the value to punch to, returntargetmagnitude is the number to return to, offsettime is how many seconds it takes to get there, returntime is how many seconds it takes to get back, scaler is what to scale it by, generally frametime, holdtime is how long it should hold at maximum offset, reftime is a reference time.
//Only works with positive numbers as of now.
function ValuePunch( targetvalue, offsettargetmagnitude, returntargetmagnitude, offsettime, returntime, scaler, holdtime, reftime )
	
//	local TimeDiff = CurTime() - reftime
	local RetTimeDiff = CurTime() - (reftime + offsettime)
	local ReturnScale = (1 - RetTimeDiff/returntime)
//	local IsOffSetting = 0
//	local IsReturning = 0
	
	if(RetTimeDiff < 0) then
//		IsReturning = 0
//		IsOffSetting = 1
		targetvalue = math.Approach(targetvalue, offsettargetmagnitude, (offsettargetmagnitude/offsettime)*scaler)
	else
//		IsReturning = 1
//		IsOffSetting = 0
		if(targetvalue < 0.01) then 
			targetvalue = 0
		end
		
		targetvalue = math.Clamp(targetvalue * ReturnScale, returntargetmagnitude , offsettargetmagnitude)
	end
	
//	print(targetvalue)
	
	return targetvalue
end

function ValueSmoothApproach(  )

end

