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
	local v5 = nil;
	for v6, v7 in ipairs(p3.registeredInteractions) do
		if v7.interactionTag == p4.interactionTag == true then
			v5 = v7;
			break;
		end;
	end;
	if v5 then
		error("Tag " .. p4.interactionTag .. " is already registered");
	end;
	table.insert(p3.registeredInteractions, p4);
	for v8, v9 in ipairs((l__CollectionService__3:GetTagged(p4.interactionTag))) do
		if v9:IsA("BasePart") and (not p4.shouldMakeInteraction or p4.shouldMakeInteraction(v9)) then
			p3:givePartProximityPrompt(v9, p4);
		end;
	end;
	l__CollectionService__3:GetInstanceAddedSignal(p4.interactionTag):Connect(function(p5)
		if not p5:IsA("BasePart") then
			error("Only BaseParts can have an interaction, got " .. p5:GetFullName());
		end;
		if p4.shouldMakeInteraction and not p4.shouldMakeInteraction(p5) then
			return nil;
		end;
		p3:givePartProximityPrompt(p5, p4);
	end);
	l__CollectionService__3:GetInstanceRemovedSignal(p4.interactionTag):Connect(function(p6)
		local v10 = p6:FindFirstChild(p4.interactionTag);
		if v10 then
			v10:Destroy();
		end;
	end);
	if p4.onVisibilityStateChanged then
		p4.onVisibilityStateChanged:Connect(function(p7)
			local v11 = p3.proximityPrompts[p4.interactionTag];
			if v11 then
				for v12, v13 in ipairs(v11) do
					v13.Enabled = p7;
				end;
			end;
		end);
	end;
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function u1.givePartProximityPrompt(p8, p9, p10)
	local l__interactionLabel__14 = p10.interactionLabel;
	if type(l__interactionLabel__14) == "function" then
		local v15 = l__interactionLabel__14(p9);
	else
		v15 = l__interactionLabel__14;
	end;
	local l__interactionObjectText__16 = p10.interactionObjectText;
	if type(l__interactionObjectText__16) == "function" then
		local v17 = l__interactionObjectText__16(p9);
	else
		v17 = l__interactionObjectText__16;
	end;
	local v18 = {
		Name = p10.interactionTag, 
		ObjectText = v17, 
		ActionText = v15, 
		AutoLocalize = true, 
		ClickablePrompt = p10.clickablePrompt, 
		KeyboardKeyCode = Enum.KeyCode.F, 
		RequiresLineOfSight = false
	};
	if p10.instantActivation then
		local v19 = 0;
	else
		v19 = l__Theme__5.promptHoldDuration;
	end;
	v18.HoldDuration = v19;
	v18.Parent = p9;
	v18.MaxActivationDistance = p10.maxActivationDistance;
	local v20 = u4("ProximityPrompt", v18);
	v20.Triggered:Connect(function()
		return p10.onInteracted(p9);
	end);
	local v21 = p8.proximityPrompts[p10.interactionTag] or {};
	local v22 = {};
	local v23 = #v22;
	local v24 = #v21;
	table.move(v21, 1, v24, v23 + 1, v22);
	v22[v23 + v24 + 1] = v20;
	p8.proximityPrompts[p10.interactionTag] = v22;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	InteractionRegistryController = u2
};
return u1;
