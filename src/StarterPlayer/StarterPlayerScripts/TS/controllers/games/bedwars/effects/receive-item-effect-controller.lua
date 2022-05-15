
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ReceiveItemEffectController";
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
	p1.Name = "ReceiveItemEffectController";
	p1.random = Random.new();
end;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
end;
local l__Workspace__2 = v3.Workspace;
local u3 = v2.ConstantManager.registerConstants(script, {
	P1XRange = NumberRange.new(-30, 30), 
	P1YRange = NumberRange.new(-15, 15), 
	P1ZRange = NumberRange.new(-15, 15)
});
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuad__6 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutQuad;
v5.playEffect = v1.async(function(p3, p4, p5, p6, p7, p8)
	local v7 = l__Workspace__2:GetServerTimeNow();
	if p8 == 0 or p8 ~= p8 or not p8 then
		p8 = v7;
	end;
	local v8 = v7 - p8;
	local v9 = p6();
	if not v9 then
		return false;
	end;
	p4 = p4:Clone();
	local v10 = p4:GetDescendants();
	local function v11(p9)
		return l__GameQueryUtil__4:setQueryIgnored(p9, true);
	end;
	for v12, v13 in ipairs(v10) do
		v11(v13, v12 - 1, v10);
	end;
	p4.Parent = l__Workspace__2;
	local l__Position__7 = (v9 * CFrame.new(p3.random:NextNumber(u3.P1XRange.Min, u3.P1XRange.Max), p3.random:NextNumber(u3.P1YRange.Min, u3.P1YRange.Max), p3.random:NextNumber(u3.P1ZRange.Min, u3.P1ZRange.Max))):Lerp(v9, 0.5).Position;
	l__default__5(p7 - v8, l__InOutQuad__6, function(p10)
		local v14 = p6();
		if v14 ~= nil then
			v14 = v14.Position;
		end;
		if not v14 then
			return nil;
		end;
		p4:SetPrimaryPartCFrame(CFrame.new((p5:Lerp(l__Position__7, p10):Lerp(l__Position__7:Lerp(v14, p10), p10))) * CFrame.Angles(0, math.pi * 2 * p10, 0));
	end, v8, 1):Wait();
	p4:Destroy();
	return true;
end);
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.cloneItemIntoModel(p11, p12)
	local v15 = p12:GetChildren();
	local u9 = u8("Model", {
		Name = p12.Name
	});
	local function v16(p13)
		p13:Clone().Parent = u9;
	end;
	for v17, v18 in ipairs(v15) do
		v16(v18, v17 - 1, v15);
	end;
	local v19 = u9:GetDescendants();
	local function v20(p14)
		if p14:IsA("Trail") then
			p14.Enabled = true;
		end;
		if p14:IsA("BasePart") then
			p14.Anchored = false;
			p14.CanCollide = false;
		end;
	end;
	for v21, v22 in ipairs(v19) do
		v20(v22, v21 - 1, v19);
	end;
	u9.PrimaryPart = u9:FindFirstChildWhichIsA("BasePart");
	return u9;
end;
local l__ReplicatedStorage__10 = v3.ReplicatedStorage;
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.playEffectForItems(p15, p16, p17, p18, p19, p20)
	if p20 == nil then
		p20 = 5;
	end;
	local v23 = 0;
	for v24, v25 in ipairs(p16) do
		local v26 = math.min(v25.amount, p20);
		local v27 = p15:cloneItemIntoModel((l__ReplicatedStorage__10:WaitForChild("Items"):WaitForChild(v25.item)));
		local v28 = 0;
		local v29 = false;
		while true do
			if v29 then
				v28 = v28 + 1;
			else
				v29 = true;
			end;
			if not (v28 < math.ceil(v26)) then
				break;
			end;
			local u13 = v23;
			task.spawn(function()
				task.wait(math.random() * 0.2);
				p15:playEffect(v27, p17, p18, 0.5 + math.random() * 0.2):andThen(function(p21)
					if p21 then
						local v30 = {};
						if p19 == "PlayLocally" then
							local v31 = nil;
						else
							local v32 = p18();
							if v32 ~= nil then
								v32 = v32.Position;
							end;
							v31 = v32;
						end;
						v30.position = v31;
						v30.volumeMultiplier = 0.8;
						local v33 = l__SoundManager__11:playSound(l__GameSound__12.PICKUP_ITEM_DROP, v30);
						if v33 then
							u13 = u13 + 1;
							v33.PlaybackSpeed = 1 + u13 / 50;
						end;
					end;
				end);
			end);		
		end;
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

