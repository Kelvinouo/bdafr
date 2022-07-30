-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "WorldeditController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__HandKnitController__3;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "WorldeditController";
	p1.gamemodeRemotes = l__default__2.Client:GetNamespace("Gamemode");
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ItemType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__3.WOOD_AXE;
end;
local l__KnitClient__4 = v2.KnitClient;
local l__ContextActionService__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).ContextActionService;
local l__ClientBlockEngine__6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local l__BlockSelectorMode__7 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client.select["block-selector"]).BlockSelectorMode;
local l__BlockEngine__8 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function v4.onEnable(p5, p6)
	if not l__KnitClient__4.Controllers.GamemodeController:isInCreativeMode() then
		return nil;
	end;
	l__ContextActionService__5:BindAction("worldedit-wand-right-click", function(p7, p8, p9)
		if p8 == Enum.UserInputState.Begin then
			local v6 = l__ClientBlockEngine__6:getBlockSelector():getMouseInfo(l__BlockSelectorMode__7.SELECT);
			local v7 = v6;
			if v7 ~= nil then
				v7 = v7.target;
			end;
			if v7 then
				local l__target__8 = v6.target;
				if not l__BlockEngine__8:getStore():getBlockData(l__target__8.blockRef.blockPosition) then
					return nil;
				end;
				p5.gamemodeRemotes:Get("SetPosition2"):CallServer(l__target__8.blockRef.blockPosition);
			end;
		end;
	end, false, Enum.UserInputType.MouseButton2);
end;
function v4.onDisable(p10)
	l__ContextActionService__5:UnbindAction("worldedit-wand-right-click");
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
