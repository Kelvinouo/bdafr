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
local l__ExpireList__1 = v2.ExpireList;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "HiddenMetalController";
	p1.animationPlayingCooldowns = l__ExpireList__1.new(2);
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectableEntityType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collectable-entity", "collectable-entity").CollectableEntityType;
local l__CollectionService__4 = v3.CollectionService;
local l__WatchCharacter__5 = v2.WatchCharacter;
local l__AnimatorAdded__6 = v2.AnimatorAdded;
local l__GameAnimationUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local l__Players__9 = v3.Players;
local l__ReplicatedStorage__10 = v3.ReplicatedStorage;
local l__WeldUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		if p3.entityType ~= l__CollectableEntityType__3.HIDDEN_METAL then
			return nil;
		end;
		p2:createLocalModel({
			id = p3.id, 
			origin = p3.position
		});
	end);
	l__default__2.Client:OnEvent("RemoteName", function(p4)
		local v7 = nil;
		local v8, v9, v10 = ipairs((l__CollectionService__4:GetTagged("hidden-metal")));
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			if v9:GetAttribute("Id") == p4.id == true then
				v7 = v9;
				break;
			end;		
		end;
		if v7 ~= nil then
			v7:Destroy();
		end;
	end);
	l__WatchCharacter__5(function(p5, p6)
		l__AnimatorAdded__6(p6:WaitForChild("Humanoid"), function(p7)
			p7.AnimationPlayed:Connect(function(p8)
				local v11 = p8.Animation;
				if v11 ~= nil then
					v11 = v11.AnimationId;
				end;
				if v11 == l__GameAnimationUtil__7.getAssetId(l__AnimationType__8.SHOVEL_DIG) then
					if p2.animationPlayingCooldowns:has(p5.UserId) and p5.UserId ~= l__Players__9.LocalPlayer.UserId then
						return nil;
					end;
					p2.animationPlayingCooldowns:add(p5.UserId);
					local v12 = l__ReplicatedStorage__10.Assets.Effects.Shovel:Clone();
					v12.Parent = p6;
					l__WeldUtil__11.weldCharacterAccessories(p6);
					local l__metal_detector__13 = p6:FindFirstChild("metal_detector");
					if l__metal_detector__13 then
						local v14, v15, v16 = ipairs(l__metal_detector__13:GetChildren());
						while true do
							v14(v15, v16);
							if not v14 then
								break;
							end;
							v16 = v14;
							if v15:IsA("BasePart") then
								v15.Transparency = 1;
							end;						
						end;
					end;
					p8.Stopped:Connect(function()
						v12:Destroy();
						if l__metal_detector__13 then
							local v17, v18, v19 = ipairs(l__metal_detector__13:GetChildren());
							while true do
								v17(v18, v19);
								if not v17 then
									break;
								end;
								v19 = v17;
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
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__13 = v3.Workspace;
local l__Theme__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__15 = v2.SoundManager;
local l__GameSound__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__17 = v2.GameQueryUtil;
function v5.createLocalModel(p9, p10)
	local v20 = u12("Model", {});
	v20.PrimaryPart = u12("Part", {
		Anchored = true, 
		CanCollide = false, 
		Transparency = 1, 
		Parent = v20
	});
	v20.Parent = l__Workspace__13;
	v20:SetPrimaryPartCFrame(CFrame.new(p10.origin));
	v20:SetAttribute("Id", p10.id);
	local v21 = {
		ActionText = "Collect", 
		ObjectText = "", 
		HoldDuration = 1, 
		KeyboardKeyCode = l__Theme__14.promptKeyboardKey, 
		RequiresLineOfSight = false, 
		Enabled = true, 
		MaxActivationDistance = 8
	};
	function v21.Triggered(p11)
		l__GameAnimationUtil__7.playAnimation(p11, l__AnimationType__8.SHOVEL_DIG);
		l__SoundManager__15:playSound(l__GameSound__16.SNAP_TRAP_CONSUME_MARK);
		l__default__2.Client:Get("RemoteName"):SendToServer({
			id = p10.id
		});
	end;
	v21.Parent = v20;
	u12("ProximityPrompt", v21);
	local v22, v23, v24 = ipairs(v20:GetDescendants());
	while true do
		v22(v23, v24);
		if not v22 then
			break;
		end;
		v24 = v22;
		if v23:IsA("BasePart") then
			l__GameQueryUtil__17:setQueryIgnored(v23, true);
		end;	
	end;
	l__CollectionService__4:AddTag(v20, "hidden-metal");
	return v20;
end;
local v25 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
