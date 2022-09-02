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
		local v9, v10, v11 = ipairs(v7);
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			if v10.matchEndScreenType == p6 == true then
				v8 = v10;
				break;
			end;		
		end;
		v7 = v8;
	end;
	local v12 = v7;
	if v12 ~= nil then
		v12 = v12.completed;
	end;
	return v12;
end;
function v4.waitUntilDisplay(p7, p8)
	local v13 = l__MatchEndScreensMeta__2[p8];
	if v13.displayAfterScreen ~= nil then
		while not p7:isMatchEndScreenCompleted(v13.displayAfterScreen) and p7.currDisplayOrder ~= v13.displayOrder do
			wait(0.5);		
		end;
	else
		while p7.currDisplayOrder ~= v13.displayOrder do
			wait(0.5);		
		end;
	end;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v4.getMatchScreensInDisplayOrder(p9, p10)
	local v14 = {};
	local v15 = u3.entries(l__MatchEndScreensMeta__2);
	table.move(v15, 1, #v15, #v14 + 1, v14);
	local v16 = {};
	local v17 = 0;
	local v18, v19, v20 = ipairs(v14);
	while true do
		v18(v19, v20);
		if not v18 then
			break;
		end;
		local v21 = v19[1];
		if v19[2].displayOrder == p10 == true then
			v17 = v17 + 1;
			v16[v17] = v19;
		end;	
	end;
	return v16;
end;
function v4.totalCompletedInDisplayOrder(p11, p12)
	local v22 = p11.matchEndScreens[p12];
	if not v22 then
		return nil;
	end;
	local u4 = 0;
	local v23, v24, v25 = ipairs(v22);
	while true do
		v23(v24, v25);
		if not v23 then
			break;
		end;
		v25 = v23;
		if v24.completed then
			u4 = u4 + 1;
		end;	
	end;
	return {
		playCount = u4, 
		finished = #v22 == u4
	};
end;
function v4.setMatchEndScreenCompleted(p13, p14)
	local v26 = l__MatchEndScreensMeta__2[p14];
	local v27 = p13.matchEndScreens[v26.displayOrder];
	if not v27 then
		return nil;
	end;
	local v28 = nil;
	local v29, v30, v31 = ipairs(v27);
	while true do
		v29(v30, v31);
		if not v29 then
			break;
		end;
		v31 = v29;
		if v30.matchEndScreenType == p14 == true then
			v28 = v30;
			break;
		end;	
	end;
	if v28 then
		local v32 = {};
		local v33 = 0;
		local v34, v35, v36 = ipairs(v27);
		while true do
			v34(v35, v36);
			if not v34 then
				break;
			end;
			if v35.matchEndScreenType ~= p14 == true then
				v33 = v33 + 1;
				v32[v33] = v35;
			end;		
		end;
		local v37 = {};
		local v38 = #v37;
		local v39 = #v32;
		table.move(v32, 1, v39, v38 + 1, v37);
		v37[v38 + v39 + 1] = {
			matchEndScreenType = p14, 
			completed = true
		};
		p13.matchEndScreens[v26.displayOrder] = v37;
	end;
end;
function v4.displayNextDisplayOrder(p15)
	p15.currDisplayOrder = p15.currDisplayOrder + 1;
	local v40 = 0;
	for v41 in pairs(p15.matchEndScreens) do
		v40 = v40 + 1;
	end;
	if not p15.matchEndScreens[p15.currDisplayOrder] and p15.currDisplayOrder <= v40 then
		p15:displayNextDisplayOrder();
	end;
end;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.setupIMatchEndScreens(p16)
	local l__queueType__42 = l__ClientStore__5:getState().Game.queueType;
	local v43 = {};
	local v44 = u3.entries(l__MatchEndScreensMeta__2);
	table.move(v44, 1, #v44, #v43 + 1, v43);
	local function v45(p17)
		local v46 = p17[1];
		local v47 = p17[2];
		local v48 = p16.matchEndScreens[v47.displayOrder];
		if v47.enabledQueues and table.find(v47.enabledQueues, l__queueType__42) == nil then
			return nil;
		end;
		if not v48 then
			p16.matchEndScreens[v47.displayOrder] = { {
					matchEndScreenType = v46, 
					completed = false
				} };
			return;
		end;
		local v49 = {};
		local v50 = #v49;
		local v51 = #v48;
		table.move(v48, 1, v51, v50 + 1, v49);
		v49[v50 + v51 + 1] = {
			matchEndScreenType = v46, 
			completed = false
		};
		p16.matchEndScreens[v47.displayOrder] = v49;
	end;
	local v52, v53, v54 = ipairs(v43);
	while true do
		v52(v53, v54);
		if not v52 then
			break;
		end;
		v54 = v52;
		v45(v53, v52 - 1, v43);	
	end;
end;
l__Reflect__2.defineMetadata(v4, "identifier", "client/controllers/game/match/match-end-screen-controller@MatchEndScreenController");
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart", "$:flamework@OnInit" });
l__Reflect__2.decorate(v4, "$:flamework@Controller", l__Controller__3, { {} });
return {
	default = v4
};
