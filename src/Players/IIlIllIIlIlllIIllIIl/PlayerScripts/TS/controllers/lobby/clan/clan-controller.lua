-- Script Hash: 564f9718cc37523c9a1c33366049ba3962da349b9577950fe5970d611ed77b717976f333f09f56baaa069aa683b3508a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "ClanController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "ClanController";
	p1.clansRemotes = l__default__2.Client:GetNamespace("Clans");
end;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ClientStore__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BedwarsImageId__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__9 = v2.ColorUtil;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Players__11 = v3.Players;
local l__ClanUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:GetNamespace("Clans"):OnEvent("ClanUpdate", function(p3)
		local v7 = p3.newClan and p3.clanId;
		if v7 ~= "" and v7 then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__4.CLAN_PROFILE, {
				ClanId = p3.clanId, 
				newClan = true
			});
			l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_UPGRADE_SUCCESS);
		end;
		l__ClientStore__7:dispatch({
			type = "ClanUpdate", 
			myClanId = p3.clanId, 
			myClan = p3.clanProfile, 
			me = p3.me
		});
		if p3.clanId == nil then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__4.CLAN_PROFILE);
		end;
	end);
	l__default__2.Client:GetNamespace("Clans"):OnEvent("ClanInvite", function(p4)
		l__ClientStore__7:dispatch({
			type = "ClanInviteIncoming", 
			clanId = p4.clanId, 
			clanProfile = p4.clanProfile
		});
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
			image = l__BedwarsImageId__8.CLAN, 
			message = "<b>Clan <font color=\"" .. l__ColorUtil__9.richTextColor(l__Theme__10.mcAqua) .. "\">[" .. p4.clanProfile.tag .. "]</font> has sent you an invite!</b>", 
			onClick = function()
				l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__4.CLAN_MENU, {});
			end
		});
	end);
	l__default__2.Client:GetNamespace("Clans"):OnEvent("OpenClanMenu", function(p5)
		if p5.open then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__4.CLAN_MENU, {});
			return;
		end;
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__4.CLAN_MENU);
	end);
	l__Players__11.LocalPlayer:GetAttributeChangedSignal("ClanPassPaid"):Connect(function()
		l__ClientStore__7:dispatch({
			type = "ClanSetClanPassPaid", 
			paid = l__ClanUtil__12.hasClanPass(l__Players__11.LocalPlayer)
		});
	end);
end;
v5.submitClanCreateForm = v1.async(function(p6, p7)
	return v1.await(p6.clansRemotes:Get("SubmitClanCreateForm"):CallServerAsync(p7):andThen(function(p8)
		return p8;
	end));
end);
local l__MarketplaceService__13 = v3.MarketplaceService;
local l__Gamepass__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
function v5.promptClanPassPurchase(p9)
	if not l__ClanUtil__12.hasClanPass(l__Players__11.LocalPlayer) then
		l__MarketplaceService__13:PromptGamePassPurchase(l__Players__11.LocalPlayer, l__Gamepass__14.CLAN_CREATE_PASS);
	end;
end;
function v5.fetchClanDisplay(p10, p11)
	local v8 = p10.clansRemotes:Get("FetchClanGuestView"):CallServer(p11);
	if v8 ~= nil then
		v8 = v8.clanProfile;
	end;
	return v8;
end;
function v5.promoteMember(p12, p13, p14)
	return p12.clansRemotes:Get("PromoteMember"):CallServerAsync(p13, p14);
end;
function v5.demoteMember(p15, p16, p17)
	return p15.clansRemotes:Get("DemoteMember"):CallServerAsync(p16, p17);
end;
function v5.kickPlayer(p18, p19, p20)
	return p18.clansRemotes:Get("KickMember"):CallServerAsync(p19, p20);
end;
v5.upgrade = v1.async(function(p21, p22, p23)
	return p21.clansRemotes:Get("Upgrade"):CallServerAsync(p22, p23);
end);
function v5.updateClanInfo(p24, p25, p26)
	return p24.clansRemotes:Get("UpdateClanInfo"):CallServerAsync(p25, p26);
end;
function v5.deleteClan(p27, p28)
	if p27.clansRemotes:Get("DeleteClan"):CallServer(p28) then
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__4.CLAN_PROFILE);
		l__SoundManager__5:playSound(l__GameSound__6.ARMOR_UNEQUIP);
	end;
end;
local l__UILayers__15 = v2.UILayers;
function v5.leaveClan(p29)
	local v9 = {
		Title = "Leave Clan?", 
		Body = "Are you sure you want to leave this clan? You can't undo this action.", 
		PrimaryBtnProps = {
			Text = "Leave", 
			BackgroundColor3 = l__Theme__10.backgroundError
		}, 
		SecondaryBtnProps = {
			Text = "Cancel"
		}
	};
	function v9.OnPrimaryBtnClick()
		if not p29.clansRemotes:Get("LeaveClan"):CallServer() then
			l__SoundManager__5:playSound(l__GameSound__6.ERROR_NOTIFICATION);
			return;
		end;
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__4.CLAN_PROFILE);
		l__SoundManager__5:playSound(l__GameSound__6.ARMOR_UNEQUIP);
	end;
	function v9.OnSecondaryBtnClick()
		l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__15.OVERLAY);
	end;
	l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__4.CONFIRMATION_MODAL, v9);
end;
function v5.invitePlayerToClan(p30, p31, p32)
	p30.clansRemotes:Get("InvitePlayerToClan"):CallServer(p31, p32);
end;
function v5.clanInviteDecision(p33, p34, p35)
	p33.clansRemotes:Get("ClanInviteDecision"):CallServerAsync(p34, p35):andThen(function(p36)
		local v10 = p36.joinedClan and p36.clanId;
		if v10 ~= "" and v10 and not l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(l__BedwarsAppIds__4.CLAN_PROFILE) then
			l__Flamework__3.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__4.CLAN_PROFILE, {
				ClanId = p36.clanId
			});
		end;
	end):catch(function(p37)
		return print("[ClanInviteDecision Error]", p37);
	end);
	l__ClientStore__7:dispatch({
		type = "ClanInviteDelete", 
		clanId = p34
	});
end;
function v5.kitShopPurchase(p38, p39)
	local v11 = p38.clansRemotes:Get("KitShopPurchase"):CallServerAsync(p39);
	v11:andThen(function(p40)
		if p40 then
			l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_UPGRADE_SUCCESS);
		end;
	end);
	return v11;
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
