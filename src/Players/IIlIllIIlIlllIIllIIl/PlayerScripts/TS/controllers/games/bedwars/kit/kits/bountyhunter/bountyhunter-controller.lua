-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__LegacyKitKnitController__3 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BountyhunterController";
	end, 
	__index = l__LegacyKitKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__LegacyKitKnitController__3;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Maid__3 = v2.Maid;
function v4.constructor(p1)
	u1.constructor(p1, { l__BedwarsKit__2.BOUNTY_HUNTER });
	p1.Name = "BountyhunterController";
	p1.maid = l__Maid__3.new();
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CreateRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TargetMarkerWrapper__10 = v1.import(script, script.Parent, "ui", "target-marker").TargetMarkerWrapper;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local l__newTargetUserId__6 = p3.newTargetUserId;
		if l__newTargetUserId__6 ~= 0 and l__newTargetUserId__6 == l__newTargetUserId__6 and l__newTargetUserId__6 then
			local v7 = l__Players__5:GetPlayerByUserId(p3.newTargetUserId);
		else
			v7 = nil;
		end;
		l__ClientStore__6:dispatch({
			type = "KitBountyHunterSetTarget", 
			bountyHunterTarget = v7
		});
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p4)
		p4:CallServerAsync():andThen(function(p5)
			if p5 ~= 0 and p5 == p5 and p5 then
				local v8 = l__Players__5:GetPlayerByUserId(p5);
			else
				v8 = nil;
			end;
			l__ClientStore__6:dispatch({
				type = "KitBountyHunterSetTarget", 
				bountyHunterTarget = v8
			});
		end);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p6)
		l__SoundManager__7:playSound(l__GameSound__8.BOUNTY_CLAIMED);
	end);
	l__ClientStore__6.changed:connect(function(p7, p8)
		local l__bountyHunterTarget__9 = p7.Kit.bountyHunterTarget;
		if l__bountyHunterTarget__9 == nil or l__bountyHunterTarget__9 == p8.Kit.bountyHunterTarget then
			return nil;
		end;
		p2.maid:DoCleaning();
		print("Bounty hunter target changed. New Target: " .. l__bountyHunterTarget__9.Name);
		l__SoundManager__7:playSound(l__GameSound__8.BOUNTY_ASSIGNED);
		local function u12(p9)
			local v10 = l__Maid__3.new();
			local u13 = l__CreateRoduxApp__9("TargetMarker", l__TargetMarkerWrapper__10, {
				adornee = p9:WaitForChild("HumanoidRootPart"), 
				player = l__bountyHunterTarget__9
			});
			v10:GiveTask(function()
				u11.unmount(u13);
			end);
			v10:GiveTask(l__bountyHunterTarget__9.CharacterRemoving:Connect(function()
				v10:DoCleaning();
			end));
			v10:GiveTask(l__default__4.Client:Get("RemoteName"):Connect(function(p10)
				if p10.entityInstance == p9 then
					v10:DoCleaning();
				end;
			end));
			return v10;
		end;
		p2.maid:GiveTask(l__bountyHunterTarget__9.CharacterAdded:Connect(function(p11)
			p2.maid:GiveTask(u12(p11));
		end));
		task.spawn(function()
			if l__bountyHunterTarget__9.Character then
				p2.maid:GiveTask(u12(l__bountyHunterTarget__9.Character));
			end;
		end);
	end);
end;
local u14 = v1.import(script, script.Parent, "ui", "bountyhunter-poster").BountyHunterPosterWrapper;
function v4.onKitEnabled(p12)
	l__CreateRoduxApp__9("BountyHunterPoster", u14, {});
end;
function v4.onKitDisabled(p13)

end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
