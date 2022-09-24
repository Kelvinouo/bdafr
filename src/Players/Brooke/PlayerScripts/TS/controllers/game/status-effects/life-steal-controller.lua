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
		local v6 = p3.config;
		if v6 ~= nil then
			v6 = v6.beamColors;
		end;
		p2:playRegenEffect(p3.healer, p3.enemy, v6);
		p2:playRegenSound(p3.healer, p3.overHeal);
	end);
end;
local l__BannerConnection__2 = v2.ReplicatedStorage.Assets.Effects.BannerConnection;
local l__TweenService__3 = v2.TweenService;
local u4 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, math.huge, true);
function v4.playRegenEffect(p4, p5, p6, p7)
	if p4:isLocal(p5) or p4:isLocal(p6) then
		local v7 = p5:WaitForChild("UpperTorso", 1);
		if v7 ~= nil then
			v7 = v7:WaitForChild("BodyFrontAttachment", 1);
		end;
		local v8 = p6:WaitForChild("UpperTorso", 1);
		if v8 ~= nil then
			v8 = v8:WaitForChild("BodyFrontAttachment", 1);
		end;
		local v9 = { { ColorSequence.new(Color3.new(0, 90, 0)), ColorSequence.new(Color3.new(0, 0, 0)) } };
		if p7 then
			local v10 = {};
			local v11 = #v10;
			local v12 = #v9;
			table.move(v9, 1, v12, v11 + 1, v10);
			table.move(p7, 1, #p7, v11 + v12 + 1, v10);
			v9 = v10;
		end;
		if v7 and v8 then
			local v13 = p4.playerBeamMap[p5];
			local v14 = v13;
			if v14 ~= nil then
				local v15 = nil;
				local v16, v17, v18 = ipairs(v14);
				while true do
					v16(v17, v18);
					if not v16 then
						break;
					end;
					v18 = v16;
					if v17.target == p6 == true then
						v15 = v17;
						break;
					end;				
				end;
				v14 = v15;
			end;
			if not v14 then
				local function v19(p8)
					local v20 = l__BannerConnection__2.Beam1:Clone();
					local v21 = l__BannerConnection__2.Beam2:Clone();
					v20.Color = p8[1];
					v20.Attachment0 = v7;
					v20.Attachment1 = v8;
					v20.Parent = p5;
					v21.Color = p8[2];
					v21.Attachment0 = v7;
					v21.Attachment1 = v8;
					v21.Parent = p5;
					l__TweenService__3:Create(v20, u4, {
						CurveSize0 = -1.25, 
						CurveSize1 = 1.25, 
						Width0 = 1.4, 
						Width1 = 1.4
					}):Play();
					l__TweenService__3:Create(v21, u4, {
						CurveSize0 = 1.25, 
						CurveSize1 = -1.25, 
						Width0 = 1.2, 
						Width1 = 1.2
					}):Play();
					if v13 then
						table.insert(v13, {
							target = p6, 
							front = v20, 
							back = v21
						});
						return;
					end;
					p4.playerBeamMap[p5] = { {
							target = p6, 
							front = v20, 
							back = v21
						} };
				end;
				local v22, v23, v24 = ipairs(v9);
				while true do
					v22(v23, v24);
					if not v22 then
						break;
					end;
					v24 = v22;
					v19(v23, v22 - 1, v9);				
				end;
			end;
		end;
		local v25 = p4.hitTimeMap[p5];
		if v25 then
			v25[p6] = os.time();
			return;
		end;
		p4.hitTimeMap[p5] = {
			[p6] = os.time()
		};
	end;
end;
local l__RunService__5 = v2.RunService;
function v4.beamCleanupTicker(p9)
	l__RunService__5.Heartbeat:Connect(function()
		local l__hitTimeMap__26 = p9.hitTimeMap;
		local function v27(p10, p11)
			local function v28(p12, p13)
				if os.time() - p12 >= 2 then
					local v29 = p9.playerBeamMap[p11];
					local v30 = v29;
					if v30 ~= nil then
						local v31 = {};
						local v32 = 0;
						local v33, v34, v35 = ipairs(v30);
						while true do
							v33(v34, v35);
							if not v33 then
								break;
							end;
							if v34.target == p13 == true then
								v32 = v32 + 1;
								v31[v32] = v34;
							end;						
						end;
						v30 = v31;
					end;
					local v36 = v29;
					if v36 ~= nil then
						local v37 = {};
						local v38 = 0;
						local v39, v40, v41 = ipairs(v36);
						while true do
							v39(v40, v41);
							if not v39 then
								break;
							end;
							if v40.target ~= p13 == true then
								v38 = v38 + 1;
								v37[v38] = v40;
							end;						
						end;
						v36 = v37;
					end;
					if v36 then
						p9.playerBeamMap[p11] = v36;
					end;
					if v30 ~= nil then
						local v42, v43, v44 = ipairs(v30);
						while true do
							v42(v43, v44);
							if not v42 then
								break;
							end;
							v44 = v42;
							v43.front:Destroy();
							v43.front.Parent = nil;
							v43.back:Destroy();
							v43.back.Parent = nil;						
						end;
					end;
					local v45 = p9.hitTimeMap[p11];
					if v45 ~= nil then
						v45[p13] = nil;
					end;
				end;
			end;
			for v46, v47 in pairs(p10) do
				v28(v47, v46, p10);
			end;
		end;
		for v48, v49 in pairs(l__hitTimeMap__26) do
			v27(v49, v48, l__hitTimeMap__26);
		end;
	end);
end;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
function v4.playRegenSound(p14, p15, p16)
	if p16 then
		local v50 = l__GameSound__6.LIFE_STEAL_OVERHEAL;
	else
		v50 = l__GameSound__6.LIFE_STEAL_HEAL;
	end;
	local v51 = {};
	if p14:isLocal(p15) then
		local v52 = nil;
	else
		local v53 = p15.PrimaryPart;
		if v53 ~= nil then
			v53 = v53.Position;
		end;
		v52 = v53;
	end;
	v51.position = v52;
	l__SoundManager__7:playSound(v50, v51);
end;
local l__Players__8 = v2.Players;
function v4.isLocal(p17, p18)
	return p18 == l__Players__8.LocalPlayer.Character;
end;
local v54 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
