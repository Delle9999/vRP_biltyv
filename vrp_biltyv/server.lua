local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "vrp_biltyv") 
vRP = Proxy.getInterface("vRP")

RegisterCommand('restartbiltyv', function(source, args, rawCommand, suggestions)
    local source = source
    local user_id = vRP.getUserId({source})
    if vRP.hasGroup({user_id, "ledelse"}) then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message"><b>^1@'..user_id..' ^0har valgt at starte biltyveriet, skynd dig derovre!</b></div>',
            args = { fal, msg }
        })
        local dname = "Biltyveri"
	    local dmessage = "ID: **".. tostring(user_id).. "** har lige restartet biltyv missionen"
	    PerformHttpRequest(Config.StaffWebhook, function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
        TriggerClientEvent('restart:event', source)
    else
        print("Ingen adgang!")
    end
end)

RegisterServerEvent('beloening1:1')
AddEventHandler('beloening1:1', function()
    local source = source
    local user_id = vRP.getUserId({source})
    vRP.giveMoney({user_id, 3500})
    local dname = "Biltyveri"
	local dmessage = "ID: **".. tostring(user_id).. "** har lige afleveret sit køretøj"
	PerformHttpRequest(Config.LogWebhook, function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
    TriggerClientEvent('tilbage:lol', source)
end)