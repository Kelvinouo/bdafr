-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("BedwarsTeamUpgradeAppBase");
function v4.init(p1)
	p1.alive = true;
end;
local l__BedwarsShop__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__DarkBackground__2 = v2.DarkBackground;
local l__BedwarsTeamUpgradeCard__3 = v1.import(script, script.Parent, "bedwars-team-upgrade-card").BedwarsTeamUpgradeCard;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__DeviceUtil__7 = v2.DeviceUtil;
local l__Empty__8 = v2.Empty;
local u9 = v1.import(script, script.Parent, "bedwars-team-upgrade-item-shop").BedwarsTeamUpgradeItemShop;
local u10 = v1.import(script, script.Parent, "bedwars-team-upgrade-consumable").BedWarsTeamUpgradeConsumable;
local l__SlideIn__11 = v2.SlideIn;
function v4.render(p2)
	local l__TeamUpgrades__5 = l__BedwarsShop__1.TeamUpgrades;
	local function v6(p3)
		return p3.menuPosition == "main";
	end;
	local v7 = {};
	local v8 = 0;
	for v9, v10 in ipairs(l__TeamUpgrades__5) do
		if v6(v10, v9 - 1, l__TeamUpgrades__5) == true then
			v8 = v8 + 1;
			v7[v8] = v10;
		end;
	end;
	local l__TeamUpgrades__11 = l__BedwarsShop__1.TeamUpgrades;
	local function v12(p4)
		return p4.menuPosition == "bottom";
	end;
	local v13 = {};
	local v14 = 0;
	for v15, v16 in ipairs(l__TeamUpgrades__11) do
		if v12(v16, v15 - 1, l__TeamUpgrades__11) == true then
			v14 = v14 + 1;
			v13[v14] = v16;
		end;
	end;
	local l__TeamUpgrades__17 = l__BedwarsShop__1.TeamUpgrades;
	local function v18(p5)
		return p5.menuPosition == "itemshop";
	end;
	local v19 = {};
	local v20 = 0;
	for v21, v22 in ipairs(l__TeamUpgrades__17) do
		if v18(v22, v21 - 1, l__TeamUpgrades__17) == true then
			v20 = v20 + 1;
			v19[v20] = v22;
		end;
	end;
	local v23 = { v3.createElement(l__DarkBackground__2, {
			AppId = p2.props.AppId
		}) };
	local v24 = {};
	local v25 = {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0, 0), 
		Position = UDim2.fromScale(0, 0.05)
	};
	local v26 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v27 = #v26;
	local function v28(p6, p7)
		local v29 = {
			Upgrade = p6, 
			Size = UDim2.fromScale(0.2, 1), 
			AspectRatio = 0.8275862068965517, 
			LayoutOrder = p7, 
			store = p2.props.store, 
			AutoSelect = p7 == 0
		};
		function v29.Purchased()
			local v30 = p2.props.Bedwars.teamUpgrades[p6.id];
			if v30 == nil then
				v30 = -1;
			end;
			l__default__4.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = p6.id, 
				tier = v30 + 1
			}):andThen(function()
				l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		return v3.createElement(l__BedwarsTeamUpgradeCard__3, v29);
	end;
	local v31 = table.create(#v7);
	for v32, v33 in ipairs(v7) do
		v31[v32] = v28(v33, v32 - 1, v7);
	end;
	local v34 = {};
	if l__DeviceUtil__7.isSmallScreen() then
		local v35 = 0.75;
	else
		v35 = 0.7;
	end;
	if l__DeviceUtil__7.isSmallScreen() then
		local v36 = 0.47;
	else
		v36 = 0.4;
	end;
	v34.Size = UDim2.fromScale(v35, v36);
	v34.Position = UDim2.fromScale(0.5, 0.08);
	v34.AnchorPoint = Vector2.new(0.5, 0);
	local v37 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.137931034482759, 
			DominantAxis = "Height"
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Bottom", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v38 = #v37;
	for v39, v40 in ipairs(v31) do
		v37[v38 + v39] = v40;
	end;
	v26[v27 + 1] = v3.createElement(l__Empty__8, v34, v37);
	local function v41(p8, p9)
		return v3.createElement(u9, {
			Upgrade = p8, 
			LayoutOrder = p9, 
			store = p2.props.store
		});
	end;
	local v42 = table.create(#v19);
	for v43, v44 in ipairs(v19) do
		v42[v43] = v41(v44, v43 - 1, v19);
	end;
	local v45 = {};
	if l__DeviceUtil__7.isSmallScreen() then
		local v46 = 0.75;
	else
		v46 = 0.7;
	end;
	v45.Size = UDim2.fromScale(v46, 0.25);
	local v47 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v48 = #v47;
	for v49, v50 in ipairs(v42) do
		v47[v48 + v49] = v50;
	end;
	local v51 = #v47;
	local v52 = l__DeviceUtil__7.isSmallScreen();
	if v52 then
		local function v53(p10, p11)
			return v3.createElement(u10, {
				Size = UDim2.fromScale(0.2, 1), 
				Upgrade = p10, 
				LayoutOrder = p11, 
				store = p2.props.store, 
				AutoSelect = p11 == 0
			});
		end;
		local v54 = table.create(#v13);
		for v55, v56 in ipairs(v13) do
			v54[v55] = v53(v56, v55 - 1, v13);
		end;
		v52 = v54;
	end;
	if v52 then
		for v57, v58 in ipairs(v52) do
			v47[v51 + v57] = v58;
		end;
	end;
	v26[v27 + 2] = v3.createElement(l__Empty__8, v45, v47);
	local v59 = not l__DeviceUtil__7.isSmallScreen();
	if v59 then
		local function v60(p12, p13)
			return v3.createElement(u10, {
				Upgrade = p12, 
				LayoutOrder = p13, 
				store = p2.props.store, 
				AutoSelect = p13 == 0
			});
		end;
		local v61 = table.create(#v13);
		for v62, v63 in ipairs(v13) do
			v61[v62] = v60(v63, v62 - 1, v13);
		end;
		local v64 = {
			Size = UDim2.fromScale(0.7, 0.07)
		};
		local v65 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Top", 
				Padding = UDim.new(0.008, 0)
			}) };
		local v66 = #v65;
		for v67, v68 in ipairs(v61) do
			v65[v66 + v67] = v68;
		end;
		v59 = v3.createElement(l__Empty__8, v64, v65);
	end;
	if v59 then
		v26[v27 + 3] = v59;
	end;
	v24[#v24 + 1] = v3.createElement(l__Empty__8, v25, v26);
	v23[#v23 + 1] = v3.createElement(l__SlideIn__11, {}, v24);
	return v3.createElement("ScreenGui", {}, v23);
end;
local l__Players__12 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.didMount(p14)
	local v69 = l__Players__12.LocalPlayer;
	if v69 ~= nil then
		v69 = v69.Character;
	end;
	if v69 then
		local l__Position__14 = l__Players__12.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		v1.Promise.defer(function()
			while { wait(0.2) } and p14.alive do
				local v70 = l__Players__12.LocalPlayer.Character;
				if v70 ~= nil then
					v70 = v70:GetPrimaryPartCFrame().Position;
				end;
				local v71 = v70;
				if v71 == nil then
					v71 = Vector3.new();
				end;
				if (v71 - l__Position__14).Magnitude > 6 then
					l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p14.props.AppId);
				end;			
			end;
		end);
	end;
end;
function v4.willUnmount(p15)
	p15.alive = false;
end;
return {
	BedwarsTeamUpgradeApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p16, p17)
		local v72 = {
			Bedwars = p16.Bedwars, 
			store = p16
		};
		for v73, v74 in pairs(p17) do
			v72[v73] = v74;
		end;
		return v72;
	end)(v4)
};
