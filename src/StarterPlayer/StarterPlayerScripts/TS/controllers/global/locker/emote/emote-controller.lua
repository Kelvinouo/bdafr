-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "EmoteController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
local l__ExpireList__3 = v2.ExpireList;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "EmoteController";
	p1.emoteSoundMaid = {};
	p1.emoteCooldowns = l__ExpireList__3.new(2);
end;
local l__ContextActionService__4 = v3.ContextActionService;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__EmoteType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__preloadImages__7 = v2.preloadImages;
local l__BedwarsImageId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__default__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
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
			if p6.Locker.selectedSpray == l__EmoteType__6.ROCK_PAPER_SCISSORS then
				l__preloadImages__7({ l__BedwarsImageId__8.HAND_FIST_ICON, l__BedwarsImageId__8.HAND_SCISSOR_ICON, l__BedwarsImageId__8.HAND_STOP_ICON });
			end;
		end;
	end);
	l__default__9.Client:OnEvent("RemoteName", function(p8)
		local v7 = p2:playEmoteBeginSounds(p8.emote, p8.sourcePlayer);
	end);
	l__default__9.Client:OnEvent("RemoteName", function(p9)
		local v8 = p2.emoteSoundMaid[p9.sourcePlayer.UserId];
		if v8 ~= nil then
			v8:DoCleaning();
		end;
		if not p9.cancelled then
			local v9 = p2:playEmoteEndSounds(p9.emote, p9.sourcePlayer);
		end;
	end);
end;
local l__Players__10 = v3.Players;
local l__EmoteMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__EmoteDisplayMeta__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-display-meta").EmoteDisplayMeta;
function u1.emote(p10)
	local l__LocalPlayer__10 = l__Players__10.LocalPlayer;
	if p10.emoteCooldowns:has(l__LocalPlayer__10.UserId) then
		return nil;
	end;
	p10.emoteCooldowns:add(l__LocalPlayer__10.UserId);
	local l__selectedSpray__11 = l__ClientStore__5:getState().Locker.selectedSpray;
	local v12 = l__EmoteMeta__11[l__selectedSpray__11];
	local v13 = l__default__9.Client:Get("RemoteName"):CallServer({
		emoteType = l__selectedSpray__11
	});
	local v14 = v12.animation;
	if v12.emoteDisplayType ~= nil and not v14 then
		v14 = l__EmoteDisplayMeta__12[v12.emoteDisplayType].animation;
	end;
	if v14 then
		p10:playEmoteAnimation(l__LocalPlayer__10, v14);
	end;
end;
function u1.getPlayingEmote(p11, p12)
	local l__Character__15 = p12.Character;
	if not l__Character__15 then
		return;
	end;
	return l__Character__15:GetAttribute("PlayingEmote");
end;
local l__GameAnimationUtil__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ClientSyncEvents__15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__RunService__16 = v3.RunService;
function u1.playEmoteAnimation(p13, p14, p15)
	local v16 = p14.Character;
	if v16 ~= nil then
		v16 = v16.PrimaryPart;
	end;
	if not v16 then
		return nil;
	end;
	local v17 = nil;
	if not p15.noAutoPlayAnimation then
		local v18 = {};
		local v19 = p15.looped;
		if v19 == nil then
			v19 = false;
		end;
		v18.looped = v19;
		v17 = l__GameAnimationUtil__13.playAnimation(l__Players__10.LocalPlayer, p15.type, v18);
	end;
	local v20 = u14.new();
	v20:GiveTask(function()
		l__ClientSyncEvents__15.CancelEmoteEvent:fire();
		if v17 ~= nil then
			v17:Stop();
		end;
		if v17 ~= nil then
			v17:Destroy();
		end;
		l__default__9.Client:Get("RemoteName"):CallServer({
			emoteType = l__ClientStore__5:getState().Locker.selectedSpray
		});
	end);
	local v21 = v17;
	if v21 ~= nil then
		v21 = v21.Looped;
	end;
	if not v21 then
		local v22 = v17;
		if v22 ~= nil then
			local u17 = nil;
			v22 = v22.Stopped:Connect(function()
				v20:DoCleaning();
				if u17 ~= nil then
					u17:Disconnect();
				end;
			end);
		end;
	end;
	local l__Position__18 = v16.Position;
	v20:GiveTask(l__RunService__16.RenderStepped:Connect(function()
		if not v16.Parent then
			v20:DoCleaning();
			return nil;
		end;
		if not l__Position__18 or (v16.Position - l__Position__18).Magnitude > 0.6 then
			v20:DoCleaning();
		end;
	end));
end;
local l__SoundManager__19 = v2.SoundManager;
function u1.playEmoteBeginSounds(p16, p17, p18)
	local v23 = l__EmoteMeta__11[p17];
	local v24 = p18;
	if v24 ~= nil then
		v24 = v24.Character;
	end;
	if p18 then
		local v25 = p18;
		if v25 ~= nil then
			v25 = v25.UserId;
		end;
		local v26 = p16.emoteSoundMaid[v25];
		if v26 ~= nil then
			v26:DoCleaning();
		end;
	end;
	local v27 = v23.soundsOnBegin or {};
	if v23.emoteDisplayType ~= nil then
		local l__soundsOnBegin__28 = l__EmoteDisplayMeta__12[v23.emoteDisplayType].soundsOnBegin;
		if l__soundsOnBegin__28 then
			local v29 = {};
			local v30 = #v29;
			local v31 = #v27;
			table.move(v27, 1, v31, v30 + 1, v29);
			table.move(l__soundsOnBegin__28, 1, #l__soundsOnBegin__28, v30 + v31 + 1, v29);
			v27 = v29;
		end;
	end;
	local function v32(p19)
		local v33 = {};
		if v24 then
			local v34 = v24:GetPrimaryPartCFrame().Position;
		else
			v34 = nil;
		end;
		v33.position = v34;
		if v24 then
			local v35 = v24.PrimaryPart;
		else
			v35 = nil;
		end;
		v33.parent = v35;
		v33.rollOffMaxDistance = 30;
		v33.volumeMultiplier = 0.5;
		local v36 = l__SoundManager__19:playSound(p19.sound, v33);
		if v36 and p19.looped then
			v36.Looped = true;
		end;
		return v36;
	end;
	local v37 = {};
	local v38 = 0;
	for v39, v40 in ipairs(v27) do
		local v41 = v32(v40, v39 - 1, v27);
		if v41 ~= nil then
			v38 = v38 + 1;
			v37[v38] = v41;
		end;
	end;
	if v37 then
		if p18 then
			local v42 = p18.UserId;
		else
			v42 = l__Players__10.LocalPlayer.UserId;
		end;
		local v43 = u14.new();
		v43:GiveTask(function()
			local function v44(p20)
				p20:Stop();
				p20:Destroy();
			end;
			for v45, v46 in ipairs(v37) do
				v44(v46, v45 - 1, v37);
			end;
		end);
		p16.emoteSoundMaid[v42] = v43;
	end;
	return v37;
end;
function u1.playEmoteEndSounds(p21, p22, p23)
	local v47 = l__EmoteMeta__11[p22];
	local l__Character__48 = p23.Character;
	if not l__Character__48 then
		return nil;
	end;
	local v49 = v47.soundsOnEnd or {};
	if v47.emoteDisplayType ~= nil then
		local l__soundsOnEnd__50 = l__EmoteDisplayMeta__12[v47.emoteDisplayType].soundsOnEnd;
		if l__soundsOnEnd__50 then
			local v51 = {};
			local v52 = #v51;
			local v53 = #v49;
			table.move(v49, 1, v53, v52 + 1, v51);
			table.move(l__soundsOnEnd__50, 1, #l__soundsOnEnd__50, v52 + v53 + 1, v51);
			v49 = v51;
		end;
	end;
	local function v54(p24)
		if p24.sound == "" then
			return nil;
		end;
		local v55 = l__SoundManager__19:playSound(p24.sound, {
			position = l__Character__48:GetPrimaryPartCFrame().Position, 
			parent = l__Character__48.PrimaryPart, 
			rollOffMaxDistance = 30, 
			volumeMultiplier = 0.5
		});
		if v55 then
			v55.PlayOnRemove = true;
			v55:Destroy();
		end;
		return v55;
	end;
	local v56 = {};
	local v57 = 0;
	for v58, v59 in ipairs(v49) do
		local v60 = v54(v59, v58 - 1, v49);
		if v60 ~= nil then
			v57 = v57 + 1;
			v56[v57] = v60;
		end;
	end;
	return v56;
end;
local l__ContentProvider__20 = v3.ContentProvider;
function u1.preloadEmote(p25)
	local v61 = l__EmoteMeta__11[l__ClientStore__5:getState().Locker.selectedSpray];
	local l__image__62 = v61.image;
	if l__image__62 ~= "" and l__image__62 then
		l__preloadImages__7({ v61.image });
	end;
	task.spawn(function()
		if v61.animation then
			l__ContentProvider__20:PreloadAsync({ l__GameAnimationUtil__13.getAnimation(v61.animation.type) });
		end;
	end);
end;
function u1.playEmoteShowcase(p26, p27)
	p26.activeEmoteShowcaseSounds = p26:playEmoteBeginSounds(p27);
end;
function u1.stopEmoteShowcase(p28)
	local v63 = p28.activeEmoteShowcaseSounds;
	if v63 then
		local function v64(p29)
			p29:Stop();
			p29:Destroy();
		end;
		for v65, v66 in ipairs(v63) do
			v64(v66, v65 - 1, v63);
		end;
		p28.activeEmoteShowcaseSounds = nil;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
