-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = setmetatable({}, {
	__tostring = function()
		return "SceneManager";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__RunService__1 = v2.RunService;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__DeviceUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__StarterGui__4 = v2.StarterGui;
local l__Players__5 = v2.Players;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__Workspace__7 = v2.Workspace;
function v3.constructor(p1)
	p1.timeOffset = 0;
	p1.scenes = {};
	if not l__RunService__1:IsClient() then
		p1.root = u6.new(l__Workspace__7);
		return;
	end;
	local v5 = {};
	if l__DeviceUtil__3.isHoarceKat() then
		local v6 = l__StarterGui__4;
	else
		v6 = l__Players__5.LocalPlayer:FindFirstChildOfClass("PlayerGui");
	end;
	v5.Parent = v6;
	p1.screenGui = u2("ScreenGui", v5);
	p1.root = u6.new(p1.screenGui);
end;
function v3.loadScene(p2, p3)
	table.insert(p2.scenes, p3);
end;
local l__WriteableSceneState__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system", "scene-state").WriteableSceneState;
function v3.loadChainedScenes(p4, p5, p6)
	if p5:getEndDate() ~= p6:getStartDate() then
		error("The end date of scene A and start date of scene B must be the same for them to chain");
	end;
	local v7 = l__WriteableSceneState__8.new();
	p5:overrideState(v7);
	p6:overrideState(v7);
	p5:setChainInfo(0, p5:getLength(), p6:getLength());
	p6:setChainInfo(1, p5:getLength(), p6:getLength());
	p4:loadScene(p5);
	p4:loadScene(p6);
end;
function v3.getTimeMillis(p7)
	if p7.recordedServerTime == nil or p7.elaspedTimeSinceServerTimestamp == nil then
		return -1;
	end;
	return (p7.recordedServerTime + p7.elaspedTimeSinceServerTimestamp) * 1000;
end;
local l__match__9 = v1.import(script, v1.getModule(script, "@rbxts", "variant").out).match;
function v3.getElapsedTimeForScene(p8, p9)
	local v8 = p8:getTimeMillis();
	if v8 < 0 then
		return 0;
	end;
	local function v9(p10)
		return (v8 - p10.startDate.UnixTimestampMillis) / 1000;
	end;
	return l__match__9(p9.timeConfig, {
		betweenDates = v9, 
		startDateAndLength = v9
	});
end;
function v3.cleanAllState(p11)
	local v10, v11, v12 = ipairs(p11.scenes);
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		v11:overrideState(l__WriteableSceneState__8.new({}));	
	end;
	u6.start(p11.root, function()
		local v13, v14, v15 = ipairs(p11.scenes);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			v14:step(0, p11:getElapsedTimeForScene(v14), "Heartbeat");		
		end;
	end);
	u6.start(p11.root, function()

	end);
	local l__screenGui__16 = p11.screenGui;
	if l__screenGui__16 ~= nil then
		l__screenGui__16:Destroy();
	end;
end;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__default__11 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__13 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v3.begin(p12)
	if l__RunService__1:IsClient() then
		task.spawn(function()
			local v17 = 0;
			local v18 = false;
			while true do
				if v18 then
					v17 = v17 + 1;
				else
					v18 = true;
				end;
				if not (v17 < 3) then
					break;
				end;
				local v19 = l__default__10.Client:Get("RemoteName"):CallServer();
				p12.recordedServerTime = v19.unixTimeMillis / 1000 + (l__Workspace__7:GetServerTimeNow() - v19.serverTimeTaken);
				p12.elaspedTimeSinceServerTimestamp = 0;
				l__default__11.Debug("Time taken to receive: ${time}ms", (l__Workspace__7:GetServerTimeNow() - v19.serverTimeTaken) * 1000);
				l__default__11.Debug("DateTime.now() offset: {time}ms", (v19.unixTimeMillis / 1000 - (l__Workspace__7:GetServerTimeNow() - v19.serverTimeTaken) - DateTime.now().UnixTimestampMillis / 1000) * 1000);
				task.wait(3);			
			end;
		end);
	else
		p12.recordedServerTime = DateTime.now().UnixTimestampMillis / 1000;
		p12.elaspedTimeSinceServerTimestamp = 0;
	end;
	local v20 = u12.new();
	local v21, v22, v23 = ipairs(p12.scenes);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		v22:initBehaviors();	
	end;
	local u14 = os.clock();
	v20:GiveTask(l__RunService__1.Heartbeat:Connect(function(p13)
		debug.profilebegin("scene-manager heartbeat");
		if p12.elaspedTimeSinceServerTimestamp ~= nil then
			local v24 = os.clock();
			p12.elaspedTimeSinceServerTimestamp = p12.elaspedTimeSinceServerTimestamp + (v24 - u14);
			u14 = v24;
		end;
		u6.start(p12.root, function()
			local v25, v26, v27 = pairs(p12.scenes);
			while true do
				local v28, v29 = v25(v26, v27);
				if not v28 then
					break;
				end;
				if l__RunService__1:IsClient() and not v29.preloadRan and v29:isNearlyActive(p12:getTimeMillis(), 120) then
					v29.preloadRan = true;
					l__KnitClient__13.Controllers.PreloadController:runPreload(v29.preloadDefinition);
					v29.logger:Info("Running scene preload.");
				end;
				if v29:isActive(p12:getTimeMillis()) then
					if l__RunService__1:IsStudio() and l__RunService__1:IsClient() then
						u6.scope(function()
							u6.useKey(v28);
							local v30, v31 = u6.useState(0);
							u6.window(tostring(math.floor(v30)), function()
								v31((u6.slider(v29:getLength())));
							end);
							p12.timeOffset = v30;
						end);
					end;
					v29:step(p13, p12:getElapsedTimeForScene(v29) + p12.timeOffset, "Heartbeat");
				end;			
			end;
		end);
		debug.profileend();
	end));
	v20:GiveTask(l__RunService__1.Stepped:Connect(function(p14, p15)
		local v32, v33, v34 = ipairs(p12.scenes);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			if v33:isActive(p12:getTimeMillis()) then
				v33:step(p15, p12:getElapsedTimeForScene(v33) + p12.timeOffset, "Stepped");
			end;		
		end;
	end));
	if l__RunService__1:IsClient() then
		v20:GiveTask(l__RunService__1.RenderStepped:Connect(function(p16)
			local v35, v36, v37 = ipairs(p12.scenes);
			while true do
				v35(v36, v37);
				if not v35 then
					break;
				end;
				v37 = v35;
				if v36:isActive(p12:getTimeMillis()) then
					v36:step(p16, p12:getElapsedTimeForScene(v36) + p12.timeOffset, "RenderStepped");
				end;			
			end;
		end));
	end;
	return v20;
end;
return {
	SceneManager = v3
};
