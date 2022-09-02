-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "log").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "scene-state");
local v4 = setmetatable({}, {
	__tostring = function()
		return "Scene";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local l__WriteableSceneState__1 = v3.WriteableSceneState;
local l__MinPriorityQueue__2 = v1.import(script, v1.getModule(script, "@rbxts", "datastructures").out).MinPriorityQueue;
local l__Logger__3 = v2.Logger;
local l__default__4 = v2.default;
local l__match__5 = v1.import(script, v1.getModule(script, "@rbxts", "variant").out).match;
function v4.constructor(p1, p2)
	p1.preloadRan = false;
	p1.state = l__WriteableSceneState__1.new();
	p1.recentErrors = {};
	p1.heartbeatBehaviors = l__MinPriorityQueue__2.new();
	p1.steppedBehaviors = l__MinPriorityQueue__2.new();
	p1.rendersteppedBehaviors = l__MinPriorityQueue__2.new();
	p1.behaviorStateHistory = {};
	p1.logger = l__Logger__3:configure():WriteTo(l__default__4.RobloxOutput({
		Prefix = p2.sceneName
	})):Create();
	p1.timeConfig = p2.timeConfig;
	p1.preloadDefinition = p2.preload or {};
	p1.length = l__match__5(p2.timeConfig, {
		betweenDates = function(p3)
			return p3.endDate.UnixTimestamp - p3.startDate.UnixTimestamp;
		end, 
		startDateAndLength = function(p4)
			return p4.length;
		end
	});
end;
function v4.registerBehavior(p5, p6, p7)
	if p6.event == "RenderStepped" then
		local v6 = p6.priority;
		if v6 == nil then
			v6 = 0;
		end;
		p5.rendersteppedBehaviors:InsertWithPriority({
			name = p6.name, 
			func = p7, 
			init = p6.init
		}, v6);
		return;
	end;
	if p6.event == "Heartbeat" then
		local v7 = p6.priority;
		if v7 == nil then
			v7 = 0;
		end;
		p5.heartbeatBehaviors:InsertWithPriority({
			name = p6.name, 
			func = p7, 
			init = p6.init
		}, v7);
		return;
	end;
	if p6.event == "Stepped" then
		local v8 = p6.priority;
		if v8 == nil then
			v8 = 0;
		end;
		p5.steppedBehaviors:InsertWithPriority({
			name = p6.name, 
			func = p7, 
			init = p6.init
		}, v8);
	end;
end;
function v4.registerBehaviorTable(p8, p9)
	p8:registerBehavior({
		name = p9.name, 
		event = p9.event, 
		priority = p9.priority, 
		init = p9.init
	}, p9.func);
end;
function v4.isActive(p10, p11)
	return p10:isNearlyActive(p11, 0);
end;
function v4.isNearlyActive(p12, p13, p14)
	local v9 = {};
	function v9.betweenDates(p15)
		if p15.startDate.UnixTimestampMillis - p14 * 1000 < p13 and p13 < p15.endDate.UnixTimestampMillis then
			return true;
		end;
		return false;
	end;
	function v9.startDateAndLength(p16)
		if p16.startDate.UnixTimestampMillis - p14 * 1000 < p13 and p13 < p16.startDate.UnixTimestampMillis + p16.length * 1000 then
			return true;
		end;
		return false;
	end;
	return l__match__5(p12.timeConfig, v9);
end;
function v4.getStartDate(p17)
	return l__match__5(p17.timeConfig, {
		betweenDates = function(p18)
			return p18.startDate.UnixTimestamp;
		end, 
		startDateAndLength = function(p19)
			return p19.startDate.UnixTimestamp;
		end
	});
end;
function v4.getEndDate(p20)
	return l__match__5(p20.timeConfig, {
		betweenDates = function(p21)
			return p21.endDate.UnixTimestamp;
		end, 
		startDateAndLength = function(p22)
			return p22.startDate.UnixTimestamp + p22.length;
		end
	});
end;
function v4.getLength(p23)
	return l__match__5(p23.timeConfig, {
		betweenDates = function(p24)
			return p24.endDate.UnixTimestamp - p24.startDate.UnixTimestamp;
		end, 
		startDateAndLength = function(p25)
			return p25.length;
		end
	});
end;
function v4.overrideState(p26, p27)
	p26.state = p27;
end;
function v4.overrideTimeConfig(p28, p29)
	p28.timeConfig = p29;
	p28.length = l__match__5(p29, {
		betweenDates = function(p30)
			return p30.endDate.UnixTimestamp - p30.startDate.UnixTimestamp;
		end, 
		startDateAndLength = function(p31)
			return p31.length;
		end
	});
	print(p28.length);
end;
function v4.setChainInfo(p32, p33, p34, p35)
	p32.chainInfo = {
		stageInChain = p33, 
		length1 = p34, 
		length2 = p35
	};
end;
function v4.initBehaviors(p36)
	for v10, v11 in p36.heartbeatBehaviors() do
		if v11.Value.init ~= nil then
			task.spawn(function()
				return v11.Value.init(p36.state);
			end);
		end;
	end;
	for v12, v13 in p36.rendersteppedBehaviors() do
		if v13.Value.init ~= nil then
			task.spawn(function()
				return v13.Value.init(p36.state);
			end);
		end;
	end;
	for v14, v15 in p36.steppedBehaviors() do
		if v15.Value.init ~= nil then
			task.spawn(function()
				return v15.Value.init(p36.state);
			end);
		end;
	end;
end;
local l__SceneState__6 = v3.SceneState;
function v4.step(p37, p38, p39, p40)
	if p40 == "Heartbeat" then
		local v16 = p37.heartbeatBehaviors;
	elseif p40 == "Stepped" then
		v16 = p37.steppedBehaviors;
	else
		if p40 ~= "RenderStepped" then
			p37.logger:Error("{eventName} is not a valid event name", p40);
			return nil;
		end;
		v16 = p37.rendersteppedBehaviors;
	end;
	debug.profilebegin("Clean recent errors");
	for v17, v18 in pairs(p37.recentErrors) do
		if os.clock() - v18.timestamp > 10 then
			p37.recentErrors[v17] = nil;
		end;
	end;
	debug.profileend();
	local v19, v20, v21 = v16:Iterate();
	while true do
		local v22, v23 = v19(v20, v21);
		if not v22 then
			break;
		end;
		local l__Value__24 = v23.Value;
		debug.profilebegin(l__Value__24.name);
		local v25 = coroutine.create(l__Value__24.func);
		local v26 = p37.behaviorStateHistory[l__Value__24.name];
		if v26 ~= nil then
			v26 = v26.oldState;
		end;
		local v27, v28 = coroutine.resume(v25, {
			elapsedEventTime = p39, 
			frameDeltaTime = p38, 
			totalLength = p37:getLength(), 
			chainInfo = p37.chainInfo
		}, p37.state, v26);
		if coroutine.status(v25) ~= "dead" then
			coroutine.close(v25);
			task.spawn(function()
				p37.logger:Error("Live event behavior " .. l__Value__24.name .. " yielded. Yielding in live event behaviors is forbidden");
			end);
		end;
		if not v27 and type(v28) == "string" and p37.recentErrors[v28] == nil then
			p37.recentErrors[v28] = {
				timestamp = os.clock()
			};
			task.spawn(error, v28);
			p37.logger:Warn("The above error will be suppressed for 10 seconds");
		end;
		debug.profilebegin("cloning state");
		p37.behaviorStateHistory[l__Value__24.name] = {
			oldState = l__SceneState__6.new((p37.state:getRaw()))
		};
		debug.profileend();
		debug.profileend();	
	end;
end;
return {
	Scene = v4
};
