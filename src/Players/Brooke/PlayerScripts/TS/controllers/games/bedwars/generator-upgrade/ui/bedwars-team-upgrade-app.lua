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
	local v5 = {};
	local v6 = 0;
	local v7, v8, v9 = ipairs(l__BedwarsShop__1.TeamUpgrades);
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		if v8.menuPosition == "main" == true then
			v6 = v6 + 1;
			v5[v6] = v8;
		end;	
	end;
	local v10 = {};
	local v11 = 0;
	local v12, v13, v14 = ipairs(l__BedwarsShop__1.TeamUpgrades);
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		if v13.menuPosition == "bottom" == true then
			v11 = v11 + 1;
			v10[v11] = v13;
		end;	
	end;
	local v15 = {};
	local v16 = 0;
	local v17, v18, v19 = ipairs(l__BedwarsShop__1.TeamUpgrades);
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		if v18.menuPosition == "itemshop" == true then
			v16 = v16 + 1;
			v15[v16] = v18;
		end;	
	end;
	local v20 = { v3.createElement(l__DarkBackground__2, {
			AppId = p2.props.AppId
		}) };
	local v21 = {};
	local v22 = {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0, 0), 
		Position = UDim2.fromScale(0, 0.05)
	};
	local v23 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v24 = #v23;
	local function v25(p3, p4)
		local v26 = {
			Upgrade = p3, 
			Size = UDim2.fromScale(0.2, 1), 
			AspectRatio = 0.8275862068965517, 
			LayoutOrder = p4, 
			store = p2.props.store, 
			AutoSelect = p4 == 0
		};
		function v26.Purchased()
			local v27 = p2.props.Bedwars.teamUpgrades[p3.id];
			if v27 == nil then
				v27 = -1;
			end;
			l__default__4.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = p3.id, 
				tier = v27 + 1
			}):andThen(function()
				l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		return v3.createElement(l__BedwarsTeamUpgradeCard__3, v26);
	end;
	local v28 = table.create(#v5);
	local v29, v30, v31 = ipairs(v5);
	while true do
		v29(v30, v31);
		if not v29 then
			break;
		end;
		v31 = v29;
		v28[v29] = v25(v30, v29 - 1, v5);	
	end;
	local v32 = {};
	if l__DeviceUtil__7.isSmallScreen() then
		local v33 = 0.75;
	else
		v33 = 0.7;
	end;
	if l__DeviceUtil__7.isSmallScreen() then
		local v34 = 0.47;
	else
		v34 = 0.4;
	end;
	v32.Size = UDim2.fromScale(v33, v34);
	v32.Position = UDim2.fromScale(0.5, 0.08);
	v32.AnchorPoint = Vector2.new(0.5, 0);
	local v35 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.137931034482759, 
			DominantAxis = "Height"
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Bottom", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v36 = #v35;
	local v37, v38, v39 = ipairs(v28);
	while true do
		v37(v38, v39);
		if not v37 then
			break;
		end;
		v39 = v37;
		v35[v36 + v37] = v38;	
	end;
	v23[v24 + 1] = v3.createElement(l__Empty__8, v32, v35);
	local v40 = table.create(#v15);
	local v41, v42, v43 = ipairs(v15);
	while true do
		v41(v42, v43);
		if not v41 then
			break;
		end;
		v43 = v41;
		v40[v41] = v3.createElement(u9, {
			Upgrade = v42, 
			LayoutOrder = v41 - 1, 
			store = p2.props.store
		});	
	end;
	local v44 = {};
	if l__DeviceUtil__7.isSmallScreen() then
		local v45 = 0.75;
	else
		v45 = 0.7;
	end;
	v44.Size = UDim2.fromScale(v45, 0.25);
	local v46 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v47 = #v46;
	local v48, v49, v50 = ipairs(v40);
	while true do
		v48(v49, v50);
		if not v48 then
			break;
		end;
		v50 = v48;
		v46[v47 + v48] = v49;	
	end;
	local v51 = #v46;
	local v52 = l__DeviceUtil__7.isSmallScreen();
	if v52 then
		local function v53(p5, p6)
			return v3.createElement(u10, {
				Size = UDim2.fromScale(0.2, 1), 
				Upgrade = p5, 
				LayoutOrder = p6, 
				store = p2.props.store, 
				AutoSelect = p6 == 0
			});
		end;
		local v54 = table.create(#v10);
		local v55, v56, v57 = ipairs(v10);
		while true do
			v55(v56, v57);
			if not v55 then
				break;
			end;
			v57 = v55;
			v54[v55] = v53(v56, v55 - 1, v10);		
		end;
		v52 = v54;
	end;
	if v52 then
		local v58, v59, v60 = ipairs(v52);
		while true do
			v58(v59, v60);
			if not v58 then
				break;
			end;
			v60 = v58;
			v46[v51 + v58] = v59;		
		end;
	end;
	v23[v24 + 2] = v3.createElement(l__Empty__8, v44, v46);
	local v61 = not l__DeviceUtil__7.isSmallScreen();
	if v61 then
		local v62 = table.create(#v10);
		local v63, v64, v65 = ipairs(v10);
		while true do
			v63(v64, v65);
			if not v63 then
				break;
			end;
			v65 = v63;
			local v66 = v63 - 1;
			v62[v63] = v3.createElement(u10, {
				Upgrade = v64, 
				LayoutOrder = v66, 
				store = p2.props.store, 
				AutoSelect = v66 == 0
			});		
		end;
		local v67 = {
			Size = UDim2.fromScale(0.7, 0.07)
		};
		local v68 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Top", 
				Padding = UDim.new(0.008, 0)
			}) };
		local v69 = #v68;
		local v70, v71, v72 = ipairs(v62);
		while true do
			v70(v71, v72);
			if not v70 then
				break;
			end;
			v72 = v70;
			v68[v69 + v70] = v71;		
		end;
		v61 = v3.createElement(l__Empty__8, v67, v68);
	end;
	if v61 then
		v23[v24 + 3] = v61;
	end;
	v21[#v21 + 1] = v3.createElement(l__Empty__8, v22, v23);
	v20[#v20 + 1] = v3.createElement(l__SlideIn__11, {}, v21);
	return v3.createElement("ScreenGui", {}, v20);
end;
local l__Players__12 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.didMount(p7)
	local v73 = l__Players__12.LocalPlayer;
	if v73 ~= nil then
		v73 = v73.Character;
	end;
	if v73 then
		local l__Position__14 = l__Players__12.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		v1.Promise.defer(function()
			while { wait(0.2) } and p7.alive do
				local v74 = l__Players__12.LocalPlayer.Character;
				if v74 ~= nil then
					v74 = v74:GetPrimaryPartCFrame().Position;
				end;
				local v75 = v74;
				if v75 == nil then
					v75 = Vector3.new();
				end;
				if (v75 - l__Position__14).Magnitude > 6 then
					l__Flamework__13.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p7.props.AppId);
				end;			
			end;
		end);
	end;
end;
function v4.willUnmount(p8)
	p8.alive = false;
end;
return {
	BedwarsTeamUpgradeApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p9, p10)
		local v76 = {
			Bedwars = p9.Bedwars, 
			store = p9
		};
		for v77, v78 in pairs(p10) do
			v76[v77] = v78;
		end;
		return v76;
	end)(v4)
};
