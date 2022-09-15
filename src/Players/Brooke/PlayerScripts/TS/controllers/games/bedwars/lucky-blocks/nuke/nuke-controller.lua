-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Reflect__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Reflect;
local l__Controller__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Controller;
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = setmetatable({}, {
	__tostring = function()
		return "NukeController";
	end
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)

end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v4.Workspace;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__6 = v4.TweenService;
function v5.onStart(p2)
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local v7 = u2("Part", {
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
		local v8 = l__TweenService__6:Create(v7, TweenInfo.new(0.2, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
			Size = Vector3.new(100, 100, 100), 
			Color = Color3.fromRGB(250, 148, 28)
		});
		v8:Play();
		v8.Completed:Wait();
		local v9 = l__TweenService__6:Create(v7, TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
			Size = Vector3.new(150, 150, 150), 
			Transparency = 1
		});
		v9:Play();
		v9.Completed:Wait();
		v7:Destroy();
	end);
end;
l__Reflect__2.defineMetadata(v5, "identifier", "client/controllers/games/bedwars/lucky-blocks/nuke/nuke-controller@NukeController");
l__Reflect__2.defineMetadata(v5, "flamework:implements", { "$:flamework@OnStart" });
l__Reflect__2.decorate(v5, "$:flamework@Controller", l__Controller__3, { {} });
return {
	default = v5
};
