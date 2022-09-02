-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "DetonatedBombController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "DetonatedBombController";
	p1.bombMap = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:Get("RemoteName"):Connect(function(p3)
		if not p3.hitPart then
			return nil;
		end;
		p2:attachBomb(p3.hitPart, p3.cFrame, p3.hitEntity, p3.bombOwner);
	end);
	l__default__1.Client:Get("RemoteName"):Connect(function(p4)
		p2:bombExplosion(p4.player);
	end);
end;
function v4.registerBomb(p5, p6, p7)
	local v6 = p5.bombMap[p6];
	if not v6 then
		p5.bombMap[p6] = { p7 };
		return;
	end;
	local v7 = {};
	local v8 = #v7;
	local v9 = #v6;
	table.move(v6, 1, v9, v8 + 1, v7);
	v7[v8 + v9 + 1] = p7;
	p5.bombMap[p6] = v7;
end;
function v4.bombExplosion(p8, p9)
	print(p9.UserId);
	local v10 = p8.bombMap[p9];
	if not v10 then
		return nil;
	end;
	local v11, v12, v13 = ipairs(v10);
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		v13 = v11;
		v12:Destroy();	
	end;
	p8.bombMap[p9] = {};
end;
local l__ReplicatedStorage__2 = v2.ReplicatedStorage;
local l__Players__3 = v2.Players;
local l__WeldUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
function v4.attachBomb(p10, p11, p12, p13, p14)
	local v14 = l__ReplicatedStorage__2.Assets.Effects.DetonatedBomb:Clone();
	if not v14.PrimaryPart then
		return nil;
	end;
	local l__Indicator__15 = v14.PrimaryPart:WaitForChild("Indicator", 3);
	if l__Indicator__15 and p14 == l__Players__3.LocalPlayer then
		l__Indicator__15.Color = Color3.fromRGB(26, 255, 5);
	elseif l__Indicator__15 and p14.Team == l__Players__3.LocalPlayer.Team then
		l__Indicator__15.Color = Color3.fromRGB(217, 252, 23);
	end;
	v14.Parent = p11;
	if p13 then
		p12 = p12:Lerp(CFrame.new(p11.Position), 0.5);
	else
		p12 = p12 * CFrame.Angles(0, math.pi / 2, 0);
	end;
	v14:SetPrimaryPartCFrame(p12);
	l__WeldUtil__4.weldParts(p11, v14.PrimaryPart);
	p10:registerBomb(p14, v14);
end;
local v16 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
