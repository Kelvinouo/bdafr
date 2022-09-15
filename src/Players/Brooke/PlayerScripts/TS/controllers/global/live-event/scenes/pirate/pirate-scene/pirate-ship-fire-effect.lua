-- Decompiled with the Synapse X Luau decompiler.

return {
	PirateShipFireEffect = {
		name = "pirate fire effect", 
		event = "Heartbeat", 
		func = function(p1, p2, p3)
			local v1 = p2:get("ships");
			if v1 ~= nil then
				v1 = v1.ship1;
			end;
			if not v1 then
				return nil;
			end;
			local v2 = p2:get("shipHealth");
			if v2 == nil then
				v2 = 1000;
			end;
			local v3 = math.ceil(math.clamp((800 - v2) / 75, 0, 5));
			local v4 = math.ceil(math.clamp((230 - v2) / 50, 0, 5));
			local v5 = 1;
			local v6 = false;
			while true do
				if v6 then
					v5 = v5 + 1;
				else
					v6 = true;
				end;
				if not (v5 <= 5) then
					break;
				end;
				local v7 = v5 <= v4;
				if v5 <= v3 then
					local v8 = v1.instance:FindFirstChild("DamagePoints");
					if v8 ~= nil then
						v8 = v8:FindFirstChild(tostring(v5));
					end;
					local v9 = v8;
					if v9 ~= nil then
						v9 = v9:GetChildren();
					end;
					local v10 = v9;
					if v10 == nil then
						v10 = {};
					end;
					local v11, v12, v13 = ipairs(v10);
					while true do
						v11(v12, v13);
						if not v11 then
							break;
						end;
						if (v12.Name == "Smoke" or v7) and v12:IsA("ParticleEmitter") then
							v12.Enabled = true;
						end;
						if v7 and v12:IsA("Light") then
							v12.Enabled = true;
						end;					
					end;
				end;			
			end;
		end
	}
};
