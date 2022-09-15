-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v6 = setmetatable({}, {
	__tostring = function()
		return "CollectorPlayer";
	end
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__OutQuint__2 = v3.OutQuint;
local l__InOutExpo__3 = v3.InOutExpo;
local l__Players__4 = v4.Players;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__TweenService__7 = v4.TweenService;
local l__SoundManager__8 = v2.SoundManager;
local l__RandomUtil__9 = v2.RandomUtil;
local u10 = nil;
local l__UIUtil__11 = v2.UIUtil;
function v6.create(p2, p3, p4, p5, p6)
	local v8 = {};
	local u12 = u1.new();
	function v8.play()
		local v9 = {};
		if type(p6) == "table" then
			for v10, v11 in pairs(p6) do
				v9[v10] = v11;
			end;
		end;
		local v12 = v9.explodePower;
		if v12 == nil then
			v12 = 100;
		end;
		local v13 = v9.minExplodeSpeed;
		if v13 == nil then
			local v14 = p6;
			if v14 ~= nil then
				v14 = v14.amount;
			end;
			local v15 = v14;
			if v15 == nil then
				local v16 = p6;
				if v16 ~= nil then
					v16 = v16.waitSecBtwnExplodes;
				end;
				local v17 = v16;
				if v17 == nil then
					v17 = 0.1;
				end;
				v15 = 1 * v17;
			end;
			v13 = math.max(1, v15);
		end;
		local v18 = v9.maxExplodeSpeed;
		if v18 == nil then
			local v19 = p6;
			if v19 ~= nil then
				v19 = v19.amount;
			end;
			local v20 = v19;
			if v20 == nil then
				local v21 = p6;
				if v21 ~= nil then
					v21 = v21.waitSecBtwnExplodes;
				end;
				local v22 = v21;
				if v22 == nil then
					v22 = 0.1;
				end;
				v20 = 1 * v22;
			end;
			v18 = math.max(1, v20) + 1;
		end;
		local v23 = v9.waitSecBtwnExplodes;
		if v23 == nil then
			v23 = 0.1;
		end;
		local v24 = v9.minSiphonSpeed;
		if v24 == nil then
			v24 = 0.7;
		end;
		local v25 = v9.maxSiphonSpeed;
		if v25 == nil then
			v25 = 1.6;
		end;
		local v26 = v9.endStaySecs;
		if v26 == nil then
			v26 = 0.2;
		end;
		local v27 = v9.explodeSizeEasingFunction;
		if v27 == nil then
			v27 = l__OutQuint__2;
		end;
		local v28 = v9.siphonPosEasingFunction;
		if v28 == nil then
			v28 = l__InOutExpo__3;
		end;
		local v29 = {
			Name = "CollectEffectScreen", 
			DisplayOrder = 200
		};
		local v30 = p6;
		if v30 ~= nil then
			v30 = v30.parent;
		end;
		local v31 = v30;
		if v31 == nil then
			v31 = l__Players__4.LocalPlayer:WaitForChild("PlayerGui");
		end;
		v29.Parent = v31;
		local v32 = u5("ScreenGui", v29);
		u12:GiveTask(v32);
		local v33 = {};
		local u13 = Random.new(os.time());
		local u14 = {};
		local function v34(p7)
			l__default__6(0.5, v27, function(p8)
				p7.Size = p8;
				return p7.Size;
			end, UDim2.fromOffset(0, 0), UDim2.fromOffset(p7.AbsoluteSize.X, p7.AbsoluteSize.Y));
			if u13:NextNumber() < 0.5 then
				local v35 = -1;
			else
				v35 = 1;
			end;
			if u13:NextNumber() < 0.5 then
				local v36 = -1;
			else
				v36 = 1;
			end;
			local v37 = p4 + Vector2.new(v35 * u13:NextNumber() * v12, v36 * u13:NextNumber() * v12);
			local v38 = l__TweenService__7:Create(p7, TweenInfo.new(u13:NextNumber() * (v18 - v13) + v13, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Position = UDim2.fromOffset(v37.X, v37.Y)
			});
			table.insert(u14, v38);
			v38:Play();
			l__SoundManager__8:playSound(l__RandomUtil__9.randomArraySelectN(u10, 1)[1]);
			wait(v23);
		end;
		local v39 = 0;
		local v40 = false;
		while true do
			if v40 then
				v39 = v39 + 1;
			else
				v40 = true;
			end;
			local v41 = p6;
			if v41 ~= nil then
				v41 = v41.amount;
			end;
			local v42 = v41;
			if v42 == nil then
				v42 = 1;
			end;
			if not (v39 < v42) then
				break;
			end;
			local v43 = p3:Clone();
			v43.Position = UDim2.fromOffset(p4.X, p4.Y);
			v43.Parent = v32;
			table.insert(v33, v43);
			v34(v43);		
		end;
		local v44, v45, v46 = ipairs(u14);
		while true do
			v44(v45, v46);
			if not v44 then
				break;
			end;
			v46 = v44;
			v45:Pause();
			v45:Destroy();		
		end;
		local v47, v48, v49 = ipairs(v33);
		while true do
			v47(v48, v49);
			if not v47 then
				break;
			end;
			v49 = v47;
			task.spawn(function()
				l__default__6(u13:NextNumber() * (v25 - v24) + v24, v28, function(p9)
					v48.Position = p9;
					return v48.Position;
				end, UDim2.fromOffset(v48.AbsolutePosition.X, v48.AbsolutePosition.Y), UDim2.fromOffset(p5.X, p5.Y)):Wait();
				l__UIUtil__11:setContainerTransparency(v48, 1, {
					onSetTweenInfo = TweenInfo.new(0.2)
				});
				wait(v26);
				v48:Destroy();
			end);		
		end;
		task.delay(2, function()
			u12:DoCleaning();
		end);
	end;
	function v8.cleanup()
		u12:DoCleaning();
	end;
	return v8;
end;
u10 = { l__GameSound__5.BUBBLE_POP1, l__GameSound__5.BUBBLE_POP2, l__GameSound__5.BUBBLE_POP3, l__GameSound__5.BUBBLE_POP4, l__GameSound__5.BUBBLE_POP5, l__GameSound__5.BUBBLE_POP6 };
return {
	CollectorPlayer = v6
};
