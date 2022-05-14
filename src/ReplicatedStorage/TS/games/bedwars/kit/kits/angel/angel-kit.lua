-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local v2 = setmetatable({}, {
	__index = v1
});
v2.LIGHT = "Light";
v1.Light = "LIGHT";
v2.VOID = "Void";
v1.Void = "VOID";
local v3 = {};
local u1 = {
	Base = {
		texture = "rbxassetid://7539909078"
	}, 
	[v2.LIGHT] = {
		texture = "rbxassetid://7478451250", 
		neon = {
			color = Color3.fromRGB(117, 161, 255)
		}, 
		beams = {
			colorSequence = ColorSequence.new(Color3.fromRGB(90, 170, 255), Color3.fromRGB(56, 186, 255))
		}, 
		halos = {
			color = Color3.fromRGB(255, 126, 75)
		}
	}, 
	[v2.VOID] = {
		texture = "rbxassetid://7478260534", 
		neon = {
			color = Color3.fromRGB(255, 94, 89)
		}, 
		beams = {
			colorSequence = ColorSequence.new(Color3.fromRGB(255, 62, 62), Color3.fromRGB(255, 80, 80))
		}
	}
};
function v3.changeAngelAppearance(p1, p2)
	local v4 = u1[p2];
	for v5, v6 in ipairs(p1:GetDescendants()) do
		if v6:IsA("MeshPart") then
			if v6.Name == "Mesh/Neon" then
				if v4.neon then
					v6.TextureID = "";
					v6.Color = v4.neon.color;
				else
					v6.TextureID = v4.texture;
				end;
			elseif v6.Name == "Mesh/NeonException" then
				if v4.neon then
					v6.Transparency = 0;
					v6.Color = v4.neon.color;
				else
					v6.Transparency = 1;
				end;
			elseif v6.Name == "Mesh/Halo" then
				if v4.halos then
					v6.Transparency = 0;
					v6.Color = v4.halos.color;
				else
					v6.Transparency = 1;
				end;
			else
				local l__TextureID__7 = v6.TextureID;
				if l__TextureID__7 ~= "" and l__TextureID__7 then
					v6.TextureID = v4.texture;
				end;
			end;
		elseif v6:IsA("Beam") then
			if v4.beams then
				v6:SetAttribute("FirstPersonVisible", false);
				v6.Enabled = true;
				v6.Color = v4.beams.colorSequence;
			else
				v6:SetAttribute("FirstPersonVisible", nil);
				v6.Enabled = false;
			end;
		end;
	end;
end;
local v8 = {};
u1 = 3;
v8.ANGEL_KILL_REQUIREMENT = u1;
v8.AngelType = v2;
v8.AngelKitUtil = v3;
return v8;
