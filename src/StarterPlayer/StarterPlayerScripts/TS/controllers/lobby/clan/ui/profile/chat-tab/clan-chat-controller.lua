-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__Controller__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v4 = setmetatable({}, {
	__tostring = function()
		return "ClanChatController";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ExpireList__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ExpireList;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
function v4.constructor(p1)
	p1.clansRemotes = l__default__1.Client:GetNamespace("Clans");
	p1.sendMessageRateLimiter = l__ExpireList__2.new(0.5);
	p1.clanChatUpdate = u3.new();
end;
function v4.onInit(p2)

end;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
function v4.onStart(p3)
	p3.clansRemotes:Get("ClanChatUpdate"):Connect(function(p4)
		l__default__4.Debug("[CONTROLLER] ClanChatUpdate:", #p4.messages);
		p3.clanChatUpdate:Fire(p4.messages);
	end);
end;
function v4.getClanChatMessages(p5)
	return p5.clansRemotes:Get("FetchClanChat"):CallServer();
end;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v4.sendMessage(p6, p7)
	if p6.sendMessageRateLimiter:has(l__Players__5.LocalPlayer.UserId) then
		return {
			success = false, 
			errorMessage = "You're sending messages too fast! Please slow down."
		};
	end;
	p6.sendMessageRateLimiter:add(l__Players__5.LocalPlayer.UserId);
	return p6.clansRemotes:Get("SendClanChatMessage"):CallServer(p7);
end;
function v4.clanChatUpdateEvent(p8)
	return p8.clanChatUpdate;
end;
l__Reflect__2.defineMetadata(v4, "identifier", "client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController");
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnInit" });
l__Reflect__2.decorate(v4, "$:flamework@Controller", l__Controller__3, { {} });
return {
	default = v4
};
