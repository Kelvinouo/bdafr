-- Script Hash: e7da8646c93afe119e2b0e41f684312f4860b60d6891f76c4756483c19d2a04f924a3fad91f273ba5a8f712ef0a88de8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "LifeStealController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "LifeStealController";
	p1.playerBeamMap = {};
	p1.hitTimeMap = {};
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	p2:beamCleanupTicker();
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		p2:playRegenEffect(p3.healer, p3.enemy);
		p2:playRegenSound(p3.healer, p3.overHeal);
	end);
end;
local l__BannerConnection__3 = v2.ReplicatedStorage.Assets.Effects.BannerConnection;
local l__TweenService__4 = v2.TweenService;
local u5 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, math.huge, true);
function v4.playRegenEffect(p4, p5, p6)
	if p4:isLocal(p5) or p4:isLocal(p6) then
		local v6 = p5:WaitForChild("UpperTorso", 1);
		if v6 ~= nil then
			v6 = v6:WaitForChild("BodyFrontAttachment", 1);
		end;
		local v7 = p6:WaitForChild("UpperTorso", 1);
		if v7 ~= nil then
			v7 = v7:WaitForChild("BodyFrontAttachment", 1);
		end;
		local v8 = l__BannerConnection__3.Beam1:Clone();
		local v9 = l__BannerConnection__3.Beam2:Clone();
		if v6 and v7 then
			local v10 = p4.playerBeamMap[p5];
			local v11 = v10;
			if v11 ~= nil then
				local function v12(p7)
					return p7.target == p6;
				end;
				local v13 = nil;
				for v14, v15 in ipairs(v11) do
					if v12(v15, v14 - 1, v11) == true then
						v13 = v15;
						break;
					end;
				end;
				v11 = v13;
			end;
			if not v11 then
				v8.Color = ColorSequence.new(Color3.new(0, 90, 0));
				v8.Attachment0 = v6;
				v8.Attachment1 = v7;
				v8.Parent = p5;
				v9.Color = ColorSequence.new(Color3.new(0, 0, 0));
				v9.Attachment0 = v6;
				v9.Attachment1 = v7;
				v9.Parent = p5;
				l__TweenService__4:Create(v8, u5, {
					CurveSize0 = -1.25, 
					CurveSize1 = 1.25, 
					Width0 = 1.4, 
					Width1 = 1.4
				}):Play();
				l__TweenService__4:Create(v9, u5, {
					CurveSize0 = 1.25, 
					CurveSize1 = -1.25, 
					Width0 = 1.2, 
					Width1 = 1.2
				}):Play();
				if v10 then
					table.insert(v10, {
						target = p6, 
						front = v8, 
						back = v9
					});
				else
					p4.playerBeamMap[p5] = { {
							target = p6, 
							front = v8, 
							back = v9
						} };
				end;
			end;
		end;
		local v16 = p4.hitTimeMap[p5];
		if v16 then
			v16[p6] = os.time();
			return;
		end;
		p4.hitTimeMap[p5] = {
			[p6] = os.time()
		};
	end;
end;
local l__RunService__6 = v2.RunService;
function v4.beamCleanupTicker(p8)
	l__RunService__6.Heartbeat:Connect(function()
		local l__hitTimeMap__17 = p8.hitTimeMap;
		local function v18(p9, p10)
			local function v19(p11, p12)
				if os.time() - p11 >= 2 then
					local v20 = p8.playerBeamMap[p10];
					local v21 = v20;
					if v21 ~= nil then
						local function v22(p13)
							return p13.target == p12;
						end;
						local v23 = nil;
						for v24, v25 in ipairs(v21) do
							if v22(v25, v24 - 1, v21) == true then
								v23 = v25;
								break;
							end;
						end;
						v21 = v23;
					end;
					local v26 = v20;
					if v26 ~= nil then
						local function v27(p14)
							return p14.target ~= p12;
						end;
						local v28 = {};
						local v29 = 0;
						for v30, v31 in ipairs(v26) do
							if v27(v31, v30 - 1, v26) == true then
								v29 = v29 + 1;
								v28[v29] = v31;
							end;
						end;
						v26 = v28;
					end;
					if v26 then
						p8.playerBeamMap[p10] = v26;
					end;
					if v21 then
						v21.front:Destroy();
						v21.front.Parent = nil;
						v21.back:Destroy();
						v21.back.Parent = nil;
					end;
					local v32 = p8.hitTimeMap[p10];
					if v32 ~= nil then
						v32[p12] = nil;
					end;
				end;
			end;
			for v33, v34 in pairs(p9) do
				v19(v34, v33, p9);
			end;
		end;
		for v35, v36 in pairs(l__hitTimeMap__17) do
			v18(v36, v35, l__hitTimeMap__17);
		end;
	end);
end;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v4.playRegenSound(p15, p16, p17)
	if p17 then
		local v37 = l__GameSound__7.LIFE_STEAL_OVERHEAL;
	else
		v37 = l__GameSound__7.LIFE_STEAL_HEAL;
	end;
	local v38 = {};
	if p15:isLocal(p16) then
		local v39 = nil;
	else
		local v40 = p16.PrimaryPart;
		if v40 ~= nil then
			v40 = v40.Position;
		end;
		v39 = v40;
	end;
	v38.position = v39;
	l__SoundManager__8:playSound(v37, v38);
end;
local l__Players__9 = v2.Players;
function v4.isLocal(p18, p19)
	return p19 == l__Players__9.LocalPlayer.Character;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
