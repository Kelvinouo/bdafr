-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "VoidArmorController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "VoidArmorController";
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	for v6, v7 in ipairs({ l__ItemType__2.VOID_CHESTPLATE, l__ItemType__2.VOID_HELMET, l__ItemType__2.VOID_BOOTS }) do
		l__KnitClient__3.Controllers.PreloadController:preloadForItemType(v7, {
			sounds = { l__GameSound__4.VOID_SHIELD_BREAK }
		});
	end;
	l__default__5.Client:Get("RemoteName"):Connect(function(p3)
		p2:playEffect(p3.player);
		p2:putOnCooldown(p3.player);
		task.delay(30, function()
			p2:shieldReady(p3.player);
		end);
	end);
end;
function v4.putOnCooldown(p4, p5)
	p4:changeArmorMaterial(p5, Enum.Material.Sand);
end;
function v4.shieldReady(p6, p7)
	p6:changeArmorMaterial(p7, Enum.Material.Neon);
end;
function v4.changeArmorMaterial(p8, p9, p10)
	if p9.Character == nil then
		return nil;
	end;
	local v8 = p9.Character;
	if v8 ~= nil then
		v8 = v8:GetChildren();
	end;
	for v9, v10 in ipairs(v8) do
		if #{ string.find(v10:GetFullName(), "void_") } ~= 0 then
			local v11 = v10:WaitForChild("Handle", 3);
			if v11 ~= nil then
				v11 = v11:WaitForChild("Neon", 3);
			end;
			if v11 then
				v11.Material = p10;
			end;
		end;
	end;
end;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__Workspace__7 = v2.Workspace;
local l__RunService__8 = v2.RunService;
local l__scaleModel__9 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
function v4.playEffect(p11, p12)
	if p12.Character == nil then
		return nil;
	end;
	local v12 = l__ReplicatedStorage__6.Assets.Effects.VoidShieldBreak:Clone();
	v12:SetPrimaryPartCFrame(p12.Character:GetPrimaryPartCFrame());
	v12.Parent = l__Workspace__7;
	local l__Shield__13 = v12:WaitForChild("Shield", 3);
	l__Shield__13.Transparency = 0.4;
	local u10 = tick() + 1;
	local u11 = 1;
	l__RunService__8.Heartbeat:Connect(function(p13)
		if u10 < tick() + p13 then
			l__Shield__13:Destroy();
			return nil;
		end;
		v12:SetPrimaryPartCFrame(p12.Character:GetPrimaryPartCFrame());
		l__Shield__13.Transparency = l__Shield__13.Transparency + p13 * 2.5;
		l__scaleModel__9(v12, u11);
		u11 = u11 + p13;
	end);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v4.new());
return nil;
