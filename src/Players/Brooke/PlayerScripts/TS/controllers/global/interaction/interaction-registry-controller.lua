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
function u1.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "InteractionRegistryController";
	p1.registeredInteractions = {};
	p1.proximityPrompts = {};
end;
function u1.KnitStart(p2)

end;
function u1.getProximityPrompts(p3)
	return p3.proximityPrompts;
end;
local l__CollectionService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
function u1.RegisterInteraction(p4, p5)
	local v5 = nil;
	local v6, v7, v8 = ipairs(p4.registeredInteractions);
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		if v7.interactionTag == p5.interactionTag == true then
			v5 = v7;
			break;
		end;	
	end;
	if v5 then
		error("Tag " .. p5.interactionTag .. " is already registered");
	end;
	table.insert(p4.registeredInteractions, p5);
	local v9, v10, v11 = ipairs((l__CollectionService__2:GetTagged(p5.interactionTag)));
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		if v10:IsA("BasePart") and (not p5.shouldMakeInteraction or p5.shouldMakeInteraction(v10)) then
			p4:givePartProximityPrompt(v10, p5);
		end;	
	end;
	l__CollectionService__2:GetInstanceAddedSignal(p5.interactionTag):Connect(function(p6)
		if not p6:IsA("BasePart") then
			error("Only BaseParts can have an interaction, got " .. p6:GetFullName());
		end;
		if p5.shouldMakeInteraction and not p5.shouldMakeInteraction(p6) then
			return nil;
		end;
		p4:givePartProximityPrompt(p6, p5);
	end);
	l__CollectionService__2:GetInstanceRemovedSignal(p5.interactionTag):Connect(function(p7)
		local v12 = p7:FindFirstChild(p5.interactionTag);
		if v12 then
			v12:Destroy();
		end;
	end);
	if p5.onVisibilityStateChanged then
		p5.onVisibilityStateChanged:Connect(function(p8)
			local v13 = p4.proximityPrompts[p5.interactionTag];
			if v13 then
				local v14, v15, v16 = ipairs(v13);
				while true do
					v14(v15, v16);
					if not v14 then
						break;
					end;
					v16 = v14;
					v15.Enabled = p8;				
				end;
			end;
		end);
	end;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function u1.givePartProximityPrompt(p9, p10, p11)
	local l__interactionLabel__17 = p11.interactionLabel;
	if type(l__interactionLabel__17) == "function" then
		local v18 = l__interactionLabel__17(p10);
	else
		v18 = l__interactionLabel__17;
	end;
	local l__interactionObjectText__19 = p11.interactionObjectText;
	if type(l__interactionObjectText__19) == "function" then
		local v20 = l__interactionObjectText__19(p10);
	else
		v20 = l__interactionObjectText__19;
	end;
	local v21 = {
		Name = p11.interactionTag, 
		ObjectText = v20, 
		ActionText = v18, 
		AutoLocalize = true, 
		ClickablePrompt = p11.clickablePrompt, 
		KeyboardKeyCode = Enum.KeyCode.F, 
		RequiresLineOfSight = false
	};
	if p11.instantActivation then
		local v22 = 0;
	else
		v22 = l__Theme__4.promptHoldDuration;
	end;
	v21.HoldDuration = v22;
	v21.Parent = p10;
	v21.MaxActivationDistance = p11.maxActivationDistance;
	local v23 = u3("ProximityPrompt", v21);
	v23.Triggered:Connect(function()
		return p11.onInteracted(p10);
	end);
	local v24 = p9.proximityPrompts[p11.interactionTag] or {};
	local v25 = {};
	local v26 = #v25;
	local v27 = #v24;
	table.move(v24, 1, v27, v26 + 1, v25);
	v25[v26 + v27 + 1] = v23;
	p9.proximityPrompts[p11.interactionTag] = v25;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	InteractionRegistryController = u1
};
