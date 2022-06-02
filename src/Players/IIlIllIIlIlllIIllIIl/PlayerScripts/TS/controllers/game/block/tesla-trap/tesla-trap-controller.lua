-- Script Hash: 49183db62d9482b60686e2e71c7e3e4e2d1e5e01b2d6fe5a196cf6c4b8f412788ce4b47af83047cc9c66b580cc7a688a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "TeslaTrapController";
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
	p1.Name = "TeslaTrapController";
	p1.teslaTrapToTargets = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__CollectionService__3 = v4.CollectionService;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("TeslaTrapTargetsChanged", function(p3)
		local v8 = {};
		for v9, v10 in ipairs(p3.targets) do
			v8[v10] = true;
		end;
		p2:reconcileEffects(p3.teslaTrap, v8);
	end);
	local v11 = l__CollectionService__3:GetTagged("tesla-trap");
	local function v12(p4)
		return p2:updateTeamIndicator(p4);
	end;
	for v13, v14 in ipairs(v11) do
		v12(v14, v13 - 1, v11);
	end;
	l__CollectionService__3:GetInstanceAddedSignal("tesla-trap"):Connect(function(p5)
		p2:updateTeamIndicator(p5);
	end);
	l__CollectionService__3:GetInstanceRemovedSignal("tesla-trap"):Connect(function(p6)
		local v15 = p2.teslaTrapToTargets[p6];
		if v15 == nil then
			return nil;
		end;
		for v16, v17 in pairs(v15) do
			v17:DoCleaning();
		end;
		p2.teslaTrapToTargets[p6] = nil;
	end);
end;
local l__default__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local l__Workspace__5 = v4.Workspace;
local l__TweenService__6 = v4.TweenService;
local l__ColorUtil__7 = v2.ColorUtil;
v6.updateTeamIndicator = v1.async(function(p7, p8)
	local l__TeamIndicator__18 = p8:WaitForChild("TeamIndicator", 3);
	if l__TeamIndicator__18 == nil then
		return nil;
	end;
	local v19 = l__default__4(p8);
	if v19 then
		if not (l__Workspace__5:GetServerTimeNow() < p8:GetAttribute("ActivationTime")) then
			l__TeamIndicator__18.Color = v19.color;
			return;
		end;
	else
		return;
	end;
	l__TweenService__6:Create(l__TeamIndicator__18, TweenInfo.new(p8:GetAttribute("ActivationTime") - l__Workspace__5:GetServerTimeNow(), Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Color = l__ColorUtil__7.darken(v19.color, 0.8)
	}):Play();
end);
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v6.reconcileEffects(p9, p10, p11)
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
			v23[v24] = p9:createTeslaTrapEffect(p10, v24);
		end;
	end;
	p9.teslaTrapToTargets[p10] = v23;
end;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "electric-arc").lib);
local l__Maid__10 = v3.Maid;
local l__Players__11 = v4.Players;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.createTeslaTrapEffect(p12, p13, p14)
	local l__BodyFrontAttachment__26 = p14:FindFirstChild("UpperTorso"):FindFirstChild("BodyFrontAttachment");
	if not l__BodyFrontAttachment__26 then
		error("Could not find targetAttachment");
	end;
	local v27 = l__default__4(p13);
	if v27 then
		local v28 = v27.color;
	else
		v28 = Color3.fromRGB(0, 0, 0);
	end;
	local v29 = l__Maid__10.new();
	v29:GiveTask((u9.link(l__BodyFrontAttachment__26, p13.SourceAttachment, v28)));
	local v30 = {};
	if p14 == l__Players__11.LocalPlayer.Character then
		local v31 = nil;
	else
		v31 = p13.Position;
	end;
	v30.position = v31;
	local v32 = l__SoundManager__12:playSound(l__GameSound__13.TESLA_ZAP, v30);
	if v32 then
		v32.Looped = true;
		v29:GiveTask(function()
			if v32 ~= nil then
				v32:Stop();
			end;
		end);
	end;
	return v29;
end;
u1 = v3.KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
