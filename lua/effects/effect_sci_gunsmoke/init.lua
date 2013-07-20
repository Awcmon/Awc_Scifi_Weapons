//sprites/autoaim_1a
//sprites/reticle, 1, 2
//sprites/rico1
//sprites/richo1
//sprites/hud/v_crosshair1, 2
//effects/combinebinocoverlay

/*
local smokestartalpha = CreateClientConVar("scifi_armaments_gunsmokealpha", 1, true, false)
local smokestartsize = CreateClientConVar("scifi_armaments_gunsmokessize", 1, true, false)
local smokeendsize = CreateClientConVar("scifi_armaments_gunsmokeesize", 1, true, false)
*/

//I basically copied right off of Acruid who copied right from WAC

function EFFECT:Init(data)
//	if(!data:IsValid()) then return end
	if(!self:IsValid()) then return end

	self.Parent = data:GetEntity()
	if(not (self.Parent):IsValid()) then return end
	self.Entity:SetParent(self.Parent)
	local radius = tonumber(data:GetRadius()) or 1
	if(radius > 1) then
		self.Size = radius
	end
	self.Entity:SetRenderBounds(Vector()*self.Size*(-2),Vector()*self.Size*2)
	
	
	//wth that wasnt there before wtf
	local light = DynamicLight( self:EntIndex() )
            light.Pos            = self:GetPos()+ Vector(0,0,75)
            light.Size            = 400
            light.Decay            = 10
            light.R                = 255
            light.G                = 255
            light.B                = 255
            light.Brightness    = 4
            light.DieTime        = CurTime() + 0.05
    
	
end


function EFFECT:Think()
	if(!self:IsValid()) then return end

	local viewmodel
	if !self.Parent then return end
	if !self.Parent:GetActiveWeapon().EffectsOffset then return end
	if(self.Parent == LocalPlayer() and self.Parent == GetViewEntity()) then
		viewmodel = self.Parent:GetViewModel()
//		print("VM")
	else
		if(self.Parent.GetActiveWeapon) then
			viewmodel = self.Parent:GetActiveWeapon()
//			print("Active weapon")
		end
	end
	if(not (viewmodel):IsValid()) then return end;
	local attach = viewmodel:GetAttachment(1)
	if(not attach) then return end
	if attach.Pos then
		start = attach.Pos + (self.Parent:EyeAngles():Right() * self.Parent:GetActiveWeapon().EffectsOffset.x) + (self.Parent:EyeAngles():Up() * self.Parent:GetActiveWeapon().EffectsOffset.y) + (self.Parent:EyeAngles():Forward() * self.Parent:GetActiveWeapon().EffectsOffset.z)
	end
	
	self.Table = self.Parent:GetActiveWeapon().MuzzleFlashAdd
	self.Forward = self.Parent:GetAimVector()
	self.Angle	= self.Forward:Angle()
	self.Right = self.Angle:Right()

	local emitter = ParticleEmitter(start)	

	/*
		for i = 1,2 do
			local particle = emitter:Add("particle/particle_smokegrenade", start + (i*3)*self.Forward)
//			particle:SetVelocity(((i/2)*250)*self.Forward + AddVel/5 + VectorRand()*100)
			particle:SetVelocity(500*self.Forward + VectorRand()*100)
//			particle:SetGravity(AddVel + VectorRand()*1000)
//			particle:SetGravity(VectorRand()*1000)
			particle:SetDieTime(0.5)
			particle:SetStartAlpha(30)
			particle:SetStartSize(6/i)
			particle:SetEndSize(10*(10/i))
			particle:SetRoll(math.Rand(180,480))
			particle:SetRollDelta(math.Rand(-1,1))
			particle:SetColor(200,200,200)	
			particle:SetAirResistance(500)
		end
	*/
	
		local particle = emitter:Add("particle/particle_smokegrenade", start + (3)*self.Forward)
		particle:SetVelocity(500*self.Forward + VectorRand()*100)
		particle:SetDieTime(0.5)
		particle:SetStartAlpha(255)
		particle:SetStartSize(3)
		particle:SetEndSize(30)
		particle:SetRoll(math.Rand(180,480))
		particle:SetRollDelta(math.Rand(-1,1))
		particle:SetColor(200,200,200)	
		particle:SetAirResistance(500)

	
	
	emitter:Finish()
	return false	
end


function EFFECT:Render()	
end














