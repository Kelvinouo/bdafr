-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BaseRelicController__2 = v1.import(script, script.Parent.Parent.Parent, "base-relic-controller").BaseRelicController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "BlackholeRelicController";
	end, 
	__index = l__BaseRelicController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__RelicType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
function v3.constructor(p1)
	l__BaseRelicController__2.constructor(p1, l__RelicType__1.BLACKHOLE);
	p1.Name = "BlackholeRelicController";
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BlackholeCountdown__3 = v1.import(script, script.Parent, "ui", "blackhole-countdown").BlackholeCountdown;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v3.onActivated(p2)
	p2.countdownTree = u2.mount(u2.createElement(l__BlackholeCountdown__3, {
		initialCountdown = p2.relicMeta.config.initialCountdown
	}), l__Players__4.LocalPlayer:WaitForChild("PlayerGui"));
	l__default__5.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		task.delay(5, function()
			if p2.countdownTree then
				u2.unmount(p2.countdownTree);
				p2.countdownTree = nil;
			end;
		end);
	end);
end;
function v3.deactivate(p4)
	if p4.countdownTree then
		u2.unmount(p4.countdownTree);
		p4.countdownTree = nil;
	end;
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return {
	BlackholeRelicController = v3
};
