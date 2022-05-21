-- Script Hash: 358d81077de23414f434a43a9b90ddb74e92f9f90a94c6d049a9762cc2b9dd1427661192d53cec2955cf8992c84a1f05
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
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
				local v8 = p5:GetDescendants();
				local function v9(p6)
					p2:update(p6);
				end;
				for v10, v11 in ipairs(v8) do
					v9(v11, v10 - 1, v8);
				end;
			end);
		end;
	end);
	l__KnitClient__3.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function()
		p2:updateAll(l__Players__4.LocalPlayer.Character);
	end);
	l__CollectionTagAdded__5("FirstPersonHidden", function(p7)
		p2:update(p7);
	end);
end;
local l__CollectionService__6 = v4.CollectionService;
function u1.updateAll(p8, p9)
	if p9 then
		for v12, v13 in ipairs(p9:GetDescendants()) do
			p8:update(v13);
		end;
	end;
	for v14, v15 in ipairs((l__CollectionService__6:GetTagged("FirstPersonHidden"))) do
		local v16 = {};
		local v17 = #v16;
		local v18 = v15:GetDescendants();
		local v19 = #v18;
		table.move(v18, 1, v19, v17 + 1, v16);
		v16[v17 + v19 + 1] = v15;
		for v20, v21 in ipairs(v16) do
			p8:update(v21);
		end;
	end;
end;
local l__CameraPerspective__7 = v1.import(script, script.Parent, "camera-perspective").CameraPerspective;
function u1.update(p10, p11)
	local v22 = l__KnitClient__3.Controllers.CameraPerspectiveController:getCameraPerspective();
	if p11:IsA("BasePart") and p11:GetAttribute("LocalTransparency") ~= nil then
		p11.LocalTransparencyModifier = p11:GetAttribute("LocalTransparency");
	end;
	local v23 = p11:GetAttribute("FirstPersonVisible");
	local v24 = l__CollectionService__6:HasTag(p11, "FirstPersonHidden");
	if v23 == nil and not v24 then
		return nil;
	end;
	local v25 = true;
	if v23 ~= false then
		v25 = v24;
	end;
	if p11:IsA("Beam") or p11:IsA("ParticleEmitter") then
		local v26 = nil;
		local v27 = nil;
		local v28 = nil;
		local v29 = nil;
		local v30 = nil;
		if v22 == l__CameraPerspective__7.FIRST_PERSON then
			if v25 then
				if p11:IsA("ParticleEmitter") then
					p11:Clear();
				end;
				p11.Enabled = false;
				return;
			end;
			v27 = true;
			v26 = "Enabled";
			v28 = p11;
			v29 = v26;
			v30 = v27;
			v28[v29] = v30;
		else
			v27 = true;
			v26 = "Enabled";
			v28 = p11;
			v29 = v26;
			v30 = v27;
			v28[v29] = v30;
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
