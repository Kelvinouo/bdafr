-- Script Hash: 6213fee4b84314e7293a4782b2838b348fc74da57defaa9d5e8f88ad9705633aa51e52c961df9f103e198a1f928f5417
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "AeryKitController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "AeryKitController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v3.Players;
local l__KnitClient__4 = v2.KnitClient;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsKitSkin__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__Workspace__9 = v3.Workspace;
local l__Maid__10 = v2.Maid;
local l__HttpService__11 = v3.HttpService;
local l__RunService__12 = v3.RunService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("AeryGiveButterfly", function(p3)
		if not l__Players__3.LocalPlayer.Character then
			return nil;
		end;
		local v7 = l__KnitClient__4.Controllers.KitSkinController:getKitSkin(l__Players__3.LocalPlayer.Character);
		l__SoundManager__5:playSound(l__GameSound__6.AERY_BUTTERFLY_SPAWN);
		local v8 = 0;
		local v9 = false;
		while true do
			if v9 then
				v8 = v8 + 1;
			else
				v9 = true;
			end;
			if not (v8 < p3.amount) then
				break;
			end;
			if v7 == l__BedwarsKitSkin__7.ACADEMY_AERY then
				local v10 = l__ReplicatedStorage__8.Assets.Effects.AeryButterflyPurple:Clone();
			else
				v10 = l__ReplicatedStorage__8.Assets.Effects.AeryButterfly:Clone();
			end;
			v10.Parent = l__Workspace__9;
			v10:SetPrimaryPartCFrame(CFrame.new(p3.position));
			local v11 = l__Maid__10.new();
			v11:GiveTask(function()
				v10:Destroy();
			end);
			local l__UpperTorso__12 = p3.givenToEntity:FindFirstChild("UpperTorso");
			if l__UpperTorso__12 == nil then
				return nil;
			end;
			local v13 = Vector3.new(math.random(-2, 2), math.random(3, 4), math.random(-2, 2));
			local v14 = l__HttpService__11:GenerateGUID(false);
			local u13 = 0;
			local u14 = 1.2 + v8 * 0.2;
			l__RunService__12:BindToRenderStep(v14, Enum.RenderPriority.Last.Value, function(p4)
				if l__UpperTorso__12.Parent == nil then
					return nil;
				end;
				if v10.PrimaryPart == nil then
					return nil;
				end;
				u13 = u13 + p4;
				local v15 = math.clamp(u13 / u14, 0, 1);
				local v16 = math.sin(v15 * math.pi);
				v10:SetPrimaryPartCFrame(CFrame.new(v10.PrimaryPart.Position:Lerp(l__UpperTorso__12.Position, math.sqrt(v15)) + v13 * Vector3.new(v16, v16, v16)));
			end);
			v11:GiveTask(function()
				l__RunService__12:UnbindFromRenderStep(v14);
			end);
			task.delay(u14, function()
				l__SoundManager__5:playSound(l__GameSound__6.AERY_BUTTERFLY_CONSUME);
				v11:DoCleaning();
			end);		
		end;
	end);
end;
u1 = l__KnitClient__4.CreateController;
u1 = u1(v5.new());
return nil;
