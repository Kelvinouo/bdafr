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
	for v10, v11 in ipairs((p4:GetDescendants())) do
		local v12 = l__GameQueryUtil__4:setQueryIgnored(v11, true);
	end;
	p4.Parent = l__Workspace__2;
	local l__Position__7 = (v9 * CFrame.new(p3.random:NextNumber(u3.P1XRange.Min, u3.P1XRange.Max), p3.random:NextNumber(u3.P1YRange.Min, u3.P1YRange.Max), p3.random:NextNumber(u3.P1ZRange.Min, u3.P1ZRange.Max))):Lerp(v9, 0.5).Position;
	l__default__5(p7 - v8, l__InOutQuad__6, function(p9)
		local v13 = p6();
		if v13 ~= nil then
			v13 = v13.Position;
		end;
		if not v13 then
			return nil;
		end;
		p4:SetPrimaryPartCFrame(CFrame.new((p5:Lerp(l__Position__7, p9):Lerp(l__Position__7:Lerp(v13, p9), p9))) * CFrame.Angles(0, math.pi * 2 * p9, 0));
	end, v8, 1):Wait();
	p4:Destroy();
	return true;
end);
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.cloneItemIntoModel(p10, p11)
	local u9 = u8("Model", {
		Name = p11.Name
	});
	for v14, v15 in ipairs((p11:GetChildren())) do
		v15:Clone().Parent = u9;
	end;
	local v16, v17, v18 = ipairs((u9:GetDescendants()));
	while true do
		local v19, v20 = v16(v17, v18);
		if not v19 then
			break;
		end;
		if v20:IsA("Trail") then
			v20.Enabled = true;
		end;
		if v20:IsA("BasePart") then
			v20.Anchored = false;
			v20.CanCollide = false;
		end;	
	end;
	u9.PrimaryPart = u9:FindFirstChildWhichIsA("BasePart");
	return u9;
end;
local l__ReplicatedStorage__10 = v3.ReplicatedStorage;
local l__SoundManager__11 = v2.SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.playEffectForItems(p12, p13, p14, p15, p16, p17)
	if p17 == nil then
		p17 = 5;
	end;
	local v21 = 0;
	local v22, v23, v24 = ipairs(p13);
	while true do
		local v25, v26 = v22(v23, v24);
		if not v25 then
			break;
		end;
		local v27 = math.min(v26.amount, p17);
		if p17 < v26.amount then
			v27 = v27 + math.log(v26.amount - p17 + 1, 2);
		end;
		local v28 = p12:cloneItemIntoModel((l__ReplicatedStorage__10:WaitForChild("Items"):WaitForChild(v26.itemType)));
		local v29 = 0;
		local v30 = false;
		while true do
			if v30 then
				v29 = v29 + 1;
			else
				v30 = true;
			end;
			if not (v29 < math.ceil(v27)) then
				break;
			end;
			local u13 = v21;
			task.spawn(function()
				task.wait(math.random() * 0.2);
				p12:playEffect(v28, p14, p15, 0.5 + math.random() * 0.2):andThen(function(p18)
					if p18 then
						local v31 = {};
						if p16 == "PlayLocally" then
							local v32 = nil;
						else
							local v33 = p15();
							if v33 ~= nil then
								v33 = v33.Position;
							end;
							v32 = v33;
						end;
						v31.position = v32;
						v31.volumeMultiplier = 0.8;
						local v34 = l__SoundManager__11:playSound(l__GameSound__12.PICKUP_ITEM_DROP, v31);
						if v34 then
							u13 = u13 + 1;
							v34.PlaybackSpeed = 1 + u13 / 50;
						end;
					end;
				end);
			end);		
		end;	
	end;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
