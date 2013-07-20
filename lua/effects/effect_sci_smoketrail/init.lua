

//Cubans
local Smoke = Material( "trails/smoke" )


//K now just going to rip off Chad again...




function EFFECT:GetTracerOrigin( data )

	-- this is almost a direct port of GetTracerOrigin in fx_tracer.cpp
	local start = data:GetStart();
	
	-- use attachment?
	if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then

		local entity = data:GetEntity();
		
		if( not IsValid( entity ) ) then return start; end
		if( not game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then return start; end
		
		if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
			-- can't be done, can't call the real function
			-- local origin = weapon:GetTracerOrigin();
			-- if( origin ) then
			-- 	return origin, angle, entity;
			-- end
			
			-- use the view model
			local pl = entity:GetOwner();
			if( IsValid( pl ) ) then
				local vm = pl:GetViewModel();
				if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
					entity = vm;
				else
					-- HACK: fix the model in multiplayer
					if( entity.WorldModel ) then
						entity:SetModel( entity.WorldModel );
					end
				end
			end
		end

		local attachment = entity:GetAttachment( data:GetAttachment() );
		if( attachment ) then
			start = attachment.Pos;
		end

	end
	
	return start;

end





/*---------------------------------------------------------
   Init( data table )
---------------------------------------------------------*/
function EFFECT:Init( data )

//	if(!data:IsValid()) then return end
	if(!self:IsValid()) then return end

	self.texcoord = math.Rand( 0, 20 )/3
	self.Position = data:GetStart()
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	
//	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )
	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin()
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos, Vector()*8 )
	
//	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )

	
//	self.StartPos = LocalPlayer():GetActiveWeapon():GetAttachment(1).pos
//	self.StartPos = LocalPlayer():GetShootPos()










	
	self.Alpha = 255

	
end

/*---------------------------------------------------------
   IBM
---------------------------------------------------------*/
function EFFECT:Think( )

	if(!self:IsValid()) then return end

	
	
	//420 phase it faggot
	self.Alpha = math.Approach(self.Alpha, 0, FrameTime() * 420)
	
	//420 phases it faggot
	if (self.Alpha == 0) then 
		return false 
	else
		return true
	end

end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render( )

	if(!self:IsValid()) then return end
	
	self.Length = (self.StartPos - self.EndPos):Length()
	
	local texcoord = self.texcoord
	
	render.SetMaterial( Smoke )
//	render.DrawBeam( self.StartPos, self.EndPos, 8, texcoord, texcoord + self.Length / 256, Color( 255, 255, 255, math.Clamp(self.Alpha, 0,255)) )
//	render.DrawBeam( self.StartPos, self.EndPos, 4, 1, 1, Color( 255, 255, 255, math.Clamp(self.Alpha, 0,255)) )
	render.DrawBeam( self.StartPos, self.EndPos, 2, texcoord, texcoord + self.Length / 256, Color( 255, 255, 255, math.Clamp(self.Alpha, 0,255)) )
					 
end
