-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FirstPersonVisibilityController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
function u1.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "FirstPersonVisibilityController";
end;
local l__WatchCharacter__2 = v2.WatchCharacter;
local l__Players__3 = v3.Players;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__CollectionTagAdded__5 = v2.CollectionTagAdded;
function u1.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4)
		if p3 == l__Players__3.LocalPlayer then
			p2:updateAll(p4);
			p4.ChildAdded:Connect(function(p5)
				p2:update(p5);
				local v7, v8, v9 = ipairs((p5:GetDescendants()));
				while true do
					v7(v8, v9);
					if not v7 then
						break;
					end;
					v9 = v7;
					p2:update(v8);				
				end;
			end);
		end;
	end);
	l__KnitClient__4.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function()
		p2:updateAll(l__Players__3.LocalPlayer.Character);
	end);
	l__CollectionTagAdded__5("FirstPersonHidden", function(p6)
		p2:update(p6);
	end);
end;
local l__CollectionService__6 = v3.CollectionService;
function u1.updateAll(p7, p8)
	if p8 then
		local v10, v11, v12 = ipairs(p8:GetDescendants());
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			p7:update(v11);		
		end;
	end;
	local v13, v14, v15 = ipairs((l__CollectionService__6:GetTagged("FirstPersonHidden")));
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		local v16 = {};
		local v17 = #v16;
		local v18 = v14:GetDescendants();
		local v19 = #v18;
		table.move(v18, 1, v19, v17 + 1, v16);
		v16[v17 + v19 + 1] = v14;
		local v20, v21, v22 = ipairs(v16);
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			p7:update(v21);		
		end;	
	end;
end;
local l__CameraPerspective__7 = v1.import(script, script.Parent, "camera-perspective").CameraPerspective;
function u1.update(p9, p10)
	local v23 = l__KnitClient__4.Controllers.CameraPerspectiveController:getCameraPerspective();
	if p10:IsA("BasePart") and p10:GetAttribute("LocalTransparency") ~= nil then
		p10.LocalTransparencyModifier = p10:GetAttribute("LocalTransparency");
	end;
	local v24 = p10:GetAttribute("FirstPersonVisible");
	local v25 = l__CollectionService__6:HasTag(p10, "FirstPersonHidden");
	if v24 == nil and not v25 then
		return nil;
	end;
	local v26 = true;
	if v24 ~= false then
		v26 = v25;
	end;
	if not (not p10:IsA("Beam")) or not (not p10:IsA("ParticleEmitter")) or p10:IsA("Trail") then
		local v27 = nil;
		local v28 = nil;
		local v29 = nil;
		local v30 = nil;
		local v31 = nil;
		if v23 == l__CameraPerspective__7.FIRST_PERSON then
			if v26 then
				if p10:IsA("ParticleEmitter") then
					p10:Clear();
				end;
				p10.Enabled = false;
				return;
			end;
			v28 = true;
			v27 = "Enabled";
			v29 = p10;
			v30 = v27;
			v31 = v28;
			v29[v30] = v31;
		else
			v28 = true;
			v27 = "Enabled";
			v29 = p10;
			v30 = v27;
			v31 = v28;
			v29[v30] = v31;
		end;
	end;
end;
u1 = l__KnitClient__4.CreateController;
u1 = u1(u1.new());
return {
	FirstPersonVisibilityController = u1
};
