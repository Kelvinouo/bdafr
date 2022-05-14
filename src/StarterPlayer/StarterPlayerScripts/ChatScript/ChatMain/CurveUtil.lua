-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	Expt = function(p1, p2, p3, p4, p5)
		if math.abs(p3 - p2) < 0.01 then
			return p3;
		end;
		return p2 + (p3 - p2) * u1:Expty(p2, p3, p4, p5);
	end, 
	Expty = function(p6, p7, p8, p9, p10)
		return 1 - math.exp(-(-math.log(1 - p9)) * p10);
	end, 
	Sign = function(p11, p12)
		if p12 > 0 then
			return 1;
		end;
		if p12 < 0 then
			return -1;
		end;
		return 0;
	end, 
	BezierValForT = function(p13, p14, p15, p16, p17, p18)
		return (1 - p18) * (1 - p18) * (1 - p18) * p14 + 3 * p18 * (1 - p18) * (1 - p18) * p15 + 3 * p18 * p18 * (1 - p18) * p16 + p18 * p18 * p18 * p17;
	end, 
	_BezierPt2ForT = {
		x = 0, 
		y = 0
	}, 
	BezierPt2ForT = function(p19, p20, p21, p22, p23, p24, p25, p26, p27, p28)
		u1._BezierPt2ForT.x = u1:BezierValForT(p20, p22, p24, p26, p28);
		u1._BezierPt2ForT.y = u1:BezierValForT(p21, p23, p25, p27, p28);
		return u1._BezierPt2ForT;
	end, 
	YForPointOf2PtLine = function(p29, p30, p31, p32)
		local v1 = (p30.y - p31.y) / (p30.x - p31.x);
		return v1 * p32 + (p30.y - v1 * p30.x);
	end, 
	DeltaTimeToTimescale = function(p33, p34)
		return p34 / 0.016666666666666666;
	end, 
	SecondsToTick = function(p35, p36)
		return 0.016666666666666666 / p36;
	end, 
	ExptValueInSeconds = function(p37, p38, p39, p40)
		return 1 - math.pow(p38 / p39, 1 / (60 * p40));
	end, 
	NormalizedDefaultExptValueInSeconds = function(p41, p42)
		return p41:ExptValueInSeconds(0.01, 1, p42);
	end
};
return u1;
