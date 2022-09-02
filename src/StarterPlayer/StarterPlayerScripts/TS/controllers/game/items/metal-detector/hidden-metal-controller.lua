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
		local v7 = nil;
		for v8, v9 in ipairs((l__CollectionService__5:GetTagged("hidden-metal"))) do
			if v9:GetAttribute("Id") == p4.id == true then
				v7 = v9;
				break;
			end;
		end;
		if v7 ~= nil then
			v7:Destroy();
		end;
	end);
	l__WatchCharacter__6(function(p5, p6)
		l__AnimatorAdded__7(p6:WaitForChild("Humanoid"), function(p7)
			p7.AnimationPlayed:Connect(function(p8)
				local v10 = p8.Animation;
				if v10 ~= nil then
					v10 = v10.AnimationId;
				end;
				if v10 == l__GameAnimationUtil__8.getAssetId(l__AnimationType__9.SHOVEL_DIG) then
					if p2.animationPlayingCooldowns:has(p5.UserId) and p5.UserId ~= l__Players__10.LocalPlayer.UserId then
						return nil;
					end;
					p2.animationPlayingCooldowns:add(p5.UserId);
					local v11 = l__ReplicatedStorage__11.Assets.Effects.Shovel:Clone();
					v11.Parent = p6;
					l__WeldUtil__12.weldCharacterAccessories(p6);
					local l__metal_detector__12 = p6:FindFirstChild("metal_detector");
					if l__metal_detector__12 then
						for v13, v14 in ipairs(l__metal_detector__12:GetChildren()) do
							if v14:IsA("BasePart") then
								v14.Transparency = 1;
							end;
						end;
					end;
					p8.Stopped:Connect(function()
						v11:Destroy();
						if l__metal_detector__12 then
							for v15, v16 in ipairs(l__metal_detector__12:GetChildren()) do
								if v16:IsA("BasePart") then
									v16.Transparency = 0;
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
function v5.createLocalModel(p9, p10)
	local v17 = u13("Model", {});
	v17.PrimaryPart = u13("Part", {
		Anchored = true, 
		CanCollide = false, 
		Transparency = 1, 
		Parent = v17
	});
	v17.Parent = l__Workspace__14;
	v17:SetPrimaryPartCFrame(CFrame.new(p10.origin));
	v17:SetAttribute("Id", p10.id);
	local v18 = {
		ActionText = "Collect", 
		ObjectText = "", 
		HoldDuration = 1, 
		KeyboardKeyCode = l__Theme__15.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		Enabled = true, 
		MaxActivationDistance = 8
	};
	function v18.Triggered(p11)
		l__GameAnimationUtil__8.playAnimation(p11, l__AnimationType__9.SHOVEL_DIG);
		l__SoundManager__16:playSound(l__GameSound__17.SNAP_TRAP_CONSUME_MARK);
		l__default__3.Client:Get("RemoteName"):SendToServer({
			id = p10.id
		});
	end;
	v18.Parent = v17;
	u13("ProximityPrompt", v18);
	for v19, v20 in ipairs(v17:GetDescendants()) do
		if v20:IsA("BasePart") then
			l__GameQueryUtil__18:setQueryIgnored(v20, true);
		end;
	end;
	l__CollectionService__5:AddTag(v17, "hidden-metal");
	return v17;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
