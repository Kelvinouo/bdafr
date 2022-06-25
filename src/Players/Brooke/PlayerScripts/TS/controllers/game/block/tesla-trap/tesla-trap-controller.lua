-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "TeslaTrapController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "TeslaTrapController";
	p1.teslaTrapToTargets = {};
	p1.lastEffectReconcileTime = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__3 = v3.CollectionService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v7 = {};
		for v8, v9 in ipairs(p3.targets) do
			v7[v9] = true;
		end;
		p2:reconcileEffects(p3.teslaTrap, v7);
	end);
	local v10 = l__CollectionService__3:GetTagged("tesla-trap");
	local function v11(p4)
		return p2:updateTeamIndicator(p4);
	end;
	for v12, v13 in ipairs(v10) do
		v11(v13, v12 - 1, v10);
	end;
	l__CollectionService__3:GetInstanceAddedSignal("tesla-trap"):Connect(function(p5)
		p2:updateTeamIndicator(p5);
	end);
	l__CollectionService__3:GetInstanceRemovedSignal("tesla-trap"):Connect(function(p6)
		local v14 = p2.teslaTrapToTargets[p6];
		if v14 == nil then
			return nil;
		end;
		for v15, v16 in pairs(v14) do
			v16:DoCleaning();
		end;
		p2.teslaTrapToTargets[p6] = nil;
	end);
end;
local l__default__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local l__Workspace__5 = v3.Workspace;
local l__TweenService__6 = v3.TweenService;
local l__ColorUtil__7 = v2.ColorUtil;
v5.updateTeamIndicator = v1.async(function(p7, p8)
	local l__TeamIndicator__17 = p8:WaitForChild("TeamIndicator", 3);
	if l__TeamIndicator__17 == nil then
		return nil;
	end;
	local v18 = l__default__4(p8);
	if v18 then
		if not (l__Workspace__5:GetServerTimeNow() < p8:GetAttribute("ActivationTime")) then
			l__TeamIndicator__17.Color = v18.color;
			return;
		end;
	else
		return;
	end;
	l__TweenService__6:Create(l__TeamIndicator__17, TweenInfo.new(p8:GetAttribute("ActivationTime") - l__Workspace__5:GetServerTimeNow(), Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Color = l__ColorUtil__7.darken(v18.color, 0.8)
	}):Play();
end);
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v5.reconcileEffects(p9, p10, p11)
	local v19 = os.clock();
	p9.lastEffectReconcileTime[p10] = v19;
	local v20 = p9.teslaTrapToTargets[p10] or {};
	for v21, v22 in pairs(v20) do
		if p11[v21] == nil then
			v22:DoCleaning();
			v20[v21] = nil;
		end;
	end;
	local v23 = u8.copy(v20);
	for v24, v25 in pairs(p11) do
		if v20[v24] == nil then
			local v26 = v24.PrimaryPart;
			if v26 ~= nil then
				v26 = (v26.Position - p10.Position).Magnitude;
			end;
			local v27 = v26;
			if v27 == nil then
				v27 = 100;
			end;
			if not (v27 > 18) then
				local v28 = l__EntityUtil__9:getEntity(v24);
				if v28 ~= nil then
					v28 = v28:isAlive();
				end;
				if v28 then
					v23[v24] = p9:createTeslaTrapEffect(p10, v24);
				end;
			end;
		end;
	end;
	p9.teslaTrapToTargets[p10] = v23;
	task.delay(1, function()
		if p9.lastEffectReconcileTime[p10] == v19 then
			p9:reconcileEffects(p10, {});
		end;
	end);
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__12 = v3.Players;
local l__SoundManager__13 = v2.SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.createTeslaTrapEffect(p12, p13, p14)
	local l__BodyFrontAttachment__29 = p14:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
	if not l__BodyFrontAttachment__29 then
		error("Could not find targetAttachment");
	end;
	local v30 = l__default__4(p13);
	if v30 then
		local v31 = v30.color;
	else
		v31 = Color3.fromRGB(0, 0, 0);
	end;
	local v32 = u11.new();
	v32:GiveTask((u10.link(l__BodyFrontAttachment__29, p13.SourceAttachment, v31)));
	local v33 = {};
	if p14 == l__Players__12.LocalPlayer.Character then
		local v34 = nil;
	else
		v34 = p13.Position;
	end;
	v33.position = v34;
	local v35 = l__SoundManager__13:playSound(l__GameSound__14.TESLA_ZAP, v33);
	if v35 then
		v35.Looped = true;
		v32:GiveTask(function()
			if v35 ~= nil then
				v35:Stop();
			end;
		end);
	end;
	return v32;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
