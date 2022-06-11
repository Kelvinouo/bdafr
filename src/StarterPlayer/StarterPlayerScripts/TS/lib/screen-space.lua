-- Script Hash: 2f11f87b93daf1c14813f193c6ac209273249db91685fd7977bafc3b97701a6abee39fd02f0b5e7f1d43f39212a9fb66
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {};
local l__CurrentCamera__1 = Game:GetService("Workspace").CurrentCamera;
function v1.ViewSizeX()
	local l__Y__2 = l__CurrentCamera__1.ViewportSize.Y;
	return l__CurrentCamera__1.ViewportSize.X;
end;
function v1.ViewSizeY()
	local l__X__3 = l__CurrentCamera__1.ViewportSize.X;
	return l__CurrentCamera__1.ViewportSize.Y;
end;
function v1.AspectRatio()
	return v1.ViewSizeX() / v1.ViewSizeY();
end;
function v1.WorldToScreen(p1)
	local v4 = Workspace.CurrentCamera.CoordinateFrame:pointToObjectSpace(p1);
	local v5 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	return Vector2.new(v1.ViewSizeX() * (0.5 + 0.5 * (v4.x / v4.z / -(v1.AspectRatio() * v5))), v1.ViewSizeY() * (0.5 + 0.5 * (v4.y / v4.z / v5)));
end;
function v1.ScreenToWorld(p2, p3, p4)
	local v6 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	return Vector3.new((p2 / v1.ViewSizeX() * 2 - 1) * -(v1.AspectRatio() * v6) * p4, (p3 / v1.ViewSizeY() * 2 - 1) * v6 * p4, p4);
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
	local v7 = v1.ViewSizeY();
	return -(v1.ViewSizeX() * p16) / (p15 * 2 * (v1.AspectRatio() * math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2)));
end;
function v1.GetDepthForHeight(p17, p18)
	return -(v1.ViewSizeY() * p18) / (p17 * 2 * math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2));
end;
function v1.ScreenToWorldByHeightDepth(p19, p20, p21, p22)
	local v8 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v9 = v1.ViewSizeY();
	return Vector3.new((p19 / v1.ViewSizeX() * 2 - 1) * -(v1.AspectRatio() * v8) * p22, (p20 / v9 * 2 - 1) * v8 * p22, p22), -(p21 / v9) * 2 * v8 * p22;
end;
function v1.ScreenToWorldByWidthDepth(p23, p24, p25, p26)
	local v10 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v11 = v1.AspectRatio() * v10;
	local v12 = v1.ViewSizeX();
	return Vector3.new((p23 / v12 * 2 - 1) * -v11 * p26, (p24 / v1.ViewSizeY() * 2 - 1) * v10 * p26, p26), p25 / v12 * 2 * -v11 * p26;
end;
function v1.ScreenToWorldByHeight(p27, p28, p29, p30)
	local v13 = v1.AspectRatio();
	local v14 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v15 = v1.ViewSizeX();
	local v16 = v1.ViewSizeY();
	local v17 = -(v16 * p30) / (p29 * 2 * v14);
	return Vector3.new((p27 / v15 * 2 - 1) * -(v13 * v14) * v17, (p28 / v16 * 2 - 1) * v14 * v17, v17);
end;
function v1.ScreenToWorldByWidth(p31, p32, p33, p34)
	local v18 = math.tan(math.rad(Workspace.CurrentCamera.FieldOfView) / 2);
	local v19 = v1.AspectRatio() * v18;
	local v20 = v1.ViewSizeX();
	local v21 = v1.ViewSizeY();
	local v22 = -(v20 * p34) / (p33 * 2 * v19);
	return Vector3.new((p31 / v20 * 2 - 1) * -v19 * v22, (p32 / v21 * 2 - 1) * v18 * v22, v22);
end;
return v1;
