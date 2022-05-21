-- Script Hash: 59874288cc7c8c616903b4434e20cedbda73ccc42afc70bae3fe9fee3d6f94adfc3297610dd56ed89135939e118c3729
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit");
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta");
local l__getBedwarsKitMeta__1 = v4.getBedwarsKitMeta;
local l__BundleMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local l__BedwarsKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__BedwarsKitMeta__6 = v4.BedwarsKitMeta;
local l__BattlePassUtils__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsBPKits__9 = v3.BedwarsBPKits;
local l__BundleType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitShopFilters__13 = v1.import(script, script.Parent.Parent, "filters", "kit-shop-filters").KitShopFilters;
local l__AutoCompleteSearchbar__14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local l__KitShopItemCard__15 = v1.import(script, script.Parent, "kit-shop-item-card").KitShopItemCard;
local l__KitShopBundleCard__16 = v1.import(script, script.Parent, "kit-shop-bundle-card").KitShopBundleCard;
local l__BedwarsKit__17 = v3.BedwarsKit;
local l__Empty__18 = v2.Empty;
return {
	KitShopItemList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u12)(function(p1, p2)
		local v5 = nil;
		local l__useState__6 = p2.useState;
		local l__useEffect__7 = p2.useEffect;
		local v8, v9 = l__useState__6(Vector2.new(584, 443));
		local v10, v11 = l__useState__6(443);
		local v12, v13 = l__useState__6(false);
		local v14, v15 = l__useState__6(false);
		local v16, v17 = l__useState__6({});
		local v18, v19 = l__useState__6({});
		local v20, v21 = l__useState__6({});
		local v22 = math.floor(v8.X * 0.2191780821917808);
		local v23 = math.floor(v8.X * 0.03571428571428571);
		local function u19()
			if #v20 == 0 then
				local v24 = v16;
			else
				v24 = v20;
			end;
			if v14 then
				local function v25(p3)
					if p3.bedwarsKit then
						return l__getBedwarsKitMeta__1(p3.bedwarsKit).unlockedInBattlePass;
					end;
					if not p3.kitBundle then
						return false;
					end;
					return l__BundleMeta__2[p3.kitBundle].battlepass ~= nil;
				end;
				local v26 = {};
				local v27 = 0;
				for v28, v29 in ipairs(v24) do
					if v25(v29, v28 - 1, v24) == true then
						v27 = v27 + 1;
						v26[v27] = v29;
					end;
				end;
				v24 = v26;
			end;
			if v12 then
				local l__ownedKits__20 = p1.store.Bedwars.ownedKits;
				local function v30(p4)
					if not p4.bedwarsKit then
						return false;
					end;
					return table.find(l__ownedKits__20, p4.bedwarsKit) ~= nil;
				end;
				local v31 = {};
				local v32 = 0;
				for v33, v34 in ipairs(v24) do
					if v30(v34, v33 - 1, v24) == true then
						v32 = v32 + 1;
						v31[v32] = v34;
					end;
				end;
				v24 = v31;
			end;
			if v24 ~= v18 then
				return v24;
			end;
			return v16;
		end;
		l__useEffect__7(function()
			local v35 = nil;
			local function v36(p5, p6)
				local function v37(p7)
					return not l__getBedwarsKitMeta__1(p7).hiddenInShop;
				end;
				local v38 = {};
				local v39 = 0;
				for v40, v41 in ipairs(p5) do
					if v37(v41, v40 - 1, p5) == true then
						v39 = v39 + 1;
						v38[v39] = v41;
					end;
				end;
				local function v42(p8)
					local v43 = p6;
					if v43 ~= nil then
						v43 = v43.includeFreeKits;
					end;
					if v43 then
						return table.find(l__BedwarsKitShop__3.FreeKits, p8) ~= nil;
					end;
					return table.find(l__BedwarsKitShop__3.FreeKits, p8) == nil;
				end;
				local v44 = {};
				local v45 = 0;
				for v46, v47 in ipairs(v38) do
					if v42(v47, v46 - 1, v38) == true then
						v45 = v45 + 1;
						v44[v45] = v47;
					end;
				end;
				local function v48(p9)
					if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
						return true;
					end;
					if l__getBedwarsKitMeta__1(p9).hiddenInShopTillUnlocked and table.find(p1.store.Bedwars.ownedKits, p9) == nil then
						return false;
					end;
					return true;
				end;
				local v49 = {};
				local v50 = 0;
				for v51, v52 in ipairs(v44) do
					if v48(v52, v51 - 1, v44) == true then
						v50 = v50 + 1;
						v49[v50] = v52;
					end;
				end;
				local function v53(p10)
					local v54 = l__BedwarsKitMeta__6[p10];
					if v54.battlepassSeason ~= nil then
						local v55 = p6;
						if v55 ~= nil then
							v55 = v55.includeBattlePassKits;
						end;
						if not v55 then
							return false;
						end;
						if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
							return true;
						end;
						if table.find(l__BedwarsKitShop__3.FreeKits, p10) ~= nil then
							return true;
						end;
						if v54.battlepassSeason ~= l__BattlePassUtils__7.BATTLE_PASS_SEASON and table.find(p1.store.Bedwars.ownedKits, p10) == nil then
							return false;
						end;
					end;
					return true;
				end;
				local v56 = {};
				local v57 = 0;
				for v58, v59 in ipairs(v49) do
					if v53(v59, v58 - 1, v49) == true then
						v57 = v57 + 1;
						v56[v57] = v59;
					end;
				end;
				table.sort(v56, function(p11, p12)
					return l__BedwarsKitMeta__6[p11].name < l__BedwarsKitMeta__6[p12].name;
				end);
				local function v60(p13)
					return {
						bedwarsKit = p13
					};
				end;
				local v61 = table.create(#v56);
				for v62, v63 in ipairs(v56) do
					v61[v62] = v60(v63, v62 - 1, v56);
				end;
				return v61;
			end;
			local v64 = v36(u8.values(l__BedwarsKitShop__3.ShopKits), {
				includeFreeKits = true, 
				includeBattlePassKits = true
			});
			local v65 = u8.entries(l__BedwarsBPKits__9);
			table.sort(v65, function(p14, p15)
				local v66 = p14[2];
				local v67 = p15[2];
				return p15[1] < p14[1];
			end);
			v35 = {};
			local function v68(p16, p17)
				local v69 = p17[1];
				local v70 = {};
				local v71 = #v70;
				local v72 = #p16;
				table.move(p16, 1, v72, v71 + 1, v70);
				local v73 = v36(p17[2], {
					includeBattlePassKits = true
				});
				table.move(v73, 1, #v73, v71 + v72 + 1, v70);
				p16 = v70;
				return p16;
			end;
			for v74 = 1, #v65 do
				v35 = v68(v35, v65[v74], v74 - 1, v65);
			end;
			local v75 = v36(u8.values(l__BedwarsKitShop__3.ShopKits));
			local v76 = u8.values(l__BundleType__10);
			local function v77(p18)
				local v78 = l__BundleMeta__2[p18];
				if v78.kitShopBundle ~= nil and v78.kits then
					local l__kits__79 = v78.kits;
					local function v80(p19)
						return table.find(p1.store.Bedwars.ownedKits, p19) ~= nil;
					end;
					local v81 = true;
					for v82, v83 in ipairs(l__kits__79) do
						if not v80(v83, v82 - 1, l__kits__79) then
							v81 = false;
							break;
						end;
					end;
					if not v81 then
						return true;
					end;
				end;
				return false;
			end;
			local v84 = {};
			local v85 = 0;
			for v86, v87 in ipairs(v76) do
				if v77(v87, v86 - 1, v76) == true then
					v85 = v85 + 1;
					v84[v85] = v87;
				end;
			end;
			table.sort(v84, function(p20, p21)
				return l__BundleMeta__2[p20].name < l__BundleMeta__2[p21].name;
			end);
			local function v88(p22)
				return {
					kitBundle = p22
				};
			end;
			local v89 = table.create(#v84);
			for v90, v91 in ipairs(v84) do
				v89[v90] = v88(v91, v90 - 1, v84);
			end;
			local v92 = {};
			local v93 = #v92;
			local v94 = #v64;
			table.move(v64, 1, v94, v93 + 1, v92);
			local v95 = v93 + v94;
			local v96 = #v89;
			table.move(v89, 1, v96, v95 + 1, v92);
			local v97 = v95 + v96;
			local v98 = #local v99;
			table.move(v99, 1, v98, v97 + 1, v92);
			table.move(v75, 1, #v75, v97 + v98 + 1, v92);
			v17(v92);
			local v100 = {};
			local v101 = #v100;
			local v102 = #v64;
			table.move(v64, 1, v102, v101 + 1, v100);
			local v103 = v101 + v102;
			local v104 = #v89;
			table.move(v89, 1, v104, v103 + 1, v100);
			local v105 = v103 + v104;
			local v106 = #v99;
			table.move(v99, 1, v106, v105 + 1, v100);
			table.move(v75, 1, #v75, v105 + v106 + 1, v100);
			v19(v100);
		end, { v12, v14, p1.store.Bedwars.ownedKits });
		l__useEffect__7(function()
			if #v16 == 0 then
				return nil;
			end;
			v19((u19()));
		end, { v12, v14 });
		local v107 = {};
		local v108 = {
			Size = UDim2.fromScale(1, 0.05), 
			LayoutOrder = 1
		};
		function v108.SetKitOwnedToggle(p23)
			v13(p23);
		end;
		function v108.SetBattlePassKitsToggle(p24)
			v15(p24);
		end;
		v108.KitOwnedToggle = v12;
		v108.BattlePassKitsToggle = v14;
		v107[1] = u12.createElement("UIPadding", {
			PaddingTop = UDim.new(0.03, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v107[2] = u12.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0.01, 0)
		});
		v107[3] = u12.createElement(l__KitShopFilters__13, v108);
		local v109 = #v107;
		local v110 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v111 = 0.08;
		else
			v111 = 0.06;
		end;
		v110.Size = UDim2.new(0.6, 0, v111, 0);
		v5 = {};
		local function v112(p25, p26)
			if p26.bedwarsKit then
				table.insert(p25, l__getBedwarsKitMeta__1(p26.bedwarsKit).name);
				return p25;
			end;
			if p26.kitBundle then
				local l__kitShopBundle__113 = l__BundleMeta__2[p26.kitBundle].kitShopBundle;
				if l__kitShopBundle__113 then
					table.insert(p25, l__kitShopBundle__113.name);
				end;
			end;
			return p25;
		end;
		for v114 = 1, #v16 do
			v5 = v112(v5, v16[v114], v114 - 1, v16);
		end;
		v110.Items = local v115;
		v110.Item = "";
		local function u21(p27, p28)
			if p27 == "" then
				v21({});
				return u19();
			end;
			local u22 = {};
			local function v116(p29)
				local function v117(p30)
					if p30.bedwarsKit then
						return string.lower(l__getBedwarsKitMeta__1(p30.bedwarsKit).name) == string.lower(p29);
					end;
					if not p30.kitBundle then
						return;
					end;
					local v118 = l__BundleMeta__2[p30.kitBundle].kitShopBundle;
					if v118 ~= nil then
						v118 = string.lower(v118.name);
					end;
					return v118 == string.lower(p29);
				end;
				local v119 = nil;
				for v120, v121 in ipairs(v16) do
					if v117(v121, v120 - 1, v16) == true then
						v119 = v121;
						break;
					end;
				end;
				if v119 then
					table.insert(u22, v119);
				end;
			end;
			for v122, v123 in ipairs(p28) do
				v116(v123, v122 - 1, p28);
			end;
			v21(u22);
			return u22;
		end;
		function v110.OnSubmit(p31, p32)
			v19(u21(p31, p32));
		end;
		v110.PlaceHolderText = "Search Kit";
		v110.LayoutOrder = 2;
		v107[v109 + 1] = u12.createElement(l__AutoCompleteSearchbar__14, v110);
		local v124 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v125 = 0.87;
		else
			v125 = 0.89;
		end;
		v124.Size = UDim2.new(1, 0, v125, 0);
		v124.CanvasSize = UDim2.new(1, 0, 0, v10 + 36);
		v124.ScrollingDirection = "Y";
		v124.ScrollBarThickness = 6;
		v124.BackgroundTransparency = 1;
		v124.BorderSizePixel = 0;
		v124.Selectable = false;
		v124[u12.Change.AbsoluteSize] = function(p33)
			v9(p33.AbsoluteSize);
		end;
		v124.LayoutOrder = 2;
		local v126 = {};
		local function v127(p34, p35)
			if p34.bedwarsKit then
				local l__bedwarsKit__128 = p34.bedwarsKit;
				local v129 = {
					Kit = l__bedwarsKit__128, 
					Selected = p1.SelectedKit == l__bedwarsKit__128, 
					LayoutOrder = p35, 
					store = p1.store
				};
				function v129.OnClick()
					p1.SetSelectedKit(l__bedwarsKit__128);
				end;
				return u12.createElement(l__KitShopItemCard__15, v129);
			end;
			if not p34.kitBundle then
				return;
			end;
			local l__kitBundle__130 = p34.kitBundle;
			local v131 = {
				Bundle = l__kitBundle__130, 
				LayoutOrder = p35, 
				Selected = p1.SelectedBundle == l__kitBundle__130
			};
			function v131.OnClick()
				p1.SetSelectedBundle(l__kitBundle__130);
			end;
			v131.store = p1.store;
			return u12.createElement(l__KitShopBundleCard__16, v131);
		end;
		local v132 = {};
		local v133 = 0;
		for v134, v135 in ipairs(v18) do
			local v136 = v127(v135, v134 - 1, v18);
			if v136 ~= nil then
				v133 = v133 + 1;
				v132[v133] = v136;
			end;
		end;
		local v137 = {
			Position = UDim2.fromScale(0, 0.01), 
			Size = UDim2.fromScale(0.99, 0.9)
		};
		local v138 = {};
		local v139 = {
			CellSize = UDim2.fromOffset(v22, v22), 
			CellPadding = UDim2.fromOffset(v23, v23), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		v139[u12.Change.AbsoluteCellCount] = function(p36)
			v11(p36.AbsoluteContentSize.Y);
		end;
		v138[1] = u12.createElement("UIGridLayout", v139);
		v138[2] = u12.createElement(l__KitShopItemCard__15, {
			Kit = l__BedwarsKit__17.NONE, 
			Selected = p1.SelectedKit == l__BedwarsKit__17.NONE, 
			LayoutOrder = -2, 
			store = p1.store, 
			OnClick = function()
				p1.SetSelectedKit(l__BedwarsKit__17.NONE);
			end
		});
		local v140 = #v138;
		for v141, v142 in ipairs(v132) do
			v138[v140 + v141] = v142;
		end;
		v126[#v126 + 1] = u12.createElement(l__Empty__18, v137, v138);
		v107[v109 + 2] = u12.createElement("ScrollingFrame", v124, v126);
		return u12.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__11.backgroundPrimary, 
			BorderSizePixel = 0
		}, v107);
	end)
};
