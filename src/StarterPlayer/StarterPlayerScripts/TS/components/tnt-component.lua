-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = setmetatable({}, {
	__tostring = function()
		return "TntComponent";
	end
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local l__SoundManager__1 = v2.SoundManager;
local l__GameSound__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ImageId__4 = v2.ImageId;
function v3.constructor(p1, p2)
	l__SoundManager__1:playSound(l__GameSound__2.TNT_HISS_1, {
		position = p2.Position, 
		rollOffMaxDistance = 220
	});
	local v5 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 2);
	l__TweenService__3:Create(p2, v5, {
		Size = p2.Size * 1.2
	}):Play();
	local u5 = {};
	local function v6(p3)
		if p3:IsA("Texture") then
			u5[p3.Face] = p3.Texture;
			l__TweenService__3:Create(p3, v5, {
				StudsPerTileU = p3.StudsPerTileU * 1.2, 
				StudsPerTileV = p3.StudsPerTileV * 1.2
			}):Play();
		end;
	end;
	local v7 = p2:GetChildren();
	local v8, v9, v10 = ipairs(v7);
	while true do
		v8(v9, v10);
		if not v8 then
			break;
		end;
		v10 = v8;
		v6(v9, v8 - 1, v7);	
	end;
	p2.ChildAdded:Connect(v6);
	v1.Promise.defer(function()
		local v11 = false;
		while { wait(0.25) } and p2.Parent ~= nil do
			v11 = not v11;
			local v12, v13, v14 = ipairs((p2:GetChildren()));
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				v14 = v12;
				if v13:IsA("Texture") then
					if v11 then
						v13.Texture = l__ImageId__4.PIXEL;
					else
						local v15 = u5[v13.Face];
						if v15 ~= "" and v15 then
							v13.Texture = v15;
						end;
					end;
				end;			
			end;		
		end;
	end);
end;
function v3.Destroy(p4)

end;
v3.Tag = "tnt";
return v3;
