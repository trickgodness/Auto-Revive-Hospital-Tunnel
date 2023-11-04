ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function save()
	local player = PlayerPedId()
	TriggerEvent('esx_ambulancejob:revive')
	Wait(3000)
	exports['okokNotify']:Alert("Information", "The System Detected You Died in the Hospital Tunnel and Automatically Rescued You from the Hospital Tunnel", 6500, 'inform')
	SetEntityCoords(player, 268.228, -638.81, 42.0203, false, false, false, false)
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(30000)
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
		local hp = GetEntityHealth(player)
        local distance = GetDistanceBetweenCoords(297.120, -583.83, 17.7568, playerCoords, true)
        if distance <= 20.0 and IsEntityPlayingAnim(player, 'dead', 'dead_a', 3) or IsPlayerDead(player) or IsEntityDead(player) or IsPedDeadOrDying(player) or hp == 0 then
			save()
        end
    end

end)