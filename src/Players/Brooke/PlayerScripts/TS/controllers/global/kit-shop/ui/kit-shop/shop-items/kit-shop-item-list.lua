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
					return true;
				end;
				local v63 = {};
				local v64 = 0;
				for v65, v66 in ipairs(v56) do
					if v60(v66, v65 - 1, v56) == true then
						v64 = v64 + 1;
						v63[v64] = v66;
					end;
				end;
				table.sort(v63, function(p7, p8)
					return l__BedwarsKitMeta__6[p7].name < l__BedwarsKitMeta__6[p8].name;
				end);
				local v67 = table.create(#v63);
				for v68, v69 in ipairs(v63) do
					v67[v68] = {
						bedwarsKit = v69
					};
				end;
				return v67;
			end;
			local v70 = v41(u8.values(l__BedwarsKitShop__3.ShopKits), {
				includeFreeKits = true, 
				includeBattlePassKits = true
			});
			local v71 = u8.entries(l__BedwarsBPKits__9);
			table.sort(v71, function(p9, p10)
				local v72 = p9[2];
				local v73 = p10[2];
				return p10[1] < p9[1];
			end);
			v40 = {};
			local function v74(p11, p12)
				local v75 = p12[1];
				local v76 = {};
				local v77 = #v76;
				local v78 = #p11;
				table.move(p11, 1, v78, v77 + 1, v76);
				local v79 = v41(p12[2], {
					includeBattlePassKits = true
				});
				table.move(v79, 1, #v79, v77 + v78 + 1, v76);
				p11 = v76;
				return p11;
			end;
			for v80 = 1, #v71 do
				v40 = v74(v40, v71[v80], v80 - 1, v71);
			end;
			local v81 = v41(u8.values(l__BedwarsKitShop__3.ShopKits));
			local v82 = u8.values(l__BundleType__10);
			local function v83(p13)
				local v84 = l__BundleMeta__2[p13];
				if v84.kitShopBundle ~= nil and v84.kits then
					local v85 = v84.kitShopBundle;
					if v85 ~= nil then
						v85 = v85.disabled;
					end;
					if v85 then
						return nil;
					end;
					local v86 = true;
					for v87, v88 in ipairs(v84.kits) do
						if table.find(p1.store.Bedwars.ownedKits, v88) == nil then
							v86 = false;
							break;
						end;
					end;
					if not v86 then
						return true;
					end;
				end;
				return false;
			end;
			local v89 = {};
			local v90 = 0;
			for v91, v92 in ipairs(v82) do
				if v83(v92, v91 - 1, v82) == true then
					v90 = v90 + 1;
					v89[v90] = v92;
				end;
			end;
			table.sort(v89, function(p14, p15)
				return l__BundleMeta__2[p14].name < l__BundleMeta__2[p15].name;
			end);
			local v93 = table.create(#v89);
			for v94, v95 in ipairs(v89) do
				v93[v94] = {
					kitBundle = v95
				};
			end;
			local v96 = {};
			local v97 = #v96;
			local v98 = #v70;
			table.move(v70, 1, v98, v97 + 1, v96);
			local v99 = v97 + v98;
			local v100 = #v93;
			table.move(v93, 1, v100, v99 + 1, v96);
			local v101 = v99 + v100;
			local v102 = #local v103;
			table.move(v103, 1, v102, v101 + 1, v96);
			table.move(v81, 1, #v81, v101 + v102 + 1, v96);
			v16(v96);
			local v104 = {};
			local v105 = #v104;
			local v106 = #v70;
			table.move(v70, 1, v106, v105 + 1, v104);
			local v107 = v105 + v106;
			local v108 = #v93;
			table.move(v93, 1, v108, v107 + 1, v104);
			local v109 = v107 + v108;
			local v110 = #v103;
			table.move(v103, 1, v110, v109 + 1, v104);
			table.move(v81, 1, #v81, v109 + v110 + 1, v104);
			v18(v104);
		end, { v11, v13, p1.store.Bedwars.ownedKits });
		l__useEffect__6(function()
			if #v15 == 0 then
				return nil;
			end;
			v18((u19()));
		end, { v11, v13 });
		local v111 = {};
		local v112 = {
			Size = UDim2.fromScale(1, 0.05), 
			LayoutOrder = 1
		};
		function v112.SetKitOwnedToggle(p16)
			v12(p16);
		end;
		function v112.SetBattlePassKitsToggle(p17)
			v14(p17);
		end;
		v112.KitOwnedToggle = v11;
		v112.BattlePassKitsToggle = v13;
		v111[1] = u12.createElement("UIPadding", {
			PaddingTop = UDim.new(0.03, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		});
		v111[2] = u12.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0.01, 0)
		});
		v111[3] = u12.createElement(l__KitShopFilters__13, v112);
		local v113 = #v111;
		local v114 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v115 = 0.08;
		else
			v115 = 0.06;
		end;
		v114.Size = UDim2.new(0.6, 0, v115, 0);
		v4 = {};
		local function v116(p18, p19)
			if p19.bedwarsKit then
				table.insert(p18, l__getBedwarsKitMeta__1(p19.bedwarsKit).name);
				return p18;
			end;
			if p19.kitBundle then
				local l__kitShopBundle__117 = l__BundleMeta__2[p19.kitBundle].kitShopBundle;
				if l__kitShopBundle__117 then
					table.insert(p18, l__kitShopBundle__117.name);
				end;
			end;
			return p18;
		end;
		for v118 = 1, #v15 do
			v4 = v116(v4, v15[v118], v118 - 1, v15);
		end;
		v114.Items = local v119;
		v114.InputText = "";
		local function u21(p20, p21)
			if p20 == "" then
				v20({});
				return u19();
			end;
			local u22 = {};
			local function v120(p22)
				local function v121(p23)
					if p23.bedwarsKit then
						return string.lower(l__getBedwarsKitMeta__1(p23.bedwarsKit).name) == string.lower(p22);
					end;
					if not p23.kitBundle then
						return;
					end;
					local v122 = l__BundleMeta__2[p23.kitBundle].kitShopBundle;
					if v122 ~= nil then
						v122 = string.lower(v122.name);
					end;
					return v122 == string.lower(p22);
				end;
				local v123 = nil;
				for v124, v125 in ipairs(v15) do
					if v121(v125, v124 - 1, v15) == true then
						v123 = v125;
						break;
					end;
				end;
				if v123 then
					table.insert(u22, v123);
				end;
			end;
			for v126, v127 in ipairs(p21) do
				v120(v127, v126 - 1, p21);
			end;
			v20(u22);
			return u22;
		end;
		function v114.OnTextChange(p24, p25)
			v18((u21(p24, p25)));
		end;
		v114.PlaceHolderText = "Search Kit";
		v114.LayoutOrder = 2;
		v111[v113 + 1] = u12.createElement(l__AutoCompleteSearchbar__14, v114);
		local v128 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v129 = 0.87;
		else
			v129 = 0.89;
		end;
		v128.Size = UDim2.new(1, 0, v129, 0);
		v128.CanvasSize = UDim2.new(1, 0, 0, v9 + 36);
		v128.ScrollingDirection = "Y";
		v128.ScrollBarThickness = 6;
		v128.BackgroundTransparency = 1;
		v128.BorderSizePixel = 0;
		v128.Selectable = false;
		v128[u12.Change.AbsoluteSize] = function(p26)
			v8(p26.AbsoluteSize);
		end;
		v128.LayoutOrder = 2;
		local v130 = {};
		local function v131(p27, p28)
			if p27.bedwarsKit then
				local l__bedwarsKit__132 = p27.bedwarsKit;
				local v133 = {
					Kit = l__bedwarsKit__132, 
					Selected = p1.SelectedKit == l__bedwarsKit__132, 
					LayoutOrder = p28, 
					store = p1.store
				};
				function v133.OnClick()
					p1.SetSelectedKit(l__bedwarsKit__132);
				end;
				return u12.createElement(l__KitShopItemCard__15, v133);
			end;
			if not p27.kitBundle then
				return;
			end;
			local l__kitBundle__134 = p27.kitBundle;
			local v135 = {
				Bundle = l__kitBundle__134, 
				LayoutOrder = p28, 
				Selected = p1.SelectedBundle == l__kitBundle__134
			};
			function v135.OnClick()
				p1.SetSelectedBundle(l__kitBundle__134);
			end;
			v135.store = p1.store;
			return u12.createElement(l__KitShopBundleCard__16, v135);
		end;
		local v136 = {};
		local v137 = 0;
		for v138, v139 in ipairs(v17) do
			local v140 = v131(v139, v138 - 1, v17);
			if v140 ~= nil then
				v137 = v137 + 1;
				v136[v137] = v140;
			end;
		end;
		local v141 = {
			Position = UDim2.fromScale(0, 0.01), 
			Size = UDim2.fromScale(0.99, 0.9)
		};
		local v142 = {};
		local v143 = {
			CellSize = UDim2.fromOffset(v21, v21), 
			CellPadding = UDim2.fromOffset(v22, v22), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		v143[u12.Change.AbsoluteCellCount] = function(p29)
			v10(p29.AbsoluteContentSize.Y);
		end;
		v142[1] = u12.createElement("UIGridLayout", v143);
		v142[2] = u12.createElement(l__KitShopItemCard__15, {
			Kit = l__BedwarsKit__17.NONE, 
			Selected = p1.SelectedKit == l__BedwarsKit__17.NONE, 
			LayoutOrder = -2, 
			store = p1.store, 
			OnClick = function()
				p1.SetSelectedKit(l__BedwarsKit__17.NONE);
			end
		});
		local v144 = #v142;
		for v145, v146 in ipairs(v136) do
			v142[v144 + v145] = v146;
		end;
		v130[#v130 + 1] = u12.createElement(l__Empty__18, v141, v142);
		v111[v113 + 2] = u12.createElement("ScrollingFrame", v128, v130);
		return u12.createElement("Frame", {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__11.backgroundPrimary, 
			BorderSizePixel = 0
		}, v111);
	end)
};
