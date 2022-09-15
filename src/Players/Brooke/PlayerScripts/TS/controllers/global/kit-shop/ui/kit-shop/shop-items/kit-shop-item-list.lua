-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta");
local l__getBedwarsKitMeta__1 = v3.getBedwarsKitMeta;
local l__BundleMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local l__BedwarsKitShop__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKitMeta__6 = v3.BedwarsKitMeta;
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
local l__BedwarsKit__17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__Empty__18 = v2.Empty;
return {
	KitShopItemList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u12)(function(p1, p2)
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
		local function u19()
			if #v19 == 0 then
				local v23 = v15;
			else
				v23 = v19;
			end;
			if v13 then
				local v24 = {};
				local v25 = 0;
				local v26, v27, v28 = ipairs(v23);
				while true do
					v26(v27, v28);
					if not v26 then
						break;
					end;
					if v27.bedwarsKit then
						local v29 = l__getBedwarsKitMeta__1(v27.bedwarsKit).unlockedInBattlePass;
					elseif v27.kitBundle then
						v29 = l__BundleMeta__2[v27.kitBundle].battlepass ~= nil;
					else
						v29 = false;
					end;
					if v29 == true then
						v25 = v25 + 1;
						v24[v25] = v27;
					end;				
				end;
				v23 = v24;
			end;
			if v11 then
				local l__ownedKits__20 = p1.store.Bedwars.ownedKits;
				local v30 = {};
				local v31 = 0;
				local v32, v33, v34 = ipairs(v23);
				while true do
					v32(v33, v34);
					if not v32 then
						break;
					end;
					if v33.bedwarsKit then
						local v35 = table.find(l__ownedKits__20, v33.bedwarsKit) ~= nil;
					else
						v35 = false;
					end;
					if v35 == true then
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
			local v36 = nil;
			local function v37(p3, p4)
				local v38 = {};
				local v39 = 0;
				local v40, v41, v42 = ipairs(p3);
				while true do
					v40(v41, v42);
					if not v40 then
						break;
					end;
					v42 = v40;
					if not l__getBedwarsKitMeta__1(v41).hiddenInShop == true then
						v39 = v39 + 1;
						v38[v39] = v41;
					end;				
				end;
				local v43 = {};
				local v44 = 0;
				local v45, v46, v47 = ipairs(v38);
				while true do
					v45(v46, v47);
					if not v45 then
						break;
					end;
					local v48 = p4;
					if v48 ~= nil then
						v48 = v48.includeFreeKits;
					end;
					if v48 then
						local v49 = table.find(l__BedwarsKitShop__3.FreeKits, v46) ~= nil;
					else
						v49 = table.find(l__BedwarsKitShop__3.FreeKits, v46) == nil;
					end;
					if v49 == true then
						v44 = v44 + 1;
						v43[v44] = v46;
					end;				
				end;
				local function v50(p5)
					if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
						return true;
					end;
					if l__getBedwarsKitMeta__1(p5).hiddenInShopTillUnlocked and table.find(p1.store.Bedwars.ownedKits, p5) == nil then
						return false;
					end;
					return true;
				end;
				local v51 = {};
				local v52 = 0;
				local v53, v54, v55 = ipairs(v43);
				while true do
					v53(v54, v55);
					if not v53 then
						break;
					end;
					v55 = v53;
					if v50(v54, v53 - 1, v43) == true then
						v52 = v52 + 1;
						v51[v52] = v54;
					end;				
				end;
				local function v56(p6)
					local v57 = l__BedwarsKitMeta__6[p6];
					if v57.battlepassSeason ~= nil then
						local v58 = p4;
						if v58 ~= nil then
							v58 = v58.includeBattlePassKits;
						end;
						if not v58 then
							return false;
						end;
						if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
							return true;
						end;
						if table.find(l__BedwarsKitShop__3.FreeKits, p6) ~= nil then
							return true;
						end;
						if v57.battlepassSeason ~= l__BattlePassUtils__7.BATTLE_PASS_SEASON and table.find(p1.store.Bedwars.ownedKits, p6) == nil then
							return false;
						end;
					end;
					local v59 = p4;
					if v59 ~= nil then
						v59 = v59.includeFeaturedKits;
					end;
					if not v59 and v57.featured then
						return false;
					end;
					return true;
				end;
				local v60 = {};
				local v61 = 0;
				local v62, v63, v64 = ipairs(v51);
				while true do
					v62(v63, v64);
					if not v62 then
						break;
					end;
					v64 = v62;
					if v56(v63, v62 - 1, v51) == true then
						v61 = v61 + 1;
						v60[v61] = v63;
					end;				
				end;
				table.sort(v60, function(p7, p8)
					return l__BedwarsKitMeta__6[p7].name < l__BedwarsKitMeta__6[p8].name;
				end);
				local v65 = table.create(#v60);
				local v66, v67, v68 = ipairs(v60);
				while true do
					v66(v67, v68);
					if not v66 then
						break;
					end;
					v68 = v66;
					v65[v66] = {
						bedwarsKit = v67
					};				
				end;
				return v65;
			end;
			local v69 = v37(u8.values(l__BedwarsKitShop__3.ShopKits), {
				includeFreeKits = true, 
				includeBattlePassKits = true
			});
			local v70 = {};
			local v71 = 0;
			local v72, v73, v74 = ipairs((u8.values(l__BedwarsKitShop__3.ShopKits)));
			while true do
				v72(v73, v74);
				if not v72 then
					break;
				end;
				v74 = v72;
				if l__getBedwarsKitMeta__1(v73).featured == true then
					v71 = v71 + 1;
					v70[v71] = v73;
				end;			
			end;
			local v75 = v37(v70, {
				includeFeaturedKits = true
			});
			local v76 = v37(l__BedwarsBPKits__9[l__BattlePassUtils__7.BATTLE_PASS_SEASON], {
				includeBattlePassKits = true
			});
			local v77 = v37(u8.values(l__BedwarsKitShop__3.ShopKits));
			local v78 = u8.entries(l__BedwarsBPKits__9);
			table.sort(v78, function(p9, p10)
				local v79 = p9[2];
				local v80 = p10[2];
				return p10[1] < p9[1];
			end);
			local function v81(p11, p12)
				if p12[1] == l__BattlePassUtils__7.BATTLE_PASS_SEASON then
					return p11;
				end;
				local v82 = {};
				local v83 = #v82;
				local v84 = #p11;
				table.move(p11, 1, v84, v83 + 1, v82);
				local v85 = v37(p12[2], {
					includeBattlePassKits = true
				});
				table.move(v85, 1, #v85, v83 + v84 + 1, v82);
				p11 = v82;
				return p11;
			end;
			v36 = {};
			for v86 = 1, #v78 do
				v36 = v81(v36, v78[v86], v86 - 1, v78);
			end;
			local v87 = {};
			local v88 = 0;
			local v89, v90, v91 = ipairs((u8.values(l__BundleType__10)));
			while true do
				v89(v90, v91);
				if not v89 then
					break;
				end;
				local v92 = l__BundleMeta__2[v90];
				if v92.kitShopBundle ~= nil and v92.rewards.kits then
					local v93 = v92.kitShopBundle;
					if v93 ~= nil then
						v93 = v93.disabled;
					end;
					if v93 then
						local v94 = nil;
					else
						v94 = true;
					end;
				else
					v94 = false;
				end;
				if v94 == true then
					v88 = v88 + 1;
					v87[v88] = v90;
				end;			
			end;
			table.sort(v87, function(p13, p14)
				return l__BundleMeta__2[p13].name < l__BundleMeta__2[p14].name;
			end);
			local v95 = table.create(#v87);
			local v96, v97, v98 = ipairs(v87);
			while true do
				v96(v97, v98);
				if not v96 then
					break;
				end;
				v98 = v96;
				v95[v96] = {
					kitBundle = v97
				};			
			end;
			local v99 = {};
			local v100 = #v99;
			local v101 = #v69;
			table.move(v69, 1, v101, v100 + 1, v99);
			local v102 = v100 + v101;
			local v103 = #v75;
			table.move(v75, 1, v103, v102 + 1, v99);
			local v104 = v102 + v103;
			local v105 = #v95;
			table.move(v95, 1, v105, v104 + 1, v99);
			local v106 = v104 + v105;
			local v107 = #v76;
			table.move(v76, 1, v107, v106 + 1, v99);
			local v108 = v106 + v107;
			local v109 = #v77;
			table.move(v77, 1, v109, v108 + 1, v99);
			table.move(local v110, 1, #v110, v108 + v109 + 1, v99);
			v16(v99);
			local v111 = {};
			local v112 = #v111;
			local v113 = #v69;
			table.move(v69, 1, v113, v112 + 1, v111);
			local v114 = v112 + v113;
			local v115 = #v75;
			table.move(v75, 1, v115, v114 + 1, v111);
			local v116 = v114 + v115;
			local v117 = #v95;
			table.move(v95, 1, v117, v116 + 1, v111);
			local v118 = v116 + v117;
			local v119 = #v76;
			table.move(v76, 1, v119, v118 + 1, v111);
			local v120 = v118 + v119;
			local v121 = #v77;
			table.move(v77, 1, v121, v120 + 1, v111);
			table.move(v110, 1, #v110, v120 + v121 + 1, v111);
			v18(v111);
		end, { v11, v13, p1.store.Bedwars.ownedKits });
		l__useEffect__6(function()
			if #v15 == 0 then
				return nil;
			end;
			v18((u19()));
		end, { v11, v13 });
		local v122 = {};
		local v123 = {
			Size = UDim2.fromScale(1, 0.05), 
			LayoutOrder = 1
		};
		function v123.SetKitOwnedToggle(p15)
			v12(p15);
		end;
		function v123.SetBattlePassKitsToggle(p16)
			v14(p16);
		end;
		v123.KitOwnedToggle = v11;
		v123.BattlePassKitsToggle = v13;
		v122[1] = u12.createElement("UIPadding", {
			PaddingTop = UDim.new(0.03, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v122[2] = u12.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0.01, 0)
		});
		v122[3] = u12.createElement(l__KitShopFilters__13, v123);
		local v124 = #v122;
		local v125 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v126 = 0.08;
		else
			v126 = 0.06;
		end;
		v125.Size = UDim2.new(0.6, 0, v126, 0);
		v4 = {};
		for v127 = 1, #v15 do
			local v128 = v15[v127];
			if v128.bedwarsKit then
				table.insert(v4, l__getBedwarsKitMeta__1(v128.bedwarsKit).name);
			elseif v128.kitBundle then
				local l__kitShopBundle__129 = l__BundleMeta__2[v128.kitBundle].kitShopBundle;
				if l__kitShopBundle__129 then
					table.insert(v4, l__kitShopBundle__129.name);
				end;
			end;
			v4 = v4;
		end;
		v125.Items = local v130;
		v125.InputText = "";
		local function u21(p17, p18)
			if p17 == "" then
				v20({});
				return u19();
			end;
			local u22 = {};
			local function v131(p19)
				local function v132(p20)
					if p20.bedwarsKit then
						return string.lower(l__getBedwarsKitMeta__1(p20.bedwarsKit).name) == string.lower(p19);
					end;
					if not p20.kitBundle then
						return;
					end;
					local v133 = l__BundleMeta__2[p20.kitBundle].kitShopBundle;
					if v133 ~= nil then
						v133 = string.lower(v133.name);
					end;
					return v133 == string.lower(p19);
				end;
				local v134 = nil;
				local v135, v136, v137 = ipairs(v15);
				while true do
					v135(v136, v137);
					if not v135 then
						break;
					end;
					v137 = v135;
					if v132(v136, v135 - 1, v15) == true then
						v134 = v136;
						break;
					end;				
				end;
				if v134 then
					table.insert(u22, v134);
				end;
			end;
			local v138, v139, v140 = ipairs(p18);
			while true do
				v138(v139, v140);
				if not v138 then
					break;
				end;
				v140 = v138;
				v131(v139, v138 - 1, p18);			
			end;
			v20(u22);
			return u22;
		end;
		function v125.OnTextChange(p21, p22)
			v18((u21(p21, p22)));
		end;
		v125.PlaceHolderText = "Search Kit";
		v125.LayoutOrder = 2;
		v122[v124 + 1] = u12.createElement(l__AutoCompleteSearchbar__14, v125);
		local v141 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v142 = 0.87;
		else
			v142 = 0.89;
		end;
		v141.Size = UDim2.new(1, 0, v142, 0);
		v141.CanvasSize = UDim2.new(1, 0, 0, v9 + 36);
		v141.ScrollingDirection = "Y";
		v141.ScrollBarThickness = 6;
		v141.BackgroundTransparency = 1;
		v141.BorderSizePixel = 0;
		v141.Selectable = false;
		v141[u12.Change.AbsoluteSize] = function(p23)
			v8(p23.AbsoluteSize);
		end;
		v141.LayoutOrder = 2;
		local v143 = {};
		local function v144(p24, p25)
			if p24.bedwarsKit then
				local l__bedwarsKit__145 = p24.bedwarsKit;
				local v146 = {
					Kit = l__bedwarsKit__145, 
					Selected = p1.SelectedKit == l__bedwarsKit__145, 
					LayoutOrder = p25, 
					store = p1.store
				};
				function v146.OnClick()
					p1.SetSelectedKit(l__bedwarsKit__145);
				end;
				return u12.createElement(l__KitShopItemCard__15, v146);
			end;
			if not p24.kitBundle then
				return;
			end;
			local l__kitBundle__147 = p24.kitBundle;
			local v148 = {
				Bundle = l__kitBundle__147, 
				LayoutOrder = p25, 
				Selected = p1.SelectedBundle == l__kitBundle__147
			};
			function v148.OnClick()
				p1.SetSelectedBundle(l__kitBundle__147);
			end;
			v148.store = p1.store;
			return u12.createElement(l__KitShopBundleCard__16, v148);
		end;
		local v149 = {};
		local v150 = 0;
		local v151, v152, v153 = ipairs(v17);
		while true do
			v151(v152, v153);
			if not v151 then
				break;
			end;
			v153 = v151;
			local v154 = v144(v152, v151 - 1, v17);
			if v154 ~= nil then
				v150 = v150 + 1;
				v149[v150] = v154;
			end;		
		end;
		local v155 = {
			Position = UDim2.fromScale(0, 0.01), 
			Size = UDim2.fromScale(0.99, 0.9)
		};
		local v156 = {};
		local v157 = {
			CellSize = UDim2.fromOffset(v21, v21), 
			CellPadding = UDim2.fromOffset(v22, v22), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		v157[u12.Change.AbsoluteCellCount] = function(p26)
			v10(p26.AbsoluteContentSize.Y);
		end;
		v156[1] = u12.createElement("UIGridLayout", v157);
		v156[2] = u12.createElement(l__KitShopItemCard__15, {
			Kit = l__BedwarsKit__17.NONE, 
			Selected = p1.SelectedKit == l__BedwarsKit__17.NONE, 
			LayoutOrder = -2, 
			store = p1.store, 
			OnClick = function()
				p1.SetSelectedKit(l__BedwarsKit__17.NONE);
			end
		});
		local v158 = #v156;
		local v159, v160, v161 = ipairs(v149);
		while true do
			v159(v160, v161);
			if not v159 then
				break;
			end;
			v161 = v159;
			v156[v158 + v159] = v160;		
		end;
		v143[#v143 + 1] = u12.createElement(l__Empty__18, v155, v156);
		v122[v124 + 2] = u12.createElement("ScrollingFrame", v141, v143);
		return u12.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__11.backgroundPrimary, 
			BorderSizePixel = 0
		}, v122);
	end)
};
