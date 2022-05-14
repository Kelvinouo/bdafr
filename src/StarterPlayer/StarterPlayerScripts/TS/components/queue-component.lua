-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, script.Parent, "billboard-component", "attributes");
local v3 = setmetatable({}, {
	__tostring = function()
		return "QueueComponent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__QueueSelectionMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-selection.meta").QueueSelectionMeta;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__QueueType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local l__SetAttribute__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").SetAttribute;
local l__BillboardTitleAttr__6 = v2.BillboardTitleAttr;
local l__BillboardSubtitleAttr__7 = v2.BillboardSubtitleAttr;
local l__BillboardStudsOffsetAttr__8 = v2.BillboardStudsOffsetAttr;
local l__BillboardMaxSizeAttr__9 = v2.BillboardMaxSizeAttr;
local l__CollectionService__10 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
function v3.constructor(p1, p2)
	if not p2:IsA("BasePart") then
		error("Any instance with BedwarsQueue tag must be a BasePart");
	end;
	print((p2:GetAttribute("QueueSelectionMenu")));
	local v5 = p2:GetAttribute("QueueSelectionMenu");
	if v5 ~= 0 and v5 == v5 and v5 ~= "" and v5 then
		local v6 = l__QueueSelectionMeta__1[p2.Name];
		if not v6 then
			return nil;
		end;
		local v7 = v6.title;
		local v8 = v6.subtitle;
	else
		local v9 = l__Flamework__2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(p2.Name);
		if l__PlaceUtil__3.isStaging() and p2.Name == l__QueueType__4.BEDWARS_TO4 then
			p2.Name = l__QueueType__4.BEDWARS_TEST;
			v9 = l__Flamework__2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(l__QueueType__4.BEDWARS_TEST);
		end;
		if not v9 then
			error("\"" .. p2.Name .. "\" is not a valid queue type (" .. p2:GetFullName() .. ")");
		end;
		if v9.disabled ~= nil then
			local v10 = v9.disabled;
		else
			v10 = false;
		end;
		local v11 = v9.disabledMessage;
		if v11 == "" or not v11 then
			v11 = "QUEUE DISABLED";
		end;
		v7 = v9.title;
		if v10 then
			v8 = v11;
		else
			v8 = "Teams of " .. tostring(v9.queueSize.max);
		end;
		local l__eventText__12 = v9.eventText;
		if l__eventText__12 ~= "" and l__eventText__12 then
			v8 = v9.eventText;
		end;
	end;
	l__SetAttribute__5(p2, l__BillboardTitleAttr__6, v7);
	l__SetAttribute__5(p2, l__BillboardSubtitleAttr__7, v8);
	l__SetAttribute__5(p2, l__BillboardStudsOffsetAttr__8, Vector3.new(0, 7, 0));
	l__SetAttribute__5(p2, l__BillboardMaxSizeAttr__9, Vector2.new(820, 170));
	l__CollectionService__10:AddTag(p2, "Billboard");
end;
function v3.Destroy(p3)

end;
v3.Tag = "BedwarsQueue";
return v3;
