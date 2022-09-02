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
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "SocialConnectionsController";
	p1.remotes = l__default__1.Client:GetNamespace("SocialConnections");
	p1.policyDiscordAllowed = true;
	p1.completed = false;
end;
local l__PolicyService__2 = v3.PolicyService;
local l__Players__3 = v3.Players;
local l__preloadImages__4 = v2.preloadImages;
local l__ImageId__5 = v2.ImageId;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	v1.Promise.defer(function()
		p2.policyDiscordAllowed = table.find(l__PolicyService__2:GetPolicyInfoForPlayerAsync(l__Players__3.LocalPlayer).AllowedExternalLinkReferences, "Discord") ~= nil;
	end);
	p2.remotes:WaitFor("GetSocialConnections"):andThen(function(p3)
		p2:updateSocialConnectionsReducer((p3:CallServer()));
	end);
	p2.remotes:WaitFor("SocialConnectionsUpdate"):andThen(function(p4)
		p4:Connect(function(p5)
			p2:updateSocialConnectionsReducer(p5);
		end);
	end);
	l__preloadImages__4({ l__ImageId__5.CHECK_CIRCLE_SOLID, l__ImageId__5.UNLOCK_SOLID });
end;
function v5.getDiscordValidationStatus(p6)
	p6.remotes:WaitFor("QueueValidationStatus"):andThen(function(p7)
		p7:SendToServer({
			player = l__Players__3.LocalPlayer
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
local l__ClientStore__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v5.updateSocialConnectionsReducer(p10, p11)
	l__ClientStore__6:dispatch({
		type = "SocialConnectionsSetAll", 
		supportTasks = p11.supportTasks, 
		connections = p11.connections
	});
end;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.updateJoinedGroupStore(p12, p13)
	if l__ClientStore__6:getState().SocialConnections.supportTasks.joinedGroup ~= p13 then
		return nil;
	end;
	if p13 == true then
		l__SoundManager__7:playSound(l__GameSound__8.INFO_NOTIFICATION);
	end;
	l__ClientStore__6:dispatch({
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
	l__ClientStore__6:dispatch({
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
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v5.isSocialConnectionsCompleted(p16, p17)
	if p17 then
		local v8 = p17.supportTasks;
		local v9 = p17.connections;
	else
		local l__SocialConnections__10 = l__ClientStore__6:getState().SocialConnections;
		v8 = l__SocialConnections__10.supportTasks;
		v9 = l__SocialConnections__10.connections;
	end;
	local v11 = true;
	local v12, v13, v14 = ipairs((u9.values(v8)));
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		if v13 ~= true then
			v11 = false;
			break;
		end;	
	end;
	local v15 = true;
	local v16, v17, v18 = ipairs((u9.values(v9)));
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		if v17.validated ~= true then
			v15 = false;
			break;
		end;	
	end;
	return v11 or v15;
end;
function v5.giveCompletedReward(p18)
	l__SoundManager__7:playSound(l__GameSound__8.BEDWARS_UPGRADE_SUCCESS);
	p18.completed = true;
end;
local v19 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
