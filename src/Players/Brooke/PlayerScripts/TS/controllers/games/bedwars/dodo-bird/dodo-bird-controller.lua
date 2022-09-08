-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function v6.constructor(p1, ...)
	l__KnitController__5.constructor(p1, ...);
	p1.Name = "DodoBirdController";
	p1.playerToDodoBird = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionTagAdded__2 = v2.CollectionTagAdded;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DodoAction__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "dodo-bird", "dodo-bird").DodoAction;
local l__Players__6 = v4.Players;
local l__Flamework__7 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UnmountDodoApp__9 = v1.import(script, script.Parent, "ui", "unmount-dodo-app").UnmountDodoApp;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	local u11 = l__default__1.Client:Get("RemoteName");
	l__CollectionTagAdded__2("dodo-bird", function(p3)
		p3:SetAttribute("NextSquawk", -1);
		local v8 = {
			Name = "DodoMountPrompt", 
			ActionText = "Mount", 
			ObjectText = "Dodo bird", 
			HoldDuration = 1, 
			KeyboardKeyCode = l__Theme__4.promptKeyboardKey, 
			RequiresLineOfSight = false
		};
		function v8.Triggered()
			u11:SendToServer({
				action = l__DodoAction__5.Mount, 
				dodoBird = p3
			});
		end;
		v8.Parent = p3;
		u3("ProximityPrompt", v8);
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p4)
		if p4.action == l__DodoAction__5.Mount then
			if p4.player == l__Players__6.LocalPlayer then
				local v9 = l__Flamework__7.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u8.createElement(l__UnmountDodoApp__9, {
					interactionKey = Enum.KeyCode.B, 
					unmountCallback = function()
						u11:SendToServer({
							action = l__DodoAction__5.Unmount
						});
					end
				}));
				p2:toggleDodoProximityPrompts(false);
				if p2.dodoBirdMaid then
					p2.dodoBirdMaid:DoCleaning();
				end;
				p2.dodoBirdMaid = u10.new();
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
		elseif p4.action == l__DodoAction__5.Unmount then
			p2:unmountPlayerFromDodoBird(p4.player);
		end;
	end);
	local v10, v11, v12 = ipairs(l__Players__6:GetPlayers());
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		v11.CharacterRemoving:Connect(function()
			p2:unmountPlayerFromDodoBird(v11);
		end);	
	end;
	l__Players__6.PlayerAdded:Connect(function(p5)
		p5.CharacterRemoving:Connect(function()
			p2:unmountPlayerFromDodoBird(p5);
		end);
	end);
end;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__14 = v4.ReplicatedStorage;
local l__CollectionService__15 = v4.CollectionService;
local l__GameAnimationUtil__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__AnimationType__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
function v6.mountPlayerOnDodoBird(p6, p7)
	l__SoundManager__12:playSound(l__GameSound__13.DODO_BIRD_MOUNT, {
		position = p7:GetPrimaryPartCFrame().Position
	});
	local v13 = l__ReplicatedStorage__14.Assets.Misc.DodoBird:Clone();
	v13:SetAttribute("NextSquawk", -1);
	v13:SetPrimaryPartCFrame(p7:GetPrimaryPartCFrame() * CFrame.new(0, -v13.RootPart.Size.Y, 0));
	local l__Humanoid__14 = p7.Humanoid;
	l__Humanoid__14.HipHeight = l__Humanoid__14.HipHeight + (v13.RootPart.Size.Y / 2 - 0.1);
	u3("WeldConstraint", {
		Part0 = p7.HumanoidRootPart, 
		Part1 = v13.RootPart, 
		Parent = v13.RootPart
	});
	v13.Parent = p7;
	l__CollectionService__15:AddTag(v13, "dodo-bird-mount");
	local v15 = p7.Humanoid.Animator:LoadAnimation(l__GameAnimationUtil__16.getAnimation(l__AnimationType__17.SIT_ON_DODO_BIRD));
	v15.Priority = Enum.AnimationPriority.Action;
	v15:Play();
	return {
		model = v13, 
		sitTrack = v15
	};
end;
function v6.unmountPlayerFromDodoBird(p8, p9)
	if p9 == l__Players__6.LocalPlayer then
		local l__dodoBirdMaid__16 = p8.dodoBirdMaid;
		if l__dodoBirdMaid__16 ~= nil then
			l__dodoBirdMaid__16:DoCleaning();
		end;
	end;
	local v17 = p8.playerToDodoBird[p9];
	if v17 then
		if p9.Character then
			if p9.Character.PrimaryPart then
				l__SoundManager__12:playSound(l__GameSound__13.DODO_BIRD_DISMOUNT, {
					position = p9.Character.PrimaryPart.Position
				});
			end;
			local v18 = p9.Character:FindFirstChildOfClass("Humanoid");
			if v18 then
				v18.HipHeight = v18.HipHeight - (v17.model.RootPart.Size.Y / 2 - 0.1);
			end;
		end;
		v17.sitTrack:Stop();
		v17.sitTrack:Destroy();
		v17.model:Destroy();
	end;
	p8.playerToDodoBird[p9] = nil;
end;
local l__KnitClient__18 = v3.KnitClient;
local l__UserInputService__19 = v4.UserInputService;
local u20 = v2.ConstantManager.registerConstants(script, {
	MaxDodoJumps = 2
});
function v6.enableDoubleJump(p10, p11)
	local v19 = u10.new();
	v19:GiveTask(l__KnitClient__18.Controllers.JumpHeightController:getJumpModifier():addModifier({
		jumpHeightMultiplier = 1.2
	}));
	v19:GiveTask(l__KnitClient__18.Controllers.SprintController:getMovementStatusModifier():addModifier({
		moveSpeedMultiplier = 1.7, 
		blockSprint = true
	}));
	local u21 = false;
	local u22 = 0;
	v19:GiveTask(p11.Humanoid.StateChanged:Connect(function(p12, p13)
		if p13 == Enum.HumanoidStateType.Landed then
			u21 = false;
			u22 = 0;
			return;
		end;
		if p13 == Enum.HumanoidStateType.Jumping or p13 == Enum.HumanoidStateType.Freefall then
			u21 = true;
		end;
	end));
	local u23 = -1;
	v19:GiveTask(l__UserInputService__19.JumpRequest:Connect(function()
		if u21 and u22 < u20.MaxDodoJumps and u23 < time() then
			u23 = time() + 0.25;
			u22 = u22 + 1;
			p11.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
		end;
	end));
	return v19;
end;
function v6.toggleDodoProximityPrompts(p14, p15)
	local v20, v21, v22 = ipairs(l__CollectionService__15:GetTagged("dodo-bird"));
	while true do
		v20(v21, v22);
		if not v20 then
			break;
		end;
		v22 = v20;
		local l__DodoMountPrompt__23 = v21:FindFirstChild("DodoMountPrompt");
		if l__DodoMountPrompt__23 ~= nil then
			l__DodoMountPrompt__23.Enabled = p15;
		end;	
	end;
end;
local v24 = v3.KnitClient.CreateController(v6.new());
return nil;
