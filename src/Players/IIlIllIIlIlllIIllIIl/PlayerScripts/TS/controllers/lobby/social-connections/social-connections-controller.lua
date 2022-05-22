-- Script Hash: f2b75c224fdadb61cfdda83c01b63db82e32709df265984fcaa64307c17c31b2b9c04ad0b7b4287df54babfafb404aa5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SocialConnectionsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SocialConnectionsController";
	p1.remotes = l__default__2.Client:GetNamespace("SocialConnections");
	p1.policyDiscordAllowed = true;
	p1.completed = false;
end;
local l__PolicyService__3 = v3.PolicyService;
local l__Players__4 = v3.Players;
local l__preloadImages__5 = v2.preloadImages;
local l__ImageId__6 = v2.ImageId;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	v1.Promise.defer(function()
		p2.policyDiscordAllowed = table.find(l__PolicyService__3:GetPolicyInfoForPlayerAsync(l__Players__4.LocalPlayer).AllowedExternalLinkReferences, "Discord") ~= nil;
	end);
	p2.remotes:WaitFor("GetSocialConnections"):andThen(function(p3)
		p2:updateSocialConnectionsReducer((p3:CallServer()));
	end);
	p2.remotes:WaitFor("SocialConnectionsUpdate"):andThen(function(p4)
		p4:Connect(function(p5)
			p2:updateSocialConnectionsReducer(p5);
		end);
	end);
	l__preloadImages__5({ l__ImageId__6.CHECK_CIRCLE_SOLID, l__ImageId__6.UNLOCK_SOLID });
end;
function v5.getDiscordValidationStatus(p6)
	p6.remotes:WaitFor("QueueValidationStatus"):andThen(function(p7)
		p7:SendToServer({
			player = l__Players__4.LocalPlayer
		});
	end);
end;
v5.getJoinedGroupStatus = v1.async(function(p8)
	return v1.await(p8.remotes:WaitFor("VerifyJoinedGroup"):andThen(function(p9)
		local v7 = p9:CallServer();
		p8:updateJoinedGroupStore(v7);
		return v7;
	end));
end);
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.updateSocialConnectionsReducer(p10, p11)
	l__ClientStore__7:dispatch({
		type = "SocialConnectionsSetAll", 
		supportTasks = p11.supportTasks, 
		connections = p11.connections
	});
end;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.updateJoinedGroupStore(p12, p13)
	if l__ClientStore__7:getState().SocialConnections.supportTasks.joinedGroup ~= p13 then
		return nil;
	end;
	if p13 == true then
		l__SoundManager__8:playSound(l__GameSound__9.INFO_NOTIFICATION);
	end;
	l__ClientStore__7:dispatch({
		type = "SetSomeSupportTasks", 
		supportTasks = {
			joinedGroup = p13
		}
	});
	if p12:isSocialConnectionsCompleted() then
		p12:giveCompletedReward();
	end;
end;
function v5.updateDiscordStore(p14, p15)
	l__ClientStore__7:dispatch({
		type = "SetSomeConnections", 
		connections = {
			discord = {
				verificationCode = p15.verificationCode, 
				validated = p15.validated, 
				legacyDiscordVerification = p15.legacyDiscordVerification
			}
		}
	});
	if p14:isSocialConnectionsCompleted() then
		p14:giveCompletedReward();
	end;
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v5.isSocialConnectionsCompleted(p16, p17)
	if p17 then
		local v8 = p17.supportTasks;
		local v9 = p17.connections;
	else
		local l__SocialConnections__10 = l__ClientStore__7:getState().SocialConnections;
		v8 = l__SocialConnections__10.supportTasks;
		v9 = l__SocialConnections__10.connections;
	end;
	local v11 = u10.values(v8);
	local function v12(p18)
		return p18 == true;
	end;
	local v13 = true;
	for v14, v15 in ipairs(v11) do
		if not v12(v15, v14 - 1, v11) then
			v13 = false;
			break;
		end;
	end;
	local v16 = u10.values(v9);
	local function v17(p19)
		return p19.validated == true;
	end;
	local v18 = true;
	for v19, v20 in ipairs(v16) do
		if not v17(v20, v19 - 1, v16) then
			v18 = false;
			break;
		end;
	end;
	return v13 or v18;
end;
function v5.giveCompletedReward(p20)
	l__SoundManager__8:playSound(l__GameSound__9.BEDWARS_UPGRADE_SUCCESS);
	p20.completed = true;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
