local model = "models/weapons/w_rif_galil.mdl" -- What model should it be?
local classname = "sent_sci_dragonmine" -- This should be the name of the folder containing this file.
local ShouldSetOwner = true -- Set the entity's owner?

-------------------------------
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )
-------------------------------

--------------------
-- Spawn Function --
--------------------
function ENT:SpawnFunction( ply, tr )

	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 25
	local ent = ents.Create( classname )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	if ShouldSetOwner then
		ent.Owner = ply
	end
	return ent
	
end

----------------
-- Initialize --
----------------
function ENT:Initialize()
	
	self.Entity:SetModel( model )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	
	self.ExplodeOnce = 0
	self.SoundOnce = 0
	self.RemoteDetonate = 0
	
	self.Spawntime = CurTime()
end

-----------------
-- Take Damage -- 
-----------------
function ENT:OnTakeDamage( dmginfo )
	self.Entity:TakePhysicsDamage( dmginfo )

end

------------
-- On use --
------------
function ENT:Use( activator, caller )

end

-----------
-- Think --
-----------
function ENT:Think()

end

-----------
-- Touch --
-----------
function ENT:Touch(ent)

end

--------------------
-- PhysicsCollide -- 
--------------------
function ENT:PhysicsCollide( data, physobj )

end

function ENT:PhysicsUpdate()

end

function ENT:Think()

	if ( !self:IsValid() ) then return end
	
	if( !self:GetOwner():IsValid()) then
		self:Remove()
	end
		
	local proximity_ents = ents.FindInSphere(self:GetPos(),192)
	
	if(CurTime() > self.Spawntime + 2 && self.SoundOnce == 0) then
		self.SoundOnce = 1
		self:EmitSound( "buttons/button24.wav" )
	end
	
//	print(proximity_ents)
	
	for k, v in pairs(proximity_ents) do
//		print(v)
		if( ((v:IsPlayer() || v:IsNPC()) && (CurTime() > self.Spawntime + 2)) || self.RemoteDetonate == 1 ) then
			if self.ExplodeOnce == 0 then
				self.ExplodeOnce = 1
				
				
				local expl = ents.Create("env_explosion")
				expl:SetKeyValue("spawnflags",128)
		//		expl:SetKeyValue( "iMagnitude", "150" )
				expl:SetPos(self:GetPos())
				expl:Spawn()
				expl:Fire("explode","",0)
				expl:SetOwner( self.Owner )
				
				local FireExp = ents.Create("env_explosion")
				FireExp:SetPos(self:GetPos())
				FireExp:SetOwner( self.Owner )
				FireExp:SetParent(self)
				FireExp:SetKeyValue("iMagnitude", 500)
				FireExp:SetKeyValue("radius", 200)
				FireExp:SetKeyValue("spawnflags", "1")
				FireExp:Spawn()
				FireExp:Fire("Explode", "", 0)
				FireExp:Fire("kill", "", 5)
				
				//Fun DoD:S physics ie. everything flies away
				for k, v in pairs(proximity_ents) do
					if(v:IsValid() && !v:IsPlayer() && !v:IsNPC() && v:GetPhysicsObject():IsValid()) then
						//If you're using extra heavy props to counteract this, well, GetMass is on my side >:D
						v:GetPhysicsObject():ApplyForceCenter((v:GetPos() - self:GetPos())*100 * v:GetPhysicsObject():GetMass())
//						print(v)
					end
				end
				
				
				
				util.BlastDamage( self, self:GetOwner(), self:GetPos(), 300, 150000)
				util.ScreenShake(self:GetPos(), 30, 20, 0.5, 900 )
				
				self:Remove()
			end
		end
	end

end