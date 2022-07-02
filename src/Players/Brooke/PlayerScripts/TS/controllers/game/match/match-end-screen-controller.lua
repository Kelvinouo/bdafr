-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__Controller__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MatchEndScreenController";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	p1.currDisplayOrder = 0;
	p1.matchEndScreens = {};
end;
function v4.onInit(p2)

end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__MatchEndScreensMeta__2 = v1.import(script, script.Parent, "match-end-screen-meta").MatchEndScreensMeta;
function v4.onStart(p3)
	p3:setupIMatchEndScreens();
	l__ClientSyncEvents__1.MatchEndScreenEnd:connect(function(p4)
		p3:setMatchEndScreenCompleted(p4.matchEndScreenType);
		local v6 = p3:totalCompletedInDisplayOrder(l__MatchEndScreensMeta__2[p4.matchEndScreenType].displayOrder);
		if v6 ~= nil then
			v6 = v6.finished;
		end;
		if v6 then
			p3:displayNextDisplayOrder();
		end;
	end);
end;
function v4.isMatchEndScreenCompleted(p5, p6)
	local v7 = p5.matchEndScreens[l__MatchEndScreensMeta__2[p6].displayOrder];
	if v7 ~= nil then
		local v8 = nil;
		for v9, v10 in ipairs(v7) do
			if v10.matchEndScreenType == p6 == true then
				v8 = v10;
				break;
			end;
		end;
		v7 = v8;
	end;
	local v11 = v7;
	if v11 ~= nil then
		v11 = v11.completed;
	end;
	return v11;
end;
function v4.waitUntilDisplay(p7, p8)
	local v12 = l__MatchEndScreensMeta__2[p8];
	if v12.displayAfterScreen ~= nil then
		while not p7:isMatchEndScreenCompleted(v12.displayAfterScreen) and p7.currDisplayOrder ~= v12.displayOrder do
			wait(0.5);		
		end;
	else
		while p7.currDisplayOrder ~= v12.displayOrder do
			wait(0.5);		
		end;
	end;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v4.getMatchScreensInDisplayOrder(p9, p10)
	local v13 = {};
	local v14 = u3.entries(l__MatchEndScreensMeta__2);
	table.move(v14, 1, #v14, #v13 + 1, v13);
	local v15 = {};
	local v16 = 0;
	local v17, v18, v19 = ipairs(v13);
	while true do
		local v20, v21 = v17(v18, v19);
		if not v20 then
			break;
		end;
		local v22 = v21[1];
		if v21[2].displayOrder == p10 == true then
			v16 = v16 + 1;
			v15[v16] = v21;
		end;	
	end;
	return v15;
end;
function v4.totalCompletedInDisplayOrder(p11, p12)
	local v23 = p11.matchEndScreens[p12];
	if not v23 then
		return nil;
	end;
	local u4 = 0;
	for v24, v25 in ipairs(v23) do
		if v25.completed then
			u4 = u4 + 1;
		end;
	end;
	return {
		playCount = u4, 
		finished = #v23 == u4
	};
end;
function v4.setMatchEndScreenCompleted(p13, p14)
	local v26 = l__MatchEndScreensMeta__2[p14];
	local v27 = p13.matchEndScreens[v26.displayOrder];
	if not v27 then
		return nil;
	end;
	local v28 = nil;
	for v29, v30 in ipairs(v27) do
		if v30.matchEndScreenType == p14 == true then
			v28 = v30;
			break;
		end;
	end;
	if v28 then
		local v31 = {};
		local v32 = 0;
		local v33, v34, v35 = ipairs(v27);
		while true do
			local v36, v37 = v33(v34, v35);
			if not v36 then
				break;
			end;
			if v37.matchEndScreenType ~= p14 == true then
				v32 = v32 + 1;
				v31[v32] = v37;
			end;		
		end;
		local v38 = {};
		local v39 = #v38;
		local v40 = #v31;
		table.move(v31, 1, v40, v39 + 1, v38);
		v38[v39 + v40 + 1] = {
			matchEndScreenType = p14, 
			completed = true
		};
		p13.matchEndScreens[v26.displayOrder] = v38;
	end;
end;
function v4.displayNextDisplayOrder(p15)
	p15.currDisplayOrder = p15.currDisplayOrder + 1;
	local v41 = 0;
	for v42 in pairs(p15.matchEndScreens) do
		v41 = v41 + 1;
	end;
	if not p15.matchEndScreens[p15.currDisplayOrder] and p15.currDisplayOrder <= v41 then
		p15:displayNextDisplayOrder();
	end;
end;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.setupIMatchEndScreens(p16)
	local l__queueType__43 = l__ClientStore__5:getState().Game.queueType;
	local v44 = {};
	local v45 = u3.entries(l__MatchEndScreensMeta__2);
	table.move(v45, 1, #v45, #v44 + 1, v44);
	local function v46(p17)
		local v47 = p17[1];
		local v48 = p17[2];
		local v49 = p16.matchEndScreens[v48.displayOrder];
		if v48.enabledQueues and table.find(v48.enabledQueues, l__queueType__43) == nil then
			return nil;
		end;
		if not v49 then
			p16.matchEndScreens[v48.displayOrder] = { {
					matchEndScreenType = v47, 
					completed = false
				} };
			return;
		end;
		local v50 = {};
		local v51 = #v50;
		local v52 = #v49;
		table.move(v49, 1, v52, v51 + 1, v50);
		v50[v51 + v52 + 1] = {
			matchEndScreenType = v47, 
			completed = false
		};
		p16.matchEndScreens[v48.displayOrder] = v50;
	end;
	for v53, v54 in ipairs(v44) do
		v46(v54, v53 - 1, v44);
	end;
end;
l__Reflect__2.defineMetadata(v4, "identifier", "client/controllers/game/match/match-end-screen-controller@MatchEndScreenController");
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnInit" });
l__Reflect__2.decorate(v4, "$:flamework@Controller", l__Controller__3, { {} });
return {
	default = v4
};
