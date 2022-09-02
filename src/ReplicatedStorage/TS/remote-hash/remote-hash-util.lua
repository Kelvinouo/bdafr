-- Decompiled with the Synapse X Luau decompiler.

return {
	RemoteHashUtil = {
		prepareHashVector3 = function(p1)
			local v1 = tostring(p1.X) .. "," .. tostring(p1.Y) .. "," .. tostring(p1.Z);
			local u1 = {};
			local v2, v3, v4 = ipairs({ string.byte(v1, 1, #v1) });
			while true do
				v2(v3, v4);
				if not v2 then
					break;
				end;
				v4 = v2;
				table.insert(u1, v3);			
			end;
			return u1;
		end
	}
};
