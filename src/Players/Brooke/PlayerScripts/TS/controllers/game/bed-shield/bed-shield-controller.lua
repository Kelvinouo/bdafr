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
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "BedShieldController";
end;
local l__WatchCollectionTag__1 = v2.WatchCollectionTag;
local l__Workspace__2 = v4.Workspace;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__WatchCollectionTag__1("bed", function(p3)
		local v8 = p3:GetAttribute("BedShieldEndTime");
		if v8 ~= nil and l__Workspace__2:GetServerTimeNow() < v8 then
			p2:hookBedShield(p3);
		end;
		p3:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function()
			local v9 = p3:GetAttribute("BedShieldEndTime");
			if v9 ~= nil and l__Workspace__2:GetServerTimeNow() < v9 then
				p2:hookBedShield(p3);
			end;
		end);
	end);
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__4 = v4.ReplicatedStorage;
local l__scaleModel__5 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__ModelUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__7 = v3.InOutExpo;
local l__GameQueryUtil__8 = v2.GameQueryUtil;
local l__RunService__9 = v4.RunService;
local l__default__10 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local l__OutExpo__11 = v3.OutExpo;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedShieldUI__13 = v1.import(script, script.Parent, "bed-shield-ui").BedShieldUI;
local l__Players__14 = v4.Players;
function v6.hookBedShield(p4, p5)
	local v10 = p5:GetAttribute("BedShieldEndTime");
	local u15 = u3.new();
	p5:GetAttributeChangedSignal("BedShieldEndTime"):Connect(function()
		if p5:GetAttribute("BedShieldEndTime") == nil then
			u15:DoCleaning();
		end;
	end);
	p5.Destroying:Connect(function()
		u15:DoCleaning();
	end);
	local v11 = l__ReplicatedStorage__4.Assets.Effects.BedShield:Clone();
	v11:SetPrimaryPartCFrame(p5.CFrame);
	l__scaleModel__5(v11, 0.1);
	v11.Parent = l__Workspace__2;
	l__ModelUtil__6.tweenModelSize(v11, 0.2, l__InOutExpo__7, 10);
	local v12, v13, v14 = ipairs(v11:GetChildren());
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		if v13:IsA("BasePart") then
			l__GameQueryUtil__8:setQueryIgnored(v13, true);
		end;	
	end;
	local u16 = 0;
	local u17 = p5.Position + Vector3.new(0, 0, 1.5);
	u15:GiveTask(l__RunService__9.Heartbeat:Connect(function(p6)
		u16 = u16 + p6;
		if v11.PrimaryPart == nil then
			l__default__10.Error("Shield effect has no primary part");
			return nil;
		end;
		v11.Shields.CFrame = CFrame.new(u17 + Vector3.new(0, 1, 0)) * CFrame.Angles(0, u16 * 0.8, 0);
	end));
	u15:GiveTask(function()
		l__ModelUtil__6.tweenModelSize(v11, 0.15, l__OutExpo__11, 0):andThen(function()
			v11:Destroy();
		end);
	end);
	local u18 = u12.mount(u12.createElement("BillboardGui", {
		Adornee = p5, 
		StudsOffsetWorldSpace = Vector3.new(0, 4.5, 1.5), 
		Size = UDim2.fromScale(6, 3), 
		ResetOnSpawn = false, 
		MaxDistance = 200
	}, { u12.createElement(l__BedShieldUI__13, {
			ExpireTime = v10
		}) }), l__Players__14.LocalPlayer:WaitForChild("PlayerGui"), "BedShield");
	u15:GiveTask(function()
		u12.unmount(u18);
	end);
end;
local v15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v6.new());
return nil;
