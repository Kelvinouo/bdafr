-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta");
local l__getBedwarsKitMeta__1 = v3.getBedwarsKitMeta;
local l__BundleMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsKitShop__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__BedwarsKitMeta__5 = v3.BedwarsKitMeta;
local l__DeviceUtil__6 = v2.DeviceUtil;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__BattlePassUtils__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__BundleType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitShopFilters__12 = v1.import(script, script.Parent.Parent, "filters", "kit-shop-filters").KitShopFilters;
local l__AutoCompleteSearchbar__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local l__KitShopItemCard__14 = v1.import(script, script.Parent, "kit-shop-item-card").KitShopItemCard;
local l__KitShopBundleCard__15 = v1.import(script, script.Parent, "kit-shop-bundle-card").KitShopBundleCard;
local l__BedwarsKit__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Empty__17 = v2.Empty;
return {
	KitShopItemList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u11)(function(p1, p2)
		local v4 = nil;
		local l__useState__5 = p2.useState;
		local l__useEffect__6 = p2.useEffect;
		local v7, v8 = l__useState__5(Vector2.new(584, 443));
		local v9, v10 = l__useState__5(443);
		local v11, v12 = l__useState__5(false);
		local v13, v14 = l__useState__5(false);
		local v15, v16 = l__useState__5({});
		local v17, v18 = l__useState__5({});
		local v19, v20 = l__useState__5({});
		local v21 = math.floor(v7.X * 0.2191780821917808);
		local v22 = math.floor(v7.X * 0.03571428571428571);
		local function u18()
			if #v19 == 0 then
				local v23 = v15;
			else
				v23 = v19;
			end;
			if v13 then
				local function v24(p3)
					if p3.bedwarsKit then
						return l__getBedwarsKitMeta__1(p3.bedwarsKit).unlockedInBattlePass;
					end;
					if not p3.kitBundle then
						return false;
					end;
					return l__BundleMeta__2[p3.kitBundle].battlepass ~= nil;
				end;
				local v25 = {};
				local v26 = 0;
				for v27, v28 in ipairs(v23) do
					if v24(v28, v27 - 1, v23) == true then
						v26 = v26 + 1;
						v25[v26] = v28;
					end;
				end;
				v23 = v25;
			end;
			if v11 then
				local l__ownedKits__19 = p1.store.Bedwars.ownedKits;
				local function v29(p4)
					if not p4.bedwarsKit then
						return false;
					end;
					return table.find(l__ownedKits__19, p4.bedwarsKit) ~= nil;
				end;
				local v30 = {};
				local v31 = 0;
				for v32, v33 in ipairs(v23) do
					if v29(v33, v32 - 1, v23) == true then
						v31 = v31 + 1;
						v30[v31] = v33;
					end;
				end;
				v23 = v30;
			end;
			if v23 ~= v17 then
				return v23;
			end;
			return v15;
		end;
		l__useEffect__6(function()
			local v34 = u3.values(l__BedwarsKitShop__4.ShopKits);
			local function v35(p5)
				return not l__getBedwarsKitMeta__1(p5).hiddenInShop;
			end;
			local v36 = {};
			local v37 = 0;
			for v38, v39 in ipairs(v34) do
				if v35(v39, v38 - 1, v34) == true then
					v37 = v37 + 1;
					v36[v37] = v39;
				end;
			end;
			local function v40(p6)
				return not l__getBedwarsKitMeta__1(p6).hiddenInShopTillUnlocked or table.find(p1.store.Bedwars.ownedKits, p6) ~= nil;
			end;
			local v41 = {};
			local v42 = 0;
			for v43, v44 in ipairs(v36) do
				if v40(v44, v43 - 1, v36) == true then
					v42 = v42 + 1;
					v41[v42] = v44;
				end;
			end;
			local function v45(p7)
				return table.find(l__BedwarsKitShop__4.FreeKits, p7) == nil;
			end;
			local v46 = {};
			local v47 = 0;
			for v48, v49 in ipairs(v41) do
				if v45(v49, v48 - 1, v41) == true then
					v47 = v47 + 1;
					v46[v47] = v49;
				end;
			end;
			local function v50(p8)
				if l__BedwarsKitMeta__5[p8].battlepassSeason ~= nil then
					return false;
				end;
				if not l__DeviceUtil__6.isHoarceKat() and (l__KnitClient__7.Controllers.UnlockController.allItemsUnlocked or l__KnitClient__7.Controllers.UnlockController.allKitsUnlocked) then
					return true;
				end;
				return true;
			end;
			local v51 = {};
			local v52 = 0;
			for v53, v54 in ipairs(v46) do
				if v50(v54, v53 - 1, v46) == true then
					v52 = v52 + 1;
					v51[v52] = v54;
				end;
			end;
			table.sort(v51, function(p9, p10)
				return l__BedwarsKitMeta__5[p9].name < l__BedwarsKitMeta__5[p10].name;
			end);
			local function v55(p11)
				return {
					bedwarsKit = p11
				};
			end;
			local v56 = table.create(#v51);
			for v57, v58 in ipairs(v51) do
				v56[v57] = v55(v58, v57 - 1, v51);
			end;
			local v59 = u3.values(l__BedwarsKitShop__4.ShopKits);
			local function v60(p12)
				return not l__getBedwarsKitMeta__1(p12).hiddenInShop;
			end;
			local v61 = {};
			local v62 = 0;
			for v63, v64 in ipairs(v59) do
				if v60(v64, v63 - 1, v59) == true then
					v62 = v62 + 1;
					v61[v62] = v64;
				end;
			end;
			local function v65(p13)
				return not l__getBedwarsKitMeta__1(p13).hiddenInShopTillUnlocked or table.find(p1.store.Bedwars.ownedKits, p13) ~= nil;
			end;
			local v66 = {};
			local v67 = 0;
			for v68, v69 in ipairs(v61) do
				if v65(v69, v68 - 1, v61) == true then
					v67 = v67 + 1;
					v66[v67] = v69;
				end;
			end;
			local function v70(p14)
				return table.find(l__BedwarsKitShop__4.FreeKits, p14) == nil;
			end;
			local v71 = {};
			local v72 = 0;
			for v73, v74 in ipairs(v66) do
				if v70(v74, v73 - 1, v66) == true then
					v72 = v72 + 1;
					v71[v72] = v74;
				end;
			end;
			local function v75(p15)
				local v76 = l__BedwarsKitMeta__5[p15];
				if v76.battlepassSeason == nil then
					return false;
				end;
				if not l__DeviceUtil__6.isHoarceKat() and (l__KnitClient__7.Controllers.UnlockController.allItemsUnlocked or l__KnitClient__7.Controllers.UnlockController.allKitsUnlocked) then
					return true;
				end;
				if v76.battlepassSeason ~= l__BattlePassUtils__8.BATTLE_PASS_SEASON and table.find(p1.store.Bedwars.ownedKits, p15) == nil then
					return false;
				end;
				return true;
			end;
			local v77 = {};
			local v78 = 0;
			for v79, v80 in ipairs(v71) do
				if v75(v80, v79 - 1, v71) == true then
					v78 = v78 + 1;
					v77[v78] = v80;
				end;
			end;
			table.sort(v77, function(p16, p17)
				return l__BedwarsKitMeta__5[p16].name < l__BedwarsKitMeta__5[p17].name;
			end);
			local function v81(p18)
				return {
					bedwarsKit = p18
				};
			end;
			local v82 = table.create(#v77);
			for v83, v84 in ipairs(v77) do
				v82[v83] = v81(v84, v83 - 1, v77);
			end;
			local v85 = u3.values(l__BedwarsKitShop__4.ShopKits);
			local function v86(p19)
				return not l__getBedwarsKitMeta__1(p19).hiddenInShop;
			end;
			local v87 = {};
			local v88 = 0;
			for v89, v90 in ipairs(v85) do
				if v86(v90, v89 - 1, v85) == true then
					v88 = v88 + 1;
					v87[v88] = v90;
				end;
			end;
			local function v91(p20)
				return table.find(l__BedwarsKitShop__4.FreeKits, p20) ~= nil;
			end;
			local v92 = {};
			local v93 = 0;
			for v94, v95 in ipairs(v87) do
				if v91(v95, v94 - 1, v87) == true then
					v93 = v93 + 1;
					v92[v93] = v95;
				end;
			end;
			table.sort(v92, function(p21, p22)
				return l__BedwarsKitMeta__5[p21].name < l__BedwarsKitMeta__5[p22].name;
			end);
			local function v96(p23)
				return {
					bedwarsKit = p23
				};
			end;
			local v97 = table.create(#v92);
			for v98, v99 in ipairs(v92) do
				v97[v98] = v96(v99, v98 - 1, v92);
			end;
			local v100 = u3.values(l__BundleType__9);
			local function v101(p24)
				local v102 = l__BundleMeta__2[p24];
				if v102.kitShopBundle ~= nil and v102.kits then
					local l__kits__103 = v102.kits;
					local function v104(p25)
						return table.find(p1.store.Bedwars.ownedKits, p25) ~= nil;
					end;
					local v105 = true;
					for v106, v107 in ipairs(l__kits__103) do
						if not v104(v107, v106 - 1, l__kits__103) then
							v105 = false;
							break;
						end;
					end;
					if not v105 then
						return true;
					end;
				end;
				return false;
			end;
			local v108 = {};
			local v109 = 0;
			for v110, v111 in ipairs(v100) do
				if v101(v111, v110 - 1, v100) == true then
					v109 = v109 + 1;
					v108[v109] = v111;
				end;
			end;
			table.sort(v108, function(p26, p27)
				return l__BundleMeta__2[p26].name < l__BundleMeta__2[p27].name;
			end);
			local function v112(p28)
				return {
					kitBundle = p28
				};
			end;
			local v113 = table.create(#v108);
			for v114, v115 in ipairs(v108) do
				v113[v114] = v112(v115, v114 - 1, v108);
			end;
			local v116 = {};
			local v117 = #v116;
			local v118 = #v97;
			table.move(v97, 1, v118, v117 + 1, v116);
			local v119 = v117 + v118;
			local v120 = #v113;
			table.move(v113, 1, v120, v119 + 1, v116);
			local v121 = v119 + v120;
			local v122 = #v82;
			table.move(v82, 1, v122, v121 + 1, v116);
			table.move(v56, 1, #v56, v121 + v122 + 1, v116);
			v16(v116);
			local v123 = {};
			local v124 = #v123;
			local v125 = #v97;
			table.move(v97, 1, v125, v124 + 1, v123);
			local v126 = v124 + v125;
			local v127 = #v113;
			table.move(v113, 1, v127, v126 + 1, v123);
			local v128 = v126 + v127;
			local v129 = #v82;
			table.move(v82, 1, v129, v128 + 1, v123);
			table.move(v56, 1, #v56, v128 + v129 + 1, v123);
			v18(v123);
		end, { v11, v13, p1.store.Bedwars.ownedKits });
		l__useEffect__6(function()
			if #v15 == 0 then
				return nil;
			end;
			v18((u18()));
		end, { v11, v13 });
		local v130 = {};
		local v131 = {
			Size = UDim2.fromScale(1, 0.05), 
			LayoutOrder = 1
		};
		function v131.SetKitOwnedToggle(p29)
			v12(p29);
		end;
		function v131.SetBattlePassKitsToggle(p30)
			v14(p30);
		end;
		v131.KitOwnedToggle = v11;
		v131.BattlePassKitsToggle = v13;
		v130[1] = u11.createElement("UIPadding", {
			PaddingTop = UDim.new(0.03, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v130[2] = u11.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0.01, 0)
		});
		v130[3] = u11.createElement(l__KitShopFilters__12, v131);
		local v132 = #v130;
		local v133 = {};
		if l__DeviceUtil__6.isSmallScreen() then
			local v134 = 0.08;
		else
			v134 = 0.06;
		end;
		v133.Size = UDim2.new(0.6, 0, v134, 0);
		v4 = {};
		local function v135(p31, p32)
			if p32.bedwarsKit then
				table.insert(p31, l__getBedwarsKitMeta__1(p32.bedwarsKit).name);
				return p31;
			end;
			if p32.kitBundle then
				local l__kitShopBundle__136 = l__BundleMeta__2[p32.kitBundle].kitShopBundle;
				if l__kitShopBundle__136 then
					table.insert(p31, l__kitShopBundle__136.name);
				end;
			end;
			return p31;
		end;
		for v137 = 1, #v15 do
			v4 = v135(v4, v15[v137], v137 - 1, v15);
		end;
		v133.Items = local v138;
		v133.Item = "";
		local function u20(p33, p34)
			if p33 == "" then
				v20({});
				return u18();
			end;
			local u21 = {};
			local function v139(p35)
				local function v140(p36)
					if p36.bedwarsKit then
						return string.lower(l__getBedwarsKitMeta__1(p36.bedwarsKit).name) == string.lower(p35);
					end;
					if not p36.kitBundle then
						return;
					end;
					local v141 = l__BundleMeta__2[p36.kitBundle].kitShopBundle;
					if v141 ~= nil then
						v141 = string.lower(v141.name);
					end;
					return v141 == string.lower(p35);
				end;
				local v142 = nil;
				for v143, v144 in ipairs(v15) do
					if v140(v144, v143 - 1, v15) == true then
						v142 = v144;
						break;
					end;
				end;
				if v142 then
					table.insert(u21, v142);
				end;
			end;
			for v145, v146 in ipairs(p34) do
				v139(v146, v145 - 1, p34);
			end;
			v20(u21);
			return u21;
		end;
		function v133.OnSubmit(p37, p38)
			v18(u20(p37, p38));
		end;
		v133.PlaceHolderText = "Search Kit";
		v133.LayoutOrder = 2;
		v130[v132 + 1] = u11.createElement(l__AutoCompleteSearchbar__13, v133);
		local v147 = {};
		if l__DeviceUtil__6.isSmallScreen() then
			local v148 = 0.87;
		else
			v148 = 0.89;
		end;
		v147.Size = UDim2.new(1, 0, v148, 0);
		v147.CanvasSize = UDim2.new(1, 0, 0, v9 + 36);
		v147.ScrollingDirection = "Y";
		v147.ScrollBarThickness = 6;
		v147.BackgroundTransparency = 1;
		v147.BorderSizePixel = 0;
		v147.Selectable = false;
		v147[u11.Change.AbsoluteSize] = function(p39)
			v8(p39.AbsoluteSize);
		end;
		v147.LayoutOrder = 2;
		local v149 = {};
		local function v150(p40, p41)
			if p40.bedwarsKit then
				local l__bedwarsKit__151 = p40.bedwarsKit;
				local v152 = {
					Kit = l__bedwarsKit__151, 
					Selected = p1.SelectedKit == l__bedwarsKit__151, 
					LayoutOrder = p41, 
					store = p1.store
				};
				function v152.OnClick()
					p1.SetSelectedKit(l__bedwarsKit__151);
				end;
				return u11.createElement(l__KitShopItemCard__14, v152);
			end;
			if not p40.kitBundle then
				return;
			end;
			local l__kitBundle__153 = p40.kitBundle;
			local v154 = {
				Bundle = l__kitBundle__153, 
				LayoutOrder = p41, 
				Selected = p1.SelectedBundle == l__kitBundle__153
			};
			function v154.OnClick()
				p1.SetSelectedBundle(l__kitBundle__153);
			end;
			v154.store = p1.store;
			return u11.createElement(l__KitShopBundleCard__15, v154);
		end;
		local v155 = {};
		local v156 = 0;
		for v157, v158 in ipairs(v17) do
			local v159 = v150(v158, v157 - 1, v17);
			if v159 ~= nil then
				v156 = v156 + 1;
				v155[v156] = v159;
			end;
		end;
		local v160 = {
			Position = UDim2.fromScale(0, 0.01), 
			Size = UDim2.fromScale(0.99, 0.9)
		};
		local v161 = {};
		local v162 = {
			CellSize = UDim2.fromOffset(v21, v21), 
			CellPadding = UDim2.fromOffset(v22, v22), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		v162[u11.Change.AbsoluteCellCount] = function(p42)
			v10(p42.AbsoluteContentSize.Y);
		end;
		v161[1] = u11.createElement("UIGridLayout", v162);
		v161[2] = u11.createElement(l__KitShopItemCard__14, {
			Kit = l__BedwarsKit__16.NONE, 
			Selected = p1.SelectedKit == l__BedwarsKit__16.NONE, 
			LayoutOrder = -2, 
			store = p1.store, 
			OnClick = function()
				p1.SetSelectedKit(l__BedwarsKit__16.NONE);
			end
		});
		local v163 = #v161;
		for v164, v165 in ipairs(v155) do
			v161[v163 + v164] = v165;
		end;
		v149[#v149 + 1] = u11.createElement(l__Empty__17, v160, v161);
		v130[v132 + 2] = u11.createElement("ScrollingFrame", v147, v149);
		return u11.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__10.backgroundPrimary, 
			BorderSizePixel = 0
		}, v130);
	end)
};
