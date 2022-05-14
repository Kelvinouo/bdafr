-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "FireballController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
local u1 = v5;
function u1.new(...)
	local v6 = setmetatable({}, u1);
	return v6:constructor(...) and v6;
end;
local u2 = l__KnitController__4;
function u1.constructor(p1, ...)
	u2.constructor(p1, ...);
	p1.Name = "FireballController";
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__4 = v2.SoundManager;
local l__RandomUtil__5 = v2.RandomUtil;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__8 = v3.Workspace;
local l__GameQueryUtil__9 = v2.GameQueryUtil;
local l__Debris__10 = v3.Debris;
local l__TweenService__11 = v3.TweenService;
function u1.KnitStart(p2)
	l__default__3.Client:WaitFor("FireballExplode"):andThen(function(p3)
		p3:Connect(function(p4)
			l__SoundManager__4:playSound(l__RandomUtil__5.fromList(l__GameSound__6.TNT_EXPLODE_1, l__GameSound__6.FIREBALL_EXPLODE), {
				position = p4.position, 
				rollOffMaxDistance = 220
			});
			local v7 = u7("Part", {
				Size = Vector3.new(1, 1, 1), 
				CFrame = CFrame.new(p4.position), 
				Anchored = true, 
				CanCollide = false, 
				Transparency = 1, 
				Parent = l__Workspace__8:WaitForChild("Explosions")
			});
			l__GameQueryUtil__9:setQueryIgnored(v7, true);
			l__Debris__10:AddItem(v7, 3);
			local v8 = { "rbxassetid://6852338879", "rbxassetid://6852338938", "rbxassetid://6852338995", "rbxassetid://6852339059", "rbxassetid://6852339122", "rbxassetid://6852339192", "rbxassetid://6852339277" };
			local v9 = 0;
			local v10 = false;
			while true do
				if v10 then
					v9 = v9 + 1;
				else
					v10 = true;
				end;
				if not (v9 < 20) then
					break;
				end;
				local v11 = u7("BillboardGui", {
					Adornee = v7, 
					StudsOffsetWorldSpace = Vector3.new(math.random(-7, 7), math.random(-7, 7), math.random(-7, 7)), 
					Size = UDim2.fromScale(math.random(4, 8), math.random(4, 8)), 
					AlwaysOnTop = true, 
					LightInfluence = 0, 
					Parent = v7, 
					Children = { u7("ImageLabel", {
							Image = l__RandomUtil__5.fromList(unpack(v8)), 
							Size = UDim2.fromScale(1, 1), 
							BorderSizePixel = 0, 
							BackgroundTransparency = 1
						}) }
				});
				l__TweenService__11:Create(v11, TweenInfo.new(math.random(6, 10)), {
					StudsOffset = v11.StudsOffsetWorldSpace + Vector3.new(0, 8, 0)
				}):Play();
				l__Debris__10:AddItem(v11, math.random(3, 9) / 10);			
			end;
		end);
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;
