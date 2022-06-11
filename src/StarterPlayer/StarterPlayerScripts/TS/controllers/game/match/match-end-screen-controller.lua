-- Script Hash: 27c9850640edb371c15c547601236e07472b4331d33b01b74cfcc982586a9057c9c1ef786273f7a997cda870cfebfb67
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
		local function v8(p7)
			return p7.matchEndScreenType == p6;
		end;
		local v9 = nil;
		for v10, v11 in ipairs(v7) do
			if v8(v11, v10 - 1, v7) == true then
				v9 = v11;
				break;
			end;
		end;
		v7 = v9;
	end;
	local v12 = v7;
	if v12 ~= nil then
		v12 = v12.completed;
	end;
	return v12;
end;
function v4.waitUntilDisplay(p8, p9)
	local v13 = l__MatchEndScreensMeta__2[p9];
	if v13.displayAfterScreen ~= nil then
		while not p8:isMatchEndScreenCompleted(v13.displayAfterScreen) and p8.currDisplayOrder ~= v13.displayOrder do
			wait(0.5);		
		end;
	else
		while p8.currDisplayOrder ~= v13.displayOrder do
			wait(0.5);		
		end;
	end;
end;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
function v4.getMatchScreensInDisplayOrder(p10, p11)
	local v14 = {};
	local v15 = u3.entries(l__MatchEndScreensMeta__2);
	table.move(v15, 1, #v15, #v14 + 1, v14);
	local function v16(p12)
		local v17 = p12[1];
		return p12[2].displayOrder == p11;
	end;
	local v18 = {};
	local v19 = 0;
	for v20, v21 in ipairs(v14) do
		if v16(v21, v20 - 1, v14) == true then
			v19 = v19 + 1;
			v18[v19] = v21;
		end;
	end;
	return v18;
end;
function v4.totalCompletedInDisplayOrder(p13, p14)
	local v22 = p13.matchEndScreens[p14];
	if not v22 then
		return nil;
	end;
	local u4 = 0;
	local function v23(p15)
		if p15.completed then
			u4 = u4 + 1;
		end;
	end;
	for v24, v25 in ipairs(v22) do
		v23(v25, v24 - 1, v22);
	end;
	return {
		playCount = u4, 
		finished = #v22 == u4
	};
end;
function v4.setMatchEndScreenCompleted(p16, p17)
	local v26 = l__MatchEndScreensMeta__2[p17];
	local v27 = p16.matchEndScreens[v26.displayOrder];
	if not v27 then
		return nil;
	end;
	local function v28(p18)
		return p18.matchEndScreenType == p17;
	end;
	local v29 = nil;
	for v30, v31 in ipairs(v27) do
		if v28(v31, v30 - 1, v27) == true then
			v29 = v31;
			break;
		end;
	end;
	if v29 then
		local function v32(p19)
			return p19.matchEndScreenType ~= p17;
		end;
		local v33 = {};
		local v34 = 0;
		for v35, v36 in ipairs(v27) do
			if v32(v36, v35 - 1, v27) == true then
				v34 = v34 + 1;
				v33[v34] = v36;
			end;
		end;
		local v37 = {};
		local v38 = #v37;
		local v39 = #v33;
		table.move(v33, 1, v39, v38 + 1, v37);
		v37[v38 + v39 + 1] = {
			matchEndScreenType = p17, 
			completed = true
		};
		p16.matchEndScreens[v26.displayOrder] = v37;
	end;
end;
function v4.displayNextDisplayOrder(p20)
	p20.currDisplayOrder = p20.currDisplayOrder + 1;
	local v40 = 0;
	for v41, v42 in pairs(p20.matchEndScreens) do
		v40 = v40 + 1;
	end;
	if not p20.matchEndScreens[p20.currDisplayOrder] and p20.currDisplayOrder <= v40 then
		p20:displayNextDisplayOrder();
	end;
end;
local l__ClientStore__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function v4.setupIMatchEndScreens(p21)
	local l__queueType__43 = l__ClientStore__5:getState().Game.queueType;
	local v44 = {};
	local v45 = u3.entries(l__MatchEndScreensMeta__2);
	table.move(v45, 1, #v45, #v44 + 1, v44);
	local function v46(p22)
		local v47 = p22[1];
		local v48 = p22[2];
		local v49 = p21.matchEndScreens[v48.displayOrder];
		if v48.enabledQueues and table.find(v48.enabledQueues, l__queueType__43) == nil then
			return nil;
		end;
		if not v49 then
			p21.matchEndScreens[v48.displayOrder] = { {
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
		p21.matchEndScreens[v48.displayOrder] = v50;
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
