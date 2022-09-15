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
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "ReceiveItemEffectController";
	p1.random = Random.new();
end;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
end;
local l__Workspace__1 = v3.Workspace;
local u2 = v2.ConstantManager.registerConstants(script, {
	P1XRange = NumberRange.new(-30, 30), 
	P1YRange = NumberRange.new(-15, 15), 
	P1ZRange = NumberRange.new(-15, 15)
});
local l__GameQueryUtil__3 = v2.GameQueryUtil;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutQuad__5 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InOutQuad;
v5.playEffect = v1.async(function(p3, p4, p5, p6, p7, p8)
	local v7 = l__Workspace__1:GetServerTimeNow();
	if p8 == 0 or p8 ~= p8 or not p8 then
		p8 = v7;
	end;
	local v8 = v7 - p8;
	local v9 = p6();
	if not v9 then
		return false;
	end;
	local l__Position__10 = (v9 * CFrame.new(p3.random:NextNumber(u2.P1XRange.Min, u2.P1XRange.Max), p3.random:NextNumber(u2.P1YRange.Min, u2.P1YRange.Max), p3.random:NextNumber(u2.P1ZRange.Min, u2.P1ZRange.Max))):Lerp(v9, 0.5).Position;
	p4 = p4:Clone();
	local v11, v12, v13 = ipairs((p4:GetDescendants()));
	while true do
		v11(v12, v13);
		if not v11 then
			break;
		end;
		v13 = v11;
		local v14 = l__GameQueryUtil__3:setQueryIgnored(v12, true);	
	end;
	p4.Parent = l__Workspace__1;
	l__default__4(p7 - v8, l__InOutQuad__5, function(p9)
		local v15 = p6();
		if v15 ~= nil then
			v15 = v15.Position;
		end;
		if not v15 then
			return nil;
		end;
		p4:SetPrimaryPartCFrame(CFrame.new((p5:Lerp(l__Position__10, p9):Lerp(l__Position__10:Lerp(v15, p9), p9))) * CFrame.Angles(0, math.pi * 2 * p9, 0));
	end, v8, 1):Wait();
	p4:Destroy();
	return true;
end);
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.cloneItemIntoModel(p10, p11)
	local u7 = u6("Model", {
		Name = p11.Name
	});
	local v16, v17, v18 = ipairs((p11:GetChildren()));
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		v17:Clone().Parent = u7;	
	end;
	local v19, v20, v21 = ipairs((u7:GetDescendants()));
	while true do
		v19(v20, v21);
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
	u7.PrimaryPart = u7:FindFirstChildWhichIsA("BasePart");
	return u7;
end;
local l__ReplicatedStorage__8 = v3.ReplicatedStorage;
local l__SoundManager__9 = v2.SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__getItemMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
function v5.playEffectForItems(p12, p13, p14, p15, p16, p17)
	if p17 == nil then
		p17 = 5;
	end;
	local v22 = 0;
	local v23, v24, v25 = ipairs(p13);
	while true do
		v23(v24, v25);
		if not v23 then
			break;
		end;
		local v26 = math.min(v24.amount, p17);
		if p17 < v24.amount then
			v26 = v26 + math.log(v24.amount - p17 + 1, 2);
		end;
		local v27 = p12:cloneItemIntoModel((l__ReplicatedStorage__8:WaitForChild("Items"):WaitForChild(v24.itemType)));
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
			local u12 = v22;
			task.spawn(function()
				task.wait(math.random() * 0.2);
				p12:playEffect(v27, p14, p15, 0.5 + math.random() * 0.2):andThen(function(p18)
					if p18 then
						local v30 = {};
						if p16 == "PlayLocally" then
							local v31 = nil;
						else
							local v32 = p15();
							if v32 ~= nil then
								v32 = v32.Position;
							end;
							v31 = v32;
						end;
						v30.position = v31;
						v30.volumeMultiplier = 0.8;
						local v33 = l__SoundManager__9:playSound(l__GameSound__10.PICKUP_ITEM_DROP, v30);
						if v33 then
							u12 = u12 + 1;
							v33.PlaybackSpeed = 1 + u12 / 50;
						end;
						local l__pickUpOverlaySound__34 = l__getItemMeta__11(v24.itemType).pickUpOverlaySound;
						if l__pickUpOverlaySound__34 ~= "" and l__pickUpOverlaySound__34 then
							local v35 = {};
							if p16 == "PlayLocally" then
								local v36 = nil;
							else
								local v37 = p15();
								if v37 ~= nil then
									v37 = v37.Position;
								end;
								v36 = v37;
							end;
							v35.position = v36;
							v35.volumeMultiplier = 0.9;
							local v38 = l__SoundManager__9:playSound(l__pickUpOverlaySound__34, v35);
							if v38 then
								u12 = u12 + 1;
								v38.PlaybackSpeed = 1 + u12 / 50;
							end;
						end;
					end;
				end);
			end);		
		end;	
	end;
end;
local v39 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
