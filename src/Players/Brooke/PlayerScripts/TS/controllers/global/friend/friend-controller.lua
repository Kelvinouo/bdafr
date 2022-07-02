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
		local v12 = {};
		local v13 = 0;
		local v14, v15, v16 = ipairs(p10);
		while true do
			local v17, v18 = v14(v15, v16);
			if not v17 then
				break;
			end;
			if table.find(u6, v18) == nil == true then
				v13 = v13 + 1;
				v12[v13] = v18;
			end;		
		end;
		local v19 = {};
		local v20 = 0;
		local v21, v22, v23 = ipairs(v12);
		while true do
			local v24, v25 = v21(v22, v23);
			if not v24 then
				break;
			end;
			if string.lower(v25.username) == u7 == true then
				v20 = v20 + 1;
				v19[v20] = v25;
			end;		
		end;
		for v26, v27 in ipairs(v19) do
			table.insert(u6, v27);
		end;
		local v28 = {};
		local v29 = 0;
		local v30, v31, v32 = ipairs(p10);
		while true do
			local v33, v34 = v30(v31, v32);
			if not v33 then
				break;
			end;
			if table.find(u6, v34) == nil == true then
				v29 = v29 + 1;
				v28[v29] = v34;
			end;		
		end;
		local v35 = {};
		local v36 = 0;
		for v37, v38 in ipairs(v28) do
			if u5.startsWith(string.lower(v38.username), u7) == true then
				v36 = v36 + 1;
				v35[v36] = v38;
			end;
		end;
		for v39, v40 in ipairs(v35) do
			table.insert(u6, v40);
		end;
		local v41 = {};
		local v42 = 0;
		local v43, v44, v45 = ipairs(p10);
		while true do
			local v46, v47 = v43(v44, v45);
			if not v46 then
				break;
			end;
			if table.find(u6, v47) == nil == true then
				v42 = v42 + 1;
				v41[v42] = v47;
			end;		
		end;
		local v48 = {};
		local v49 = 0;
		for v50, v51 in ipairs(v41) do
			if u5.includes(string.lower(v51.username), u7) == true then
				v49 = v49 + 1;
				v48[v49] = v51;
			end;
		end;
		for v52, v53 in ipairs(v48) do
			table.insert(u6, v53);
		end;
		return u6;
	end));
end);
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
