SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Melee Base"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
    -- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1
SWEP.NPC_TimeUntilFire = 0
    -- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HoldType = "melee"
SWEP.Spawnable = false
SWEP.AdminSpawnable	= false
SWEP.MadeForNPCsOnly = true
    -- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.IsMeleeWeapon = true
SWEP.MeleeWeaponDistance = 70
SWEP.MeleeWeaponSound_Hit = false
SWEP.MeleeWeaponSound_Miss = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
   local owner = self:GetOwner()
   if !owner.IsCoFRHuman then return end 
     if CurTime() > owner.CoFR_NextMeleeSoundT then
        owner:PlaySoundSystem("BeforeMeleeAttack",owner.SoundTbl_BeforeMeleeAttack)
		owner.CoFR_NextMeleeSoundT = CurTime() + 1
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttack(UseAlt)
	//if self:GetOwner():KeyDown(IN_RELOAD) then return end
	//self:GetOwner():SetFOV(45, 0.3)
	//if !IsFirstTimePredicted() then return end
	
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	local owner = self:GetOwner()
	local isNPC = owner:IsNPC()
	local isPly = owner:IsPlayer()
	
	if self.Reloading or self:GetNextSecondaryFire() > CurTime() then return end
	if isNPC && owner.VJ_IsBeingControlled == false && !IsValid(owner:GetEnemy()) then return end -- If the NPC owner isn't being controlled and doesn't have an enemy, then return end
	if SERVER && self.IsMeleeWeapon == false && ((isPly && self.Primary.AllowFireInWater == false && owner:WaterLevel() == 3) or (self:Clip1() <= 0)) then owner:EmitSound(VJ.PICK(self.DryFireSound),self.DryFireSoundLevel,math.random(self.DryFireSoundPitch.a, self.DryFireSoundPitch.b)) return end
	if (!self:CanPrimaryAttack()) then return end
	if self:CustomOnPrimaryAttack_BeforeShoot() == true then return end
	
	if isNPC && owner.IsVJBaseSNPC == true then
		timer.Simple(self.NPC_ExtraFireSoundTime, function()
			if IsValid(self) && IsValid(owner) then
				VJ.EmitSound(owner, self.NPC_ExtraFireSound, self.NPC_ExtraFireSoundLevel, math.Rand(self.NPC_ExtraFireSoundPitch.a, self.NPC_ExtraFireSoundPitch.b))
			end
		end)
	end
	
	-- Firing Sounds
	if SERVER then
		local fireSd = VJ.PICK(self.Primary.Sound)
		if fireSd != false then
			sound.Play(fireSd, owner:GetPos(), self.Primary.SoundLevel, math.random(self.Primary.SoundPitch.a, self.Primary.SoundPitch.b), self.Primary.SoundVolume)
			//self:EmitSound(fireSd, 80, math.random(90,100))
		end
		if self.Primary.HasDistantSound == true then
			local fireFarSd = VJ.PICK(self.Primary.DistantSound)
			if fireFarSd != false then
				sound.Play(fireFarSd, owner:GetPos(), self.Primary.DistantSoundLevel, math.random(self.Primary.DistantSoundPitch.a, self.Primary.DistantSoundPitch.b), self.Primary.DistantSoundVolume)
			end
		end
	end
	
	-- Firing Gesture
	if owner.IsVJBaseSNPC_Human == true && owner.DisableWeaponFiringGesture != true then
		owner:VJ_ACT_PLAYACTIVITY(owner:TranslateToWeaponAnim(VJ.PICK(owner.AnimTbl_WeaponAttackFiringGesture)), false, false, false, 0, {AlwaysUseGesture=true})
	end
	
	-- MELEE WEAPON
	if self.IsMeleeWeapon == true then
	/*
		local meleeHitEnt = false
		for _,v in ipairs(ents.FindInSphere(owner:GetPos(), self.MeleeWeaponDistance)) do
			if (owner.VJ_IsBeingControlled == true && owner.VJ_TheControllerBullseye == v) or (v:IsPlayer() && v.VJTag_IsControllingNPC == true) then continue end
			if (isPly && v:EntIndex() != owner:EntIndex()) or (isNPC && (v:IsNPC() or (v:IsPlayer() && v:Alive() && !VJ_CVAR_IGNOREPLAYERS)) && (owner:Disposition(v) != D_LI) && (v != owner) && (v:GetClass() != owner:GetClass()) or (v:GetClass() == "prop_physics") or v:GetClass() == "func_breakable_surf" or v:GetClass() == "func_breakable" && (owner:GetForward():Dot((v:GetPos() -owner:GetPos()):GetNormalized()) > math.cos(math.rad(owner.MeleeAttackDamageAngleRadius)))) then
				local dmginfo = DamageInfo()
				dmginfo:SetDamage(isNPC and owner:VJ_GetDifficultyValue(self.Primary.Damage) or self.Primary.Damage)
				if v:IsNPC() or v:IsPlayer() then dmginfo:SetDamageForce(owner:GetForward() * ((dmginfo:GetDamage() + 100) * 70)) end
				dmginfo:SetInflictor(owner)
				dmginfo:SetAttacker(owner)
				dmginfo:SetDamageType(DMG_CLUB)
				VJ.DamageSpecialEnts(owner, v, dmginfo)
				v:TakeDamageInfo(dmginfo, owner)
				if v:IsPlayer() then
					v:ViewPunch(Angle(math.random(-1, 1)*10, math.random(-1, 1)*10, math.random(-1, 1)*10))
				end
				self:CustomOnPrimaryAttack_MeleeHit(v)
				meleeHitEnt = true
			end
		end
		if meleeHitEnt == true then
			local meleeSd = VJ.PICK(self.MeleeWeaponSound_Hit)
			if meleeSd != false then
				self:EmitSound(meleeSd, 70, math.random(90, 100))
			end
		else
			if owner.IsVJBaseSNPC == true then owner:CustomOnMeleeAttack_Miss() end
			local meleeSd = VJ.PICK(self.MeleeWeaponSound_Miss)
			if meleeSd != false then
				self:EmitSound(meleeSd, 70, math.random(90, 100))
			end
		end
		*/
	-- REGULAR WEAPON (NON-MELEE)
	else
		if self.Primary.DisableBulletCode == false then
			local bullet = {}
				bullet.Num = self.Primary.NumberOfShots
				bullet.Tracer = self.Primary.Tracer
				bullet.TracerName = self.Primary.TracerType
				bullet.Force = self.Primary.Force
				bullet.AmmoType = self.Primary.Ammo
				
				-- Bullet spawn position & spread & damage
				if isPly then
					bullet.Spread = Vector((self.Primary.Cone / 60) / 4, (self.Primary.Cone / 60) / 4, 0)
					bullet.Src = owner:GetShootPos()
					bullet.Dir = owner:GetAimVector()
					local plyDmg = self.Primary.PlayerDamage
					if plyDmg == "Same" then
						bullet.Damage = self.Primary.Damage
					elseif plyDmg == "Double" then
						bullet.Damage = self.Primary.Damage * 2
					elseif isnumber(plyDmg) then
						bullet.Damage = plyDmg
					end
				else
					local ene = owner:GetEnemy()
					local spawnPos = self:GetNW2Vector("VJ_CurBulletPos")
					// owner:GetPos():Distance(owner.VJ_TheController:GetEyeTrace().HitPos) -- Was used when NPC was being controlled
					local fSpread = (owner:GetPos():Distance(ene:GetPos()) / 28) * (owner.WeaponSpread or 1) * (self.NPC_CustomSpread or 1)
					bullet.Spread = Vector(fSpread, fSpread, 0)
					bullet.Src = spawnPos
					if owner.WeaponUseEnemyEyePos then
						-- Take OBB Max's z and minus it with OBB Center's z to remove center to min, then divide the result to decrease the distance so its somewhere between Eye pos and OBB center
						bullet.Dir = (ene:EyePos() - ene:GetUp()*((ene:OBBMaxs().z - ene:OBBCenter().z) / 2.5)) - spawnPos
					else
						bullet.Dir = (ene:GetPos() + ene:OBBCenter()) -  spawnPos
					end
					bullet.Damage = owner.IsVJBaseSNPC and owner:VJ_GetDifficultyValue(self.Primary.Damage) or self.Primary.Damage
				end
				
				-- Callback
				bullet.Callback = function(attacker, tr, dmginfo)
					self:CustomOnPrimaryAttack_BulletCallback(attacker, tr, dmginfo)
					/*local laserhit = EffectData()
					laserhit:SetOrigin(tr.HitPos)
					laserhit:SetNormal(tr.HitNormal)
					laserhit:SetScale(25)
					util.Effect("AR2Impact", laserhit)
					tr.HitPos:Ignite(8,0)*/
				end
			owner:FireBullets(bullet)
		end
		if GetConVar("vj_wep_nomuszzleflash"):GetInt() == 0 then owner:MuzzleFlash() end
	end
	
	self:TakePrimaryAmmo(self.Primary.TakeAmmo)
	
	self:PrimaryAttackEffects(owner)
	
	if isPly then
		//self:ShootEffects("ToolTracer") -- Deprecated
		owner:ViewPunch(Angle(-self.Primary.Recoil, 0, 0))
		owner:SetAnimation(PLAYER_ATTACK1)
		local anim = VJ.PICK(self.AnimTbl_PrimaryFire)
		local animTime = VJ.AnimDuration(owner:GetViewModel(), anim)
		self:SendWeaponAnim(anim)
		self.NextIdleT = CurTime() + animTime
		self.NextReloadT = CurTime() + animTime
	end
	self:CustomOnPrimaryAttack_AfterShoot()
	//self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end