-- Script Hash: 3d409a352a993785a06856c1f5c719cfd0d8f30aa5a619e26fac5b18fd328c751fe8245a3ebf1fd5e82ea7a5896a37a2
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("QueueApp");
function v3.init(p1)

end;
local l__QueueState__1 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).QueueState;
local l__QueueCard__2 = v1.import(script, script.Parent, "queue-card").QueueCard;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v3.render(p2)
	local v4 = {};
	local v5 = false;
	if p2.props.store.Party.queueState ~= l__QueueState__1.NONE then
		v5 = false;
		if p2.props.store.Party.queueData ~= nil then
			v5 = v2.createElement(l__QueueCard__2, {
				QueueData = p2.props.store.Party.queueData, 
				QueueState = p2.props.store.Party.queueState, 
				OnLeaveQueue = function()
					l__KnitClient__3.Controllers.QueueController:leaveQueue();
				end
			});
		end;
	end;
	if v5 then
		v4[#v4 + 1] = v5;
	end;
	return v2.createFragment(v4);
end;
return {
	QueueAppWrapper = function(p3)
		return v2.createFragment({
			QueueApp = v2.createElement("ScreenGui", {
				IgnoreGuiInset = true, 
				ResetOnSpawn = false
			}, { v2.createElement(v3, {
					store = p3.store
				}) })
		});
	end, 
	QueueApp = v3
};
