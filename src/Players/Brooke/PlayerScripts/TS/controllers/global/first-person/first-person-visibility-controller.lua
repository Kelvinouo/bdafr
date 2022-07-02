-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "FirstPersonVisibilityController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "FirstPersonVisibilityController";
end;
local l__WatchCharacter__3 = v2.WatchCharacter;
local l__Players__4 = v4.Players;
local l__CollectionTagAdded__5 = v2.CollectionTagAdded;
function u1.KnitStart(p2)
	l__WatchCharacter__3(function(p3, p4)
		if p3 == l__Players__4.LocalPlayer then
			p2:updateAll(p4);
			p4.ChildAdded:Connect(function(p5)
				p2:update(p5);
				for v8, v9 in ipairs((p5:GetDescendants())) do
					p2:update(v9);
				end;
			end);
		end;
	end);
	l__KnitClient__3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function()
		p2:updateAll(l__Players__4.LocalPlayer.Character);
	end);
	l__CollectionTagAdded__5("FirstPersonHidden", function(p6)
		p2:update(p6);
	end);
end;
local l__CollectionService__6 = v4.CollectionService;
function u1.updateAll(p7, p8)
	if p8 then
		for v10, v11 in ipairs(p8:GetDescendants()) do
			p7:update(v11);
		end;
	end;
	for v12, v13 in ipairs((l__CollectionService__6:GetTagged("FirstPersonHidden"))) do
		local v14 = {};
		local v15 = #v14;
		local v16 = v13:GetDescendants();
		local v17 = #v16;
		table.move(v16, 1, v17, v15 + 1, v14);
		v14[v15 + v17 + 1] = v13;
		for v18, v19 in ipairs(v14) do
			p7:update(v19);
		end;
	end;
end;
local l__CameraPerspective__7 = v1.import(script, script.Parent, "camera-perspective").CameraPerspective;
function u1.update(p9, p10)
	local v20 = l__KnitClient__3.Controllers.CameraPerspectiveController:getCameraPerspective();
	if p10:IsA("BasePart") and p10:GetAttribute("LocalTransparency") ~= nil then
		p10.LocalTransparencyModifier = p10:GetAttribute("LocalTransparency");
	end;
	local v21 = p10:GetAttribute("FirstPersonVisible");
	local v22 = l__CollectionService__6:HasTag(p10, "FirstPersonHidden");
	if v21 == nil and not v22 then
		return nil;
	end;
	local v23 = true;
	if v21 ~= false then
		v23 = v22;
	end;
	if not (not p10:IsA("Beam")) or not (not p10:IsA("ParticleEmitter")) or p10:IsA("Trail") then
		local v24 = nil;
		local v25 = nil;
		local v26 = nil;
		local v27 = nil;
		local v28 = nil;
		if v20 == l__CameraPerspective__7.FIRST_PERSON then
			if v23 then
				if p10:IsA("ParticleEmitter") then
					p10:Clear();
				end;
				p10.Enabled = false;
				return;
			end;
			v25 = true;
			v24 = "Enabled";
			v26 = p10;
			v27 = v24;
			v28 = v25;
			v26[v27] = v28;
		else
			v25 = true;
			v24 = "Enabled";
			v26 = p10;
			v27 = v24;
			v28 = v25;
			v26[v27] = v28;
		end;
	end;
end;
u2 = l__KnitClient__3.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	FirstPersonVisibilityController = u2
};
return u1;
