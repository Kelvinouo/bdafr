-- Script Hash: 0c879cf15335a87ddb31dac7ebcb60e7ae466d44552d0a19d3af3c2535d9aeda4a0b9d941e1340e7f0098d45f6de15ae
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__mouse__1 = Game:GetService("Players").LocalPlayer:GetMouse();
function v1.ViewSizeX()
	local l__ViewSizeX__2 = l__mouse__1.ViewSizeX;
	local l__ViewSizeY__3 = l__mouse__1.ViewSizeY;
	if l__ViewSizeX__2 == 0 then
		return 1024;
	end;
	if l__ViewSizeY__3 < l__ViewSizeX__2 then
		return l__ViewSizeX__2;
	end;
	return l__ViewSizeY__3;
end;
function v1.ViewSizeY()
	local l__ViewSizeX__4 = l__mouse__1.ViewSizeX;
	local l__ViewSizeY__5 = l__mouse__1.ViewSizeY;
	if l__ViewSizeY__5 == 0 then
		return 768;
	end;
	if l__ViewSizeY__5 < l__ViewSizeX__4 then
		return l__ViewSizeY__5;
	end;
	return l__ViewSizeX__4;
end;
function v1.AspectRatio()
	return v1.ViewSizeX() / v1.ViewSizeY();
end;
function v1.WorldToScreen(p1)
	local v6 = Workspace.CurrentCamera.CoordinateFrame:pointToObjectSpace(p1);
	local v7 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	return Vector2.new(v1.ViewSizeX() * (0.5 + 0.5 * (v6.x / v6.z / -(v1.AspectRatio() * v7))), v1.ViewSizeY() * (0.5 + 0.5 * (v6.y / v6.z / v7)));
end;
function v1.ScreenToWorld(p2, p3, p4)
	local v8 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	return Vector3.new((p2 / v1.ViewSizeX() * 2 - 1) * -(v1.AspectRatio() * v8) * p4, (p3 / v1.ViewSizeY() * 2 - 1) * v8 * p4, p4);
end;
function v1.ScreenWidthToWorldWidth(p5, p6, p7)
	return -(p5 / v1.ViewSizeX()) * 2 * (v1.AspectRatio() * math.tan(math.rad(p7 and p7 or Workspace.CurrentCamera.FieldOfView) / 2)) * p6;
end;
function v1.ScreenHeightToWorldHeight(p8, p9, p10)
	return -(p8 / v1.ViewSizeY()) * 2 * math.tan(math.rad(p10 and p10 or Workspace.CurrentCamera.FieldOfView) / 2) * p9;
end;
function v1.WorldWidthToScreenWidth(p11, p12)
	return -(p11 * v1.ViewSizeX()) / (2 * (v1.AspectRatio() * math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2)) * p12);
end;
function v1.WorldHeightToScreenHeight(p13, p14)
	return -(p13 * v1.ViewSizeY()) / (2 * math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2) * p14);
end;
function v1.GetDepthForWidth(p15, p16)
	local v9 = v1.ViewSizeY();
	return -(v1.ViewSizeX() * p16) / (p15 * 2 * (v1.AspectRatio() * math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2)));
end;
function v1.GetDepthForHeight(p17, p18)
	return -(v1.ViewSizeY() * p18) / (p17 * 2 * math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2));
end;
function v1.ScreenToWorldByHeightDepth(p19, p20, p21, p22)
	local v10 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v11 = v1.ViewSizeY();
	return Vector3.new((p19 / v1.ViewSizeX() * 2 - 1) * -(v1.AspectRatio() * v10) * p22, (p20 / v11 * 2 - 1) * v10 * p22, p22), -(p21 / v11) * 2 * v10 * p22;
end;
function v1.ScreenToWorldByWidthDepth(p23, p24, p25, p26)
	local v12 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v13 = v1.AspectRatio() * v12;
	local v14 = v1.ViewSizeX();
	return Vector3.new((p23 / v14 * 2 - 1) * -v13 * p26, (p24 / v1.ViewSizeY() * 2 - 1) * v12 * p26, p26), p25 / v14 * 2 * -v13 * p26;
end;
function v1.ScreenToWorldByHeight(p27, p28, p29, p30)
	local v15 = v1.AspectRatio();
	local v16 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v17 = v1.ViewSizeX();
	local v18 = v1.ViewSizeY();
	local v19 = -(v18 * p30) / (p29 * 2 * v16);
	return Vector3.new((p27 / v17 * 2 - 1) * -(v15 * v16) * v19, (p28 / v18 * 2 - 1) * v16 * v19, v19);
end;
function v1.ScreenToWorldByWidth(p31, p32, p33, p34)
	local v20 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v21 = v1.AspectRatio() * v20;
	local v22 = v1.ViewSizeX();
	local v23 = v1.ViewSizeY();
	local v24 = -(v22 * p34) / (p33 * 2 * v21);
	return Vector3.new((p31 / v22 * 2 - 1) * -v21 * v24, (p32 / v23 * 2 - 1) * v20 * v24, v24);
end;
return v1;
