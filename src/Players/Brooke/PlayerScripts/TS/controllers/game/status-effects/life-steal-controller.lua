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
				local v12 = nil;
				for v13, v14 in ipairs(v11) do
					if v14.target == p6 == true then
						v12 = v14;
						break;
					end;
				end;
				v11 = v12;
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
		local v15 = p4.hitTimeMap[p5];
		if v15 then
			v15[p6] = os.time();
			return;
		end;
		p4.hitTimeMap[p5] = {
			[p6] = os.time()
		};
	end;
end;
local l__RunService__6 = v2.RunService;
function v4.beamCleanupTicker(p7)
	l__RunService__6.Heartbeat:Connect(function()
		local l__hitTimeMap__16 = p7.hitTimeMap;
		local function v17(p8, p9)
			local function v18(p10, p11)
				if os.time() - p10 >= 2 then
					local v19 = p7.playerBeamMap[p9];
					local v20 = v19;
					if v20 ~= nil then
						local v21 = nil;
						for v22, v23 in ipairs(v20) do
							if v23.target == p11 == true then
								v21 = v23;
								break;
							end;
						end;
						v20 = v21;
					end;
					local v24 = v19;
					if v24 ~= nil then
						local v25 = {};
						local v26 = 0;
						local v27, v28, v29 = ipairs(v24);
						while true do
							local v30, v31 = v27(v28, v29);
							if not v30 then
								break;
							end;
							if v31.target ~= p11 == true then
								v26 = v26 + 1;
								v25[v26] = v31;
							end;						
						end;
						v24 = v25;
					end;
					if v24 then
						p7.playerBeamMap[p9] = v24;
					end;
					if v20 then
						v20.front:Destroy();
						v20.front.Parent = nil;
						v20.back:Destroy();
						v20.back.Parent = nil;
					end;
					local v32 = p7.hitTimeMap[p9];
					if v32 ~= nil then
						v32[p11] = nil;
					end;
				end;
			end;
			for v33, v34 in pairs(p8) do
				v18(v34, v33, p8);
			end;
		end;
		for v35, v36 in pairs(l__hitTimeMap__16) do
			v17(v36, v35, l__hitTimeMap__16);
		end;
	end);
end;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v4.playRegenSound(p12, p13, p14)
	if p14 then
		local v37 = l__GameSound__7.LIFE_STEAL_OVERHEAL;
	else
		v37 = l__GameSound__7.LIFE_STEAL_HEAL;
	end;
	local v38 = {};
	if p12:isLocal(p13) then
		local v39 = nil;
	else
		local v40 = p13.PrimaryPart;
		if v40 ~= nil then
			v40 = v40.Position;
		end;
		v39 = v40;
	end;
	v38.position = v39;
	l__SoundManager__8:playSound(v37, v38);
end;
local l__Players__9 = v2.Players;
function v4.isLocal(p15, p16)
	return p16 == l__Players__9.LocalPlayer.Character;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
