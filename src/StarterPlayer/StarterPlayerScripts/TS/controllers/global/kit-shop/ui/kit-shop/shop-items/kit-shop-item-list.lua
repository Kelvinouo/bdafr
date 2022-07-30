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
					local v29, v30 = v26(v27, v28);
					if not v29 then
						break;
					end;
					if v30.bedwarsKit then
						local v31 = l__getBedwarsKitMeta__1(v30.bedwarsKit).unlockedInBattlePass;
					elseif v30.kitBundle then
						v31 = l__BundleMeta__2[v30.kitBundle].battlepass ~= nil;
					else
						v31 = false;
					end;
					if v31 == true then
						v25 = v25 + 1;
						v24[v25] = v30;
					end;				
				end;
				v23 = v24;
			end;
			if v11 then
				local l__ownedKits__20 = p1.store.Bedwars.ownedKits;
				local v32 = {};
				local v33 = 0;
				local v34, v35, v36 = ipairs(v23);
				while true do
					local v37, v38 = v34(v35, v36);
					if not v37 then
						break;
					end;
					if v38.bedwarsKit then
						local v39 = table.find(l__ownedKits__20, v38.bedwarsKit) ~= nil;
					else
						v39 = false;
					end;
					if v39 == true then
						v33 = v33 + 1;
						v32[v33] = v38;
					end;				
				end;
				v23 = v32;
			end;
			if v23 ~= v17 then
				return v23;
			end;
			return v15;
		end;
		l__useEffect__6(function()
			local v40 = nil;
			local function v41(p3, p4)
				local v42 = {};
				local v43 = 0;
				for v44, v45 in ipairs(p3) do
					if not l__getBedwarsKitMeta__1(v45).hiddenInShop == true then
						v43 = v43 + 1;
						v42[v43] = v45;
					end;
				end;
				local v46 = {};
				local v47 = 0;
				local v48, v49, v50 = ipairs(v42);
				while true do
					local v51, v52 = v48(v49, v50);
					if not v51 then
						break;
					end;
					local v53 = p4;
					if v53 ~= nil then
						v53 = v53.includeFreeKits;
					end;
					if v53 then
						local v54 = table.find(l__BedwarsKitShop__3.FreeKits, v52) ~= nil;
					else
						v54 = table.find(l__BedwarsKitShop__3.FreeKits, v52) == nil;
					end;
					if v54 == true then
						v47 = v47 + 1;
						v46[v47] = v52;
					end;				
				end;
				local function v55(p5)
					if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
						return true;
					end;
					if l__getBedwarsKitMeta__1(p5).hiddenInShopTillUnlocked and table.find(p1.store.Bedwars.ownedKits, p5) == nil then
						return false;
					end;
					return true;
				end;
				local v56 = {};
				local v57 = 0;
				for v58, v59 in ipairs(v46) do
					if v55(v59, v58 - 1, v46) == true then
						v57 = v57 + 1;
						v56[v57] = v59;
					end;
				end;
				local function v60(p6)
					local v61 = l__BedwarsKitMeta__6[p6];
					if v61.battlepassSeason ~= nil then
						local v62 = p4;
						if v62 ~= nil then
							v62 = v62.includeBattlePassKits;
						end;
						if not v62 then
							return false;
						end;
						if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
							return true;
						end;
						if table.find(l__BedwarsKitShop__3.FreeKits, p6) ~= nil then
							return true;
						end;
						if v61.battlepassSeason ~= l__BattlePassUtils__7.BATTLE_PASS_SEASON and table.find(p1.store.Bedwars.ownedKits, p6) == nil then
							return false;
						end;
					end;
					local v63 = p4;
					if v63 ~= nil then
						v63 = v63.includeFeaturedKits;
					end;
					if not v63 and v61.featured then
						return false;
					end;
					return true;
				end;
				local v64 = {};
				local v65 = 0;
				for v66, v67 in ipairs(v56) do
					if v60(v67, v66 - 1, v56) == true then
						v65 = v65 + 1;
						v64[v65] = v67;
					end;
				end;
				table.sort(v64, function(p7, p8)
					return l__BedwarsKitMeta__6[p7].name < l__BedwarsKitMeta__6[p8].name;
				end);
				local v68 = table.create(#v64);
				for v69, v70 in ipairs(v64) do
					v68[v69] = {
						bedwarsKit = v70
					};
				end;
				return v68;
			end;
			local v71 = v41(u8.values(l__BedwarsKitShop__3.ShopKits), {
				includeFreeKits = true, 
				includeBattlePassKits = true
			});
			local v72 = {};
			local v73 = 0;
			for v74, v75 in ipairs((u8.values(l__BedwarsKitShop__3.ShopKits))) do
				if l__getBedwarsKitMeta__1(v75).featured == true then
					v73 = v73 + 1;
					v72[v73] = v75;
				end;
			end;
			local v76 = v41(v72, {
				includeFeaturedKits = true
			});
			local v77 = u8.entries(l__BedwarsBPKits__9);
			table.sort(v77, function(p9, p10)
				local v78 = p9[2];
				local v79 = p10[2];
				return p10[1] < p9[1];
			end);
			v40 = {};
			local function v80(p11, p12)
				local v81 = p12[1];
				local v82 = {};
				local v83 = #v82;
				local v84 = #p11;
				table.move(p11, 1, v84, v83 + 1, v82);
				local v85 = v41(p12[2], {
					includeBattlePassKits = true
				});
				table.move(v85, 1, #v85, v83 + v84 + 1, v82);
				p11 = v82;
				return p11;
			end;
			for v86 = 1, #v77 do
				v40 = v80(v40, v77[v86], v86 - 1, v77);
			end;
			local v87 = v41(u8.values(l__BedwarsKitShop__3.ShopKits));
			local v88 = {};
			local v89 = 0;
			local v90, v91, v92 = ipairs((u8.values(l__BundleType__10)));
			while true do
				local v93, v94 = v90(v91, v92);
				if not v93 then
					break;
				end;
				local v95 = l__BundleMeta__2[v94];
				if v95.kitShopBundle ~= nil and v95.kits then
					local v96 = v95.kitShopBundle;
					if v96 ~= nil then
						v96 = v96.disabled;
					end;
					if v96 then
						local v97 = nil;
					else
						v97 = true;
					end;
				else
					v97 = false;
				end;
				if v97 == true then
					v89 = v89 + 1;
					v88[v89] = v94;
				end;			
			end;
			table.sort(v88, function(p13, p14)
				return l__BundleMeta__2[p13].name < l__BundleMeta__2[p14].name;
			end);
			local v98 = table.create(#v88);
			for v99, v100 in ipairs(v88) do
				v98[v99] = {
					kitBundle = v100
				};
			end;
			local v101 = {};
			local v102 = #v101;
			local v103 = #v71;
			table.move(v71, 1, v103, v102 + 1, v101);
			local v104 = v102 + v103;
			local v105 = #v76;
			table.move(v76, 1, v105, v104 + 1, v101);
			local v106 = v104 + v105;
			local v107 = #v98;
			table.move(v98, 1, v107, v106 + 1, v101);
			local v108 = v106 + v107;
			local v109 = #local v110;
			table.move(v110, 1, v109, v108 + 1, v101);
			table.move(v87, 1, #v87, v108 + v109 + 1, v101);
			v16(v101);
			local v111 = {};
			local v112 = #v111;
			local v113 = #v71;
			table.move(v71, 1, v113, v112 + 1, v111);
			local v114 = v112 + v113;
			local v115 = #v76;
			table.move(v76, 1, v115, v114 + 1, v111);
			local v116 = v114 + v115;
			local v117 = #v98;
			table.move(v98, 1, v117, v116 + 1, v111);
			local v118 = v116 + v117;
			local v119 = #v110;
			table.move(v110, 1, v119, v118 + 1, v111);
			table.move(v87, 1, #v87, v118 + v119 + 1, v111);
			v18(v111);
		end, { v11, v13, p1.store.Bedwars.ownedKits });
		l__useEffect__6(function()
			if #v15 == 0 then
				return nil;
			end;
			v18((u19()));
		end, { v11, v13 });
		local v120 = {};
		local v121 = {
			Size = UDim2.fromScale(1, 0.05), 
			LayoutOrder = 1
		};
		function v121.SetKitOwnedToggle(p15)
			v12(p15);
		end;
		function v121.SetBattlePassKitsToggle(p16)
			v14(p16);
		end;
		v121.KitOwnedToggle = v11;
		v121.BattlePassKitsToggle = v13;
		v120[1] = u12.createElement("UIPadding", {
			PaddingTop = UDim.new(0.03, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v120[2] = u12.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0.01, 0)
		});
		v120[3] = u12.createElement(l__KitShopFilters__13, v121);
		local v122 = #v120;
		local v123 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v124 = 0.08;
		else
			v124 = 0.06;
		end;
		v123.Size = UDim2.new(0.6, 0, v124, 0);
		v4 = {};
		for v125 = 1, #v15 do
			local v126 = v15[v125];
			if v126.bedwarsKit then
				table.insert(v4, l__getBedwarsKitMeta__1(v126.bedwarsKit).name);
			elseif v126.kitBundle then
				local l__kitShopBundle__127 = l__BundleMeta__2[v126.kitBundle].kitShopBundle;
				if l__kitShopBundle__127 then
					table.insert(v4, l__kitShopBundle__127.name);
				end;
			end;
			v4 = v4;
		end;
		v123.Items = local v128;
		v123.InputText = "";
		local function u21(p17, p18)
			if p17 == "" then
				v20({});
				return u19();
			end;
			local u22 = {};
			local function v129(p19)
				local function v130(p20)
					if p20.bedwarsKit then
						return string.lower(l__getBedwarsKitMeta__1(p20.bedwarsKit).name) == string.lower(p19);
					end;
					if not p20.kitBundle then
						return;
					end;
					local v131 = l__BundleMeta__2[p20.kitBundle].kitShopBundle;
					if v131 ~= nil then
						v131 = string.lower(v131.name);
					end;
					return v131 == string.lower(p19);
				end;
				local v132 = nil;
				for v133, v134 in ipairs(v15) do
					if v130(v134, v133 - 1, v15) == true then
						v132 = v134;
						break;
					end;
				end;
				if v132 then
					table.insert(u22, v132);
				end;
			end;
			for v135, v136 in ipairs(p18) do
				v129(v136, v135 - 1, p18);
			end;
			v20(u22);
			return u22;
		end;
		function v123.OnTextChange(p21, p22)
			v18((u21(p21, p22)));
		end;
		v123.PlaceHolderText = "Search Kit";
		v123.LayoutOrder = 2;
		v120[v122 + 1] = u12.createElement(l__AutoCompleteSearchbar__14, v123);
		local v137 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v138 = 0.87;
		else
			v138 = 0.89;
		end;
		v137.Size = UDim2.new(1, 0, v138, 0);
		v137.CanvasSize = UDim2.new(1, 0, 0, v9 + 36);
		v137.ScrollingDirection = "Y";
		v137.ScrollBarThickness = 6;
		v137.BackgroundTransparency = 1;
		v137.BorderSizePixel = 0;
		v137.Selectable = false;
		v137[u12.Change.AbsoluteSize] = function(p23)
			v8(p23.AbsoluteSize);
		end;
		v137.LayoutOrder = 2;
		local v139 = {};
		local function v140(p24, p25)
			if p24.bedwarsKit then
				local l__bedwarsKit__141 = p24.bedwarsKit;
				local v142 = {
					Kit = l__bedwarsKit__141, 
					Selected = p1.SelectedKit == l__bedwarsKit__141, 
					LayoutOrder = p25, 
					store = p1.store
				};
				function v142.OnClick()
					p1.SetSelectedKit(l__bedwarsKit__141);
				end;
				return u12.createElement(l__KitShopItemCard__15, v142);
			end;
			if not p24.kitBundle then
				return;
			end;
			local l__kitBundle__143 = p24.kitBundle;
			local v144 = {
				Bundle = l__kitBundle__143, 
				LayoutOrder = p25, 
				Selected = p1.SelectedBundle == l__kitBundle__143
			};
			function v144.OnClick()
				p1.SetSelectedBundle(l__kitBundle__143);
			end;
			v144.store = p1.store;
			return u12.createElement(l__KitShopBundleCard__16, v144);
		end;
		local v145 = {};
		local v146 = 0;
		for v147, v148 in ipairs(v17) do
			local v149 = v140(v148, v147 - 1, v17);
			if v149 ~= nil then
				v146 = v146 + 1;
				v145[v146] = v149;
			end;
		end;
		local v150 = {
			Position = UDim2.fromScale(0, 0.01), 
			Size = UDim2.fromScale(0.99, 0.9)
		};
		local v151 = {};
		local v152 = {
			CellSize = UDim2.fromOffset(v21, v21), 
			CellPadding = UDim2.fromOffset(v22, v22), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		v152[u12.Change.AbsoluteCellCount] = function(p26)
			v10(p26.AbsoluteContentSize.Y);
		end;
		v151[1] = u12.createElement("UIGridLayout", v152);
		v151[2] = u12.createElement(l__KitShopItemCard__15, {
			Kit = l__BedwarsKit__17.NONE, 
			Selected = p1.SelectedKit == l__BedwarsKit__17.NONE, 
			LayoutOrder = -2, 
			store = p1.store, 
			OnClick = function()
				p1.SetSelectedKit(l__BedwarsKit__17.NONE);
			end
		});
		local v153 = #v151;
		for v154, v155 in ipairs(v145) do
			v151[v153 + v154] = v155;
		end;
		v139[#v139 + 1] = u12.createElement(l__Empty__18, v150, v151);
		v120[v122 + 2] = u12.createElement("ScrollingFrame", v137, v139);
		return u12.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__11.backgroundPrimary, 
			BorderSizePixel = 0
		}, v120);
	end)
};
