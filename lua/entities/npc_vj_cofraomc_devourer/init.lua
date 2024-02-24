include("entities/npc_vj_cofraom_devourer/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/classic/barnacle.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_CustomOnInitialize()
    self.SoundTbl_Death = {
	"vj_cofr/aom/devourer/classic/bcl_die1.wav",
	"vj_cofr/aom/devourer/classic/bcl_die3.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/aom/devourer/classic/bcl_chew1.wav",
    "vj_cofr/aom/devourer/classic/bcl_chew2.wav",
    "vj_cofr/aom/devourer/classic/bcl_chew3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(18,18,0),Vector(-18,-18,-50))
	self:SetSurroundingBounds(Vector(-60, -60, -60), Vector(60, 60, 40))
	//self:GetPoseParameters(true) -- tongue_height 0 / 1024
	self:Devourer_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local velInitial = Vector(0, 0, 2)
--
function ENT:Devourer_CalculateTongue()
	//print(self.Devourer_LastHeight)
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetUp()*-self.Devourer_LastHeight,
		filter = self
	})
	local trent = tr.Entity
	local trpos = tr.HitPos
	local height = self:GetPos():Distance(trpos)
	-- Increase the height by 10 every tick | minimum = 0, maximum = 1024
	self.Devourer_LastHeight = math.Clamp(height + 10, 0, 1024)

	if IsValid(trent) && (trent:IsNPC() or trent:IsPlayer()) && self:CheckRelationship(trent) == D_HT && trent.VJ_IsHugeMonster != true then
		-- If the grabbed enemy is a new enemy then reset the enemy values
		if self.Devourer_CurEnt != trent then
			self:Devourer_ResetEnt()
			self.Devourer_CurEntMoveType = trent:GetMoveType()
end
		self.Devourer_CurEnt = trent
		trent:AddEFlags(EFL_IS_BEING_LIFTED_BY_BARNACLE)
		if trent:IsNPC() then
			trent:StopMoving()
			trent:SetVelocity(velInitial)
			trent:SetMoveType(MOVETYPE_FLY)
		elseif trent:IsPlayer() then
			trent:SetMoveType(MOVETYPE_NONE)
			//trent:AddFlags(FL_ATCONTROLS)
end
		trent:SetGroundEntity(NULL)
		if height >= 50 then
			local setpos = trent:GetPos() + trent:GetUp()*10
			setpos.x = trpos.x
			setpos.y = trpos.y
			trent:SetPos(setpos) -- Set the position for the enemy
			-- Play the pulling sound
			if CurTime() > self.Devourer_NextPullSoundT then
				VJ.EmitSound(self, "vj_cofr/aom/devourer/classic/bcl_alert2.wav")
				self.Devourer_NextPullSoundT = CurTime() + SoundDuration("vj_cofr/aom/devourer/classic/bcl_alert2.wav")
	end
end
		self:SetPoseParameter("tongue_height", self:GetPos():Distance(trpos + self:GetUp()*125))
		return true
	else
		self:Devourer_ResetEnt()
end
	self:SetPoseParameter("tongue_height", self:GetPos():Distance(trpos + self:GetUp()*193))
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/