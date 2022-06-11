-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MountController";
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
	p1.Name = "MountController";
	p1.activeMounts = {};
end;
local l__RunService__2 = v2.RunService;
local l__Workspace__3 = v2.Workspace;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__MountMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__8 = v2.ReplicatedStorage;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Players__10 = v2.Players;
local l__Flamework__11 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ActionButton__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ActionButton;
local l__ClientSyncEvents__14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__RunService__2.Heartbeat:Connect(function()
		debug.profilebegin("mount-controller");
		for v6, v7 in pairs(p2:getActiveMounts()) do
			if not v7.model:IsDescendantOf(l__Workspace__3) then
				p2:removeMount(v6);
			end;
		end;
		debug.profileend();
	end);
	l__default__4.Client:OnEvent("RemoteName", function(p3)
		local v8 = l__MountMeta__5[p3.mountType];
		local l__Character__9 = p3.player.Character;
		if l__Character__9 == nil then
			l__default__6.Warn("Mounting player has no character");
			return nil;
		end;
		if p3.action ~= "Mount" then
			if p3.action == "Dismount" then
				p2:removeMount(p3.player);
			end;
			return;
		end;
		local v10 = u7.new();
		if type(v8.model) == "string" then
			local v11 = l__ReplicatedStorage__8.Assets.Mounts:FindFirstChild(v8.model);
			if v11 ~= nil then
				v11 = v11:Clone();
			end;
			local v12 = v11;
		else
			v12 = v8.model();
		end;
		if v12 == nil or v12.PrimaryPart == nil then
			l__default__6.Error("Error creating mount {mountType}. model not found", p3.mountType);
			return nil;
		end;
		v12:SetPrimaryPartCFrame(l__Character__9:GetPrimaryPartCFrame() * CFrame.new(0, -v12.PrimaryPart.Size.Y, 0));
		local l__Humanoid__13 = l__Character__9.Humanoid;
		l__Humanoid__13.HipHeight = l__Humanoid__13.HipHeight + (v12.PrimaryPart.Size.Y / 2 - 0.1);
		u9("WeldConstraint", {
			Part0 = l__Character__9.HumanoidRootPart, 
			Part1 = v12.PrimaryPart, 
			Parent = v12.PrimaryPart
		});
		v12.Parent = l__Character__9;
		v10:GiveTask(v12);
		if p3.player == l__Players__10.LocalPlayer then
			v10:GiveTask((l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(l__ActionButton__13, {
				actionName = "dismount-" .. p3.mountType, 
				interactionKey = Enum.KeyCode.B, 
				gamepadInteractionKey = Enum.KeyCode.ButtonB, 
				onActivated = function()
					l__default__4.Client:Get("RemoteName"):SendToServer();
				end, 
				text = "Dismount " .. v8.displayName
			}))));
		end;
		p2.activeMounts[p3.player] = {
			maid = v10, 
			mountType = p3.mountType, 
			model = v12
		};
		l__ClientSyncEvents__14.GenericMountMounted:fire(p3.player, p3.mountType, v12, l__Character__9);
	end);
end;
function v4.removeMount(p4, p5)
	local v14 = p4.activeMounts[p5];
	local l__Character__15 = p5.Character;
	if v14 then
		local v16 = v14;
		if v16 ~= nil then
			v16 = v16.mountType;
		end;
		l__ClientSyncEvents__14.GenericMountDismounted:fire(p5, v16);
		if v14.model and l__Character__15 and l__Character__15.Humanoid then
			local l__Humanoid__17 = l__Character__15.Humanoid;
			l__Humanoid__17.HipHeight = l__Humanoid__17.HipHeight - (v14.model.PrimaryPart.Size.Y / 2 - 0.1);
		end;
		if v14 ~= nil then
			local v18 = v14.maid:DoCleaning();
		end;
		p4.activeMounts[p5] = nil;
	end;
end;
function v4.getActiveMounts(p6)
	return p6.activeMounts;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
