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
		local v7 = p2:playEmoteBeginSounds(p8.emote, p8.sourcePlayer);
	end);
	l__default__6.Client:OnEvent("RemoteName", function(p9)
		local v8 = p2.emoteSoundMaid[p9.sourcePlayer.UserId];
		if v8 ~= nil then
			v8:DoCleaning();
		end;
		if not p9.cancelled then
			local v9 = p2:playEmoteEndSounds(p9.emote, p9.sourcePlayer);
		end;
	end);
end;
local l__Players__7 = v3.Players;
local l__EmoteMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__EmoteDisplayMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-display-meta").EmoteDisplayMeta;
function u1.emote(p10)
	local l__LocalPlayer__10 = l__Players__7.LocalPlayer;
	if p10.emoteCooldowns:has(l__LocalPlayer__10.UserId) then
		return nil;
	end;
	p10.emoteCooldowns:add(l__LocalPlayer__10.UserId);
	local l__selectedSpray__11 = l__ClientStore__5:getState().Locker.selectedSpray;
	local v12 = l__EmoteMeta__8[l__selectedSpray__11];
	local v13 = l__default__6.Client:Get("RemoteName"):CallServer({
		emoteType = l__selectedSpray__11
	});
	local v14 = v12.animation;
	if v12.emoteDisplayType ~= nil and not v14 then
		v14 = l__EmoteDisplayMeta__9[v12.emoteDisplayType].animation;
	end;
	if v14 then
		p10:playEmoteAnimation(l__LocalPlayer__10, v14);
	end;
end;
local l__GameAnimationUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ClientSyncEvents__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__RunService__13 = v3.RunService;
function u1.playEmoteAnimation(p11, p12, p13)
	local v15 = p12.Character;
	if v15 ~= nil then
		v15 = v15.PrimaryPart;
	end;
	if not v15 then
		return nil;
	end;
	local v16 = nil;
	if not p13.noAutoPlayAnimation then
		local v17 = {};
		local v18 = p13.looped;
		if v18 == nil then
			v18 = false;
		end;
		v17.looped = v18;
		v16 = l__GameAnimationUtil__10.playAnimation(l__Players__7.LocalPlayer, p13.type, v17);
	end;
	local v19 = u11.new();
	v19:GiveTask(function()
		l__ClientSyncEvents__12.CancelEmoteEvent:fire();
		if v16 ~= nil then
			v16:Stop();
		end;
		if v16 ~= nil then
			v16:Destroy();
		end;
		l__default__6.Client:Get("RemoteName"):CallServer({
			emoteType = l__ClientStore__5:getState().Locker.selectedSpray
		});
	end);
	local l__Position__14 = v15.Position;
	v19:GiveTask(l__RunService__13.RenderStepped:Connect(function()
		if not v15.Parent then
			v19:DoCleaning();
			return nil;
		end;
		if not l__Position__14 or (v15.Position - l__Position__14).Magnitude > 0.6 then
			v19:DoCleaning();
		end;
	end));
end;
local l__SoundManager__15 = v2.SoundManager;
function u1.playEmoteBeginSounds(p14, p15, p16)
	local v20 = l__EmoteMeta__8[p15];
	local v21 = p16;
	if v21 ~= nil then
		v21 = v21.Character;
	end;
	if p16 then
		local v22 = p16;
		if v22 ~= nil then
			v22 = v22.UserId;
		end;
		local v23 = p14.emoteSoundMaid[v22];
		if v23 ~= nil then
			v23:DoCleaning();
		end;
	end;
	local v24 = v20.soundsOnBegin or {};
	if v20.emoteDisplayType ~= nil then
		local l__soundsOnBegin__25 = l__EmoteDisplayMeta__9[v20.emoteDisplayType].soundsOnBegin;
		if l__soundsOnBegin__25 then
			local v26 = {};
			local v27 = #v26;
			local v28 = #v24;
			table.move(v24, 1, v28, v27 + 1, v26);
			table.move(l__soundsOnBegin__25, 1, #l__soundsOnBegin__25, v27 + v28 + 1, v26);
			v24 = v26;
		end;
	end;
	local function v29(p17)
		local v30 = {};
		if v21 then
			local v31 = v21:GetPrimaryPartCFrame().Position;
		else
			v31 = nil;
		end;
		v30.position = v31;
		if v21 then
			local v32 = v21.PrimaryPart;
		else
			v32 = nil;
		end;
		v30.parent = v32;
		v30.rollOffMaxDistance = 30;
		v30.volumeMultiplier = 0.5;
		local v33 = l__SoundManager__15:playSound(p17.sound, v30);
		if v33 and p17.looped then
			v33.Looped = true;
		end;
		return v33;
	end;
	local v34 = {};
	local v35 = 0;
	for v36, v37 in ipairs(v24) do
		local v38 = v29(v37, v36 - 1, v24);
		if v38 ~= nil then
			v35 = v35 + 1;
			v34[v35] = v38;
		end;
	end;
	if v34 then
		if p16 then
			local v39 = p16.UserId;
		else
			v39 = l__Players__7.LocalPlayer.UserId;
		end;
		local v40 = u11.new();
		v40:GiveTask(function()
			local function v41(p18)
				p18:Stop();
				p18:Destroy();
			end;
			for v42, v43 in ipairs(v34) do
				v41(v43, v42 - 1, v34);
			end;
		end);
		p14.emoteSoundMaid[v39] = v40;
	end;
	return v34;
end;
function u1.playEmoteEndSounds(p19, p20, p21)
	local v44 = l__EmoteMeta__8[p20];
	local l__Character__45 = p21.Character;
	if not l__Character__45 then
		return nil;
	end;
	local v46 = v44.soundsOnEnd or {};
	if v44.emoteDisplayType ~= nil then
		local l__soundsOnEnd__47 = l__EmoteDisplayMeta__9[v44.emoteDisplayType].soundsOnEnd;
		if l__soundsOnEnd__47 then
			local v48 = {};
			local v49 = #v48;
			local v50 = #v46;
			table.move(v46, 1, v50, v49 + 1, v48);
			table.move(l__soundsOnEnd__47, 1, #l__soundsOnEnd__47, v49 + v50 + 1, v48);
			v46 = v48;
		end;
	end;
	local function v51(p22)
		if p22.sound == "" then
			return nil;
		end;
		local v52 = l__SoundManager__15:playSound(p22.sound, {
			position = l__Character__45:GetPrimaryPartCFrame().Position, 
			parent = l__Character__45.PrimaryPart, 
			rollOffMaxDistance = 30, 
			volumeMultiplier = 0.5
		});
		if v52 then
			v52.PlayOnRemove = true;
			v52:Destroy();
		end;
		return v52;
	end;
	local v53 = {};
	local v54 = 0;
	for v55, v56 in ipairs(v46) do
		local v57 = v51(v56, v55 - 1, v46);
		if v57 ~= nil then
			v54 = v54 + 1;
			v53[v54] = v57;
		end;
	end;
	return v53;
end;
local l__preloadImages__16 = v2.preloadImages;
local l__ContentProvider__17 = v3.ContentProvider;
function u1.preloadEmote(p23)
	local v58 = l__EmoteMeta__8[l__ClientStore__5:getState().Locker.selectedSpray];
	local l__image__59 = v58.image;
	if l__image__59 ~= "" and l__image__59 then
		l__preloadImages__16({ v58.image });
	end;
	task.spawn(function()
		if v58.animation then
			l__ContentProvider__17:PreloadAsync({ l__GameAnimationUtil__10.getAnimation(v58.animation.type) });
		end;
	end);
end;
function u1.playEmoteShowcase(p24, p25)
	p24.activeEmoteShowcaseSounds = p24:playEmoteBeginSounds(p25);
end;
function u1.stopEmoteShowcase(p26)
	local v60 = p26.activeEmoteShowcaseSounds;
	if v60 then
		local function v61(p27)
			p27:Stop();
			p27:Destroy();
		end;
		for v62, v63 in ipairs(v60) do
			v61(v63, v62 - 1, v60);
		end;
		p26.activeEmoteShowcaseSounds = nil;
	end;
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
