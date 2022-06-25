-- Script Hash: d11bbffa9adc227bb3e4f23ecb7f826cca97296af66739025b49f485a864afc988f32a6b3ef8723d1164df479ac951be
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "BridgeAssistController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "BridgeAssistController";
end;
local l__DeviceUtil__2 = v2.DeviceUtil;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__RunService__4 = v3.RunService;
local l__Players__5 = v3.Players;
local l__GameQueryUtil__6 = v2.GameQueryUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	if not l__DeviceUtil__2.isMobileControls() and l__PlaceUtil__3.isProduction() then
		return nil;
	end;
	local u7 = { Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 0, -1) };
	l__RunService__4:BindToRenderStep("bridge-assist", Enum.RenderPriority.Character.Value + 1, function()
		local l__Character__7 = l__Players__5.LocalPlayer.Character;
		local v8 = l__Character__7;
		if v8 ~= nil then
			v8 = v8.PrimaryPart;
		end;
		if not v8 then
			return nil;
		end;
		local l__Humanoid__9 = l__Character__7:FindFirstChild("Humanoid");
		if not l__Humanoid__9 then
			return nil;
		end;
		if l__Humanoid__9.MoveDirection.Magnitude == 0 then
			return nil;
		end;
		for v10, v11 in ipairs(u7) do
			if math.abs(math.acos(v11:Dot(l__Humanoid__9.MoveDirection))) < math.rad(33) then
				local v12 = RaycastParams.new();
				v12.FilterType = Enum.RaycastFilterType.Blacklist;
				v12.FilterDescendantsInstances = { l__Character__7 };
				if not l__GameQueryUtil__6:raycast(l__Character__7.PrimaryPart.Position, Vector3.new(0, -18, 0), v12) then
					local v13 = false;
					local v14 = p2:getFloorBlock();
					if #v14 ~= 0 then
						local v15, v16, v17 = ipairs(v14);
						while true do
							local v18, v19 = v15(v16, v17);
							if not v18 then
								break;
							end;
							local l__Unit__20 = ((l__Character__7.PrimaryPart.Position - v19.Position) * Vector3.new(1, 0, 1)).Unit;
							if math.abs(l__Humanoid__9.MoveDirection.Z) < math.abs(l__Humanoid__9.MoveDirection.X) then
								local v21 = Vector3.new(0, 0, 1);
							else
								v21 = Vector3.new(1, 0, 0);
							end;
							if math.deg((math.acos(l__Humanoid__9.MoveDirection:Dot(Vector3.new(math.sign(l__Unit__20.X), 0, math.sign(l__Unit__20.Z)) * v21)))) > 90 then
								v13 = true;
							end;						
						end;
						if not v13 then
							l__Humanoid__9:Move(v11);
						end;
						return nil;
					end;
				end;
			end;
		end;
	end);
end;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__9 = v3.Workspace;
local l__BlockEngine__10 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function v5.getFloorBlock(p3)
	local l__Character__22 = l__Players__5.LocalPlayer.Character;
	local l__PrimaryPart__23 = l__Character__22.PrimaryPart;
	local v24 = u8("Part", {
		Name = "BridgeAssistHelper", 
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Size = Vector3.new(l__PrimaryPart__23.Size.X, 1, l__PrimaryPart__23.Size.Z), 
		Parent = l__Workspace__9
	});
	v24.CFrame = l__PrimaryPart__23.CFrame - Vector3.new(0, l__Character__22:FindFirstChild("Humanoid").HipHeight + l__PrimaryPart__23.Size.Y / 2, 0);
	local v25 = OverlapParams.new();
	v25.FilterDescendantsInstances = { l__Character__22 };
	v25.FilterType = Enum.RaycastFilterType.Blacklist;
	local v26 = l__Workspace__9:GetPartsInPart(v24, v25);
	local function v27(p4)
		if l__GameQueryUtil__6:isQueryIgnored(p4) then
			return nil;
		end;
		return l__BlockEngine__10:getBlockInstanceFromChild(p4);
	end;
	local v28 = {};
	local v29 = 0;
	for v30, v31 in ipairs(v26) do
		local v32 = v27(v31, v30 - 1, v26);
		if v32 ~= nil then
			v29 = v29 + 1;
			v28[v29] = v32;
		end;
	end;
	v24:Destroy();
	return v28;
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
