-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "EmoteController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
local u1 = v6;
function u1.new(...)
	local v7 = setmetatable({}, u1);
	return v7:constructor(...) and v7;
end;
local u2 = l__KnitController__5;
local l__ExpireList__3 = v2.ExpireList;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "EmoteController";
	p1.emoteSoundMaid = {};
	p1.emoteCooldowns = l__ExpireList__3.new(2);
end;
local l__ContextActionService__4 = v4.ContextActionService;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__default__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function u1.KnitStart(p2)
	l__ContextActionService__4:BindAction("spray-keyboard", function(p3, p4, p5)
		if p4 == Enum.UserInputState.Begin then
			p2:emote();
		end;
	end, false, Enum.KeyCode.T, Enum.KeyCode.DPadLeft);
	p2:preloadEmote();
	l__ClientStore__5.changed:connect(function(p6, p7)
		if p6.Locker.selectedSpray ~= p7.Locker.selectedSpray then
			p2:preloadEmote();
		end;
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p8)
		local v8 = p2:playEmoteBeginSounds(p8.emote, p8.sourcePlayer);
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p9)
		local v9 = p2.emoteSoundMaid[p9.sourcePlayer.UserId];
		if v9 ~= nil then
			v9:DoCleaning();
		end;
		if not p9.cancelled then
			local v10 = p2:playEmoteEndSounds(p9.emote, p9.sourcePlayer);
		end;
	end);
end;
local l__Players__7 = v4.Players;
local l__EmoteMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__EmoteDisplayMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-display-meta").EmoteDisplayMeta;
function u1.emote(p10)
	local l__LocalPlayer__11 = l__Players__7.LocalPlayer;
	if p10.emoteCooldowns:has(l__LocalPlayer__11.UserId) then
		return nil;
	end;
	p10.emoteCooldowns:add(l__LocalPlayer__11.UserId);
	local l__selectedSpray__12 = l__ClientStore__5:getState().Locker.selectedSpray;
	local v13 = l__EmoteMeta__8[l__selectedSpray__12];
	local v14 = l__default__6.Client:Get("RemoteName"):CallServer({
		emoteType = l__selectedSpray__12
	});
	local v15 = v13.animation;
	if v13.emoteDisplayType ~= nil and not v15 then
		v15 = l__EmoteDisplayMeta__9[v13.emoteDisplayType].animation;
	end;
	if v15 then
		p10:playEmoteAnimation(l__LocalPlayer__11, v15);
	end;
end;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local l__Maid__11 = v3.Maid;
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__RunService__13 = v4.RunService;
function u1.playEmoteAnimation(p11, p12, p13)
	local v16 = p12.Character;
	if v16 ~= nil then
		v16 = v16.PrimaryPart;
	end;
	if not v16 then
		return nil;
	end;
	local v17 = nil;
	if not p13.noAutoPlayAnimation then
		local v18 = {};
		local v19 = p13.looped;
		if v19 == nil then
			v19 = false;
		end;
		v18.looped = v19;
		v17 = l__GameAnimationUtil__10.playAnimation(l__Players__7.LocalPlayer, p13.type, v18);
	end;
	local v20 = l__Maid__11.new();
	v20:GiveTask(function()
		l__ClientSyncEvents__12.CancelEmoteEvent:fire();
		if v17 ~= nil then
			v17:Stop();
		end;
		if v17 ~= nil then
			v17:Destroy();
		end;
		l__default__6.Client:Get("RemoteName"):CallServer({
			emoteType = l__ClientStore__5:getState().Locker.selectedSpray
		});
	end);
	local l__Position__14 = v16.Position;
	v20:GiveTask(l__RunService__13.RenderStepped:Connect(function()
		if not v16.Parent then
			v20:DoCleaning();
			return nil;
		end;
		if not l__Position__14 or (v16.Position - l__Position__14).Magnitude > 0.6 then
			v20:DoCleaning();
		end;
	end));
end;
local l__SoundManager__15 = v2.SoundManager;
function u1.playEmoteBeginSounds(p14, p15, p16)
	local v21 = l__EmoteMeta__8[p15];
	local v22 = p16;
	if v22 ~= nil then
		v22 = v22.Character;
	end;
	if p16 then
		local v23 = p16;
		if v23 ~= nil then
			v23 = v23.UserId;
		end;
		local v24 = p14.emoteSoundMaid[v23];
		if v24 ~= nil then
			v24:DoCleaning();
		end;
	end;
	local v25 = v21.soundsOnBegin or {};
	if v21.emoteDisplayType ~= nil then
		local l__soundsOnBegin__26 = l__EmoteDisplayMeta__9[v21.emoteDisplayType].soundsOnBegin;
		if l__soundsOnBegin__26 then
			local v27 = {};
			local v28 = #v27;
			local v29 = #v25;
			table.move(v25, 1, v29, v28 + 1, v27);
			table.move(l__soundsOnBegin__26, 1, #l__soundsOnBegin__26, v28 + v29 + 1, v27);
			v25 = v27;
		end;
	end;
	local function v30(p17)
		local v31 = {};
		if v22 then
			local v32 = v22:GetPrimaryPartCFrame().Position;
		else
			v32 = nil;
		end;
		v31.position = v32;
		if v22 then
			local v33 = v22.PrimaryPart;
		else
			v33 = nil;
		end;
		v31.parent = v33;
		v31.rollOffMaxDistance = 30;
		v31.volumeMultiplier = 0.5;
		local v34 = l__SoundManager__15:playSound(p17.sound, v31);
		if v34 and p17.looped then
			v34.Looped = true;
		end;
		return v34;
	end;
	local v35 = {};
	local v36 = 0;
	for v37, v38 in ipairs(v25) do
		local v39 = v30(v38, v37 - 1, v25);
		if v39 ~= nil then
			v36 = v36 + 1;
			v35[v36] = v39;
		end;
	end;
	if v35 then
		if p16 then
			local v40 = p16.UserId;
		else
			v40 = l__Players__7.LocalPlayer.UserId;
		end;
		local v41 = l__Maid__11.new();
		v41:GiveTask(function()
			local function v42(p18)
				p18:Stop();
				p18:Destroy();
			end;
			for v43, v44 in ipairs(v35) do
				v42(v44, v43 - 1, v35);
			end;
		end);
		p14.emoteSoundMaid[v40] = v41;
	end;
	return v35;
end;
function u1.playEmoteEndSounds(p19, p20, p21)
	local v45 = l__EmoteMeta__8[p20];
	local l__Character__46 = p21.Character;
	if not l__Character__46 then
		return nil;
	end;
	local v47 = v45.soundsOnEnd or {};
	if v45.emoteDisplayType ~= nil then
		local l__soundsOnEnd__48 = l__EmoteDisplayMeta__9[v45.emoteDisplayType].soundsOnEnd;
		if l__soundsOnEnd__48 then
			local v49 = {};
			local v50 = #v49;
			local v51 = #v47;
			table.move(v47, 1, v51, v50 + 1, v49);
			table.move(l__soundsOnEnd__48, 1, #l__soundsOnEnd__48, v50 + v51 + 1, v49);
			v47 = v49;
		end;
	end;
	local function v52(p22)
		if p22.sound == "" then
			return nil;
		end;
		local v53 = l__SoundManager__15:playSound(p22.sound, {
			position = l__Character__46:GetPrimaryPartCFrame().Position, 
			parent = l__Character__46.PrimaryPart, 
			rollOffMaxDistance = 30, 
			volumeMultiplier = 0.5
		});
		if v53 then
			v53.PlayOnRemove = true;
			v53:Destroy();
		end;
		return v53;
	end;
	local v54 = {};
	local v55 = 0;
	for v56, v57 in ipairs(v47) do
		local v58 = v52(v57, v56 - 1, v47);
		if v58 ~= nil then
			v55 = v55 + 1;
			v54[v55] = v58;
		end;
	end;
	return v54;
end;
local l__preloadImages__16 = v2.preloadImages;
local l__ContentProvider__17 = v4.ContentProvider;
function u1.preloadEmote(p23)
	local v59 = l__EmoteMeta__8[l__ClientStore__5:getState().Locker.selectedSpray];
	local l__image__60 = v59.image;
	if l__image__60 ~= "" and l__image__60 then
		l__preloadImages__16({ v59.image });
	end;
	task.spawn(function()
		if v59.animation then
			l__ContentProvider__17:PreloadAsync({ l__GameAnimationUtil__10.getAnimation(v59.animation.type) });
		end;
	end);
end;
function u1.playEmoteShowcase(p24, p25)
	p24.activeEmoteShowcaseSounds = p24:playEmoteBeginSounds(p25);
end;
function u1.stopEmoteShowcase(p26)
	local v61 = p26.activeEmoteShowcaseSounds;
	if v61 then
		local function v62(p27)
			p27:Stop();
			p27:Destroy();
		end;
		for v63, v64 in ipairs(v61) do
			v62(v64, v63 - 1, v61);
		end;
		p26.activeEmoteShowcaseSounds = nil;
	end;
end;
u2 = v3.KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
