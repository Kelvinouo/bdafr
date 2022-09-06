-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SheepHerderKitController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ExpireList__2 = v2.ExpireList;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "SheepHerderKitController";
	p1.sheepNamespace = l__default__1.Client:GetNamespace("SheepHerder");
	p1.animationCooldowns = l__ExpireList__2.new(2);
end;
local l__WatchCharacter__3 = v2.WatchCharacter;
local l__AnimatorAdded__4 = v2.AnimatorAdded;
local l__GameAnimationUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__Players__7 = v3.Players;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__9 = v3.ReplicatedStorage;
local l__WeldUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__WatchCharacter__3(function(p3, p4)
		l__AnimatorAdded__4(p4:WaitForChild("Humanoid"), function(p5)
			p5.AnimationPlayed:Connect(function(p6)
				local v7 = p6.Animation;
				if v7 ~= nil then
					v7 = v7.AnimationId;
				end;
				if v7 == l__GameAnimationUtil__5.getAssetId(l__AnimationType__6.TAME_SHEEP) then
					if p2.animationCooldowns:has(p3.UserId) and p3.UserId ~= l__Players__7.LocalPlayer.UserId then
						return nil;
					end;
					p2.animationCooldowns:add(p3.UserId);
					local v8 = p4.PrimaryPart;
					if v8 ~= nil then
						v8 = v8.Position;
					end;
					if not v8 then
						return nil;
					end;
					local v9 = u8.new();
					local v10 = l__ReplicatedStorage__9.Assets.Effects.Crook:Clone();
					v10.Parent = p4;
					l__WeldUtil__10:weldCharacterAccessories(p4);
					p6.Stopped:Connect(function()
						v10:Destroy();
						v9:DoCleaning();
					end);
				end;
			end);
		end);
	end);
end;
function v5.tameSheep(p7, p8)
	local l__Value__11 = p8.SheepData.Value;
	print("sheep data:", l__Value__11);
	if not l__Value__11 then
		return nil;
	end;
	p7.sheepNamespace:Get("TameSheep"):SendToServer(l__Value__11);
end;
local v12 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
