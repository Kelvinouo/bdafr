-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__HandKnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "MetalDetectorController";
	end, 
	__index = l__HandKnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__HandKnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MetalDetectorController";
end;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v5.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__2.METAL_DETECTOR;
end;
local l__Maid__3 = v2.Maid;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
local l__Indicator__6 = v1.import(script, script.Parent, "indicator").Indicator;
local l__Players__7 = v3.Players;
local l__CollectionService__8 = v3.CollectionService;
local l__RunService__9 = v3.RunService;
local l__EntityUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__11 = v3.Workspace;
local l__InQuad__12 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__SoundManager__13 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.onEnable(p5, p6, p7)
	p5.maid = l__Maid__3.new();
	local v7, v8 = u4.createBinding(UDim2.fromScale(0.5, 0.5));
	local v9, v10 = u4.createBinding(0);
	local v11 = u5.new();
	local v12 = u4.createRef();
	p5.maid:GiveTask(v11);
	local u15 = u4.mount(u4.createElement("ScreenGui", {
		ResetOnSpawn = false, 
		IgnoreGuiInset = true
	}, { u4.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 1, 
			[u4.Ref] = v12
		}), u4.createElement(l__Indicator__6, {
			position = v7, 
			rotation = v9, 
			activatedSignal = v11
		}) }), l__Players__7.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
	p5.maid:GiveTask(function()
		u4.unmount(u15);
	end);
	local function v13(p8)
		for v14, v15 in ipairs(l__CollectionService__8:GetTagged("hidden-metal")) do
			for v16, v17 in ipairs(v15:GetChildren()) do
				if v17:IsA("ProximityPrompt") then
					v17.Enabled = p8;
				end;
			end;
		end;
	end;
	v13(true);
	p5.maid:GiveTask(function()
		return v13(false);
	end);
	p5.maid:GiveTask(l__RunService__9.Heartbeat:Connect(function()
		local v18 = l__EntityUtil__10:getLocalPlayerEntity();
		local v19 = v18;
		if v19 ~= nil then
			v19 = v19:getInstance():GetPrimaryPartCFrame().Position;
		end;
		if v18 == nil or v19 == nil then
			return nil;
		end;
		if p5.lastTrackedHiddenMetal then
			if p5.lastTrackedHiddenMetal.model:IsDescendantOf(l__Workspace__11) == false then
				p5.lastTrackedHiddenMetal = nil;
				return nil;
			end;
			local l__Position__20 = p5.lastTrackedHiddenMetal.model:GetPrimaryPartCFrame().Position;
			local l__Magnitude__21 = (l__Position__20 - v19).Magnitude;
			local v22 = v12:getValue();
			local l__AbsolutePosition__23 = v22.AbsolutePosition;
			local v24 = l__Workspace__11.CurrentCamera:WorldToViewportPoint(l__Position__20);
			local v25 = Vector2.new(v24.X, v24.Y);
			if v24.Z < 0 then
				v25 = v22.AbsoluteSize + l__AbsolutePosition__23 - v25 + l__AbsolutePosition__23;
			end;
			local v26 = v25 - l__AbsolutePosition__23;
			local v27 = math.atan2(v26.Y, v26.X);
			local v28 = l__AbsolutePosition__23 + Vector2.new(math.cos(v27) * 80, math.sin(v27) * 80);
			v8(UDim2.fromOffset(v28.X, v28.Y));
			v10(math.deg(v27));
			if p5.lastTrackedHiddenMetal.nextBeep < time() then
				local v29 = {};
				for v30, v31 in pairs(p5.lastTrackedHiddenMetal) do
					v29[v30] = v31;
				end;
				v29.nextBeep = time() + l__InQuad__12(200 - l__Magnitude__21, 1, -0.9, 200);
				p5.lastTrackedHiddenMetal = v29;
				l__SoundManager__13:playSound(l__GameSound__14.METAL_DETECTOR_BEEP, {});
				v11:Fire(l__InQuad__12(200 - l__Magnitude__21, 2, 20, 200));
				if l__Magnitude__21 > 200 then
					p5.lastTrackedHiddenMetal = nil;
					return;
				end;
			end;
		else
			for v32, v33 in ipairs(l__CollectionService__8:GetTagged("hidden-metal")) do
				if (v33:GetPrimaryPartCFrame().Position - v19).Magnitude < 200 then
					p5.lastTrackedHiddenMetal = {
						model = v33, 
						nextBeep = time() + 1, 
						nextRevealLocation = time() + 1
					};
				end;
			end;
		end;
	end));
end;
function v5.onDisable(p9)
	if p9.maid then
		p9.maid:DoCleaning();
		p9.maid = nil;
	end;
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
