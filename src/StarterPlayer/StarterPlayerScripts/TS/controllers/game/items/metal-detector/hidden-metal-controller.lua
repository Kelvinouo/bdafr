-- Script Hash: e590df87e1ea6165a2831ce7ddfc3bca531bffbf5ce42b535b64a36e53036c91193d13fa47974c471e48f5f043d8a87e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HiddenMetalController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__ExpireList__2 = v2.ExpireList;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "HiddenMetalController";
	p1.animationPlayingCooldowns = l__ExpireList__2.new(2);
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectableEntityType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local l__CollectionService__5 = v3.CollectionService;
local l__WatchCharacter__6 = v2.WatchCharacter;
local l__AnimatorAdded__7 = v2.AnimatorAdded;
local l__GameAnimationUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__Players__10 = v3.Players;
local l__ReplicatedStorage__11 = v3.ReplicatedStorage;
local l__WeldUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__3.Client:OnEvent("RemoteName", function(p3)
		if p3.entityType ~= l__CollectableEntityType__4.HIDDEN_METAL then
			return nil;
		end;
		p2:createLocalModel({
			id = p3.id, 
			origin = p3.position
		});
	end);
	l__default__3.Client:OnEvent("RemoteName", function(p4)
		local v7 = l__CollectionService__5:GetTagged("hidden-metal");
		local function v8(p5)
			return p5:GetAttribute("Id") == p4.id;
		end;
		local v9 = nil;
		for v10, v11 in ipairs(v7) do
			if v8(v11, v10 - 1, v7) == true then
				v9 = v11;
				break;
			end;
		end;
		if v9 ~= nil then
			v9:Destroy();
		end;
	end);
	l__WatchCharacter__6(function(p6, p7)
		l__AnimatorAdded__7(p7:WaitForChild("Humanoid"), function(p8)
			p8.AnimationPlayed:Connect(function(p9)
				local v12 = p9.Animation;
				if v12 ~= nil then
					v12 = v12.AnimationId;
				end;
				if v12 == l__GameAnimationUtil__8.getAssetId(l__AnimationType__9.SHOVEL_DIG) then
					if p2.animationPlayingCooldowns:has(p6.UserId) and p6.UserId ~= l__Players__10.LocalPlayer.UserId then
						return nil;
					end;
					p2.animationPlayingCooldowns:add(p6.UserId);
					local v13 = l__ReplicatedStorage__11.Assets.Effects.Shovel:Clone();
					v13.Parent = p7;
					l__WeldUtil__12.weldCharacterAccessories(p7);
					local l__metal_detector__14 = p7:FindFirstChild("metal_detector");
					if l__metal_detector__14 then
						for v15, v16 in ipairs(l__metal_detector__14:GetChildren()) do
							if v16:IsA("BasePart") then
								v16.Transparency = 1;
							end;
						end;
					end;
					p9.Stopped:Connect(function()
						v13:Destroy();
						if l__metal_detector__14 then
							for v17, v18 in ipairs(l__metal_detector__14:GetChildren()) do
								if v18:IsA("BasePart") then
									v18.Transparency = 0;
								end;
							end;
						end;
					end);
				end;
			end);
		end);
	end);
end;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__14 = v3.Workspace;
local l__Theme__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__16 = v2.SoundManager;
local l__GameSound__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__18 = v2.GameQueryUtil;
function v5.createLocalModel(p10, p11)
	local v19 = u13("Model", {});
	v19.PrimaryPart = u13("Part", {
		Anchored = true, 
		CanCollide = false, 
		Transparency = 1, 
		Parent = v19
	});
	v19.Parent = l__Workspace__14;
	v19:SetPrimaryPartCFrame(CFrame.new(p11.origin));
	v19:SetAttribute("Id", p11.id);
	local v20 = {
		ActionText = "Collect", 
		ObjectText = "", 
		HoldDuration = 1, 
		KeyboardKeyCode = l__Theme__15.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		Enabled = true, 
		MaxActivationDistance = 8
	};
	function v20.Triggered(p12)
		l__GameAnimationUtil__8.playAnimation(p12, l__AnimationType__9.SHOVEL_DIG);
		l__SoundManager__16:playSound(l__GameSound__17.SNAP_TRAP_CONSUME_MARK);
		l__default__3.Client:Get("RemoteName"):SendToServer({
			id = p11.id
		});
	end;
	v20.Parent = v19;
	u13("ProximityPrompt", v20);
	for v21, v22 in ipairs(v19:GetDescendants()) do
		if v22:IsA("BasePart") then
			l__GameQueryUtil__18:setQueryIgnored(v22, true);
		end;
	end;
	l__CollectionService__5:AddTag(v19, "hidden-metal");
	return v19;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
