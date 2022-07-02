-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LegacyKitKnitController__2 = v1.import(script, script.Parent.Parent.Parent, "legacy-kit-controller").LegacyKitKnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BountyhunterController";
	end, 
	__index = l__LegacyKitKnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__LegacyKitKnitController__2;
local l__BedwarsKit__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v3.constructor(p1)
	u1.constructor(p1, { l__BedwarsKit__2.BOUNTY_HUNTER });
	p1.Name = "BountyhunterController";
	p1.maid = u3.new();
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__CreateRoduxApp__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__TargetMarkerWrapper__10 = v1.import(script, script.Parent, "ui", "target-marker").TargetMarkerWrapper;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local l__newTargetUserId__5 = p3.newTargetUserId;
		if l__newTargetUserId__5 ~= 0 and l__newTargetUserId__5 == l__newTargetUserId__5 and l__newTargetUserId__5 then
			local v6 = l__Players__5:GetPlayerByUserId(p3.newTargetUserId);
		else
			v6 = nil;
		end;
		l__ClientStore__6:dispatch({
			type = "KitBountyHunterSetTarget", 
			bountyHunterTarget = v6
		});
	end);
	l__default__4.Client:WaitFor("RemoteName"):andThen(function(p4)
		p4:CallServerAsync():andThen(function(p5)
			if p5 ~= 0 and p5 == p5 and p5 then
				local v7 = l__Players__5:GetPlayerByUserId(p5);
			else
				v7 = nil;
			end;
			l__ClientStore__6:dispatch({
				type = "KitBountyHunterSetTarget", 
				bountyHunterTarget = v7
			});
		end);
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p6)
		l__SoundManager__7:playSound(l__GameSound__8.BOUNTY_CLAIMED);
	end);
	l__ClientStore__6.changed:connect(function(p7, p8)
		local l__bountyHunterTarget__8 = p7.Kit.bountyHunterTarget;
		if l__bountyHunterTarget__8 == nil or l__bountyHunterTarget__8 == p8.Kit.bountyHunterTarget then
			return nil;
		end;
		p2.maid:DoCleaning();
		print("Bounty hunter target changed. New Target: " .. l__bountyHunterTarget__8.Name);
		l__SoundManager__7:playSound(l__GameSound__8.BOUNTY_ASSIGNED);
		local function u12(p9)
			local v9 = u3.new();
			local u13 = l__CreateRoduxApp__9("TargetMarker", l__TargetMarkerWrapper__10, {
				adornee = p9:WaitForChild("HumanoidRootPart"), 
				player = l__bountyHunterTarget__8
			});
			v9:GiveTask(function()
				u11.unmount(u13);
			end);
			v9:GiveTask(l__bountyHunterTarget__8.CharacterRemoving:Connect(function()
				v9:DoCleaning();
			end));
			v9:GiveTask(l__default__4.Client:Get("RemoteName"):Connect(function(p10)
				if p10.entityInstance == p9 then
					v9:DoCleaning();
				end;
			end));
			return v9;
		end;
		p2.maid:GiveTask(l__bountyHunterTarget__8.CharacterAdded:Connect(function(p11)
			p2.maid:GiveTask((u12(p11)));
		end));
		task.spawn(function()
			if l__bountyHunterTarget__8.Character then
				p2.maid:GiveTask((u12(l__bountyHunterTarget__8.Character)));
			end;
		end);
	end);
end;
local u14 = v1.import(script, script.Parent, "ui", "bountyhunter-poster").BountyHunterPosterWrapper;
function v3.onKitEnabled(p12)
	l__CreateRoduxApp__9("BountyHunterPoster", u14, {});
end;
function v3.onKitDisabled(p13)

end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
