-- Script Hash: 91e5c439a86d331a824a70c2b88076a04d6d4f3880b9ae129510d3f66b852f4375cd52490a4f9223e07429653b4f2a64
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "BedShieldController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BedShieldController";
end;
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local l__Workspace__3 = v4.Workspace;
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("bed", function(p3)
		local function v8(p4)
			if p4 ~= nil and l__Workspace__3:GetServerTimeNow() < p4 then
				p2:hookBedShield(p3);
			end;
		end;
		v8(p3:GetAttribute("BedShieldEndTime"));
		p3:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function()
			v8(p3:GetAttribute("BedShieldEndTime"));
		end);
	end);
end;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v4.ReplicatedStorage;
local l__scaleModel__6 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__ModelUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__8 = v3.InOutExpo;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local l__RunService__10 = v4.RunService;
local l__default__11 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__OutExpo__12 = v3.OutExpo;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedShieldUI__14 = v1.import(script, script.Parent, "bed-shield-ui").BedShieldUI;
local l__Players__15 = v4.Players;
function v6.hookBedShield(p5, p6)
	local v9 = p6:GetAttribute("BedShieldEndTime");
	local u16 = u4.new();
	p6:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function()
		if p6:GetAttribute("BedShieldEndTime") == nil then
			u16:DoCleaning();
		end;
	end);
	p6.Destroying:Connect(function()
		u16:DoCleaning();
	end);
	local v10 = l__ReplicatedStorage__5.Assets.Effects.BedShield:Clone();
	v10:SetPrimaryPartCFrame(p6.CFrame);
	l__scaleModel__6(v10, 0.1);
	v10.Parent = l__Workspace__3;
	l__ModelUtil__7.tweenModelSize(v10, 0.2, l__InOutExpo__8, 10);
	for v11, v12 in ipairs(v10:GetChildren()) do
		if v12:IsA("BasePart") then
			l__GameQueryUtil__9:setQueryIgnored(v12, true);
		end;
	end;
	local u17 = 0;
	local u18 = p6.Position + Vector3.new(0, 0, 1.5);
	u16:GiveTask(l__RunService__10.Heartbeat:Connect(function(p7)
		u17 = u17 + p7;
		if v10.PrimaryPart == nil then
			l__default__11.Error("Shield effect has no primary part");
			return nil;
		end;
		v10.Shields.CFrame = CFrame.new(u18 + Vector3.new(0, 1, 0)) * CFrame.Angles(0, u17 * 0.8, 0);
	end));
	u16:GiveTask(function()
		l__ModelUtil__7.tweenModelSize(v10, 0.15, l__OutExpo__12, 0):andThen(function()
			v10:Destroy();
		end);
	end);
	local u19 = u13.mount(u13.createElement("BillboardGui", {
		Adornee = p6, 
		StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5), 
		Size = UDim2.fromScale(6, 3), 
		ResetOnSpawn = false, 
		MaxDistance = 200
	}, { u13.createElement(l__BedShieldUI__14, {
			ExpireTime = v9
		}) }), l__Players__15.LocalPlayer:WaitForChild("PlayerGui"), "BedShield");
	u16:GiveTask(function()
		u13.unmount(u19);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v6.new());
return nil;
