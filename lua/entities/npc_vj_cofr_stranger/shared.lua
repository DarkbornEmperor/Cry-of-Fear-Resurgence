ENT.Base = "npc_vj_creature_base" -- List of all base types: https://github.com/DrVrej/VJ-Base/wiki/Base-Types
ENT.Type = "ai"
ENT.PrintName = ""
ENT.Author = "Stranger"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Cry of Fear Resurgence"
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
    function ENT:Initialize()
        local function GetStrangers()
            local strangers = {}
            for _,v in pairs(ents.FindByClass("npc_vj_cofr_stranger")) do
                if IsValid(v) then
                    table.insert(strangers,v)
    end
end
    return strangers
end
        local hookName = "VJ_COFR_Stranger_ScreenEffect"
        hook.Add("Think",hookName,function()
            local strangers = GetStrangers()
            local ply = LocalPlayer()
            if #strangers <= 0 then
                hook.Remove("Think",hookName)
    return
end
            local stranger = NULL
            local closestDist = 500
            for _,v in pairs(strangers) do
                local dist = v:GetPos():Distance(ply:GetPos())
                if dist < closestDist then
                    stranger = v
                    closestDist = dist
    end
end
            if ply.VJ_IsControllingNPC then return end
            if !IsValid(stranger) then return end
            local dist = ply:GetPos():Distance(stranger:GetPos())
            local enemy = stranger:GetNW2Entity("Enemy")

            hook.Add("RenderScreenspaceEffects",hookName,function()
                if !IsValid(ply) or (IsValid(ply) && (ply:Health() <= 0)) or GetConVar("ai_ignoreplayers"):GetInt() == 1 or GetConVar("ai_disabled"):GetInt() == 1 or !stranger:IsLineOfSightClear(ply) or !IsValid(stranger) or ply:GetPos():Distance(stranger:GetPos()) > 500 then
                    hook.Remove("RenderScreenspaceEffects",hookName)
    return
end
                if !ply:Alive() or (ply.VJ_IsControllingNPC && ply.VJCE_NPC == stranger) then return end
                local tab = {
                    ["$pp_colour_addr"] = 0,
                    ["$pp_colour_addg"] = 0,
                    ["$pp_colour_addb"] = 0,
                    ["$pp_colour_brightness"] = -0.10,
                    ["$pp_colour_contrast"] = 0.50,
                    ["$pp_colour_colour"] = 0,
                    ["$pp_colour_mulr"] = 0,
                    ["$pp_colour_mulg"] = 0,
                    ["$pp_colour_mulb"] = 0
                }
                DrawColorModify(tab)
            end)
        end)
    end
end