--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local function v1(p1, p2)
	local v2 = {};
	local v3, v4, v5 = ipairs(p2);
	while true do
		v3(v4, v5);
		if not v3 then
			break;
		end;
		v5 = v3;
		v2[v4] = v4;	
	end;
	local v6 = {};
	function v6.__index(p3, p4)
		error(string.format("%s is not in %s!", p4, p1), 2);
	end;
	function v6.__newindex()
		error(string.format("Creating new members in %s is not allowed!", p1), 2);
	end;
	return setmetatable(v2, v6);
end;
local v7 = {
	Kind = v1("Promise.Error.Kind", { "ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut" })
};
v7.__index = v7;
function v7.new(p5, p6)
	p5 = p5 or {};
	return setmetatable({
		error = tostring(p5.error) and "[This error has no error text.]", 
		trace = p5.trace, 
		context = p5.context, 
		kind = p5.kind, 
		parent = p6, 
		createdTick = os.clock(), 
		createdTrace = debug.traceback()
	}, v7);
end;
function v7.is(p7)
	local v8 = nil;
	if type(p7) == "table" then
		v8 = getmetatable(p7);
		if type(v8) ~= "table" then
			return false;
		end;
	else
		return false;
	end;
	local v9 = false;
	if rawget(p7, "error") ~= nil then
		v9 = type(rawget(v8, "extend")) == "function";
	end;
	return v9;
end;
function v7.isKind(p8, p9)
	assert(p9 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
	return v7.is(p8) and p8.kind == p9;
end;
function v7.extend(p10, p11)
	p11 = p11 or {};
	p11.kind = p11.kind or p10.kind;
	return v7.new(p11, p10);
end;
function v7.getErrorChain(p12)
	local v10 = { p12 };
	while v10[#v10].parent do
		table.insert(v10, v10[#v10].parent);	
	end;
	return v10;
end;
function v7.__tostring(p13)
	local v11 = { string.format("-- Promise.Error(%s) --", p13.kind and "?") };
	local v12, v13, v14 = ipairs(p13:getErrorChain());
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		table.insert(v11, table.concat({ v13.trace or v13.error, v13.context }, "\n"));	
	end;
	return table.concat(v11, "\n");
end;
local function u1(p14, ...)
	return p14, select("#", ...), { ... };
end;
local function u2(p15, p16, ...)
	assert(p15 ~= nil, "traceback is nil");
	return u1(xpcall(p16, function(p17)
		if type(p17) == "table" then
			return p17;
		end;
		return v7.new({
			error = p17, 
			kind = v7.Kind.ExecutionError, 
			trace = debug.traceback(tostring(p17), 2), 
			context = "Promise created at:\n\n" .. p15
		});
	end, ...));
end;
local v15 = {
	Error = v7, 
	Status = v1("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }), 
	_getTime = os.clock, 
	_timeEvent = game:GetService("RunService").Heartbeat, 
	_unhandledRejectionCallbacks = {}, 
	prototype = {}
};
v15.__index = v15.prototype;
local u3 = {
	__mode = "k"
};
function v15._new(p18, p19, p20)
	if p20 ~= nil and not v15.is(p20) then
		error("Argument #2 to Promise.new must be a promise or nil", 2);
	end;
	local v16 = {
		_source = p18, 
		_status = v15.Status.Started, 
		_values = nil, 
		_valuesLength = -1, 
		_unhandledRejection = true, 
		_queuedResolve = {}, 
		_queuedReject = {}, 
		_queuedFinally = {}, 
		_cancellationHook = nil, 
		_parent = p20, 
		_consumers = setmetatable({}, u3)
	};
	if p20 and p20._status == v15.Status.Started then
		p20._consumers[v16] = true;
	end;
	setmetatable(v16, v15);
	local function u4(...)
		v16:_resolve(...);
	end;
	local function u5(...)
		v16:_reject(...);
	end;
	local function u6(p21)
		if p21 then
			if v16._status == v15.Status.Cancelled then
				p21();
			else
				v16._cancellationHook = p21;
			end;
		end;
		return v16._status == v15.Status.Cancelled;
	end;
	coroutine.wrap(function()
		local v17, v18, v19 = u2(v16._source, p19, u4, u5, u6);
		if not v17 then
			u5(v19[1]);
		end;
	end)();
	return v16;
end;
function v15.new(p22)
	return v15._new(debug.traceback(nil, 2), p22);
end;
function v15.__tostring(p23)
	return string.format("Promise(%s)", p23._status);
end;
function v15.defer(p24)
	local v20 = debug.traceback(nil, 2);
	return v15._new(v20, function(p25, p26, p27)
		local u7 = nil;
		u7 = v15._timeEvent:Connect(function()
			u7:Disconnect();
			local v21, v22, v23 = u2(v20, p24, p25, p26, p27);
			if not v21 then
				p26(v23[1]);
			end;
		end);
	end);
end;
v15.async = v15.defer;
local function u8(...)
	return select("#", ...), { ... };
end;
function v15.resolve(...)
	local v24, v25 = u8(...);
	return v15._new(debug.traceback(nil, 2), function(p28)
		p28(unpack(v25, 1, v24));
	end);
end;
function v15.reject(...)
	local v26, v27 = u8(...);
	return v15._new(debug.traceback(nil, 2), function(p29, p30)
		p30(unpack(v27, 1, v26));
	end);
end;
function v15._try(p31, p32, ...)
	local v28, v29 = u8(...);
	return v15._new(p31, function(p33)
		p33(p32(unpack(v29, 1, v28)));
	end);
end;
function v15.try(p34, ...)
	return v15._try(debug.traceback(nil, 2), p34, ...);
end;
function v15._all(p35, p36, p37)
	if type(p36) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
	end;
	for v30, v31 in pairs(p36) do
		if not v15.is(v31) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", tostring(v30)), 3);
		end;
	end;
	if #p36 ~= 0 and p37 ~= 0 then
		return v15._new(p35, function(p38, p39, p40)
			local v32 = 0;
			local u9 = {};
			local u10 = false;
			local u11 = 0;
			local u12 = {};
			local function v33(p41, ...)
				if u10 then
					return;
				end;
				u11 = u11 + 1;
				if p37 == nil then
					u12[p41] = ...;
				else
					u12[u11] = ...;
				end;
				if (p37 or #p36) <= u11 then
					u10 = true;
					p38(u12);
					local v34, v35, v36 = ipairs(u9);
					while true do
						v34(v35, v36);
						if not v34 then
							break;
						end;
						v36 = v34;
						v35:cancel();					
					end;
				end;
			end;
			p40(function()
				local v37, v38, v39 = ipairs(u9);
				while true do
					v37(v38, v39);
					if not v37 then
						break;
					end;
					v39 = v37;
					v38:cancel();				
				end;
			end);
			local v40, v41, v42 = ipairs(p36);
			while true do
				v40(v41, v42);
				if not v40 then
					break;
				end;
				v42 = v40;
				local u13 = v32;
				u9[v40] = v41:andThen(function(...)
					v33(v40, ...);
				end, function(...)
					u13 = u13 + 1;
					if p37 == nil or #p36 - u13 < p37 then
						local v43, v44, v45 = ipairs(u9);
						while true do
							v43(v44, v45);
							if not v43 then
								break;
							end;
							v45 = v43;
							v44:cancel();						
						end;
						u10 = true;
						p39(...);
					end;
				end);			
			end;
			if u10 then
				local v46, v47, v48 = ipairs(u9);
				while true do
					v46(v47, v48);
					if not v46 then
						break;
					end;
					v48 = v46;
					v47:cancel();				
				end;
			end;
		end);
	end;
	return v15.resolve({});
end;
function v15.all(p42)
	return v15._all(debug.traceback(nil, 2), p42);
end;
function v15.fold(p43, p44, p45)
	assert(type(p43) == "table", "Bad argument #1 to Promise.fold: must be a table");
	if type(p44) == "function" then
		local v49 = true;
	elseif type(p44) == "table" then
		local v50 = getmetatable(p44);
		if v50 and type(rawget(v50, "__call")) == "function" then
			v49 = true;
		else
			v49 = false;
		end;
	else
		v49 = false;
	end;
	assert(v49, "Bad argument #2 to Promise.fold: must be a function");
	local u14 = v15.resolve(p45);
	return v15.each(p43, function(p46, p47)
		u14 = u14:andThen(function(p48)
			return p44(p48, p46, p47);
		end);
	end):andThen(function()
		return u14;
	end);
end;
function v15.some(p49, p50)
	assert(type(p50) == "number", "Bad argument #2 to Promise.some: must be a number");
	return v15._all(debug.traceback(nil, 2), p49, p50);
end;
function v15.any(p51)
	return v15._all(debug.traceback(nil, 2), p51, 1):andThen(function(p52)
		return p52[1];
	end);
end;
function v15.allSettled(p53)
	if type(p53) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
	end;
	for v51, v52 in pairs(p53) do
		if not v15.is(v52) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(v51)), 2);
		end;
	end;
	if #p53 == 0 then
		return v15.resolve({});
	end;
	return v15._new(debug.traceback(nil, 2), function(p54, p55, p56)
		local u15 = 0;
		local u16 = {};
		local function v53(p57, ...)
			u15 = u15 + 1;
			u16[p57] = ...;
			if #p53 <= u15 then
				p54(u16);
			end;
		end;
		local u17 = {};
		p56(function()
			local v54, v55, v56 = ipairs(u17);
			while true do
				v54(v55, v56);
				if not v54 then
					break;
				end;
				v56 = v54;
				v55:cancel();			
			end;
		end);
		local v57, v58, v59 = ipairs(p53);
		while true do
			v57(v58, v59);
			if not v57 then
				break;
			end;
			v59 = v57;
			u17[v57] = v58:finally(function(...)
				v53(v57, ...);
			end);		
		end;
	end);
end;
function v15.race(p58)
	assert(type(p58) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
	for v60, v61 in pairs(p58) do
		assert(v15.is(v61), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(v60)));
	end;
	return v15._new(debug.traceback(nil, 2), function(p59, p60, p61)
		local u18 = {};
		local u19 = false;
		if p61(function(...)
			local v62, v63, v64 = ipairs(u18);
			while true do
				v62(v63, v64);
				if not v62 then
					break;
				end;
				v64 = v62;
				v63:cancel();			
			end;
			u19 = true;
			return p60(...);
		end) then
			return;
		end;
		local v65, v66, v67 = ipairs(p58);
		while true do
			v65(v66, v67);
			if not v65 then
				break;
			end;
			v67 = v65;
			u18[v65] = v66:andThen(function(...)
				local v68, v69, v70 = ipairs(u18);
				while true do
					v68(v69, v70);
					if not v68 then
						break;
					end;
					v70 = v68;
					v69:cancel();				
				end;
				u19 = true;
				return p59(...);
			end, function(...)
				local v71, v72, v73 = ipairs(u18);
				while true do
					v71(v72, v73);
					if not v71 then
						break;
					end;
					v73 = v71;
					v72:cancel();				
				end;
				u19 = true;
				return p60(...);
			end);		
		end;
		if u19 then
			local v74, v75, v76 = ipairs(u18);
			while true do
				v74(v75, v76);
				if not v74 then
					break;
				end;
				v76 = v74;
				v75:cancel();			
			end;
		end;
	end);
end;
function v15.each(p62, p63)
	assert(type(p62) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
	if type(p63) == "function" then
		local v77 = true;
	elseif type(p63) == "table" then
		local v78 = getmetatable(p63);
		if v78 and type(rawget(v78, "__call")) == "function" then
			v77 = true;
		else
			v77 = false;
		end;
	else
		v77 = false;
	end;
	assert(v77, string.format("Please pass a handler function to %s!", "Promise.each"));
	return v15._new(debug.traceback(nil, 2), function(p64, p65, p66)
		local v79 = {};
		local u20 = {};
		local u21 = false;
		p66(function()
			u21 = true;
			local v80, v81, v82 = ipairs(u20);
			while true do
				v80(v81, v82);
				if not v80 then
					break;
				end;
				v82 = v80;
				v81:cancel();			
			end;
		end);
		local v83 = {};
		local v84, v85, v86 = ipairs(p62);
		while true do
			v84(v85, v86);
			if not v84 then
				break;
			end;
			v86 = v84;
			if v15.is(v85) then
				if v85:getStatus() == v15.Status.Cancelled then
					local v87, v88, v89 = ipairs(u20);
					while true do
						v87(v88, v89);
						if not v87 then
							break;
						end;
						v89 = v87;
						v88:cancel();					
					end;
					return p65(v7.new({
						error = "Promise is cancelled", 
						kind = v7.Kind.AlreadyCancelled, 
						context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v84, v85._source)
					}));
				end;
				if v85:getStatus() == v15.Status.Rejected then
					local v90, v91, v92 = ipairs(u20);
					while true do
						v90(v91, v92);
						if not v90 then
							break;
						end;
						v92 = v90;
						v91:cancel();					
					end;
					return p65(select(2, v85:await()));
				end;
				local v93 = v85:andThen(function(...)
					return ...;
				end);
				table.insert(u20, v93);
				v83[v84] = v93;
			else
				v83[v84] = v85;
			end;		
		end;
		local v94, v95, v96 = ipairs(v83);
		while true do
			local v97 = v95;
			v94(v97, v96);
			if not v94 then
				break;
			end;
			v96 = v94;
			if v15.is(v97) then
				local v98, v99 = v97:await();
				v97 = v99;
				if not v98 then
					local v100, v101, v102 = ipairs(u20);
					while true do
						v100(v101, v102);
						if not v100 then
							break;
						end;
						v102 = v100;
						v101:cancel();					
					end;
					return p65(v97);
				end;
			end;
			if u21 then
				return;
			end;
			local v103 = v15.resolve(p63(v97, v94));
			table.insert(u20, v103);
			local v104, v105 = v103:await();
			if not v104 then
				local v106, v107, v108 = ipairs(u20);
				while true do
					v106(v107, v108);
					if not v106 then
						break;
					end;
					v108 = v106;
					v107:cancel();				
				end;
				return p65(v105);
			end;
			v79[v94] = v105;		
		end;
		p64(v79);
	end);
end;
function v15.is(p67)
	if type(p67) ~= "table" then
		return false;
	end;
	local v109 = getmetatable(p67);
	if v109 == v15 then
		return true;
	end;
	if v109 == nil then
		local l__andThen__110 = p67.andThen;
		if type(l__andThen__110) == "function" then
			return true;
		elseif type(l__andThen__110) == "table" then
			local v111 = getmetatable(l__andThen__110);
			if v111 and type(rawget(v111, "__call")) == "function" then
				return true;
			else
				return false;
			end;
		else
			return false;
		end;
	end;
	if type(v109) == "table" and type(rawget(v109, "__index")) == "table" then
		local v112 = rawget(rawget(v109, "__index"), "andThen");
		if type(v112) == "function" then
			local v113 = true;
		elseif type(v112) == "table" then
			local v114 = getmetatable(v112);
			if v114 and type(rawget(v114, "__call")) == "function" then
				v113 = true;
			else
				v113 = false;
			end;
		else
			v113 = false;
		end;
		if v113 then
			return true;
		end;
	end;
	return false;
end;
function v15.promisify(p68)
	return function(...)
		return v15._try(debug.traceback(nil, 2), p68, ...);
	end;
end;
local u22 = nil;
local u23 = nil;
function v15.delay(p69)
	assert(type(p69) == "number", "Bad argument #1 to Promise.delay, must be a number.");
	if not (p69 >= 0.016666666666666666) or p69 == math.huge then
		p69 = 0.016666666666666666;
	end;
	return v15._new(debug.traceback(nil, 2), function(p70, p71, p72)
		local v115 = v15._getTime();
		local v116 = v115 + p69;
		local v117 = {
			resolve = p70, 
			startTime = v115, 
			endTime = v116
		};
		if u22 == nil then
			u23 = v117;
			u22 = v15._timeEvent:Connect(function()
				while u23 ~= nil and u23.endTime < v15._getTime() do
					u23 = u23.next;
					if u23 == nil then
						u22:Disconnect();
						u22 = nil;
					else
						u23.previous = nil;
					end;
					u23.resolve(v15._getTime() - u23.startTime);				
				end;
			end);
		elseif u23.endTime < v116 then
			local v118 = u23;
			local v119 = v118.next;
			while v119 ~= nil and v119.endTime < v116 do
				v118 = v119;
				v119 = v118.next;			
			end;
			v118.next = v117;
			v117.previous = v118;
			if v119 ~= nil then
				v117.next = v119;
				v119.previous = v117;
			end;
		else
			v117.next = u23;
			u23.previous = v117;
			u23 = v117;
		end;
		p72(function()
			local l__next__120 = v117.next;
			if u23 ~= v117 then
				local l__previous__121 = v117.previous;
				l__previous__121.next = l__next__120;
				if l__next__120 ~= nil then
					l__next__120.previous = l__previous__121;
				end;
				return;
			end;
			if l__next__120 == nil then
				u22:Disconnect();
				u22 = nil;
			else
				l__next__120.previous = nil;
			end;
			u23 = l__next__120;
		end);
	end);
end;
v15.prototype.timeout = function(p73, p74, p75)
	local v122 = {};
	local u24 = debug.traceback(nil, 2);
	v122[1] = v15.delay(p74):andThen(function()
		if p75 == nil then
			local v123 = v7.new({
				kind = v7.Kind.TimedOut, 
				error = "Timed out", 
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p74, u24)
			}) or p75;
		else
			v123 = p75;
		end;
		return v15.reject(v123);
	end);
	v122[2] = p73;
	return v15.race(v122);
end;
v15.prototype.getStatus = function(p76)
	return p76._status;
end;
v15.prototype._andThen = function(p77, p78, p79, p80)
	p77._unhandledRejection = false;
	return v15._new(p78, function(p81, p82)
		local v124 = p81;
		if p79 then
			v124 = function(...)
				local v125 = nil;
				local v126 = nil;
				local v127 = nil;
				v126, v127, v125 = u2(p78, p79, ...);
				if not v126 then
					p82(v125[1]);
					return;
				end;
				p81(unpack(v125, 1, v127));
			end;
		end;
		local v128 = p82;
		if p80 then
			v128 = function(...)
				local v129 = nil;
				local v130 = nil;
				local v131 = nil;
				v130, v131, v129 = u2(p78, p80, ...);
				if not v130 then
					p82(v129[1]);
					return;
				end;
				p81(unpack(v129, 1, v131));
			end;
		end;
		if p77._status == v15.Status.Started then
			table.insert(p77._queuedResolve, v124);
			table.insert(p77._queuedReject, v128);
			return;
		end;
		if p77._status == v15.Status.Resolved then
			v124(unpack(p77._values, 1, p77._valuesLength));
			return;
		end;
		if p77._status == v15.Status.Rejected then
			v128(unpack(p77._values, 1, p77._valuesLength));
			return;
		end;
		if p77._status == v15.Status.Cancelled then
			p82(v7.new({
				error = "Promise is cancelled", 
				kind = v7.Kind.AlreadyCancelled, 
				context = "Promise created at\n\n" .. p78
			}));
		end;
	end, p77);
end;
v15.prototype.andThen = function(p83, p84, p85)
	local v132 = true;
	if p84 ~= nil then
		if type(p84) == "function" then
			v132 = true;
		elseif type(p84) == "table" then
			local v133 = getmetatable(p84);
			if v133 and type(rawget(v133, "__call")) == "function" then
				v132 = true;
			else
				v132 = false;
			end;
		else
			v132 = false;
		end;
	end;
	assert(v132, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	local v134 = true;
	if p85 ~= nil then
		if type(p85) == "function" then
			v134 = true;
		elseif type(p85) == "table" then
			local v135 = getmetatable(p85);
			if v135 and type(rawget(v135, "__call")) == "function" then
				v134 = true;
			else
				v134 = false;
			end;
		else
			v134 = false;
		end;
	end;
	assert(v134, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	return p83:_andThen(debug.traceback(nil, 2), p84, p85);
end;
v15.prototype.catch = function(p86, p87)
	local v136 = true;
	if p87 ~= nil then
		if type(p87) == "function" then
			v136 = true;
		elseif type(p87) == "table" then
			local v137 = getmetatable(p87);
			if v137 and type(rawget(v137, "__call")) == "function" then
				v136 = true;
			else
				v136 = false;
			end;
		else
			v136 = false;
		end;
	end;
	assert(v136, string.format("Please pass a handler function to %s!", "Promise:catch"));
	return p86:_andThen(debug.traceback(nil, 2), nil, p87);
end;
v15.prototype.tap = function(p88, p89)
	if type(p89) == "function" then
		local v138 = true;
	elseif type(p89) == "table" then
		local v139 = getmetatable(p89);
		if v139 and type(rawget(v139, "__call")) == "function" then
			v138 = true;
		else
			v138 = false;
		end;
	else
		v138 = false;
	end;
	assert(v138, string.format("Please pass a handler function to %s!", "Promise:tap"));
	return p88:_andThen(debug.traceback(nil, 2), function(...)
		local v140 = p89(...);
		if not v15.is(v140) then
			return ...;
		end;
		local v141, v142 = u8(...);
		return v140:andThen(function()
			return unpack(v142, 1, v141);
		end);
	end);
end;
v15.prototype.andThenCall = function(p90, p91, ...)
	if type(p91) == "function" then
		local v143 = true;
	elseif type(p91) == "table" then
		local v144 = getmetatable(p91);
		if v144 and type(rawget(v144, "__call")) == "function" then
			v143 = true;
		else
			v143 = false;
		end;
	else
		v143 = false;
	end;
	assert(v143, string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
	local v145, v146 = u8(...);
	return p90:_andThen(debug.traceback(nil, 2), function()
		return p91(unpack(v146, 1, v145));
	end);
end;
v15.prototype.andThenReturn = function(p92, ...)
	local v147, v148 = u8(...);
	return p92:_andThen(debug.traceback(nil, 2), function()
		return unpack(v148, 1, v147);
	end);
end;
v15.prototype.cancel = function(p93)
	if p93._status ~= v15.Status.Started then
		return;
	end;
	p93._status = v15.Status.Cancelled;
	if p93._cancellationHook then
		p93._cancellationHook();
	end;
	if p93._parent then
		p93._parent:_consumerCancelled(p93);
	end;
	for v149 in pairs(p93._consumers) do
		v149:cancel();
	end;
	p93:_finalize();
end;
v15.prototype._consumerCancelled = function(p94, p95)
	if p94._status ~= v15.Status.Started then
		return;
	end;
	p94._consumers[p95] = nil;
	if next(p94._consumers) == nil then
		p94:cancel();
	end;
end;
v15.prototype._finally = function(p96, p97, p98, p99)
	if not p99 then
		p96._unhandledRejection = false;
	end;
	return v15._new(p97, function(p100, p101)
		local v150 = p100;
		if p98 then
			v150 = function(...)
				local v151 = nil;
				local v152 = nil;
				local v153 = nil;
				v152, v153, v151 = u2(p97, p98, ...);
				if not v152 then
					p101(v151[1]);
					return;
				end;
				p100(unpack(v151, 1, v153));
			end;
		end;
		if p99 then
			v150 = function(...)
				if p96._status == v15.Status.Rejected then
					return p100(p96);
				end;
				return v150(...);
			end;
		end;
		if p96._status == v15.Status.Started then
			table.insert(p96._queuedFinally, v150);
			return;
		end;
		v150(p96._status);
	end, p96);
end;
v15.prototype.finally = function(p102, p103)
	local v154 = true;
	if p103 ~= nil then
		if type(p103) == "function" then
			v154 = true;
		elseif type(p103) == "table" then
			local v155 = getmetatable(p103);
			if v155 and type(rawget(v155, "__call")) == "function" then
				v154 = true;
			else
				v154 = false;
			end;
		else
			v154 = false;
		end;
	end;
	assert(v154, string.format("Please pass a handler function to %s!", "Promise:finally"));
	return p102:_finally(debug.traceback(nil, 2), p103);
end;
v15.prototype.finallyCall = function(p104, p105, ...)
	if type(p105) == "function" then
		local v156 = true;
	elseif type(p105) == "table" then
		local v157 = getmetatable(p105);
		if v157 and type(rawget(v157, "__call")) == "function" then
			v156 = true;
		else
			v156 = false;
		end;
	else
		v156 = false;
	end;
	assert(v156, string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
	local v158, v159 = u8(...);
	return p104:_finally(debug.traceback(nil, 2), function()
		return p105(unpack(v159, 1, v158));
	end);
end;
v15.prototype.finallyReturn = function(p106, ...)
	local v160, v161 = u8(...);
	return p106:_finally(debug.traceback(nil, 2), function()
		return unpack(v161, 1, v160);
	end);
end;
v15.prototype.done = function(p107, p108)
	local v162 = true;
	if p108 ~= nil then
		if type(p108) == "function" then
			v162 = true;
		elseif type(p108) == "table" then
			local v163 = getmetatable(p108);
			if v163 and type(rawget(v163, "__call")) == "function" then
				v162 = true;
			else
				v162 = false;
			end;
		else
			v162 = false;
		end;
	end;
	assert(v162, string.format("Please pass a handler function to %s!", "Promise:done"));
	return p107:_finally(debug.traceback(nil, 2), p108, true);
end;
v15.prototype.doneCall = function(p109, p110, ...)
	if type(p110) == "function" then
		local v164 = true;
	elseif type(p110) == "table" then
		local v165 = getmetatable(p110);
		if v165 and type(rawget(v165, "__call")) == "function" then
			v164 = true;
		else
			v164 = false;
		end;
	else
		v164 = false;
	end;
	assert(v164, string.format("Please pass a handler function to %s!", "Promise:doneCall"));
	local v166, v167 = u8(...);
	return p109:_finally(debug.traceback(nil, 2), function()
		return p110(unpack(v167, 1, v166));
	end, true);
end;
v15.prototype.doneReturn = function(p111, ...)
	local v168, v169 = u8(...);
	return p111:_finally(debug.traceback(nil, 2), function()
		return unpack(v169, 1, v168);
	end, true);
end;
v15.prototype.awaitStatus = function(p112)
	p112._unhandledRejection = false;
	if p112._status == v15.Status.Started then
		local u25 = Instance.new("BindableEvent");
		p112:finally(function()
			u25:Fire();
		end);
		u25.Event:Wait();
		u25:Destroy();
	end;
	if p112._status == v15.Status.Resolved then
		return p112._status, unpack(p112._values, 1, p112._valuesLength);
	end;
	if p112._status ~= v15.Status.Rejected then
		return p112._status;
	end;
	return p112._status, unpack(p112._values, 1, p112._valuesLength);
end;
local function u26(p113, ...)
	return p113 == v15.Status.Resolved, ...;
end;
v15.prototype.await = function(p114)
	return u26(p114:awaitStatus());
end;
local function u27(p115, ...)
	if p115 ~= v15.Status.Resolved then
		if ... == nil then
			local v170 = "Expected Promise rejected with no value.";
		else
			v170 = ...;
		end;
		error(v170, 3);
	end;
	return ...;
end;
v15.prototype.expect = function(p116)
	return u27(p116:awaitStatus());
end;
v15.prototype.awaitValue = v15.prototype.expect;
v15.prototype._unwrap = function(p117)
	if p117._status == v15.Status.Started then
		error("Promise has not resolved or rejected.", 2);
	end;
	return p117._status == v15.Status.Resolved, unpack(p117._values, 1, p117._valuesLength);
end;
v15.prototype._resolve = function(p118, ...)
	if p118._status ~= v15.Status.Started then
		if v15.is((...)) then
			(...):_consumerCancelled(p118);
		end;
		return;
	end;
	if not v15.is((...)) then
		p118._status = v15.Status.Resolved;
		local v171, v172 = u8(...);
		p118._valuesLength = v171;
		p118._values = v172;
		local v173, v174, v175 = ipairs(p118._queuedResolve);
		while true do
			v173(v174, v175);
			if not v173 then
				break;
			end;
			v175 = v173;
			coroutine.wrap(v174)(...);		
		end;
		p118:_finalize();
		return;
	end;
	if select("#", ...) > 1 then
		warn((string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p118._source)));
	end;
	local u28 = ...;
	local v176 = u28:andThen(function(...)
		p118:_resolve(...);
	end, function(...)
		local v177 = u28._values[1];
		if u28._error then
			v177 = v7.new({
				error = u28._error, 
				kind = v7.Kind.ExecutionError, 
				context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
			});
		end;
		if not v7.isKind(v177, v7.Kind.ExecutionError) then
			p118:_reject(...);
			return;
		end;
		return p118:_reject(v177:extend({
			error = "This Promise was chained to a Promise that errored.", 
			trace = "", 
			context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p118._source)
		}));
	end);
	if v176._status == v15.Status.Cancelled then
		p118:cancel();
		return;
	end;
	if v176._status == v15.Status.Started then
		p118._parent = v176;
		v176._consumers[p118] = true;
	end;
end;
v15.prototype._reject = function(p119, ...)
	if p119._status ~= v15.Status.Started then
		return;
	end;
	p119._status = v15.Status.Rejected;
	local v178, v179 = u8(...);
	p119._valuesLength = v178;
	p119._values = v179;
	if next(p119._queuedReject) ~= nil then
		local v180, v181, v182 = ipairs(p119._queuedReject);
		while true do
			v180(v181, v182);
			if not v180 then
				break;
			end;
			v182 = v180;
			coroutine.wrap(v181)(...);		
		end;
	else
		local u29 = tostring((...));
		coroutine.wrap(function()
			v15._timeEvent:Wait();
			if not p119._unhandledRejection then
				return;
			end;
			local v183 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", u29, p119._source);
			local v184, v185, v186 = ipairs(v15._unhandledRejectionCallbacks);
			while true do
				v184(v185, v186);
				if not v184 then
					break;
				end;
				v186 = v184;
				task.spawn(v185, p119, unpack(p119._values, 1, p119._valuesLength));			
			end;
			if v15.TEST then
				return;
			end;
			warn(v183);
		end)();
	end;
	p119:_finalize();
end;
v15.prototype._finalize = function(p120)
	local v187, v188, v189 = ipairs(p120._queuedFinally);
	while true do
		v187(v188, v189);
		if not v187 then
			break;
		end;
		v189 = v187;
		coroutine.wrap(v188)(p120._status);	
	end;
	p120._queuedFinally = nil;
	p120._queuedReject = nil;
	p120._queuedResolve = nil;
	if not v15.TEST then
		p120._parent = nil;
		p120._consumers = nil;
	end;
end;
v15.prototype.now = function(p121, p122)
	local v190 = nil;
	v190 = debug.traceback(nil, 2);
	if p121._status == v15.Status.Resolved then
		return p121:_andThen(v190, function(...)
			return ...;
		end);
	end;
	if p122 == nil then
		local v191 = v7.new({
			kind = v7.Kind.NotResolvedInTime, 
			error = "This Promise was not resolved in time for :now()", 
			context = ":now() was called at:\n\n" .. v190
		}) or p122;
	else
		v191 = p122;
	end;
	return v15.reject(v191);
end;
function v15.retry(p123, p124, ...)
	if type(p123) == "function" then
		local v192 = true;
	elseif type(p123) == "table" then
		local v193 = getmetatable(p123);
		if v193 and type(rawget(v193, "__call")) == "function" then
			v192 = true;
		else
			v192 = false;
		end;
	else
		v192 = false;
	end;
	assert(v192, "Parameter #1 to Promise.retry must be a function");
	assert(type(p124) == "number", "Parameter #2 to Promise.retry must be a number");
	local u30 = { ... };
	local u31 = select("#", ...);
	return v15.resolve(p123(...)):catch(function(...)
		if not (p124 > 0) then
			return v15.reject(...);
		end;
		return v15.retry(p123, p124 - 1, unpack(u30, 1, u31));
	end);
end;
function v15.retryWithDelay(p125, p126, p127, ...)
	if type(p125) == "function" then
		local v194 = true;
	elseif type(p125) == "table" then
		local v195 = getmetatable(p125);
		if v195 and type(rawget(v195, "__call")) == "function" then
			v194 = true;
		else
			v194 = false;
		end;
	else
		v194 = false;
	end;
	assert(v194, "Parameter #1 to Promise.retry must be a function");
	assert(type(p126) == "number", "Parameter #2 (times) to Promise.retry must be a number");
	assert(type(p127) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
	local u32 = { ... };
	local u33 = select("#", ...);
	return v15.resolve(p125(...)):catch(function(...)
		if not (p126 > 0) then
			return v15.reject(...);
		end;
		v15.delay(p127):await();
		return v15.retryWithDelay(p125, p126 - 1, p127, unpack(u32, 1, u33));
	end);
end;
function v15.fromEvent(p128, p129)
	p129 = p129 or function()
		return true;
	end;
	return v15._new(debug.traceback(nil, 2), function(p130, p131, p132)
		local u34 = nil;
		local function v196()
			u34:Disconnect();
			u34 = nil;
		end;
		local u35 = false;
		u34 = p128:Connect(function(...)
			local v197 = p129(...);
			if v197 ~= true then
				if type(v197) ~= "boolean" then
					error("Promise.fromEvent predicate should always return a boolean");
				end;
				return;
			end;
			p130(...);
			if not u34 then
				u35 = true;
				return;
			end;
			u34:Disconnect();
			u34 = nil;
		end);
		if u35 and u34 then
			return v196();
		end;
		p132(v196);
	end);
end;
function v15.onUnhandledRejection(p133)
	table.insert(v15._unhandledRejectionCallbacks, p133);
	return function()
		local v198 = table.find(v15._unhandledRejectionCallbacks, p133);
		if v198 then
			table.remove(v15._unhandledRejectionCallbacks, v198);
		end;
	end;
end;
return v15;
