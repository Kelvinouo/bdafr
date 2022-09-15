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
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "TeslaTrapController";
	p1.teslaTrapToTargets = {};
	p1.lastEffectReconcileTime = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__2 = v3.CollectionService;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v7 = {};
		local v8, v9, v10 = ipairs(p3.targets);
		while true do
			v8(v9, v10);
			if not v8 then
				break;
			end;
			v10 = v8;
			v7[v9] = true;		
		end;
		p2:reconcileEffects(p3.teslaTrap, v7);
	end);
	local v11, v12, v13 = ipairs((l__CollectionService__2:GetTagged("tesla-trap")));
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		v13 = v11;
		local v14 = p2:updateTeamIndicator(v12);	
	end;
	l__CollectionService__2:GetInstanceAddedSignal("tesla-trap"):Connect(function(p4)
		p2:updateTeamIndicator(p4);
	end);
	l__CollectionService__2:GetInstanceRemovedSignal("tesla-trap"):Connect(function(p5)
		local v15 = p2.teslaTrapToTargets[p5];
		if v15 == nil then
			return nil;
		end;
		for v16, v17 in pairs(v15) do
			v17:DoCleaning();
		end;
		p2.teslaTrapToTargets[p5] = nil;
	end);
end;
local l__default__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local l__Workspace__4 = v3.Workspace;
local l__TweenService__5 = v3.TweenService;
local l__ColorUtil__6 = v2.ColorUtil;
v5.updateTeamIndicator = v1.async(function(p6, p7)
	local l__TeamIndicator__18 = p7:WaitForChild("TeamIndicator", 3);
	if l__TeamIndicator__18 == nil then
		return nil;
	end;
	local v19 = l__default__3(p7);
	if v19 then
		if not (l__Workspace__4:GetServerTimeNow() < p7:GetAttribute("ActivationTime")) then
			l__TeamIndicator__18.Color = v19.color;
			return;
		end;
	else
		return;
	end;
	l__TweenService__5:Create(l__TeamIndicator__18, TweenInfo.new(p7:GetAttribute("ActivationTime") - l__Workspace__4:GetServerTimeNow(), Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Color = l__ColorUtil__6.darken(v19.color, 0.8)
	}):Play();
end);
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EntityUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
function v5.reconcileEffects(p8, p9, p10)
	local v20 = os.clock();
	p8.lastEffectReconcileTime[p9] = v20;
	local v21 = p8.teslaTrapToTargets[p9] or {};
	for v22, v23 in pairs(v21) do
		if p10[v22] == nil then
			v23:DoCleaning();
			v21[v22] = nil;
		end;
	end;
	local v24 = u7.copy(v21);
	for v25 in pairs(p10) do
		if v21[v25] == nil then
			local v26 = v25.PrimaryPart;
			if v26 ~= nil then
				v26 = (v26.Position - p9.Position).Magnitude;
			end;
			local v27 = v26;
			if v27 == nil then
				v27 = 100;
			end;
			if not (v27 > 18) then
				local v28 = l__EntityUtil__8:getEntity(v25);
				if v28 ~= nil then
					v28 = v28:isAlive();
				end;
				if v28 then
					v24[v25] = p8:createTeslaTrapEffect(p9, v25);
				end;
			end;
		end;
	end;
	p8.teslaTrapToTargets[p9] = v24;
	task.delay(1, function()
		if p8.lastEffectReconcileTime[p9] == v20 then
			p8:reconcileEffects(p9, {});
		end;
	end);
end;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Players__11 = v3.Players;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.createTeslaTrapEffect(p11, p12, p13)
	local l__BodyFrontAttachment__29 = p13:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
	if not l__BodyFrontAttachment__29 then
		error("Could not find targetAttachment");
	end;
	local v30 = l__default__3(p12);
	if v30 then
		local v31 = v30.color;
	else
		v31 = Color3.fromRGB(0, 0, 0);
	end;
	local v32 = u10.new();
	v32:GiveTask((u9.link(l__BodyFrontAttachment__29, p12.SourceAttachment, v31)));
	local v33 = {};
	if p13 == l__Players__11.LocalPlayer.Character then
		local v34 = nil;
	else
		v34 = p12.Position;
	end;
	v33.position = v34;
	local v35 = l__SoundManager__12:playSound(l__GameSound__13.TESLA_ZAP, v33);
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
local v36 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
