-- Script Hash: 01e05287a734cedcbb48fbc02834719c8ed01c5c0727bfbeceff0fcd8c34e2cc7d0daf633af8085a954dcbce12f39dab
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "DodoBirdController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "DodoBirdController";
	p1.playerToDodoBird = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionTagAdded__3 = v2.CollectionTagAdded;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DodoAction__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "dodo-bird", "dodo-bird").DodoAction;
local l__Players__7 = v4.Players;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UnmountDodoApp__10 = v1.import(script, script.Parent, "ui", "unmount-dodo-app").UnmountDodoApp;
local l__Maid__11 = v3.Maid;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	local u12 = l__default__2.Client:Get("RemoteName");
	l__CollectionTagAdded__3("dodo-bird", function(p3)
		p3:SetAttribute("NextSquawk", -1);
		local v8 = {
			Name = "DodoMountPrompt", 
			ActionText = "Mount", 
			ObjectText = "Dodo bird", 
			HoldDuration = 1, 
			KeyboardKeyCode = l__Theme__5.promptKeyboardKey, 
			RequiresLineOfSight = false
		};
		function v8.Triggered()
			u12:SendToServer({
				action = l__DodoAction__6.Mount, 
				dodoBird = p3
			});
		end;
		v8.Parent = p3;
		u4("ProximityPrompt", v8);
	end);
	l__default__2.Client:Get("RemoteName"):Connect(function(p4)
		if p4.action == l__DodoAction__6.Mount then
			if p4.player == l__Players__7.LocalPlayer then
				local v9 = l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(l__UnmountDodoApp__10, {
					interactionKey = Enum.KeyCode.B, 
					unmountCallback = function()
						u12:SendToServer({
							action = l__DodoAction__6.Unmount
						});
					end
				}));
				p2:toggleDodoProximityPrompts(false);
				if p2.dodoBirdMaid then
					p2.dodoBirdMaid:DoCleaning();
				end;
				p2.dodoBirdMaid = l__Maid__11.new();
				p2.dodoBirdMaid:GiveTask(function()
					v9:DoCleaning();
				end);
				p2.dodoBirdMaid:GiveTask(function()
					p2:toggleDodoProximityPrompts(true);
				end);
				p2.dodoBirdMaid:GiveTask(p2:enableDoubleJump(p4.player.Character));
			end;
			if p4.player.Character ~= nil then
				p2.playerToDodoBird[p4.player] = p2:mountPlayerOnDodoBird(p4.player.Character);
				return;
			end;
		elseif p4.action == l__DodoAction__6.Unmount then
			p2:unmountPlayerFromDodoBird(p4.player);
		end;
	end);
	for v10, v11 in ipairs(l__Players__7:GetPlayers()) do
		v11.CharacterRemoving:Connect(function()
			p2:unmountPlayerFromDodoBird(v11);
		end);
	end;
	l__Players__7.PlayerAdded:Connect(function(p5)
		p5.CharacterRemoving:Connect(function()
			p2:unmountPlayerFromDodoBird(p5);
		end);
	end);
end;
local l__SoundManager__13 = v2.SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__15 = v4.ReplicatedStorage;
local l__CollectionService__16 = v4.CollectionService;
local l__GameAnimationUtil__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v6.mountPlayerOnDodoBird(p6, p7)
	l__SoundManager__13:playSound(l__GameSound__14.DODO_BIRD_MOUNT, {
		position = p7:GetPrimaryPartCFrame().Position
	});
	local v12 = l__ReplicatedStorage__15.Assets.Misc.DodoBird:Clone();
	v12:SetAttribute("NextSquawk", -1);
	v12:SetPrimaryPartCFrame(p7:GetPrimaryPartCFrame() * CFrame.new(0, -v12.RootPart.Size.Y, 0));
	local l__Humanoid__13 = p7.Humanoid;
	l__Humanoid__13.HipHeight = l__Humanoid__13.HipHeight + (v12.RootPart.Size.Y / 2 - 0.1);
	u4("WeldConstraint", {
		Part0 = p7.HumanoidRootPart, 
		Part1 = v12.RootPart, 
		Parent = v12.RootPart
	});
	v12.Parent = p7;
	l__CollectionService__16:AddTag(v12, "dodo-bird-mount");
	local v14 = p7.Humanoid.Animator:LoadAnimation(l__GameAnimationUtil__17.getAnimation(l__AnimationType__18.SIT_ON_DODO_BIRD));
	v14.Priority = Enum.AnimationPriority.Action;
	v14:Play();
	return {
		model = v12, 
		sitTrack = v14
	};
end;
function v6.unmountPlayerFromDodoBird(p8, p9)
	if p9 == l__Players__7.LocalPlayer then
		local l__dodoBirdMaid__15 = p8.dodoBirdMaid;
		if l__dodoBirdMaid__15 ~= nil then
			l__dodoBirdMaid__15:DoCleaning();
		end;
	end;
	local v16 = p8.playerToDodoBird[p9];
	if v16 then
		if p9.Character then
			if p9.Character.PrimaryPart then
				l__SoundManager__13:playSound(l__GameSound__14.DODO_BIRD_DISMOUNT, {
					position = p9.Character.PrimaryPart.Position
				});
			end;
			local v17 = p9.Character:FindFirstChildOfClass("Humanoid");
			if v17 then
				v17.HipHeight = v17.HipHeight - (v16.model.RootPart.Size.Y / 2 - 0.1);
			end;
		end;
		v16.sitTrack:Stop();
		v16.sitTrack:Destroy();
		v16.model:Destroy();
	end;
	p8.playerToDodoBird[p9] = nil;
end;
local l__KnitClient__19 = v3.KnitClient;
local l__UserInputService__20 = v4.UserInputService;
local u21 = v2.ConstantManager.registerConstants(script, {
	MaxDodoJumps = 2
});
function v6.enableDoubleJump(p10, p11)
	local v18 = l__Maid__11.new();
	v18:GiveTask(l__KnitClient__19.Controllers.JumpHeightController:getJumpModifier():addModifier({
		jumpHeightMultiplier = 1.2
	}));
	v18:GiveTask(l__KnitClient__19.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 1.7, 
		blockSprint = true
	}));
	local u22 = false;
	local u23 = 0;
	v18:GiveTask(p11.Humanoid.StateChanged:Connect(function(p12, p13)
		if p13 == Enum.HumanoidStateType.Landed then
			u22 = false;
			u23 = 0;
			return;
		end;
		if p13 == Enum.HumanoidStateType.Jumping or p13 == Enum.HumanoidStateType.Freefall then
			u22 = true;
		end;
	end));
	local u24 = -1;
	v18:GiveTask(l__UserInputService__20.JumpRequest:Connect(function()
		if u22 and u23 < u21.MaxDodoJumps and u24 < time() then
			u24 = time() + 0.25;
			u23 = u23 + 1;
			p11.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
		end;
	end));
	return v18;
end;
function v6.toggleDodoProximityPrompts(p14, p15)
	for v19, v20 in ipairs(l__CollectionService__16:GetTagged("dodo-bird")) do
		local l__DodoMountPrompt__21 = v20:FindFirstChild("DodoMountPrompt");
		if l__DodoMountPrompt__21 ~= nil then
			l__DodoMountPrompt__21.Enabled = p15;
		end;
	end;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
