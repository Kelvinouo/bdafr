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
	for v10, v11 in ipairs((l__CollectionService__3:GetTagged("tesla-trap"))) do
		local v12 = p2:updateTeamIndicator(v11);
	end;
	l__CollectionService__3:GetInstanceAddedSignal("tesla-trap"):Connect(function(p4)
		p2:updateTeamIndicator(p4);
	end);
	l__CollectionService__3:GetInstanceRemovedSignal("tesla-trap"):Connect(function(p5)
		local v13 = p2.teslaTrapToTargets[p5];
		if v13 == nil then
			return nil;
		end;
		for v14, v15 in pairs(v13) do
			v15:DoCleaning();
		end;
		p2.teslaTrapToTargets[p5] = nil;
	end);
end;
local l__default__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local l__Workspace__5 = v3.Workspace;
local l__TweenService__6 = v3.TweenService;
local l__ColorUtil__7 = v2.ColorUtil;
v5.updateTeamIndicator = v1.async(function(p6, p7)
	local l__TeamIndicator__16 = p7:WaitForChild("TeamIndicator", 3);
	if l__TeamIndicator__16 == nil then
		return nil;
	end;
	local v17 = l__default__4(p7);
	if v17 then
		if not (l__Workspace__5:GetServerTimeNow() < p7:GetAttribute("ActivationTime")) then
			l__TeamIndicator__16.Color = v17.color;
			return;
		end;
	else
		return;
	end;
	l__TweenService__6:Create(l__TeamIndicator__16, TweenInfo.new(p7:GetAttribute("ActivationTime") - l__Workspace__5:GetServerTimeNow(), Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Color = l__ColorUtil__7.darken(v17.color, 0.8)
	}):Play();
end);
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EntityUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v5.reconcileEffects(p8, p9, p10)
	local v18 = os.clock();
	p8.lastEffectReconcileTime[p9] = v18;
	local v19 = p8.teslaTrapToTargets[p9] or {};
	for v20, v21 in pairs(v19) do
		if p10[v20] == nil then
			v21:DoCleaning();
			v19[v20] = nil;
		end;
	end;
	local v22 = u8.copy(v19);
	for v23 in pairs(p10) do
		if v19[v23] == nil then
			local v24 = v23.PrimaryPart;
			if v24 ~= nil then
				v24 = (v24.Position - p9.Position).Magnitude;
			end;
			local v25 = v24;
			if v25 == nil then
				v25 = 100;
			end;
			if not (v25 > 18) then
				local v26 = l__EntityUtil__9:getEntity(v23);
				if v26 ~= nil then
					v26 = v26:isAlive();
				end;
				if v26 then
					v22[v23] = p8:createTeslaTrapEffect(p9, v23);
				end;
			end;
		end;
	end;
	p8.teslaTrapToTargets[p9] = v22;
	task.delay(1, function()
		if p8.lastEffectReconcileTime[p9] == v18 then
			p8:reconcileEffects(p9, {});
		end;
	end);
end;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__12 = v3.Players;
local l__SoundManager__13 = v2.SoundManager;
local l__GameSound__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.createTeslaTrapEffect(p11, p12, p13)
	local l__BodyFrontAttachment__27 = p13:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
	if not l__BodyFrontAttachment__27 then
		error("Could not find targetAttachment");
	end;
	local v28 = l__default__4(p12);
	if v28 then
		local v29 = v28.color;
	else
		v29 = Color3.fromRGB(0, 0, 0);
	end;
	local v30 = u11.new();
	v30:GiveTask((u10.link(l__BodyFrontAttachment__27, p12.SourceAttachment, v29)));
	local v31 = {};
	if p13 == l__Players__12.LocalPlayer.Character then
		local v32 = nil;
	else
		v32 = p12.Position;
	end;
	v31.position = v32;
	local v33 = l__SoundManager__13:playSound(l__GameSound__14.TESLA_ZAP, v31);
	if v33 then
		v33.Looped = true;
		v30:GiveTask(function()
			if v33 ~= nil then
				v33:Stop();
			end;
		end);
	end;
	return v30;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
