//Chug out Dragon mines full auto...
//Model made by BFG.


AddCSLuaFile( "shared.lua" )

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false




		
SWEP.Slot				= 3
SWEP.SlotPos			= 10


SWEP.PrintName               = "Dragon Master"              -- Name of your SWEP
SWEP.Author                = "Awcmon"                 --Author
SWEP.Purpose                = "dataDyne on drugs"           
SWEP.Spawnable                = false          --Can it be spawned by normal players?
SWEP.AdminSpawnable            = true           -- Can it be spawned by admin?
SWEP.Base 						= "weapon_scibase"
SWEP.Category			= "Sci-fi Weapons"


SWEP.HoldType = "ar2"
SWEP.ViewModelFOV = 57
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false


/*--------------------------
Primary Functions Init
---------------------------*/
SWEP.Primary.Sound = Sound( "Weapon_Galil.Single" )
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize        = 30
SWEP.Primary.DefaultClip    = 200
SWEP.Primary.Ammo            = "smg1"
SWEP.Secondary.Ammo = "none"

SWEP.Primary.Recoil			= 1
SWEP.Primary.Damage			= 55
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.03
SWEP.Primary.Delay 			= 60/700




SWEP.SprintPos 				= Vector(0,0,0)
SWEP.SprintAngle 			= Angle(-20,0,0)

SWEP.VMOffsetRight 			= -1
SWEP.VMOffsetUp 			= 1.5
SWEP.VMOffsetForward 		= 0


SWEP.DrawAnimSpeed 			= 1.2

SWEP.CanFireOnSprint		= 1



/*---------------------------------------------------------
	PrimaryAttack
---------------------------------------------------------*/
function SWEP:PrimaryAttack()

	if( self.Owner:KeyDown(IN_SPEED) && self.CanFireOnSprint == 0) then return end

	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	if (SERVER) then
		
		local dragon = ents.Create("sent_sci_dragonmine")
			dragon:SetPos(self.Owner:GetShootPos() + self.Owner:GetAimVector() * 50 + self.Owner:GetRight()*10)
			dragon:SetAngles(self.Owner:EyeAngles())
			dragon:SetOwner(self.Owner)
//			dragon.DragonOwner = self:GetOwner()
		dragon:Spawn()
		
		local phys = dragon:GetPhysicsObject()
		phys:ApplyForceCenter(self.Owner:GetAimVector() * 5000)
		
	end
	

	
	// Play shoot sound
//	self:EmitSound( self.Primary.Sound )


	
	if ( self.Owner:IsNPC() ) then return end
	
	
	// In singleplayer this function doesn't get called on the client, so we use a networked float
	// to send the last shoot time. In multiplayer this is predicted clientside so we don't need to 
	// send the float.
	if ( (game.SinglePlayer() && SERVER) || CLIENT ) then
		self:SetNetworkedFloat( "LastShootTime", CurTime() )
//		self:SetNetworkedFloat( "RecoilPitch", RecoPitch )
	end
	

	
	
	
end

function SWEP:SecondaryAttack()

	if (SERVER) then
		
		local dragons = ents.FindByClass("sent_sci_dragonmine")
		
		for k, v in pairs(dragons) do
			v.RemoteDetonate = 1
		end
			
		
	end
end
