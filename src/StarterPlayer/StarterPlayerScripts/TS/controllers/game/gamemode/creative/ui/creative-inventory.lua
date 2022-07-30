-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v3 = v2.import(script, v2.getModule(script, "@easy-games", "game-core").out);
local v4 = v2.import(script, v2.getModule(script, "@rbxts", "object-utils"));
local l__items__5 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items;
local v6 = v4.entries(l__items__5);
v1 = {};
for v7 = 1, #v6 do
	local v8 = v6[v7];
	local v9 = v8[1];
	table.insert(v1, v8[2].displayName);
	v1 = v1;
end;
local v10 = {};
local v11 = setmetatable({}, {
	__index = v10
});
v11.ALL = "all";
v10.all = "ALL";
v11.BLOCKS = "blocks";
v10.blocks = "BLOCKS";
v11.COMBAT = "combat";
v10.combat = "COMBAT";
v11.CONSUMABLES = "consumables";
v10.consumables = "CONSUMABLES";
v11.TOOLS = "tools";
v10.tools = "TOOLS";
local u1 = v2.import(script, v2.getModule(script, "@rbxts", "roact").src);
local l__DarkBackground__2 = v3.DarkBackground;
local l__ScaleComponent__3 = v3.ScaleComponent;
local l__Flamework__4 = v2.import(script, v2.getModule(script, "@flamework", "core").out).Flamework;
local l__TabsComponent__5 = v2.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "tabs", "tabs-component").TabsComponent;
local l__AutoCompleteSearchbar__6 = v2.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar;
local l__KnitClient__7 = v2.import(script, v2.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Theme__8 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ItemToolTip__9 = v2.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "item-tool-tip").ItemToolTip;
local l__AutoCanvasScrollingFrame__10 = v3.AutoCanvasScrollingFrame;
local l__WidgetComponent__11 = v3.WidgetComponent;
local l__BedwarsImageId__12 = v2.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__BedwarsAppIds__13 = v2.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__TooltipContainer__14 = v3.TooltipContainer;
local l__AutoSizedText__15 = v3.AutoSizedText;
local l__SlideIn__16 = v3.SlideIn;
return {
	CreativeInventory = v2.import(script, v2.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v12 = {};
		for v13, v14 in pairs(p2) do
			v12[v13] = v14;
		end;
		return v12;
	end)((v2.import(script, v2.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p3, p4)
		local l__useState__15 = p4.useState;
		local v16, v17 = l__useState__15(v11.ALL);
		local v18, v19 = l__useState__15({});
		local v20, v21 = l__useState__15({});
		local v22, v23 = l__useState__15("");
		p4.useEffect(function()
			local v24 = {};
			if v16 == v11.BLOCKS then
				local v25 = {};
				local v26 = 0;
				local v27, v28, v29 = ipairs((v4.entries(l__items__5)));
				while true do
					local v30, v31 = v27(v28, v29);
					if not v30 then
						break;
					end;
					local v32 = v31[1];
					if v31[2].block ~= nil == true then
						v26 = v26 + 1;
						v25[v26] = v31;
					end;				
				end;
				v24 = v25;
			elseif v16 == v11.COMBAT then
				local v33 = {};
				local v34 = 0;
				local v35, v36, v37 = ipairs((v4.entries(l__items__5)));
				while true do
					local v38, v39 = v35(v36, v37);
					if not v38 then
						break;
					end;
					local v40 = v39[1];
					local v41 = v39[2];
					if (v41.sword or v41.projectileSource) ~= nil == true then
						v34 = v34 + 1;
						v33[v34] = v39;
					end;				
				end;
				v24 = v33;
			elseif v16 == v11.CONSUMABLES then
				local v42 = {};
				local v43 = 0;
				local v44, v45, v46 = ipairs((v4.entries(l__items__5)));
				while true do
					local v47, v48 = v44(v45, v46);
					if not v47 then
						break;
					end;
					local v49 = v48[1];
					if v48[2].consumable ~= nil == true then
						v43 = v43 + 1;
						v42[v43] = v48;
					end;				
				end;
				v24 = v42;
			elseif v16 == v11.TOOLS then
				local v50 = {};
				local v51 = 0;
				local v52, v53, v54 = ipairs((v4.entries(l__items__5)));
				while true do
					local v55, v56 = v52(v53, v54);
					if not v55 then
						break;
					end;
					local v57 = v56[1];
					if v56[2].breakBlock ~= nil == true then
						v51 = v51 + 1;
						v50[v51] = v56;
					end;				
				end;
				v24 = v50;
			elseif v16 == v11.ALL then
				v24 = v4.entries(l__items__5);
			end;
			table.sort(v24, function(p5, p6)
				return p5[2].displayName < p6[2].displayName;
			end);
			v23("");
			v19(v24);
			v21(v24);
		end, { v16 });
		local v58 = { u1.createElement(l__DarkBackground__2, {
				AppId = p3.AppId
			}) };
		local v59 = {};
		local v60 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromOffset(640, 440), 
			BackgroundTransparency = 1
		};
		local v61 = { u1.createElement(l__ScaleComponent__3, {
				MaximumSize = Vector2.new(704, 484.00000000000006), 
				ScreenPadding = Vector2.new(24, 24)
			}) };
		local v62 = {
			AppId = p3.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false, 
			Title = "Creative Inventory"
		};
		function v62.OnClose()
			l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p3.AppId);
		end;
		local v63 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0, 8)
			}), u1.createElement(l__TabsComponent__5, {
				Value = v16, 
				Tabs = v4.values(v11), 
				OnChange = function(p7)
					v17(p7);
				end, 
				FrameProps = {
					LayoutOrder = 1
				}
			}), u1.createElement(l__AutoCompleteSearchbar__6, {
				Size = UDim2.new(1, 0, 0, 30), 
				Items = local v64, 
				InputText = v22, 
				OnTextChange = function(p8, p9)
					v17(v11.ALL);
					local v65 = {};
					local v66 = 0;
					local v67, v68, v69 = ipairs((v4.entries(l__items__5)));
					while true do
						local v70, v71 = v67(v68, v69);
						if not v70 then
							break;
						end;
						local v72 = v71[1];
						if table.find(p9, v71[2].displayName) ~= nil == true then
							v66 = v66 + 1;
							v65[v66] = v71;
						end;					
					end;
					v21(v65);
					v23(p8);
				end, 
				PlaceHolderText = "Search All Items", 
				LayoutOrder = 2
			}) };
		local function v73(p10)
			local v74 = {};
			local v75 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1
			};
			local u17 = p10[1];
			v75[u1.Event.Activated] = function()
				l__KnitClient__7.Controllers.GamemodeController:requestCreativeItem(u17);
			end;
			v74.ItemFrame = u1.createElement("ImageButton", v75, { u1.createElement("UIStroke", {
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
			return u1.createFragment(v74);
		end;
		local v76 = table.create(#v20);
		for v77, v78 in ipairs(v20) do
			v76[v77] = v73(v78, v77 - 1, v20);
		end;
		local v79 = {
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 1, -60), 
				LayoutOrder = 3
			}, 
			AdditionalSpace = 10
		};
		local v80 = { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4)
			}), u1.createElement("UIGridLayout", {
				FillDirection = "Horizontal", 
				FillDirectionMaxCells = 10, 
				CellSize = UDim2.new(0, 48, 0, 48), 
				CellPadding = UDim2.new(0, 8, 0, 8), 
				HorizontalAlignment = "Center"
			}) };
		local v81 = #v80;
		for v82, v83 in ipairs(v76) do
			v80[v81 + v82] = v83;
		end;
		v63.CreativeInventory = u1.createElement(l__AutoCanvasScrollingFrame__10, v79, v80);
		v61[#v61 + 1] = u1.createElement(l__WidgetComponent__11, v62, v63);
		v61.OpenPlayerInventoryBtn = u1.createElement("ImageButton", {
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
				local v84 = l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
				if v84:isAppOpen(l__BedwarsAppIds__13.INVENTORY) then
					v84:closeApp(l__BedwarsAppIds__13.INVENTORY);
					return;
				end;
				v84:openApp(l__BedwarsAppIds__13.INVENTORY, {});
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
		v59[#v59 + 1] = u1.createElement("Frame", v60, v61);
		v58[#v58 + 1] = u1.createElement(l__SlideIn__16, {}, v59);
		return u1.createFragment({
			CreativeInventory = u1.createElement("ScreenGui", {
				ResetOnSpawn = false
			}, v58)
		});
	end)))
};
