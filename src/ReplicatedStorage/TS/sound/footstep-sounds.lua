-- Script Hash: 98099fd7658c8ab866d3a15c6fc8bc3c7f35906c8b88e2a967b63d666fc5e848f38f5f2c99041b048b9243e5b7b7fe0c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.GRASS = 0;
v1[0] = "GRASS";
v2.STONE = 1;
v1[1] = "STONE";
v2.WOOD = 2;
v1[2] = "WOOD";
v2.SAND = 3;
v1[3] = "SAND";
v2.VOID = 4;
v1[4] = "VOID";
return {
	BlockFootstepSound = v2, 
	FootstepSounds = {
		[v2.GRASS] = {
			walk = { "rbxassetid://6345664026", "rbxassetid://6345663913" }, 
			run = { "rbxassetid://6345664026", "rbxassetid://6345663913" }
		}, 
		[v2.STONE] = {
			walk = { "rbxassetid://6343101162", "rbxassetid://6343101129" }, 
			run = { "rbxassetid://6343101162", "rbxassetid://6343101129" }
		}, 
		[v2.WOOD] = {
			walk = { "rbxassetid://6343101162", "rbxassetid://6343101129" }, 
			run = { "rbxassetid://6343101162", "rbxassetid://6343101129" }
		}, 
		[v2.SAND] = {
			walk = { "rbxassetid://6342794392", "rbxassetid://6342794345", "rbxassetid://6345664026", "rbxassetid://6345663913" }, 
			run = { "rbxassetid://6342794392", "rbxassetid://6342794345", "rbxassetid://6345664026", "rbxassetid://6345663913" }
		}, 
		[v2.VOID] = {
			volume = 0.06, 
			walk = { "rbxassetid://9867707447", "rbxassetid://9867707580", "rbxassetid://9867707252", "rbxassetid://9867707660" }, 
			run = { "rbxassetid://9867707447", "rbxassetid://9867707580", "rbxassetid://9867707252", "rbxassetid://9867707660" }
		}
	}, 
	DefaultFootstepSound = v2.WOOD, 
	TerrainFootstepSounds = {
		[Enum.Material.Grass] = v2.GRASS, 
		[Enum.Material.LeafyGrass] = v2.GRASS, 
		[Enum.Material.Mud] = v2.GRASS, 
		[Enum.Material.Ground] = v2.GRASS, 
		[Enum.Material.Cobblestone] = v2.STONE, 
		[Enum.Material.CrackedLava] = v2.STONE, 
		[Enum.Material.Asphalt] = v2.STONE, 
		[Enum.Material.Rock] = v2.STONE
	}
};
