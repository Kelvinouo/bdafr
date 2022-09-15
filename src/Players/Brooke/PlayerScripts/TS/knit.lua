-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__ClientBlockEngine__2 = v1.import(script, script.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local l__SharedModules__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "shared-modules").SharedModules;
local l__PlaceUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__patchKnitClient__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "knit", "patch-knit").patchKnitClient;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "inspect").inspect);
return {
	setup = function()
		l__DeviceUtil__1.isMobileControls();
		l__SharedModules__3.loadGlobalModules();
		if l__PlaceUtil__4.isLobbyServer() then
			l__SharedModules__3.loadLobbyModules();
		end;
		if l__PlaceUtil__4.isGameServer() then
			l__SharedModules__3.loadGameModules("bedwars");
		end;
		l__patchKnitClient__5(l__KnitClient__6);
		local u9 = 0;
		local function u10(p1, p2)
			if p2 == nil then
				p2 = false;
			end;
			local v2, v3, v4 = ipairs(p1:GetChildren());
			while true do
				v2(v3, v4);
				if not v2 then
					break;
				end;
				v4 = v2;
				if v3:IsA("ModuleScript") and u7.includes(v3.Name, "controller") then
					require(v3);
					u9 = u9 + 1;
				elseif p2 and v3:IsA("Folder") then
					u10(v3, true);
				end;			
			end;
		end;
		local l__controllers__5 = script.Parent:FindFirstChild("controllers");
		u10(l__controllers__5:FindFirstChild("global"), true);
		if l__PlaceUtil__4.isLobbyServer() then
			u10(l__controllers__5:FindFirstChild("lobby"), true);
		end;
		if l__PlaceUtil__4.isGameServer() then
			u10(l__controllers__5:FindFirstChild("game"), true);
			u10(l__controllers__5:FindFirstChild("games"):FindFirstChild("bedwars"), true);
			u10(l__controllers__5:FindFirstChild("games"):FindFirstChild("gun-game"), true);
			u10(l__controllers__5:FindFirstChild("games"):FindFirstChild("tnt-wars"), true);
			u10(l__controllers__5:FindFirstChild("games"):FindFirstChild("capture-flag"), true);
			u10(l__controllers__5:FindFirstChild("games"):FindFirstChild("survival"), true);
		end;
		u10(script.Parent.Parent:FindFirstChild("Modules"):FindFirstChild("anticheat"), true);
		local u11 = os.clock();
		l__KnitClient__6.Start():andThen(function()
			print("[Knit Client]: Started " .. tostring(u9) .. " controllers in " .. tostring((math.floor((os.clock() - u11) * 1000))) .. "ms");
		end):catch(function(p3)
			warn("Knit Error: " .. u8(p3));
		end);
	end
};
