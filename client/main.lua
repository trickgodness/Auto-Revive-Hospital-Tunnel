local function RevivePlayer()
	if (GetResourceState('esx_ambulancejob'):match('start')) then
		TriggerEvent('esx_ambulancejob:revive')
		ESX.ShowNotification(
			'The System Detected You Died in the Hospital Tunnel and Automatically Rescued You from the Hospital Tunnel',
			'info')
		return
	end

	--- Your own revive function here
end

local function StartLoops()
	while (ESX.PlayerLoaded) do
		local tunnelCoords = vec3(297.120, -583.83, 17.7568)
		local isInDistance = #(tunnelCoords - GetEntityCoords(ESX.PlayerData.ped)) <= 20.0
		if (isInDistance and ESX.PlayerData.dead) then
			RevivePlayer()
		end

		Wait(1000)
	end
end

CreateThread(
	function()
		while (not ESX.PlayerLoaded) do
			Wait(1000)
		end
		Wait(1000)
		StartLoops()
	end
)
