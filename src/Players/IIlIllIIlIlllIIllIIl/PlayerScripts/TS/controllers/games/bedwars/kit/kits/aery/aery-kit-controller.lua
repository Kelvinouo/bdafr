-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "AeryKitController";
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
	p1.Name = "AeryKitController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v2.Players;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__SoundManager__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__BedwarsKitSkin__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__ReplicatedStorage__8 = v2.ReplicatedStorage;
local l__Workspace__9 = v2.Workspace;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__HttpService__11 = v2.HttpService;
local l__RunService__12 = v2.RunService;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		if not l__Players__3.LocalPlayer.Character then
			return nil;
		end;
		local v6 = l__KnitClient__4.Controllers.KitSkinController:getKitSkin(l__Players__3.LocalPlayer.Character);
		l__SoundManager__5:playSound(l__GameSound__6.AERY_BUTTERFLY_SPAWN);
		local v7 = 0;
		local v8 = false;
		while true do
			if v8 then
				v7 = v7 + 1;
			else
				v8 = true;
			end;
			if not (v7 < p3.amount) then
				break;
			end;
			if v6 == l__BedwarsKitSkin__7.ACADEMY_AERY then
				local v9 = l__ReplicatedStorage__8.Assets.Effects.AeryButterflyPurple:Clone();
			else
				v9 = l__ReplicatedStorage__8.Assets.Effects.AeryButterfly:Clone();
			end;
			v9.Parent = l__Workspace__9;
			v9:SetPrimaryPartCFrame(CFrame.new(p3.position));
			local v10 = u10.new();
			v10:GiveTask(function()
				v9:Destroy();
			end);
			local l__UpperTorso__11 = p3.givenToEntity:FindFirstChild("UpperTorso");
			if l__UpperTorso__11 == nil then
				return nil;
			end;
			local v12 = Vector3.new(math.random(-2, 2), math.random(3, 4), math.random(-2, 2));
			local v13 = l__HttpService__11:GenerateGUID(false);
			local u13 = 0;
			local u14 = 1.2 + v7 * 0.2;
			l__RunService__12:BindToRenderStep(v13, Enum.RenderPriority.Last.Value, function(p4)
				if l__UpperTorso__11.Parent == nil then
					return nil;
				end;
				if v9.PrimaryPart == nil then
					return nil;
				end;
				u13 = u13 + p4;
				local v14 = math.clamp(u13 / u14, 0, 1);
				local v15 = math.sin(v14 * math.pi);
				v9:SetPrimaryPartCFrame(CFrame.new(v9.PrimaryPart.Position:Lerp(l__UpperTorso__11.Position, math.sqrt(v14)) + v12 * Vector3.new(v15, v15, v15)));
			end);
			v10:GiveTask(function()
				l__RunService__12:UnbindFromRenderStep(v13);
			end);
			task.delay(u14, function()
				l__SoundManager__5:playSound(l__GameSound__6.AERY_BUTTERFLY_CONSUME);
				v10:DoCleaning();
			end);		
		end;
	end);
end;
u1 = l__KnitClient__4.CreateController;
u1 = u1(v4.new());
return nil;
