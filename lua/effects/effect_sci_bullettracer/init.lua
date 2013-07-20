
//Shamelessly stolen off the Chad dude who made the Nomad >:C
//I actually made my own version that worked quite similarly but I got frustrated when it wouldn't show up properly when the viewmodel moved in Multiplayer so I trashed it and used Chad's since I assumed it would work. Turns out it didn't either and I couldn't be arsed to do anything else so yeah.

//Cubans
local Smoke = Material( "effects/spark" )
local Flare = Material( "effects/yellowflare" )

TRACER_FLAG_USEATTACHMENT	= 0x0002;

EFFECT.Speed				= 16000;
EFFECT.Length				= 128;


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


function EFFECT:Init( data )

//	if(!data:IsValid()) then return end
	if(!self:IsValid()) then return end

	self.StartPos = self:GetTracerOrigin( data );
	self.EndPos = data:GetOrigin();
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos );

	local diff = ( self.EndPos - self.StartPos );
	
	self.Normal = diff:GetNormal();
	self.StartTime = 0;
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed;
	

end


function EFFECT:Think()

	if(!self:IsValid()) then return end

	self.LifeTime = self.LifeTime - FrameTime();
	self.StartTime = self.StartTime + FrameTime(); 

	return self.LifeTime > 0;

end


function EFFECT:Render()

	if(!self:IsValid()) then return end

	local endDistance = self.Speed * self.StartTime;
	local startDistance = endDistance - self.Length;
	
	startDistance = math.max( 0, startDistance );
	endDistance = math.max( 0, endDistance );

	local startPos = self.StartPos + self.Normal * startDistance;
	local endPos = self.StartPos + self.Normal * endDistance;

	render.SetMaterial( Smoke );
	render.DrawBeam( startPos, endPos, 10, 0, 1, Color(255, 255, 0, 255) );
	
	render.SetMaterial( Flare );
	render.DrawSprite( endPos, 20, 20, Color(255,255,0,255) );
	
end
