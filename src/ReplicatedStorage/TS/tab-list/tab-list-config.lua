-- Script Hash: 9208d39cd1ea399eaf8ca8e39c6f47265802166536a809abd4551bc3462bb987fb944fc55b207dd9b5ab47150d6c6513
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__DeviceUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local u2 = nil;
local v3 = {};
if l__DeviceUtil__2.isSmallScreen() then
	local v4 = 0.8;
else
	v4 = 0.6;
end;
v3.heightScale = v4;
if l__DeviceUtil__2.isSmallScreen() then
	local v5 = 0.6;
else
	v5 = 0.6;
end;
v3.widthScale = v5;
v3.openedPositionX = 0.5;
v3.closedPositionX = 1.5;
v3.openedPositionY = 0.1;
v3.closedPositionY = 0.1;
v3.maxRowSizeX = 650;
v3.maxRowSizeY = 36;
v3.maxRowSize = Vector2.new(650, 36);
v3.visible = {
	columnHeaders = true, 
	teamCards = true
};
v3.bgTransparency = {
	columnHeaders = 0.5, 
	cardHeader = 0.4, 
	playerRow = 0.4
};
local v6 = {};
local v7 = {
	totalWidth = 0.7
};
local v8 = {};
if l__DeviceUtil__2.isSmallScreen() then
	local v9 = 8;
else
	v9 = 0;
end;
v8.width = 36 - v9;
v7.avatar = v8;
v7.players = {
	leftPadding = 0.05
};
v6.left = v7;
v6.right = {
	totalWidth = 0.3, 
	kills = {
		width = 0.5
	}, 
	breaks = {
		width = 0.5
	}
};
v3.columns = v6;
v3.rows = {
	columnHeaders = {
		bottomBorderHeight = 1
	}, 
	cards = {
		height = 0.93, 
		scrollingHeight = 1, 
		card = {
			height = 0, 
			cardHeader = {
				height = 0.07
			}, 
			playerRow = {
				height = 0.07, 
				bottomBorderHeight = 1
			}
		}
	}
};
u2 = v3;
return {
	calcCardsDimensions = function()
		local v10 = l__Workspace__1.CurrentCamera;
		if v10 ~= nil then
			v10 = v10.ViewportSize.X;
		end;
		local v11 = l__Workspace__1.CurrentCamera;
		if v11 ~= nil then
			v11 = v11.ViewportSize.Y;
		end;
		return { v10 * u2.widthScale / 2, v11 * u2.heightScale * u2.rows.cards.height };
	end, 
	tabListLayout = u2
};
