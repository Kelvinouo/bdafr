-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__items__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local v5 = v3.entries(l__items__4);
local v6 = {};
for v7 = 1, #v5 do
	local v8 = nil;
	v8 = v6;
	local v9 = v5[v7];
	local v10 = v9[1];
	local v11 = v9[2];
	if v11.spawnCommandDisabled then
		local v12 = v8;
	else
		table.insert(v8, v11.displayName);
		v12 = v8;
	end;
end;
local v13 = {};
local v14 = setmetatable({}, {
	__index = v13
});
v14.ALL = "all";
v13.all = "ALL";
v14.BLOCKS = "blocks";
v13.blocks = "BLOCKS";
v14.COMBAT = "combat";
v13.combat = "COMBAT";
v14.CONSUMABLES = "consumables";
v13.consumables = "CONSUMABLES";
v14.TOOLS = "tools";
v13.tools = "TOOLS";
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__2 = v2.DarkBackground;
local l__ScaleComponent__3 = v2.ScaleComponent;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__TabsComponent__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "tabs", "tabs-component").TabsComponent;
local l__AutoCompleteSearchbar__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local l__KnitClient__7 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ItemToolTip__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local l__AutoCanvasScrollingFrame__10 = v2.AutoCanvasScrollingFrame;
local l__WidgetComponent__11 = v2.WidgetComponent;
local l__BedwarsImageId__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsAppIds__13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__TooltipContainer__14 = v2.TooltipContainer;
local l__AutoSizedText__15 = v2.AutoSizedText;
local l__SlideIn__16 = v2.SlideIn;
return {
	CreativeInventory = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v15 = {};
		for v16, v17 in pairs(p2) do
			v15[v16] = v17;
		end;
		return v15;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p3, p4)
		local l__useState__18 = p4.useState;
		local v19, v20 = l__useState__18(v14.ALL);
		local v21, v22 = l__useState__18({});
		local v23, v24 = l__useState__18({});
		local v25, v26 = l__useState__18("");
		p4.useEffect(function()
			local v27 = {};
			if v19 == v14.BLOCKS then
				local v28 = {};
				local v29 = 0;
				local v30, v31, v32 = ipairs((v3.entries(l__items__4)));
				while true do
					v30(v31, v32);
					if not v30 then
						break;
					end;
					local v33 = v31[1];
					local v34 = v31[2];
					local v35 = false;
					if v34.block ~= nil then
						v35 = not v34.spawnCommandDisabled;
					end;
					if v35 == true then
						v29 = v29 + 1;
						v28[v29] = v31;
					end;				
				end;
				v27 = v28;
			elseif v19 == v14.COMBAT then
				local v36 = {};
				local v37 = 0;
				local v38, v39, v40 = ipairs((v3.entries(l__items__4)));
				while true do
					v38(v39, v40);
					if not v38 then
						break;
					end;
					local v41 = v39[1];
					local v42 = v39[2];
					local v43 = false;
					if (v42.sword or v42.projectileSource) ~= nil then
						v43 = not v42.spawnCommandDisabled;
					end;
					if v43 == true then
						v37 = v37 + 1;
						v36[v37] = v39;
					end;				
				end;
				v27 = v36;
			elseif v19 == v14.CONSUMABLES then
				local v44 = {};
				local v45 = 0;
				local v46, v47, v48 = ipairs((v3.entries(l__items__4)));
				while true do
					v46(v47, v48);
					if not v46 then
						break;
					end;
					local v49 = v47[1];
					local v50 = v47[2];
					local v51 = false;
					if v50.consumable ~= nil then
						v51 = not v50.spawnCommandDisabled;
					end;
					if v51 == true then
						v45 = v45 + 1;
						v44[v45] = v47;
					end;				
				end;
				v27 = v44;
			elseif v19 == v14.TOOLS then
				local v52 = {};
				local v53 = 0;
				local v54, v55, v56 = ipairs((v3.entries(l__items__4)));
				while true do
					v54(v55, v56);
					if not v54 then
						break;
					end;
					local v57 = v55[1];
					local v58 = v55[2];
					local v59 = false;
					if v58.breakBlock ~= nil then
						v59 = not v58.spawnCommandDisabled;
					end;
					if v59 == true then
						v53 = v53 + 1;
						v52[v53] = v55;
					end;				
				end;
				v27 = v52;
			elseif v19 == v14.ALL then
				local v60 = {};
				local v61 = 0;
				local v62, v63, v64 = ipairs((v3.entries(l__items__4)));
				while true do
					v62(v63, v64);
					if not v62 then
						break;
					end;
					v64 = v62;
					local v65 = v63[1];
					if not v63[2].spawnCommandDisabled == true then
						v61 = v61 + 1;
						v60[v61] = v63;
					end;				
				end;
				v27 = v60;
			end;
			table.sort(v27, function(p5, p6)
				return p5[2].displayName < p6[2].displayName;
			end);
			v26("");
			v22(v27);
			v24(v27);
		end, { v19 });
		local v66 = { u1.createElement(l__DarkBackground__2, {
				AppId = p3.AppId
			}) };
		local v67 = {};
		local v68 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(640, 440), 
			BackgroundTransparency = 1
		};
		local v69 = { u1.createElement(l__ScaleComponent__3, {
				MaximumSize = Vector2.new(704, 484.00000000000006), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v70 = {
			AppId = p3.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false, 
			Title = "Creative Inventory"
		};
		function v70.OnClose()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p3.AppId);
		end;
		local v71 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 8)
			}), u1.createElement(l__TabsComponent__5, {
				Value = v19, 
				Tabs = v3.values(v14), 
				OnChange = function(p7)
					v20(p7);
				end, 
				FrameProps = {
					LayoutOrder = 1
				}
			}), u1.createElement(l__AutoCompleteSearchbar__6, {
				Size = UDim2.new(1, 0, 0, 30), 
				Items = v12, 
				InputText = v25, 
				OnTextChange = function(p8, p9)
					v20(v14.ALL);
					local v72 = {};
					local v73 = 0;
					local v74, v75, v76 = ipairs((v3.entries(l__items__4)));
					while true do
						v74(v75, v76);
						if not v74 then
							break;
						end;
						local v77 = v75[1];
						if table.find(p9, v75[2].displayName) ~= nil == true then
							v73 = v73 + 1;
							v72[v73] = v75;
						end;					
					end;
					v24(v72);
					v26(p8);
				end, 
				PlaceHolderText = "Search All Items", 
				LayoutOrder = 2
			}) };
		local function v78(p10)
			local v79 = {};
			local v80 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1
			};
			local u17 = p10[1];
			v80[u1.Event.Activated] = function()
				l__KnitClient__7.Controllers.GamemodeController:requestCreativeItem(u17);
			end;
			v79.ItemFrame = u1.createElement("ImageButton", v80, { u1.createElement("UIStroke", {
					Color = l__Theme__8.textPrimary, 
					Thickness = 2, 
					Transparency = 0.3
				}), u1.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.75, 0.75), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Position = UDim2.fromScale(0.5, 0.5), 
					Image = p10[2].image, 
					ScaleType = "Fit", 
					BackgroundTransparency = 1
				}), u1.createElement(l__ItemToolTip__9, {
					item = u17
				}) });
			return u1.createFragment(v79);
		end;
		local v81 = table.create(#v23);
		local v82, v83, v84 = ipairs(v23);
		while true do
			v82(v83, v84);
			if not v82 then
				break;
			end;
			v84 = v82;
			v81[v82] = v78(v83, v82 - 1, v23);		
		end;
		local v85 = {
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, -60), 
				LayoutOrder = 3
			}, 
			AdditionalSpace = 10
		};
		local v86 = { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4)
			}), u1.createElement("UIGridLayout", {
				FillDirection = "Horizontal", 
				FillDirectionMaxCells = 10, 
				CellSize = UDim2.new(0, 48, 0, 48), 
				CellPadding = UDim2.new(0, 8, 0, 8), 
				HorizontalAlignment = "Center"
			}) };
		local v87 = #v86;
		local v88, v89, v90 = ipairs(v81);
		while true do
			v88(v89, v90);
			if not v88 then
				break;
			end;
			v90 = v88;
			v86[v87 + v88] = v89;		
		end;
		v71.CreativeInventory = u1.createElement(l__AutoCanvasScrollingFrame__10, v85, v86);
		v69[#v69 + 1] = u1.createElement(l__WidgetComponent__11, v70, v71);
		v69.OpenPlayerInventoryBtn = u1.createElement("ImageButton", {
			Size = UDim2.fromScale(0.1, 0.1), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.new(1, 0, 1, 6), 
			Image = l__BedwarsImageId__12.ELLIPSIS, 
			ScaleType = "Fit", 
			BackgroundColor3 = Color3.fromHex("6b6fbf"), 
			BorderSizePixel = 0, 
			Active = true, 
			[u1.Event.Activated] = function()
				l__KnitClient__7.Controllers.GamemodeController:toggleCreativeInventory();
				local v91 = l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
				if v91:isAppOpen(l__BedwarsAppIds__13.INVENTORY) then
					v91:closeApp(l__BedwarsAppIds__13.INVENTORY);
					return;
				end;
				v91:openApp(l__BedwarsAppIds__13.INVENTORY, {});
			end
		}, { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}), u1.createElement(l__TooltipContainer__14, {}, { u1.createElement(l__AutoSizedText__15, {
					Text = "Open Player Inventory", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
		v67[#v67 + 1] = u1.createElement("Frame", v68, v69);
		v66[#v66 + 1] = u1.createElement(l__SlideIn__16, {}, v67);
		return u1.createFragment({
			CreativeInventory = u1.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, v66)
		});
	end)))
};
