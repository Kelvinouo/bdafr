
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "SheepHerderKitController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ExpireList__3 = v2.ExpireList;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "SheepHerderKitController";
	p1.sheepNamespace = l__default__2.Client:GetNamespace("SheepHerder");
	p1.animationCooldowns = l__ExpireList__3.new(2);
end;
local l__WatchCharacter__4 = v2.WatchCharacter;
local l__AnimatorAdded__5 = v2.AnimatorAdded;
local l__GameAnimationUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__Players__8 = v4.Players;
local l__Maid__9 = v3.Maid;
local l__ReplicatedStorage__10 = v4.ReplicatedStorage;
local l__WeldUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCharacter__4(function(p3, p4)
		l__AnimatorAdded__5(p4:WaitForChild("Humanoid"), function(p5)
			p5.AnimationPlayed:Connect(function(p6)
				local v8 = p6.Animation;
				if v8 ~= nil then
					v8 = v8.AnimationId;
				end;
				if v8 == l__GameAnimationUtil__6.getAssetId(l__AnimationType__7.TAME_SHEEP) then
					if p2.animationCooldowns:has(p3.UserId) and p3.UserId ~= l__Players__8.LocalPlayer.UserId then
						return nil;
					end;
					p2.animationCooldowns:add(p3.UserId);
					local v9 = p4.PrimaryPart;
					if v9 ~= nil then
						v9 = v9.Position;
					end;
					if not v9 then
						return nil;
					end;
					local v10 = l__Maid__9.new();
					local v11 = l__ReplicatedStorage__10.Assets.Effects.Crook:Clone();
					v11.Parent = p4;
					l__WeldUtil__11.weldCharacterAccessories(p4);
					p6.Stopped:Connect(function()
						v11:Destroy();
						v10:DoCleaning();
					end);
				end;
			end);
		end);
	end);
end;
function v6.tameSheep(p7, p8)
	local l__Value__12 = p8.SheepData.Value;
	print("sheep data:", l__Value__12);
	if not l__Value__12 then
		return nil;
	end;
	p7.sheepNamespace:Get("RemoteName"):SendToServer(l__Value__12);
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;

