-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ThemedEventMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-meta").ThemedEventMeta;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
local l__ThemedEventQuestCard__4 = v1.import(script, script.Parent, "themed-event-quest-card").ThemedEventQuestCard;
local l__AutoCanvasScrollingFrame__5 = v2.AutoCanvasScrollingFrame;
local l__Empty__6 = v2.Empty;
return {
	ThemedEventQuestsList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__quests__4 = l__ThemedEventMeta__1[p1.ThemedEventType].quests;
		local v5 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v6 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0.025, 0)
			}) };
		local v7 = false;
		if p1.QuestListTitle ~= nil then
			v7 = u2.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 0), 
				AutomaticSize = "Y", 
				BackgroundTransparency = 1, 
				Text = "<b>" .. p1.QuestListTitle .. "</b>", 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__ColorUtil__3.WHITE, 
				TextScaled = true, 
				RichText = true, 
				Font = Enum.Font.Roboto
			}, { u2.createElement("UITextSizeConstraint", {
					MaxTextSize = 40
				}) });
		end;
		if v7 then
			v6[#v6 + 1] = v7;
		end;
		local v8 = table.create(#l__quests__4);
		for v9, v10 in ipairs(l__quests__4) do
			v8[v9] = u2.createElement(l__ThemedEventQuestCard__4, {
				ThemedEventType = p1.ThemedEventType, 
				Quest = v10, 
				PersonalCollectables = p1.PersonalCollectables
			});
		end;
		local v11 = {
			ScrollingFrameProps = {
				Size = UDim2.fromScale(1, 0.9)
			}
		};
		local v12 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0.03, 0)
			}) };
		local v13 = #v12;
		for v14, v15 in ipairs(v8) do
			v12[v13 + v14] = v15;
		end;
		v6[#v6 + 1] = u2.createElement(l__AutoCanvasScrollingFrame__5, v11, v12);
		return u2.createFragment({
			QuestsList = u2.createElement(l__Empty__6, v5, v6)
		});
	end)
};
