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
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "LifeStealController";
	p1.playerBeamMap = {};
	p1.hitTimeMap = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	p2:beamCleanupTicker();
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		p2:playRegenEffect(p3.healer, p3.enemy);
		p2:playRegenSound(p3.healer, p3.overHeal);
	end);
end;
local l__BannerConnection__2 = v2.ReplicatedStorage.Assets.Effects.BannerConnection;
local l__TweenService__3 = v2.TweenService;
local u4 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, math.huge, true);
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
		local v8 = l__BannerConnection__2.Beam1:Clone();
		local v9 = l__BannerConnection__2.Beam2:Clone();
		if v6 and v7 then
			local v10 = p4.playerBeamMap[p5];
			local v11 = v10;
			if v11 ~= nil then
				local v12 = nil;
				local v13, v14, v15 = ipairs(v11);
				while true do
					v13(v14, v15);
					if not v13 then
						break;
					end;
					v15 = v13;
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
				l__TweenService__3:Create(v8, u4, {
					CurveSize0 = -1.25, 
					CurveSize1 = 1.25, 
					Width0 = 1.4, 
					Width1 = 1.4
				}):Play();
				l__TweenService__3:Create(v9, u4, {
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
local l__RunService__5 = v2.RunService;
function v4.beamCleanupTicker(p7)
	l__RunService__5.Heartbeat:Connect(function()
		local l__hitTimeMap__17 = p7.hitTimeMap;
		local function v18(p8, p9)
			local function v19(p10, p11)
				if os.time() - p10 >= 2 then
					local v20 = p7.playerBeamMap[p9];
					local v21 = v20;
					if v21 ~= nil then
						local v22 = nil;
						local v23, v24, v25 = ipairs(v21);
						while true do
							v23(v24, v25);
							if not v23 then
								break;
							end;
							v25 = v23;
							if v24.target == p11 == true then
								v22 = v24;
								break;
							end;						
						end;
						v21 = v22;
					end;
					local v26 = v20;
					if v26 ~= nil then
						local v27 = {};
						local v28 = 0;
						local v29, v30, v31 = ipairs(v26);
						while true do
							v29(v30, v31);
							if not v29 then
								break;
							end;
							if v30.target ~= p11 == true then
								v28 = v28 + 1;
								v27[v28] = v30;
							end;						
						end;
						v26 = v27;
					end;
					if v26 then
						p7.playerBeamMap[p9] = v26;
					end;
					if v21 then
						v21.front:Destroy();
						v21.front.Parent = nil;
						v21.back:Destroy();
						v21.back.Parent = nil;
					end;
					local v32 = p7.hitTimeMap[p9];
					if v32 ~= nil then
						v32[p11] = nil;
					end;
				end;
			end;
			for v33, v34 in pairs(p8) do
				v19(v34, v33, p8);
			end;
		end;
		for v35, v36 in pairs(l__hitTimeMap__17) do
			v18(v36, v35, l__hitTimeMap__17);
		end;
	end);
end;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v4.playRegenSound(p12, p13, p14)
	if p14 then
		local v37 = l__GameSound__6.LIFE_STEAL_OVERHEAL;
	else
		v37 = l__GameSound__6.LIFE_STEAL_HEAL;
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
	l__SoundManager__7:playSound(v37, v38);
end;
local l__Players__8 = v2.Players;
function v4.isLocal(p15, p16)
	return p16 == l__Players__8.LocalPlayer.Character;
end;
local v41 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
