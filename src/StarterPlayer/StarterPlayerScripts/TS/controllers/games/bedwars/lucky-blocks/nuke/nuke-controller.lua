-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = setmetatable({}, {
	__tostring = function()
		return "NukeController";
	end
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)

end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__6 = v3.TweenService;
function v4.onStart(p2)
	l__default__1.Client:OnEvent("Nuke", function(p3)
		local v6 = u2("Part", {
			Name = "NukePart", 
			Anchored = true, 
			CanCollide = false, 
			Position = p3.position, 
			Transparency = 0.6, 
			Size = Vector3.new(30, 30, 30), 
			Color = Color3.fromRGB(255, 255, 255), 
			Material = Enum.Material.Neon, 
			Shape = Enum.PartType.Ball, 
			Parent = l__Workspace__3
		});
		task.wait(0.2);
		u2("EqualizerSoundEffect", {
			Enabled = true, 
			HighGain = 5, 
			LowGain = 6, 
			MidGain = 0, 
			Parent = l__SoundManager__4:playSound(l__GameSound__5.TNT_EXPLODE_1, {
				position = p3.position, 
				volumeMultiplier = 6, 
				rollOffMaxDistance = 10000
			})
		});
		local v7 = l__TweenService__6:Create(v6, TweenInfo.new(0.2, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Size = Vector3.new(100, 100, 100), 
			Color = Color3.fromRGB(250, 148, 28)
		});
		v7:Play();
		v7.Completed:Wait();
		local v8 = l__TweenService__6:Create(v6, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
			Size = Vector3.new(150, 150, 150), 
			Transparency = 1
		});
		v8:Play();
		v8.Completed:Wait();
		v6:Destroy();
	end);
end;
l__Reflect__2.defineMetadata(v4, "identifier", "client/controllers/games/bedwars/lucky-blocks/nuke/nuke-controller@NukeController");
l__Reflect__2.defineMetadata(v4, "flamework:isExternal", false);
l__Reflect__2.defineMetadata(v4, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.defineMetadata(v4, "flamework:decorators", { "$:flamework@Controller" });
l__Reflect__2.defineMetadata(v4, "flamework:decorators.$:flamework@Controller", {
	type = "Controller"
});
return {
	default = v4
};
