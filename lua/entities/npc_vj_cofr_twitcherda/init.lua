AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl",
"models/vj_cofr/aom/zombie_da.mdl"
} 
ENT.CanFlinch = 0
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))	
     self:Twitcher_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/