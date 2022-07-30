-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("ItemToolTip");
function v4.init(p1, p2)

end;
local l__getItemMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__AutoSizedText__2 = v2.AutoSizedText;
local l__TooltipContainer__3 = v2.TooltipContainer;
function v4.render(p3)
	local l__item__5 = p3.props.item;
	if l__item__5 == nil then
		return nil;
	end;
	local v6 = l__getItemMeta__1(l__item__5);
	local v7 = v6;
	if v7 ~= nil then
		v7 = v7.description;
	end;
	local v8 = v7 ~= nil and v3.createElement(l__AutoSizedText__2, {
		Text = v6.description, 
		Font = Enum.Font.SourceSansSemibold, 
		TextSize = 14, 
		Limits = Vector2.new(300, 500)
	});
	local v9 = { v3.createElement(l__AutoSizedText__2, {
			Text = v6.displayName, 
			Font = Enum.Font.SourceSansBold, 
			TextSize = 16, 
			Limits = Vector2.new(300, 60)
		}) };
	if v8 then
		v9[#v9 + 1] = v8;
	end;
	return v3.createElement(l__TooltipContainer__3, {}, v9);
end;
return {
	ItemToolTip = v4
};
