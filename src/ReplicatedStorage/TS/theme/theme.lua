-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ColorUtil__3 = v2.ColorUtil;
local v4 = {
	backgroundPrimary = l__ColorUtil__3.hexColor(6580135), 
	backgroundSecondary = l__ColorUtil__3.hexColor(5132418), 
	backgroundTertiary = l__ColorUtil__3.hexColor(4013929), 
	backgroundSuccess = l__ColorUtil__3.hexColor(2600544), 
	backgroundError = l__ColorUtil__3.hexColor(15423319), 
	interactionPrimary = l__ColorUtil__3.hexColor(3487320), 
	textPrimary = l__ColorUtil__3.hexColor(12172543), 
	textPrimaryRichText = l__ColorUtil__3.richTextColor(Color3.fromRGB(185, 188, 255)), 
	textSecondary = l__ColorUtil__3.hexColor(13224408), 
	textSecondaryRichText = l__ColorUtil__3.richTextColor(l__ColorUtil__3.hexColor(13224408)), 
	invBackgroundPrimary = l__ColorUtil__3.hexColor(1909806), 
	invTileTransparency = 0, 
	mcGreen = l__ColorUtil__3.hexColor(5635925), 
	mcAqua = l__ColorUtil__3.hexColor(5636095), 
	mcRed = l__ColorUtil__3.hexColor(16733525), 
	mcYellow = l__ColorUtil__3.hexColor(16777045), 
	mcPink = l__ColorUtil__3.hexColor(16733695), 
	nametagBackgroundTransparency = 0.6, 
	topBarTopOffset = 4, 
	topBarHorizontalOffset = 60, 
	topBarGuiSpacing = 12, 
	topBarGuiSize = 32, 
	topBarGuiInset = 40, 
	centerTopAnnouncementCardSize = UDim2.fromScale(0.6, 0.06), 
	actionBarProgressBarSize = UDim2.fromScale(1, 0.03), 
	actionBarButtonSize = UDim2.fromScale(1, 0.05), 
	promptHoldDuration = 0.3, 
	promptKeyboardKey = Enum.KeyCode.F, 
	cooldownBarSize = UDim2.fromScale(0.75, 0.02)
};
local v5 = {};
for v6, v7 in pairs(v2.GameTheme) do
	v5[v6] = v7;
end;
for v8, v9 in pairs(v4) do
	v5[v8] = v9;
end;
v5.mcGold = l__ColorUtil__3.hexColor(16689920);
v5.mcBlue = l__ColorUtil__3.hexColor(5593086);
return {
	GameThemeOverrides = v4, 
	Theme = v5
};
