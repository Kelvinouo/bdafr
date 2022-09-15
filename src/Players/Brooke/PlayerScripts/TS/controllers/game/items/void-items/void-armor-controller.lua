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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "VoidArmorController";
end;
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	local v6, v7, v8 = ipairs({ l__ItemType__1.VOID_CHESTPLATE, l__ItemType__1.VOID_HELMET, l__ItemType__1.VOID_BOOTS });
	while true do
		v6(v7, v8);
		if not v6 then
			break;
		end;
		v8 = v6;
		l__KnitClient__2.Controllers.PreloadController:preloadForItemType(v7, {
			sounds = { l__GameSound__3.VOID_SHIELD_BREAK }
		});	
	end;
	l__default__4.Client:Get("RemoteName"):Connect(function(p3)
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
	local v9 = p9.Character;
	if v9 ~= nil then
		v9 = v9:GetChildren();
	end;
	local v10, v11, v12 = ipairs(v9);
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		if #{ string.find(v11:GetFullName(), "void_") } ~= 0 then
			local v13 = v11:WaitForChild("Handle", 3);
			if v13 ~= nil then
				v13 = v13:WaitForChild("Neon", 3);
			end;
			if v13 then
				v13.Material = p10;
			end;
		end;	
	end;
end;
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__Workspace__6 = v2.Workspace;
local l__RunService__7 = v2.RunService;
local l__scaleModel__8 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
function v4.playEffect(p11, p12)
	if p12.Character == nil then
		return nil;
	end;
	local v14 = l__ReplicatedStorage__5.Assets.Effects.VoidShieldBreak:Clone();
	v14:SetPrimaryPartCFrame(p12.Character:GetPrimaryPartCFrame());
	v14.Parent = l__Workspace__6;
	local l__Shield__15 = v14:WaitForChild("Shield", 3);
	l__Shield__15.Transparency = 0.4;
	local u9 = tick() + 1;
	local u10 = 1;
	l__RunService__7.Heartbeat:Connect(function(p13)
		if u9 < tick() + p13 then
			l__Shield__15:Destroy();
			return nil;
		end;
		v14:SetPrimaryPartCFrame(p12.Character:GetPrimaryPartCFrame());
		l__Shield__15.Transparency = l__Shield__15.Transparency + p13 * 2.5;
		l__scaleModel__8(v14, u10);
		u10 = u10 + p13;
	end);
end;
local v16 = l__KnitClient__2.CreateController(v4.new());
return nil;
