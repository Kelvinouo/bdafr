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
				local l__ownedKits__20 = p1.store.Bedwars.ownedKits;
				local function v29(p4)
					if not p4.bedwarsKit then
						return false;
					end;
					return table.find(l__ownedKits__20, p4.bedwarsKit) ~= nil;
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
			local v34 = nil;
			local function v35(p5, p6)
				local function v36(p7)
					return not l__getBedwarsKitMeta__1(p7).hiddenInShop;
				end;
				local v37 = {};
				local v38 = 0;
				for v39, v40 in ipairs(p5) do
					if v36(v40, v39 - 1, p5) == true then
						v38 = v38 + 1;
						v37[v38] = v40;
					end;
				end;
				local function v41(p8)
					local v42 = p6;
					if v42 ~= nil then
						v42 = v42.includeFreeKits;
					end;
					if v42 then
						return table.find(l__BedwarsKitShop__3.FreeKits, p8) ~= nil;
					end;
					return table.find(l__BedwarsKitShop__3.FreeKits, p8) == nil;
				end;
				local v43 = {};
				local v44 = 0;
				for v45, v46 in ipairs(v37) do
					if v41(v46, v45 - 1, v37) == true then
						v44 = v44 + 1;
						v43[v44] = v46;
					end;
				end;
				local function v47(p9)
					if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
						return true;
					end;
					if l__getBedwarsKitMeta__1(p9).hiddenInShopTillUnlocked and table.find(p1.store.Bedwars.ownedKits, p9) == nil then
						return false;
					end;
					return true;
				end;
				local v48 = {};
				local v49 = 0;
				for v50, v51 in ipairs(v43) do
					if v47(v51, v50 - 1, v43) == true then
						v49 = v49 + 1;
						v48[v49] = v51;
					end;
				end;
				local function v52(p10)
					local v53 = l__BedwarsKitMeta__6[p10];
					if v53.battlepassSeason ~= nil then
						local v54 = p6;
						if v54 ~= nil then
							v54 = v54.includeBattlePassKits;
						end;
						if not v54 then
							return false;
						end;
						if not l__DeviceUtil__4.isHoarceKat() and l__KnitClient__5.Controllers.UnlockController.allKitsUnlocked then
							return true;
						end;
						if table.find(l__BedwarsKitShop__3.FreeKits, p10) ~= nil then
							return true;
						end;
						if v53.battlepassSeason ~= l__BattlePassUtils__7.BATTLE_PASS_SEASON and table.find(p1.store.Bedwars.ownedKits, p10) == nil then
							return false;
						end;
					end;
					return true;
				end;
				local v55 = {};
				local v56 = 0;
				for v57, v58 in ipairs(v48) do
					if v52(v58, v57 - 1, v48) == true then
						v56 = v56 + 1;
						v55[v56] = v58;
					end;
				end;
				table.sort(v55, function(p11, p12)
					return l__BedwarsKitMeta__6[p11].name < l__BedwarsKitMeta__6[p12].name;
				end);
				local function v59(p13)
					return {
						bedwarsKit = p13
					};
				end;
				local v60 = table.create(#v55);
				for v61, v62 in ipairs(v55) do
					v60[v61] = v59(v62, v61 - 1, v55);
				end;
				return v60;
			end;
			local v63 = v35(u8.values(l__BedwarsKitShop__3.ShopKits), {
				includeFreeKits = true, 
				includeBattlePassKits = true
			});
			local v64 = u8.entries(l__BedwarsBPKits__9);
			table.sort(v64, function(p14, p15)
				local v65 = p14[2];
				local v66 = p15[2];
				return p15[1] < p14[1];
			end);
			v34 = {};
			local function v67(p16, p17)
				local v68 = p17[1];
				local v69 = {};
				local v70 = #v69;
				local v71 = #p16;
				table.move(p16, 1, v71, v70 + 1, v69);
				local v72 = v35(p17[2], {
					includeBattlePassKits = true
				});
				table.move(v72, 1, #v72, v70 + v71 + 1, v69);
				p16 = v69;
				return p16;
			end;
			for v73 = 1, #v64 do
				v34 = v67(v34, v64[v73], v73 - 1, v64);
			end;
			local v74 = v35(u8.values(l__BedwarsKitShop__3.ShopKits));
			local v75 = u8.values(l__BundleType__10);
			local function v76(p18)
				local v77 = l__BundleMeta__2[p18];
				if v77.kitShopBundle ~= nil and v77.kits then
					local v78 = v77.kitShopBundle;
					if v78 ~= nil then
						v78 = v78.disabled;
					end;
					if v78 then
						return nil;
					end;
					local l__kits__79 = v77.kits;
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
			for v86, v87 in ipairs(v75) do
				if v76(v87, v86 - 1, v75) == true then
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
			local v94 = #v63;
			table.move(v63, 1, v94, v93 + 1, v92);
			local v95 = v93 + v94;
			local v96 = #v89;
			table.move(v89, 1, v96, v95 + 1, v92);
			local v97 = v95 + v96;
			local v98 = #local v99;
			table.move(v99, 1, v98, v97 + 1, v92);
			table.move(v74, 1, #v74, v97 + v98 + 1, v92);
			v16(v92);
			local v100 = {};
			local v101 = #v100;
			local v102 = #v63;
			table.move(v63, 1, v102, v101 + 1, v100);
			local v103 = v101 + v102;
			local v104 = #v89;
			table.move(v89, 1, v104, v103 + 1, v100);
			local v105 = v103 + v104;
			local v106 = #v99;
			table.move(v99, 1, v106, v105 + 1, v100);
			table.move(v74, 1, #v74, v105 + v106 + 1, v100);
			v18(v100);
		end, { v11, v13, p1.store.Bedwars.ownedKits });
		l__useEffect__6(function()
			if #v15 == 0 then
				return nil;
			end;
			v18((u19()));
		end, { v11, v13 });
		local v107 = {};
		local v108 = {
			Size = UDim2.fromScale(1, 0.05), 
			LayoutOrder = 1
		};
		function v108.SetKitOwnedToggle(p23)
			v12(p23);
		end;
		function v108.SetBattlePassKitsToggle(p24)
			v14(p24);
		end;
		v108.KitOwnedToggle = v11;
		v108.BattlePassKitsToggle = v13;
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
		v4 = {};
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
		for v114 = 1, #v15 do
			v4 = v112(v4, v15[v114], v114 - 1, v15);
		end;
		v110.Items = local v115;
		v110.InputText = "";
		local function u21(p27, p28)
			if p27 == "" then
				v20({});
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
				for v120, v121 in ipairs(v15) do
					if v117(v121, v120 - 1, v15) == true then
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
			v20(u22);
			return u22;
		end;
		function v110.OnTextChange(p31, p32)
			v18(u21(p31, p32));
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
		v124.CanvasSize = UDim2.new(1, 0, 0, v9 + 36);
		v124.ScrollingDirection = "Y";
		v124.ScrollBarThickness = 6;
		v124.BackgroundTransparency = 1;
		v124.BorderSizePixel = 0;
		v124.Selectable = false;
		v124[u12.Change.AbsoluteSize] = function(p33)
			v8(p33.AbsoluteSize);
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
		for v134, v135 in ipairs(v17) do
			local v136 = v127(v135, v134 - 1, v17);
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
			CellSize = UDim2.fromOffset(v21, v21), 
			CellPadding = UDim2.fromOffset(v22, v22), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		v139[u12.Change.AbsoluteCellCount] = function(p36)
			v10(p36.AbsoluteContentSize.Y);
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
