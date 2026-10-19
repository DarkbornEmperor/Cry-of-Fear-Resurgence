ENT.Base = "npc_vj_creature_base"
ENT.Type = "ai"
ENT.PrintName = "Stranger"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Cry of Fear Resurgence"

ENT.VJ_COFR_NPC = true

local CurTime = CurTime
local colorFlash = Color(0, 0, 0, 155)

if CLIENT then
    net.Receive("VJ_COFR_StrangerScreen", function()
        local ply = net.ReadEntity()

        ply.VJ_COFR_StrangerScreenT = ply.VJ_COFR_StrangerScreenT or 0

        local curTime = CurTime()
        local time = 1
        ply.VJ_COFR_StrangerScreenT = curTime + time

        local hookName = "VJ_COFR_StrangerScreen_" .. ply:EntIndex()
        hook.Add("RenderScreenspaceEffects", hookName, function()
            curTime = CurTime()
            if !IsValid(ply) or (IsValid(ply) && (ply:Health() <= 0 or ply.VJ_COFR_StrangerScreenT < curTime)) then
                hook.Remove("RenderScreenspaceEffects", hookName)
                ply:ScreenFade(SCREENFADE.IN, colorFlash, 0.35, 0.25)
                return
            end
            //DrawMotionBlur(0.4, 0.8, 0.01)
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
else
    util.AddNetworkString("VJ_COFR_StrangerScreen")
end