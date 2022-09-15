-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes");
local v4 = setmetatable({}, {
	__tostring = function()
		return "NpcVisualsComponent";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local l__NpcNameAttr__3 = v3.NpcNameAttr;
local l__NpcAutoPlaceAttr__4 = v3.NpcAutoPlaceAttr;
local l__NpcAnimationAttr__5 = v3.NpcAnimationAttr;
local u6 = v3.NpcSecondaryAnimationAttr;
local l__NpcLookAtPlayerAttr__7 = v3.NpcLookAtPlayerAttr;
local l__NpcLookMinDistanceAttr__8 = v3.NpcLookMinDistanceAttr;
local l__NpcScale__9 = v3.NpcScale;
local l__NpcCollectionServiceTag__10 = v3.NpcCollectionServiceTag;
local l__NpcVerticalOffset__11 = v3.NpcVerticalOffset;
local l__Workspace__12 = v2.Workspace;
local l__Players__13 = v2.Players;
function v4.constructor(p1, p2)
	p1.npcModel = p2;
	p1.maid = u1.new();
	p1.lastUpdate = 0;
	p1.config = u2.new(p2.Parent, { l__NpcNameAttr__3, l__NpcAutoPlaceAttr__4, l__NpcAnimationAttr__5, u6, l__NpcLookAtPlayerAttr__7, l__NpcLookMinDistanceAttr__8, l__NpcScale__9, l__NpcCollectionServiceTag__10, l__NpcVerticalOffset__11 });
	if not l__Workspace__12:FindFirstChild("NpcContainer") then
		local v6 = Instance.new("Folder");
		v6.Name = "NpcContainer";
		v6.Parent = l__Workspace__12;
	end;
	p1.humanoid = p2:WaitForChild("Humanoid");
	p1.npcRoot = p2.PrimaryPart;
	p1.npcNeck = p2:WaitForChild("Head"):FindFirstChild("Neck");
	local v7 = p1.npcNeck;
	if v7 ~= nil then
		v7 = v7.C0;
	end;
	p1.originalNeckC0 = v7;
	p1.maid:GiveTask(p2);
	local l__NpcAnimation__8 = p1.config.Values.NpcAnimation;
	if l__NpcAnimation__8 ~= "" and l__NpcAnimation__8 then
		v1.Promise.defer(function()
			p1:applyAnimation();
		end);
	end;
	p1:getLocalCharacterRoot();
	l__Players__13.LocalPlayer.CharacterAdded:Connect(function()
		return p1:getLocalCharacterRoot();
	end);
end;
v4.getLocalCharacterRoot = v1.async(function(p3)
	local l__Character__9 = l__Players__13.LocalPlayer.Character;
	if not l__Character__9 then
		return nil;
	end;
	p3.localCharacterRoot = l__Character__9:FindFirstChild("HumanoidRootPart");
end);
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.applyAnimation(p4)
	local l__Animator__10 = p4.humanoid:WaitForChild("Animator");
	if not l__Animator__10 then
		error("Humanoid for NPC " .. p4.npcModel.Name .. " has no Animator child");
	end;
	local v11 = u14("Animation", {
		AnimationId = p4.config.Values.NpcAnimation
	});
	local l__NpcSecondaryAnimation__12 = p4.config.Values.NpcSecondaryAnimation;
	if l__NpcSecondaryAnimation__12 ~= "" and l__NpcSecondaryAnimation__12 then
		local v13 = u14("Animation", {
			AnimationId = p4.config.Values.NpcSecondaryAnimation
		});
		local v14 = l__Animator__10:LoadAnimation(v13);
		v14.Looped = true;
		v14:Play();
		p4.maid:GiveTask(v13);
	end;
	local u15 = l__Animator__10:LoadAnimation(v11);
	v1.Promise.defer(function()
		while p4.humanoid.Parent ~= nil do
			u15:Play();
			u15.Stopped:Wait();
			wait(3);		
		end;
	end);
	p4.maid:GiveTask(v11);
end;
local function u16(p5, p6)
	local v15 = p6 - p5.Position;
	if v15.X > 0 then
		local v16 = math.pi;
	else
		v16 = 0;
	end;
	local v17 = (-(math.atan(v15.Z / v15.X) + v16) + math.pi / 2 - select(2, (p5 - p5.Position):ToEulerAnglesYXZ()) + math.pi / 2) % (math.pi * 2) - math.pi / 2;
	if math.pi / 2 * 1.1 < math.abs(v17) then
		return 0, math.pi;
	end;
	return math.clamp(math.atan(v15.Y / math.sqrt(math.pow(v15.X, 2) + math.pow(v15.Z, 2))) - (p5 - p5.Position):ToEulerAnglesYXZ(), -0.2 * math.pi / 2, 0.2 * math.pi / 2), math.clamp(v17, -0.82 * math.pi / 2, 0.82 * math.pi / 2) + math.pi;
end;
local l__TweenService__17 = v2.TweenService;
local u18 = TweenInfo.new(0.085, Enum.EasingStyle.Linear);
function v4.HeartbeatUpdate(p7)
	local v18 = nil;
	local v19 = nil;
	if os.clock() - p7.lastUpdate < 0.1 then
		return nil;
	end;
	p7.lastUpdate = os.clock();
	if not p7.npcNeck or not p7.originalNeckC0 then
		return nil;
	end;
	if p7.config.Values.NpcLookAtPlayer ~= true then
		return nil;
	end;
	if not p7.localCharacterRoot then
		return nil;
	end;
	local l__npcRoot__20 = p7.npcRoot;
	local v21 = p7.config.Values.NpcLookMinimumDistance;
	if v21 == 0 or v21 ~= v21 or not v21 then
		v21 = 10;
	end;
	local v22 = CFrame.new();
	if (p7.localCharacterRoot.Position - l__npcRoot__20.Position).Magnitude <= v21 then
		local v23, v24 = u16(l__npcRoot__20.CFrame, p7.localCharacterRoot.Position);
		v22 = CFrame.new(0, 0, 0) * CFrame.Angles(v23, -math.pi + v24, 0);
	end;
	local v25 = { p7.npcNeck.C0:ToEulerAnglesXYZ() };
	if #v25 == 0 then
		error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
	end;
	v18 = v25[1];
	for v26 = 2, #v25 do
		v18 = v18 + v25[v26];
	end;
	local v27 = { v22:ToEulerAnglesXYZ() };
	if #v27 == 0 then
		error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
	end;
	v19 = v27[1];
	for v28 = 2, #v27 do
		v19 = v19 + v27[v28];
	end;
	if math.abs(local v29 - local v30) < 1E-06 then
		return nil;
	end;
	l__TweenService__17:Create(p7.npcNeck, u18, {
		C0 = p7.originalNeckC0 * v22
	}):Play();
end;
function v4.Destroy(p8)
	p8.maid:DoCleaning();
end;
v4.Tag = "NpcModel";
return v4;
