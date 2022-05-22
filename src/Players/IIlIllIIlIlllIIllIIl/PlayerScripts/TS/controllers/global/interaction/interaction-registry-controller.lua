-- Script Hash: 78c5ca209885cca3f981198e19d97fa9d8cb4ad611c50c4ba82fafdd43e6a4ec1736e510c32f82a950481f173e2c45f6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "InteractionRegistryController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "InteractionRegistryController";
	p1.registeredInteractions = {};
	p1.proximityPrompts = {};
end;
function u1.KnitStart(p2)

end;
local l__CollectionService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
function u1.RegisterInteraction(p3, p4)
	local l__registeredInteractions__5 = p3.registeredInteractions;
	local function v6(p5)
		return p5.interactionTag == p4.interactionTag;
	end;
	local v7 = nil;
	for v8, v9 in ipairs(l__registeredInteractions__5) do
		if v6(v9, v8 - 1, l__registeredInteractions__5) == true then
			v7 = v9;
			break;
		end;
	end;
	if v7 then
		error("Tag " .. p4.interactionTag .. " is already registered");
	end;
	table.insert(p3.registeredInteractions, p4);
	for v10, v11 in ipairs((l__CollectionService__3:GetTagged(p4.interactionTag))) do
		if v11:IsA("BasePart") and (not p4.shouldMakeInteraction or p4.shouldMakeInteraction(v11)) then
			p3:givePartProximityPrompt(v11, p4);
		end;
	end;
	l__CollectionService__3:GetInstanceAddedSignal(p4.interactionTag):Connect(function(p6)
		if not p6:IsA("BasePart") then
			error("Only BaseParts can have an interaction, got " .. p6:GetFullName());
		end;
		if p4.shouldMakeInteraction and not p4.shouldMakeInteraction(p6) then
			return nil;
		end;
		p3:givePartProximityPrompt(p6, p4);
	end);
	l__CollectionService__3:GetInstanceRemovedSignal(p4.interactionTag):Connect(function(p7)
		local v12 = p7:FindFirstChild(p4.interactionTag);
		if v12 then
			v12:Destroy();
			print("Removed interaction for part \"" .. p7:GetFullName() .. "\" with interaction tag \"" .. p4.interactionTag .. "\"");
		end;
	end);
	if p4.onVisibilityStateChanged then
		p4.onVisibilityStateChanged:Connect(function(p8)
			local v13 = p3.proximityPrompts[p4.interactionTag];
			if v13 then
				for v14, v15 in ipairs(v13) do
					v15.Enabled = p8;
				end;
				print("Updated visibility of interaction \"" .. p4.interactionTag .. "\" to state \"" .. tostring(p8) .. "\"");
			end;
		end);
	end;
	print("Added interaction \"" .. tostring(p4.interactionLabel) .. " for tag \"" .. p4.interactionTag .. "\"");
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function u1.givePartProximityPrompt(p9, p10, p11)
	local l__interactionLabel__16 = p11.interactionLabel;
	if type(l__interactionLabel__16) == "function" then
		local v17 = l__interactionLabel__16(p10);
	else
		v17 = l__interactionLabel__16;
	end;
	local l__interactionObjectText__18 = p11.interactionObjectText;
	if type(l__interactionObjectText__18) == "function" then
		local v19 = l__interactionObjectText__18(p10);
	else
		v19 = l__interactionObjectText__18;
	end;
	local v20 = {
		Name = p11.interactionTag, 
		ObjectText = v19, 
		ActionText = v17, 
		AutoLocalize = true, 
		ClickablePrompt = p11.clickablePrompt, 
		KeyboardKeyCode = Enum.KeyCode.F, 
		RequiresLineOfSight = false
	};
	if p11.instantActivation then
		local v21 = 0;
	else
		v21 = l__Theme__5.promptHoldDuration;
	end;
	v20.HoldDuration = v21;
	v20.Parent = p10;
	v20.MaxActivationDistance = p11.maxActivationDistance;
	local v22 = u4("ProximityPrompt", v20);
	v22.Triggered:Connect(function()
		return p11.onInteracted(p10);
	end);
	local v23 = p9.proximityPrompts[p11.interactionTag] or {};
	local v24 = {};
	local v25 = #v24;
	local v26 = #v23;
	table.move(v23, 1, v26, v25 + 1, v24);
	v24[v25 + v26 + 1] = v22;
	p9.proximityPrompts[p11.interactionTag] = v24;
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	InteractionRegistryController = u2
};
return u1;
