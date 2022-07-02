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
		local v10, v11 = v7(v8, v9);
		if not v10 then
			break;
		end;
		if v11.menuPosition == "main" == true then
			v6 = v6 + 1;
			v5[v6] = v11;
		end;	
	end;
	local v12 = {};
	local v13 = 0;
	local v14, v15, v16 = ipairs(l__BedwarsShop__1.TeamUpgrades);
	while true do
		local v17, v18 = v14(v15, v16);
		if not v17 then
			break;
		end;
		if v18.menuPosition == "bottom" == true then
			v13 = v13 + 1;
			v12[v13] = v18;
		end;	
	end;
	local v19 = {};
	local v20 = 0;
	local v21, v22, v23 = ipairs(l__BedwarsShop__1.TeamUpgrades);
	while true do
		local v24, v25 = v21(v22, v23);
		if not v24 then
			break;
		end;
		if v25.menuPosition == "itemshop" == true then
			v20 = v20 + 1;
			v19[v20] = v25;
		end;	
	end;
	local v26 = { v3.createElement(l__DarkBackground__2, {
			AppId = p2.props.AppId
		}) };
	local v27 = {};
	local v28 = {
		Size = UDim2.fromScale(1, 1), 
		AnchorPoint = Vector2.new(0, 0), 
		Position = UDim2.fromScale(0, 0.05)
	};
	local v29 = { v3.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v30 = #v29;
	local function v31(p3, p4)
		local v32 = {
			Upgrade = p3, 
			Size = UDim2.fromScale(0.2, 1), 
			AspectRatio = 0.8275862068965517, 
			LayoutOrder = p4, 
			store = p2.props.store, 
			AutoSelect = p4 == 0
		};
		function v32.Purchased()
			local v33 = p2.props.Bedwars.teamUpgrades[p3.id];
			if v33 == nil then
				v33 = -1;
			end;
			l__default__4.Client:Get("RemoteName"):CallServerAsync({
				upgradeId = p3.id, 
				tier = v33 + 1
			}):andThen(function()
				l__SoundManager__5:playSound(l__GameSound__6.BEDWARS_UPGRADE_SUCCESS);
			end);
		end;
		return v3.createElement(l__BedwarsTeamUpgradeCard__3, v32);
	end;
	local v34 = table.create(#v5);
	for v35, v36 in ipairs(v5) do
		v34[v35] = v31(v36, v35 - 1, v5);
	end;
	local v37 = {};
	if l__DeviceUtil__7.isSmallScreen() then
		local v38 = 0.75;
	else
		v38 = 0.7;
	end;
	if l__DeviceUtil__7.isSmallScreen() then
		local v39 = 0.47;
	else
		v39 = 0.4;
	end;
	v37.Size = UDim2.fromScale(v38, v39);
	v37.Position = UDim2.fromScale(0.5, 0.08);
	v37.AnchorPoint = Vector2.new(0.5, 0);
	local v40 = { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.137931034482759, 
			DominantAxis = "Height"
		}), v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Bottom", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v41 = #v40;
	for v42, v43 in ipairs(v34) do
		v40[v41 + v42] = v43;
	end;
	v29[v30 + 1] = v3.createElement(l__Empty__8, v37, v40);
	local v44 = table.create(#v19);
	for v45, v46 in ipairs(v19) do
		v44[v45] = v3.createElement(u9, {
			Upgrade = v46, 
			LayoutOrder = v45 - 1, 
			store = p2.props.store
		});
	end;
	local v47 = {};
	if l__DeviceUtil__7.isSmallScreen() then
		local v48 = 0.75;
	else
		v48 = 0.7;
	end;
	v47.Size = UDim2.fromScale(v48, 0.25);
	local v49 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.008, 0)
		}) };
	local v50 = #v49;
	for v51, v52 in ipairs(v44) do
		v49[v50 + v51] = v52;
	end;
	local v53 = #v49;
	local v54 = l__DeviceUtil__7.isSmallScreen();
	if v54 then
		local function v55(p5, p6)
			return v3.createElement(u10, {
				Size = UDim2.fromScale(0.2, 1), 
				Upgrade = p5, 
				LayoutOrder = p6, 
				store = p2.props.store, 
				AutoSelect = p6 == 0
			});
		end;
		local v56 = table.create(#v12);
		for v57, v58 in ipairs(v12) do
			v56[v57] = v55(v58, v57 - 1, v12);
		end;
		v54 = v56;
	end;
	if v54 then
		for v59, v60 in ipairs(v54) do
			v49[v53 + v59] = v60;
		end;
	end;
	v29[v30 + 2] = v3.createElement(l__Empty__8, v47, v49);
	local v61 = not l__DeviceUtil__7.isSmallScreen();
	if v61 then
		local v62 = table.create(#v12);
		for v63, v64 in ipairs(v12) do
			local v65 = v63 - 1;
			v62[v63] = v3.createElement(u10, {
				Upgrade = v64, 
				LayoutOrder = v65, 
				store = p2.props.store, 
				AutoSelect = v65 == 0
			});
		end;
		local v66 = {
			Size = UDim2.fromScale(0.7, 0.07)
		};
		local v67 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Top", 
				Padding = UDim.new(0.008, 0)
			}) };
		local v68 = #v67;
		for v69, v70 in ipairs(v62) do
			v67[v68 + v69] = v70;
		end;
		v61 = v3.createElement(l__Empty__8, v66, v67);
	end;
	if v61 then
		v29[v30 + 3] = v61;
	end;
	v27[#v27 + 1] = v3.createElement(l__Empty__8, v28, v29);
	v26[#v26 + 1] = v3.createElement(l__SlideIn__11, {}, v27);
	return v3.createElement("ScreenGui", {}, v26);
end;
local l__Players__12 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Flamework__13 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
function v4.didMount(p7)
	local v71 = l__Players__12.LocalPlayer;
	if v71 ~= nil then
		v71 = v71.Character;
	end;
	if v71 then
		local l__Position__14 = l__Players__12.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
		v1.Promise.defer(function()
			while { wait(0.2) } and p7.alive do
				local v72 = l__Players__12.LocalPlayer.Character;
				if v72 ~= nil then
					v72 = v72:GetPrimaryPartCFrame().Position;
				end;
				local v73 = v72;
				if v73 == nil then
					v73 = Vector3.new();
				end;
				if (v73 - l__Position__14).Magnitude > 6 then
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
		local v74 = {
			Bedwars = p9.Bedwars, 
			store = p9
		};
		for v75, v76 in pairs(p10) do
			v74[v75] = v76;
		end;
		return v74;
	end)(v4)
};
