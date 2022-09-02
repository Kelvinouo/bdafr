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
function v4.constructor(p1)
	l__HandKnitController__3.constructor(p1);
	p1.Name = "MetalDetectorController";
end;
function v4.KnitStart(p2)
	l__HandKnitController__3.KnitStart(p2);
end;
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
function v4.isRelevantItem(p3, p4)
	return p4.itemType == l__ItemType__1.METAL_DETECTOR;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "signal"));
local l__Indicator__5 = v1.import(script, script.Parent, "indicator").Indicator;
local l__Players__6 = v2.Players;
local l__CollectionService__7 = v2.CollectionService;
local l__RunService__8 = v2.RunService;
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local l__Workspace__10 = v2.Workspace;
local l__InQuad__11 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.onEnable(p5, p6, p7)
	p5.maid = u2.new();
	local v6, v7 = u3.createBinding(UDim2.fromScale(0.5, 0.5));
	local v8, v9 = u3.createBinding(0);
	local v10 = u4.new();
	local v11 = u3.createRef();
	p5.maid:GiveTask(v10);
	local u14 = u3.mount(u3.createElement("ScreenGui", {
		ResetOnSpawn = false, 
		IgnoreGuiInset = true
	}, { u3.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			BackgroundTransparency = 1, 
			[u3.Ref] = v11
		}), u3.createElement(l__Indicator__5, {
			position = v6, 
			rotation = v8, 
			activatedSignal = v10
		}) }), l__Players__6.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
	p5.maid:GiveTask(function()
		u3.unmount(u14);
	end);
	local function v12(p8)
		local v13, v14, v15 = ipairs(l__CollectionService__7:GetTagged("hidden-metal"));
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			local v16, v17, v18 = ipairs(v14:GetChildren());
			while true do
				v16(v17, v18);
				if not v16 then
					break;
				end;
				v18 = v16;
				if v17:IsA("ProximityPrompt") then
					v17.Enabled = p8;
				end;			
			end;		
		end;
	end;
	v12(true);
	p5.maid:GiveTask(function()
		return v12(false);
	end);
	p5.maid:GiveTask(l__RunService__8.Heartbeat:Connect(function()
		local v19 = l__EntityUtil__9:getLocalPlayerEntity();
		local v20 = v19;
		if v20 ~= nil then
			v20 = v20:getInstance():GetPrimaryPartCFrame().Position;
		end;
		if v19 == nil or v20 == nil then
			return nil;
		end;
		if p5.lastTrackedHiddenMetal then
			if p5.lastTrackedHiddenMetal.model:IsDescendantOf(l__Workspace__10) == false then
				p5.lastTrackedHiddenMetal = nil;
				return nil;
			end;
			local l__Position__21 = p5.lastTrackedHiddenMetal.model:GetPrimaryPartCFrame().Position;
			local l__Magnitude__22 = (l__Position__21 - v20).Magnitude;
			local v23 = v11:getValue();
			local l__AbsolutePosition__24 = v23.AbsolutePosition;
			local v25 = l__Workspace__10.CurrentCamera:WorldToViewportPoint(l__Position__21);
			local v26 = Vector2.new(v25.X, v25.Y);
			if v25.Z < 0 then
				v26 = v23.AbsoluteSize + l__AbsolutePosition__24 - v26 + l__AbsolutePosition__24;
			end;
			local v27 = v26 - l__AbsolutePosition__24;
			local v28 = math.atan2(v27.Y, v27.X);
			local v29 = l__AbsolutePosition__24 + Vector2.new(math.cos(v28) * 80, math.sin(v28) * 80);
			v7(UDim2.fromOffset(v29.X, v29.Y));
			v9(math.deg(v28));
			if p5.lastTrackedHiddenMetal.nextBeep < time() then
				local v30 = {};
				for v31, v32 in pairs(p5.lastTrackedHiddenMetal) do
					v30[v31] = v32;
				end;
				v30.nextBeep = time() + l__InQuad__11(200 - l__Magnitude__22, 1, -0.9, 200);
				p5.lastTrackedHiddenMetal = v30;
				l__SoundManager__12:playSound(l__GameSound__13.METAL_DETECTOR_BEEP, {});
				v10:Fire(l__InQuad__11(200 - l__Magnitude__22, 2, 20, 200));
				if l__Magnitude__22 > 200 then
					p5.lastTrackedHiddenMetal = nil;
					return;
				end;
			end;
		else
			local v33, v34, v35 = ipairs(l__CollectionService__7:GetTagged("hidden-metal"));
			while true do
				v33(v34, v35);
				if not v33 then
					break;
				end;
				v35 = v33;
				if (v34:GetPrimaryPartCFrame().Position - v20).Magnitude < 200 then
					p5.lastTrackedHiddenMetal = {
						model = v34, 
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
local v36 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
