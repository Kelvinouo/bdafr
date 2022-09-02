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
function v3.constructor(p1, ...)
	l__KnitController__2.constructor(p1, ...);
	p1.Name = "FriendController";
end;
local l__PlaceUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	if not l__PlaceUtil__1.isLobbyServer() then
		return nil;
	end;
	local u3 = nil;
	u3 = v1.async(function(p3)
		local v5 = {};
		local v6, v7, v8 = ipairs(p3:GetCurrentPage());
		while true do
			v6(v7, v8);
			if not v6 then
				break;
			end;
			v8 = v6;
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
		local v9 = {};
		local v10 = #v9;
		local v11 = #v5;
		table.move(v5, 1, v11, v10 + 1, v9);
		local v12 = v1.await(u3(p3));
		table.move(v12, 1, #v12, v10 + v11 + 1, v9);
		return v9;
	end);
	p2.friends = v1.Promise.promisify(function()
		return l__Players__2:GetFriendsAsync(l__Players__2.LocalPlayer.UserId);
	end)():andThen(u3):andThen(function(p4)
		table.sort(p4, function(p5, p6)
			return p5.username < p6.username;
		end);
		return p4;
	end);
end;
v3.getFriends = v1.async(function(p7)
	return v1.await(p7.friends);
end);
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "string-utils"));
v3.fuzzySearchFriends = v1.async(function(p8, p9)
	local u5 = {};
	local u6 = string.lower(p9);
	return v1.await(p8:getFriends():andThen(function(p10)
		if not p10 then
			return nil;
		end;
		local v13 = {};
		local v14 = 0;
		local v15, v16, v17 = ipairs(p10);
		while true do
			v15(v16, v17);
			if not v15 then
				break;
			end;
			if table.find(u5, v16) == nil == true then
				v14 = v14 + 1;
				v13[v14] = v16;
			end;		
		end;
		local v18 = {};
		local v19 = 0;
		local v20, v21, v22 = ipairs(v13);
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			if string.lower(v21.username) == u6 == true then
				v19 = v19 + 1;
				v18[v19] = v21;
			end;		
		end;
		local v23, v24, v25 = ipairs(v18);
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			table.insert(u5, v24);		
		end;
		local v26 = {};
		local v27 = 0;
		local v28, v29, v30 = ipairs(p10);
		while true do
			v28(v29, v30);
			if not v28 then
				break;
			end;
			if table.find(u5, v29) == nil == true then
				v27 = v27 + 1;
				v26[v27] = v29;
			end;		
		end;
		local v31 = {};
		local v32 = 0;
		local v33, v34, v35 = ipairs(v26);
		while true do
			v33(v34, v35);
			if not v33 then
				break;
			end;
			v35 = v33;
			if u4.startsWith(string.lower(v34.username), u6) == true then
				v32 = v32 + 1;
				v31[v32] = v34;
			end;		
		end;
		local v36, v37, v38 = ipairs(v31);
		while true do
			v36(v37, v38);
			if not v36 then
				break;
			end;
			v38 = v36;
			table.insert(u5, v37);		
		end;
		local v39 = {};
		local v40 = 0;
		local v41, v42, v43 = ipairs(p10);
		while true do
			v41(v42, v43);
			if not v41 then
				break;
			end;
			if table.find(u5, v42) == nil == true then
				v40 = v40 + 1;
				v39[v40] = v42;
			end;		
		end;
		local v44 = {};
		local v45 = 0;
		local v46, v47, v48 = ipairs(v39);
		while true do
			v46(v47, v48);
			if not v46 then
				break;
			end;
			v48 = v46;
			if u4.includes(string.lower(v47.username), u6) == true then
				v45 = v45 + 1;
				v44[v45] = v47;
			end;		
		end;
		local v49, v50, v51 = ipairs(v44);
		while true do
			v49(v50, v51);
			if not v49 then
				break;
			end;
			v51 = v49;
			table.insert(u5, v50);		
		end;
		return u5;
	end));
end);
local v52 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
