function CheckRDM(victim, attacker, hpLeft, hpTaken)
	// prepare our dice n shit
	local dice = math.random(1,100)
	local kickR = "Kicked for RDM"
	local victimIs = victim:GetUserGroup()
	local instaKick = {"superadmin","owner","big-server-man"}

	// Check that our attacker is a player.
	if !attacker:IsPlayer() then return end // dont return anything, it doesn't take returns.
	
	// Anyone attacking a superadmin should be kicked immediately.
	for i=1,#instaKick do
		if victimIs == instaKick[i] then
			attacker:Kick("Stop RDMing the owner you stupid twelvie")
			victim:ChatPrint( attacker:Nick() .. " was trying to RDM you and was kicked!")
			return
		end
	end
	
	// Does the player have more than 100 hp? We dont care.
	if hpLeft > 100 then
		return
	end
	
	// Less than 5 hp doesn't count as RDM.
	if hpTaken <= 5 then
		return
	end
	
	// up to 25 hp gives a 10% chance of ban
	if hpTaken <= 25 and hpTaken > 5 then
		if dice <= 10 then
			attacker:Kick(kickR)
		end
	end
	
	// You can figure out how this works.
	if hpTaken <= 50 and hpTaken > 25 then
		if dice <= 20 then
			attacker:Kick(kickR)
		end
	end
	
	if hpTaken <= 100 and hpTaken > 50 then
		if dice <= 40 then
			attacker:Kick(kickR)
		end
	end
end

hook.Add( "PlayerHurt", "Awesome Anti-RDM", CheckRDM )