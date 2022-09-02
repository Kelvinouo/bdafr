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
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "BridgeAssistController";
end;
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__PlaceUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__RunService__3 = v3.RunService;
local l__Players__4 = v3.Players;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	if not l__DeviceUtil__1.isMobileControls() and l__PlaceUtil__2.isProduction() then
		return nil;
	end;
	local u6 = { Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 0, -1) };
	l__RunService__3:BindToRenderStep("bridge-assist", Enum.RenderPriority.Character.Value + 1, function()
		local l__Character__7 = l__Players__4.LocalPlayer.Character;
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
		local v10, v11, v12 = ipairs(u6);
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			v12 = v10;
			if math.abs(math.acos(v11:Dot(l__Humanoid__9.MoveDirection))) < 0.5759586531581288 then
				local v13 = RaycastParams.new();
				v13.FilterType = Enum.RaycastFilterType.Blacklist;
				v13.FilterDescendantsInstances = { l__Character__7 };
				if not l__GameQueryUtil__5:raycast(l__Character__7.PrimaryPart.Position, Vector3.new(0, -18, 0), v13) then
					local v14 = false;
					local v15 = p2:getFloorBlock();
					if #v15 ~= 0 then
						local v16, v17, v18 = ipairs(v15);
						while true do
							v16(v17, v18);
							if not v16 then
								break;
							end;
							local l__Unit__19 = ((l__Character__7.PrimaryPart.Position - v17.Position) * Vector3.new(1, 0, 1)).Unit;
							if math.abs(l__Humanoid__9.MoveDirection.Z) < math.abs(l__Humanoid__9.MoveDirection.X) then
								local v20 = Vector3.new(0, 0, 1);
							else
								v20 = Vector3.new(1, 0, 0);
							end;
							if math.deg((math.acos(l__Humanoid__9.MoveDirection:Dot(Vector3.new(math.sign(l__Unit__19.X), 0, math.sign(l__Unit__19.Z)) * v20)))) > 90 then
								v14 = true;
							end;						
						end;
						if not v14 then
							l__Humanoid__9:Move(v11);
						end;
						return nil;
					end;
				end;
			end;		
		end;
	end);
end;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__8 = v3.Workspace;
local l__BlockEngine__9 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
function v5.getFloorBlock(p3)
	local l__Character__21 = l__Players__4.LocalPlayer.Character;
	local l__PrimaryPart__22 = l__Character__21.PrimaryPart;
	local v23 = u7("Part", {
		Name = "BridgeAssistHelper", 
		Transparency = 1, 
		CanCollide = false, 
		Anchored = true, 
		Size = Vector3.new(l__PrimaryPart__22.Size.X, 1, l__PrimaryPart__22.Size.Z), 
		Parent = l__Workspace__8
	});
	v23.CFrame = l__PrimaryPart__22.CFrame - Vector3.new(0, l__Character__21:FindFirstChild("Humanoid").HipHeight + l__PrimaryPart__22.Size.Y / 2, 0);
	local v24 = OverlapParams.new();
	v24.FilterDescendantsInstances = { l__Character__21 };
	v24.FilterType = Enum.RaycastFilterType.Blacklist;
	local v25 = {};
	local v26 = 0;
	local v27, v28, v29 = ipairs((l__Workspace__8:GetPartsInPart(v23, v24)));
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		if l__GameQueryUtil__5:isQueryIgnored(v28) then
			local v30 = nil;
		else
			v30 = l__BlockEngine__9:getBlockInstanceFromChild(v28);
		end;
		if v30 ~= nil then
			v26 = v26 + 1;
			v25[v26] = v30;
		end;	
	end;
	v23:Destroy();
	return v25;
end;
local v31 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
