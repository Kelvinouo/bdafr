-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "FriendController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "FriendController";
end;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	if not l__PlaceUtil__2.isLobbyServer() then
		return nil;
	end;
	local u4 = nil;
	u4 = v1.async(function(p3)
		local v5 = {};
		for v6, v7 in ipairs(p3:GetCurrentPage()) do
			table.insert(v5, {
				userId = v7.Id, 
				username = v7.Username, 
				isOnline = v7.IsOnline
			});
		end;
		if p3.IsFinished then
			return v5;
		end;
		p3:AdvanceToNextPageAsync();
		local v8 = {};
		local v9 = #v8;
		local v10 = #v5;
		table.move(v5, 1, v10, v9 + 1, v8);
		local v11 = v1.await(u4(p3));
		table.move(v11, 1, #v11, v9 + v10 + 1, v8);
		return v8;
	end);
	p2.friends = v1.Promise.promisify(function()
		return l__Players__3:GetFriendsAsync(l__Players__3.LocalPlayer.UserId);
	end)():andThen(u4):andThen(function(p4)
		table.sort(p4, function(p5, p6)
			return p5.username < p6.username;
		end);
		return p4;
	end);
end;
v3.getFriends = v1.async(function(p7)
	return v1.await(p7.friends);
end);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
v3.fuzzySearchFriends = v1.async(function(p8, p9)
	local u6 = {};
	local u7 = string.lower(p9);
	return v1.await(p8:getFriends():andThen(function(p10)
		if not p10 then
			return nil;
		end;
		local function v12(p11)
			return table.find(u6, p11) == nil;
		end;
		local v13 = {};
		local v14 = 0;
		for v15, v16 in ipairs(p10) do
			if v12(v16, v15 - 1, p10) == true then
				v14 = v14 + 1;
				v13[v14] = v16;
			end;
		end;
		local function v17(p12)
			return string.lower(p12.username) == u7;
		end;
		local v18 = {};
		local v19 = 0;
		for v20, v21 in ipairs(v13) do
			if v17(v21, v20 - 1, v13) == true then
				v19 = v19 + 1;
				v18[v19] = v21;
			end;
		end;
		local function v22(p13)
			table.insert(u6, p13);
			return #u6;
		end;
		for v23, v24 in ipairs(v18) do
			v22(v24, v23 - 1, v18);
		end;
		local function v25(p14)
			return table.find(u6, p14) == nil;
		end;
		local v26 = {};
		local v27 = 0;
		for v28, v29 in ipairs(p10) do
			if v25(v29, v28 - 1, p10) == true then
				v27 = v27 + 1;
				v26[v27] = v29;
			end;
		end;
		local function v30(p15)
			return u5.startsWith(string.lower(p15.username), u7);
		end;
		local v31 = {};
		local v32 = 0;
		for v33, v34 in ipairs(v26) do
			if v30(v34, v33 - 1, v26) == true then
				v32 = v32 + 1;
				v31[v32] = v34;
			end;
		end;
		local function v35(p16)
			table.insert(u6, p16);
			return #u6;
		end;
		for v36, v37 in ipairs(v31) do
			v35(v37, v36 - 1, v31);
		end;
		local function v38(p17)
			return table.find(u6, p17) == nil;
		end;
		local v39 = {};
		local v40 = 0;
		for v41, v42 in ipairs(p10) do
			if v38(v42, v41 - 1, p10) == true then
				v40 = v40 + 1;
				v39[v40] = v42;
			end;
		end;
		local function v43(p18)
			return u5.includes(string.lower(p18.username), u7);
		end;
		local v44 = {};
		local v45 = 0;
		for v46, v47 in ipairs(v39) do
			if v43(v47, v46 - 1, v39) == true then
				v45 = v45 + 1;
				v44[v45] = v47;
			end;
		end;
		local function v48(p19)
			table.insert(u6, p19);
			return #u6;
		end;
		for v49, v50 in ipairs(v44) do
			v48(v50, v49 - 1, v44);
		end;
		return u6;
	end));
end);
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
