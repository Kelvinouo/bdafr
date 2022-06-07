-- Script Hash: 6d5dc456f19b7f6dfc0bac944cc370ed3714f28587bd914a0b1dae3d1645e677952ccea49925bdf4cdeb53e908656ed9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MetalDetectorController";
	end, 
	__index = l__HandKnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__HandKnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MetalDetectorController";
end;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.METAL_DETECTOR;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
local l__Indicator__6 = v1.import(script, script.Parent, "indicator").Indicator;
local l__Players__7 = v2.Players;
local l__CollectionService__8 = v2.CollectionService;
local l__RunService__9 = v2.RunService;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__11 = v2.Workspace;
local l__InQuad__12 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__SoundManager__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.onEnable(p5, p6, p7)
	p5.maid = u3.new();
	local v6, v7 = u4.createBinding(UDim2.fromScale(0.5, 0.5));
	local v8, v9 = u4.createBinding(0);
	local v10 = u5.new();
	local v11 = u4.createRef();
	p5.maid:GiveTask(v10);
	local u15 = u4.mount(u4.createElement("ScreenGui", {
		ResetOnSpawn = false, 
		IgnoreGuiInset = true
	}, { u4.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 1, 
			[u4.Ref] = v11
		}), u4.createElement(l__Indicator__6, {
			position = v6, 
			rotation = v8, 
			activatedSignal = v10
		}) }), l__Players__7.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
	p5.maid:GiveTask(function()
		u4.unmount(u15);
	end);
	local function v12(p8)
		for v13, v14 in ipairs(l__CollectionService__8:GetTagged("hidden-metal")) do
			for v15, v16 in ipairs(v14:GetChildren()) do
				if v16:IsA("ProximityPrompt") then
					v16.Enabled = p8;
				end;
			end;
		end;
	end;
	v12(true);
	p5.maid:GiveTask(function()
		return v12(false);
	end);
	p5.maid:GiveTask(l__RunService__9.Heartbeat:Connect(function()
		local v17 = l__EntityUtil__10:getLocalPlayerEntity();
		local v18 = v17;
		if v18 ~= nil then
			v18 = v18:getInstance():GetPrimaryPartCFrame().Position;
		end;
		if v17 == nil or v18 == nil then
			return nil;
		end;
		if p5.lastTrackedHiddenMetal then
			if p5.lastTrackedHiddenMetal.model:IsDescendantOf(l__Workspace__11) == false then
				p5.lastTrackedHiddenMetal = nil;
				return nil;
			end;
			local l__Position__19 = p5.lastTrackedHiddenMetal.model:GetPrimaryPartCFrame().Position;
			local l__Magnitude__20 = (l__Position__19 - v18).Magnitude;
			local v21 = v11:getValue();
			local l__AbsolutePosition__22 = v21.AbsolutePosition;
			local v23 = l__Workspace__11.CurrentCamera:WorldToViewportPoint(l__Position__19);
			local v24 = Vector2.new(v23.X, v23.Y);
			if v23.Z < 0 then
				v24 = v21.AbsoluteSize + l__AbsolutePosition__22 - v24 + l__AbsolutePosition__22;
			end;
			local v25 = v24 - l__AbsolutePosition__22;
			local v26 = math.atan2(v25.Y, v25.X);
			local v27 = l__AbsolutePosition__22 + Vector2.new(math.cos(v26) * 80, math.sin(v26) * 80);
			v7(UDim2.fromOffset(v27.X, v27.Y));
			v9(math.deg(v26));
			if p5.lastTrackedHiddenMetal.nextBeep < time() then
				local v28 = {};
				for v29, v30 in pairs(p5.lastTrackedHiddenMetal) do
					v28[v29] = v30;
				end;
				v28.nextBeep = time() + l__InQuad__12(200 - l__Magnitude__20, 1, -0.9, 200);
				p5.lastTrackedHiddenMetal = v28;
				l__SoundManager__13:playSound(l__GameSound__14.METAL_DETECTOR_BEEP, {});
				v10:Fire(l__InQuad__12(200 - l__Magnitude__20, 2, 20, 200));
				if l__Magnitude__20 > 200 then
					p5.lastTrackedHiddenMetal = nil;
					return;
				end;
			end;
		else
			for v31, v32 in ipairs(l__CollectionService__8:GetTagged("hidden-metal")) do
				if (v32:GetPrimaryPartCFrame().Position - v18).Magnitude < 200 then
					p5.lastTrackedHiddenMetal = {
						model = v32, 
						nextBeep = time() + 1, 
						nextRevealLocation = time() + 1
					};
				end;
			end;
		end;
	end));
end;
function v4.onDisable(p9)
	if p9.maid then
		p9.maid:DoCleaning();
		p9.maid = nil;
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
