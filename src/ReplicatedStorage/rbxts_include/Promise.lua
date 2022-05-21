-- Script Hash: 03106faa58d6e1e707e3c7868ca41ad735b556f48f68c5d0030419e099166d6ed056b2f25337fcb5a396ff9d25e938d9
--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local function v1(p1, p2)
	local v2 = {};
	for v3, v4 in ipairs(p2) do
		v2[v4] = v4;
	end;
	local v5 = {};
	function v5.__index(p3, p4)
		error(string.format("%s is not in %s!", p4, p1), 2);
	end;
	function v5.__newindex()
		error(string.format("Creating new members in %s is not allowed!", p1), 2);
	end;
	return setmetatable(v2, v5);
end;
local v6 = {
	Kind = v1("Promise.Error.Kind", { "ExecutionError", "AlreadyCancelled", "NotResolvedInTime", "TimedOut" })
};
v6.__index = v6;
function v6.new(p5, p6)
	p5 = p5 or {};
	return setmetatable({
		error = tostring(p5.error) and "[This error has no error text.]", 
		trace = p5.trace, 
		context = p5.context, 
		kind = p5.kind, 
		parent = p6, 
		createdTick = os.clock(), 
		createdTrace = debug.traceback()
	}, v6);
end;
function v6.is(p7)
	local v7 = nil;
	if type(p7) == "table" then
		v7 = getmetatable(p7);
		if type(v7) ~= "table" then
			return false;
		end;
	else
		return false;
	end;
	local v8 = false;
	if rawget(p7, "error") ~= nil then
		v8 = type(rawget(v7, "extend")) == "function";
	end;
	return v8;
end;
function v6.isKind(p8, p9)
	assert(p9 ~= nil, "Argument #2 to Promise.Error.isKind must not be nil");
	return v6.is(p8) and p8.kind == p9;
end;
function v6.extend(p10, p11)
	p11 = p11 or {};
	p11.kind = p11.kind or p10.kind;
	return v6.new(p11, p10);
end;
function v6.getErrorChain(p12)
	local v9 = { p12 };
	while v9[#v9].parent do
		table.insert(v9, v9[#v9].parent);	
	end;
	return v9;
end;
function v6.__tostring(p13)
	local v10 = { string.format("-- Promise.Error(%s) --", p13.kind and "?") };
	for v11, v12 in ipairs(p13:getErrorChain()) do
		table.insert(v10, table.concat({ v12.trace or v12.error, v12.context }, "\n"));
	end;
	return table.concat(v10, "\n");
end;
local function u1(p14, ...)
	return p14, select("#", ...), { ... };
end;
local function u2(p15)
	assert(p15 ~= nil, "traceback is nil");
	return function(p16)
		if type(p16) == "table" then
			return p16;
		end;
		return v6.new({
			error = p16, 
			kind = v6.Kind.ExecutionError, 
			trace = debug.traceback(tostring(p16), 2), 
			context = "Promise created at:\n\n" .. p15
		});
	end;
end;
local function u3(p17, p18, ...)
	return u1(xpcall(p18, u2(p17), ...));
end;
local v13 = {
	Error = v6, 
	Status = v1("Promise.Status", { "Started", "Resolved", "Rejected", "Cancelled" }), 
	_getTime = os.clock, 
	_timeEvent = game:GetService("RunService").Heartbeat, 
	_unhandledRejectionCallbacks = {}, 
	prototype = {}
};
v13.__index = v13.prototype;
local u4 = {
	__mode = "k"
};
function v13._new(p19, p20, p21)
	if p21 ~= nil and not v13.is(p21) then
		error("Argument #2 to Promise.new must be a promise or nil", 2);
	end;
	local v14 = {
		_source = p19, 
		_status = v13.Status.Started, 
		_values = nil, 
		_valuesLength = -1, 
		_unhandledRejection = true, 
		_queuedResolve = {}, 
		_queuedReject = {}, 
		_queuedFinally = {}, 
		_cancellationHook = nil, 
		_parent = p21, 
		_consumers = setmetatable({}, u4)
	};
	if p21 and p21._status == v13.Status.Started then
		p21._consumers[v14] = true;
	end;
	setmetatable(v14, v13);
	local function u5(...)
		v14:_resolve(...);
	end;
	local function u6(...)
		v14:_reject(...);
	end;
	local function u7(p22)
		if p22 then
			if v14._status == v13.Status.Cancelled then
				p22();
			else
				v14._cancellationHook = p22;
			end;
		end;
		return v14._status == v13.Status.Cancelled;
	end;
	coroutine.wrap(function()
		local v15, v16, v17 = u3(v14._source, p20, u5, u6, u7);
		if not v15 then
			u6(v17[1]);
		end;
	end)();
	return v14;
end;
function v13.new(p23)
	return v13._new(debug.traceback(nil, 2), p23);
end;
function v13.__tostring(p24)
	return string.format("Promise(%s)", p24._status);
end;
function v13.defer(p25)
	local v18 = debug.traceback(nil, 2);
	return v13._new(v18, function(p26, p27, p28)
		local u8 = nil;
		u8 = v13._timeEvent:Connect(function()
			u8:Disconnect();
			local v19, v20, v21 = u3(v18, p25, p26, p27, p28);
			if not v19 then
				p27(v21[1]);
			end;
		end);
	end);
end;
v13.async = v13.defer;
local function u9(...)
	return select("#", ...), { ... };
end;
function v13.resolve(...)
	local v22, v23 = u9(...);
	return v13._new(debug.traceback(nil, 2), function(p29)
		p29(unpack(v23, 1, v22));
	end);
end;
function v13.reject(...)
	local v24, v25 = u9(...);
	return v13._new(debug.traceback(nil, 2), function(p30, p31)
		p31(unpack(v25, 1, v24));
	end);
end;
function v13._try(p32, p33, ...)
	local v26, v27 = u9(...);
	return v13._new(p32, function(p34)
		p34(p33(unpack(v27, 1, v26)));
	end);
end;
function v13.try(p35, ...)
	return v13._try(debug.traceback(nil, 2), p35, ...);
end;
function v13._all(p36, p37, p38)
	if type(p37) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3);
	end;
	for v28, v29 in pairs(p37) do
		if not v13.is(v29) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.all", tostring(v28)), 3);
		end;
	end;
	if #p37 ~= 0 and p38 ~= 0 then
		return v13._new(p36, function(p39, p40, p41)
			local v30 = 0;
			local u10 = {};
			local u11 = false;
			local u12 = 0;
			local u13 = {};
			local function u14()
				for v31, v32 in ipairs(u10) do
					v32:cancel();
				end;
			end;
			local function v33(p42, ...)
				if u11 then
					return;
				end;
				u12 = u12 + 1;
				if p38 == nil then
					u13[p42] = ...;
				else
					u13[u12] = ...;
				end;
				if (p38 or #p37) <= u12 then
					u11 = true;
					p39(u13);
					u14();
				end;
			end;
			p41(u14);
			for v34, v35 in ipairs(p37) do
				local u15 = v30;
				u10[v34] = v35:andThen(function(...)
					v33(v34, ...);
				end, function(...)
					u15 = u15 + 1;
					if p38 == nil or #p37 - u15 < p38 then
						u14();
						u11 = true;
						p40(...);
					end;
				end);
			end;
			if u11 then
				u14();
			end;
		end);
	end;
	return v13.resolve({});
end;
function v13.all(p43)
	return v13._all(debug.traceback(nil, 2), p43);
end;
local function u16(p44)
	if type(p44) == "function" then
		return true;
	end;
	if type(p44) == "table" then
		local v36 = getmetatable(p44);
		if v36 and type(rawget(v36, "__call")) == "function" then
			return true;
		end;
	end;
	return false;
end;
function v13.fold(p45, p46, p47)
	assert(type(p45) == "table", "Bad argument #1 to Promise.fold: must be a table");
	assert(u16(p46), "Bad argument #2 to Promise.fold: must be a function");
	local u17 = v13.resolve(p47);
	return v13.each(p45, function(p48, p49)
		u17 = u17:andThen(function(p50)
			return p46(p50, p48, p49);
		end);
	end):andThen(function()
		return u17;
	end);
end;
function v13.some(p51, p52)
	assert(type(p52) == "number", "Bad argument #2 to Promise.some: must be a number");
	return v13._all(debug.traceback(nil, 2), p51, p52);
end;
function v13.any(p53)
	return v13._all(debug.traceback(nil, 2), p53, 1):andThen(function(p54)
		return p54[1];
	end);
end;
function v13.allSettled(p55)
	if type(p55) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2);
	end;
	for v37, v38 in pairs(p55) do
		if not v13.is(v38) then
			error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", tostring(v37)), 2);
		end;
	end;
	if #p55 == 0 then
		return v13.resolve({});
	end;
	return v13._new(debug.traceback(nil, 2), function(p56, p57, p58)
		local u18 = 0;
		local u19 = {};
		local function v39(p59, ...)
			u18 = u18 + 1;
			u19[p59] = ...;
			if #p55 <= u18 then
				p56(u19);
			end;
		end;
		local u20 = {};
		p58(function()
			for v40, v41 in ipairs(u20) do
				v41:cancel();
			end;
		end);
		for v42, v43 in ipairs(p55) do
			u20[v42] = v43:finally(function(...)
				v39(v42, ...);
			end);
		end;
	end);
end;
function v13.race(p60)
	assert(type(p60) == "table", string.format("Please pass a list of promises to %s", "Promise.race"));
	for v44, v45 in pairs(p60) do
		assert(v13.is(v45), string.format("Non-promise value passed into %s at index %s", "Promise.race", tostring(v44)));
	end;
	return v13._new(debug.traceback(nil, 2), function(p61, p62, p63)
		local u21 = {};
		local function u22()
			for v46, v47 in ipairs(u21) do
				v47:cancel();
			end;
		end;
		local u23 = false;
		local function v48(p64)
			return function(...)
				u22();
				u23 = true;
				return p64(...);
			end;
		end;
		if p63(v48(p62)) then
			return;
		end;
		for v49, v50 in ipairs(p60) do
			u21[v49] = v50:andThen(v48(p61), v48(p62));
		end;
		if u23 then
			u22();
		end;
	end);
end;
function v13.each(p65, p66)
	assert(type(p65) == "table", string.format("Please pass a list of promises to %s", "Promise.each"));
	assert(u16(p66), string.format("Please pass a handler function to %s!", "Promise.each"));
	return v13._new(debug.traceback(nil, 2), function(p67, p68, p69)
		local v51 = {};
		local u24 = {};
		local u25 = false;
		local function u26()
			for v52, v53 in ipairs(u24) do
				v53:cancel();
			end;
		end;
		p69(function()
			u25 = true;
			u26();
		end);
		local v54 = {};
		for v55, v56 in ipairs(p65) do
			if v13.is(v56) then
				if v56:getStatus() == v13.Status.Cancelled then
					u26();
					return p68(v6.new({
						error = "Promise is cancelled", 
						kind = v6.Kind.AlreadyCancelled, 
						context = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v55, v56._source)
					}));
				end;
				if v56:getStatus() == v13.Status.Rejected then
					u26();
					return p68(select(2, v56:await()));
				end;
				local v57 = v56:andThen(function(...)
					return ...;
				end);
				table.insert(u24, v57);
				v54[v55] = v57;
			else
				v54[v55] = v56;
			end;
		end;
		local v58, v59, v60 = ipairs(v54);
		while true do
			local v61 = nil;
			local v62, v63 = v58(v59, v60);
			if not v62 then
				break;
			end;
			v60 = v62;
			if v13.is(v63) then
				local v64, v65 = v63:await();
				v63 = v65;
				if not v64 then
					u26();
					return p68(v63);
				end;
			end;
			if u25 then
				return;
			end;
			local v66 = v13.resolve(p66(v63, v62));
			table.insert(u24, v66);
			local v67 = nil;
			v67, v61 = v66:await();
			if not v67 then
				u26();
				return p68(v61);
			end;
			v51[v62] = v61;		
		end;
		p67(v51);
	end);
end;
function v13.is(p70)
	if type(p70) ~= "table" then
		return false;
	end;
	local v68 = getmetatable(p70);
	if v68 == v13 then
		return true;
	end;
	if v68 == nil then
		return u16(p70.andThen);
	end;
	if type(v68) == "table" and type(rawget(v68, "__index")) == "table" and u16(rawget(rawget(v68, "__index"), "andThen")) then
		return true;
	end;
	return false;
end;
function v13.promisify(p71)
	return function(...)
		return v13._try(debug.traceback(nil, 2), p71, ...);
	end;
end;
local u27 = nil;
local u28 = nil;
function v13.delay(p72)
	assert(type(p72) == "number", "Bad argument #1 to Promise.delay, must be a number.");
	if not (p72 >= 0.016666666666666666) or p72 == math.huge then
		p72 = 0.016666666666666666;
	end;
	return v13._new(debug.traceback(nil, 2), function(p73, p74, p75)
		local v69 = v13._getTime();
		local v70 = v69 + p72;
		local v71 = {
			resolve = p73, 
			startTime = v69, 
			endTime = v70
		};
		if u27 == nil then
			u28 = v71;
			u27 = v13._timeEvent:Connect(function()
				while u28 ~= nil and u28.endTime < v13._getTime() do
					u28 = u28.next;
					if u28 == nil then
						u27:Disconnect();
						u27 = nil;
					else
						u28.previous = nil;
					end;
					u28.resolve(v13._getTime() - u28.startTime);				
				end;
			end);
		elseif u28.endTime < v70 then
			local v72 = u28;
			local v73 = v72.next;
			while v73 ~= nil and v73.endTime < v70 do
				v72 = v73;
				v73 = v72.next;			
			end;
			v72.next = v71;
			v71.previous = v72;
			if v73 ~= nil then
				v71.next = v73;
				v73.previous = v71;
			end;
		else
			v71.next = u28;
			u28.previous = v71;
			u28 = v71;
		end;
		p75(function()
			local l__next__74 = v71.next;
			if u28 ~= v71 then
				local l__previous__75 = v71.previous;
				l__previous__75.next = l__next__74;
				if l__next__74 ~= nil then
					l__next__74.previous = l__previous__75;
				end;
				return;
			end;
			if l__next__74 == nil then
				u27:Disconnect();
				u27 = nil;
			else
				l__next__74.previous = nil;
			end;
			u28 = l__next__74;
		end);
	end);
end;
v13.prototype.timeout = function(p76, p77, p78)
	local v76 = {};
	local u29 = debug.traceback(nil, 2);
	v76[1] = v13.delay(p77):andThen(function()
		if p78 == nil then
			local v77 = v6.new({
				kind = v6.Kind.TimedOut, 
				error = "Timed out", 
				context = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p77, u29)
			}) or p78;
		else
			v77 = p78;
		end;
		return v13.reject(v77);
	end);
	v76[2] = p76;
	return v13.race(v76);
end;
v13.prototype.getStatus = function(p79)
	return p79._status;
end;
local function u30(p80, p81, p82, p83)
	return function(...)
		local v78 = nil;
		local v79 = nil;
		local v80 = nil;
		v79, v80, v78 = u3(p80, p81, ...);
		if not v79 then
			p83(v78[1]);
			return;
		end;
		p82(unpack(v78, 1, v80));
	end;
end;
v13.prototype._andThen = function(p84, p85, p86, p87)
	p84._unhandledRejection = false;
	return v13._new(p85, function(p88, p89)
		local v81 = p88;
		if p86 then
			v81 = u30(p85, p86, p88, p89);
		end;
		local v82 = p89;
		if p87 then
			v82 = u30(p85, p87, p88, p89);
		end;
		if p84._status == v13.Status.Started then
			table.insert(p84._queuedResolve, v81);
			table.insert(p84._queuedReject, v82);
			return;
		end;
		if p84._status == v13.Status.Resolved then
			v81(unpack(p84._values, 1, p84._valuesLength));
			return;
		end;
		if p84._status == v13.Status.Rejected then
			v82(unpack(p84._values, 1, p84._valuesLength));
			return;
		end;
		if p84._status == v13.Status.Cancelled then
			p89(v6.new({
				error = "Promise is cancelled", 
				kind = v6.Kind.AlreadyCancelled, 
				context = "Promise created at\n\n" .. p85
			}));
		end;
	end, p84);
end;
v13.prototype.andThen = function(p90, p91, p92)
	local v83 = true;
	if p91 ~= nil then
		v83 = u16(p91);
	end;
	assert(v83, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	local v84 = true;
	if p92 ~= nil then
		v84 = u16(p92);
	end;
	assert(v84, string.format("Please pass a handler function to %s!", "Promise:andThen"));
	return p90:_andThen(debug.traceback(nil, 2), p91, p92);
end;
v13.prototype.catch = function(p93, p94)
	local v85 = true;
	if p94 ~= nil then
		v85 = u16(p94);
	end;
	assert(v85, string.format("Please pass a handler function to %s!", "Promise:catch"));
	return p93:_andThen(debug.traceback(nil, 2), nil, p94);
end;
v13.prototype.tap = function(p95, p96)
	assert(u16(p96), string.format("Please pass a handler function to %s!", "Promise:tap"));
	return p95:_andThen(debug.traceback(nil, 2), function(...)
		local v86 = p96(...);
		if not v13.is(v86) then
			return ...;
		end;
		local v87, v88 = u9(...);
		return v86:andThen(function()
			return unpack(v88, 1, v87);
		end);
	end);
end;
v13.prototype.andThenCall = function(p97, p98, ...)
	assert(u16(p98), string.format("Please pass a handler function to %s!", "Promise:andThenCall"));
	local v89, v90 = u9(...);
	return p97:_andThen(debug.traceback(nil, 2), function()
		return p98(unpack(v90, 1, v89));
	end);
end;
v13.prototype.andThenReturn = function(p99, ...)
	local v91, v92 = u9(...);
	return p99:_andThen(debug.traceback(nil, 2), function()
		return unpack(v92, 1, v91);
	end);
end;
v13.prototype.cancel = function(p100)
	if p100._status ~= v13.Status.Started then
		return;
	end;
	p100._status = v13.Status.Cancelled;
	if p100._cancellationHook then
		p100._cancellationHook();
	end;
	if p100._parent then
		p100._parent:_consumerCancelled(p100);
	end;
	for v93, v94 in pairs(p100._consumers) do
		v93:cancel();
	end;
	p100:_finalize();
end;
v13.prototype._consumerCancelled = function(p101, p102)
	if p101._status ~= v13.Status.Started then
		return;
	end;
	p101._consumers[p102] = nil;
	if next(p101._consumers) == nil then
		p101:cancel();
	end;
end;
v13.prototype._finally = function(p103, p104, p105, p106)
	if not p106 then
		p103._unhandledRejection = false;
	end;
	return v13._new(p104, function(p107, p108)
		local v95 = p107;
		if p105 then
			v95 = u30(p104, p105, p107, p108);
		end;
		if p106 then
			v95 = function(...)
				if p103._status == v13.Status.Rejected then
					return p107(p103);
				end;
				return v95(...);
			end;
		end;
		if p103._status == v13.Status.Started then
			table.insert(p103._queuedFinally, v95);
			return;
		end;
		v95(p103._status);
	end, p103);
end;
v13.prototype.finally = function(p109, p110)
	local v96 = true;
	if p110 ~= nil then
		v96 = u16(p110);
	end;
	assert(v96, string.format("Please pass a handler function to %s!", "Promise:finally"));
	return p109:_finally(debug.traceback(nil, 2), p110);
end;
v13.prototype.finallyCall = function(p111, p112, ...)
	assert(u16(p112), string.format("Please pass a handler function to %s!", "Promise:finallyCall"));
	local v97, v98 = u9(...);
	return p111:_finally(debug.traceback(nil, 2), function()
		return p112(unpack(v98, 1, v97));
	end);
end;
v13.prototype.finallyReturn = function(p113, ...)
	local v99, v100 = u9(...);
	return p113:_finally(debug.traceback(nil, 2), function()
		return unpack(v100, 1, v99);
	end);
end;
v13.prototype.done = function(p114, p115)
	local v101 = true;
	if p115 ~= nil then
		v101 = u16(p115);
	end;
	assert(v101, string.format("Please pass a handler function to %s!", "Promise:done"));
	return p114:_finally(debug.traceback(nil, 2), p115, true);
end;
v13.prototype.doneCall = function(p116, p117, ...)
	assert(u16(p117), string.format("Please pass a handler function to %s!", "Promise:doneCall"));
	local v102, v103 = u9(...);
	return p116:_finally(debug.traceback(nil, 2), function()
		return p117(unpack(v103, 1, v102));
	end, true);
end;
v13.prototype.doneReturn = function(p118, ...)
	local v104, v105 = u9(...);
	return p118:_finally(debug.traceback(nil, 2), function()
		return unpack(v105, 1, v104);
	end, true);
end;
v13.prototype.awaitStatus = function(p119)
	p119._unhandledRejection = false;
	if p119._status == v13.Status.Started then
		local u31 = Instance.new("BindableEvent");
		p119:finally(function()
			u31:Fire();
		end);
		u31.Event:Wait();
		u31:Destroy();
	end;
	if p119._status == v13.Status.Resolved then
		return p119._status, unpack(p119._values, 1, p119._valuesLength);
	end;
	if p119._status ~= v13.Status.Rejected then
		return p119._status;
	end;
	return p119._status, unpack(p119._values, 1, p119._valuesLength);
end;
local function u32(p120, ...)
	return p120 == v13.Status.Resolved, ...;
end;
v13.prototype.await = function(p121)
	return u32(p121:awaitStatus());
end;
local function u33(p122, ...)
	if p122 ~= v13.Status.Resolved then
		if ... == nil then
			local v106 = "Expected Promise rejected with no value.";
		else
			v106 = ...;
		end;
		error(v106, 3);
	end;
	return ...;
end;
v13.prototype.expect = function(p123)
	return u33(p123:awaitStatus());
end;
v13.prototype.awaitValue = v13.prototype.expect;
v13.prototype._unwrap = function(p124)
	if p124._status == v13.Status.Started then
		error("Promise has not resolved or rejected.", 2);
	end;
	return p124._status == v13.Status.Resolved, unpack(p124._values, 1, p124._valuesLength);
end;
v13.prototype._resolve = function(p125, ...)
	if p125._status ~= v13.Status.Started then
		if v13.is((...)) then
			(...):_consumerCancelled(p125);
		end;
		return;
	end;
	if not v13.is((...)) then
		p125._status = v13.Status.Resolved;
		local v107, v108 = u9(...);
		p125._valuesLength = v107;
		p125._values = v108;
		for v109, v110 in ipairs(p125._queuedResolve) do
			coroutine.wrap(v110)(...);
		end;
		p125:_finalize();
		return;
	end;
	if select("#", ...) > 1 then
		warn((string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p125._source)));
	end;
	local u34 = ...;
	local v111 = u34:andThen(function(...)
		p125:_resolve(...);
	end, function(...)
		local v112 = u34._values[1];
		if u34._error then
			v112 = v6.new({
				error = u34._error, 
				kind = v6.Kind.ExecutionError, 
				context = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]"
			});
		end;
		if not v6.isKind(v112, v6.Kind.ExecutionError) then
			p125:_reject(...);
			return;
		end;
		return p125:_reject(v112:extend({
			error = "This Promise was chained to a Promise that errored.", 
			trace = "", 
			context = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p125._source)
		}));
	end);
	if v111._status == v13.Status.Cancelled then
		p125:cancel();
		return;
	end;
	if v111._status == v13.Status.Started then
		p125._parent = v111;
		v111._consumers[p125] = true;
	end;
end;
local function u35(p126)
	return next(p126) == nil;
end;
v13.prototype._reject = function(p127, ...)
	if p127._status ~= v13.Status.Started then
		return;
	end;
	p127._status = v13.Status.Rejected;
	local v113, v114 = u9(...);
	p127._valuesLength = v113;
	p127._values = v114;
	if not u35(p127._queuedReject) then
		for v115, v116 in ipairs(p127._queuedReject) do
			coroutine.wrap(v116)(...);
		end;
	else
		local u36 = tostring((...));
		coroutine.wrap(function()
			v13._timeEvent:Wait();
			if not p127._unhandledRejection then
				return;
			end;
			for v117, v118 in ipairs(v13._unhandledRejectionCallbacks) do
				task.spawn(v118, p127, unpack(p127._values, 1, p127._valuesLength));
			end;
			if v13.TEST then
				return;
			end;
			warn((string.format("Unhandled Promise rejection:\n\n%s\n\n%s", u36, p127._source)));
		end)();
	end;
	p127:_finalize();
end;
v13.prototype._finalize = function(p128)
	for v119, v120 in ipairs(p128._queuedFinally) do
		coroutine.wrap(v120)(p128._status);
	end;
	p128._queuedFinally = nil;
	p128._queuedReject = nil;
	p128._queuedResolve = nil;
	if not v13.TEST then
		p128._parent = nil;
		p128._consumers = nil;
	end;
end;
v13.prototype.now = function(p129, p130)
	local v121 = nil;
	v121 = debug.traceback(nil, 2);
	if p129._status == v13.Status.Resolved then
		return p129:_andThen(v121, function(...)
			return ...;
		end);
	end;
	if p130 == nil then
		local v122 = v6.new({
			kind = v6.Kind.NotResolvedInTime, 
			error = "This Promise was not resolved in time for :now()", 
			context = ":now() was called at:\n\n" .. v121
		}) or p130;
	else
		v122 = p130;
	end;
	return v13.reject(v122);
end;
function v13.retry(p131, p132, ...)
	assert(u16(p131), "Parameter #1 to Promise.retry must be a function");
	assert(type(p132) == "number", "Parameter #2 to Promise.retry must be a number");
	local u37 = { ... };
	local u38 = select("#", ...);
	return v13.resolve(p131(...)):catch(function(...)
		if not (p132 > 0) then
			return v13.reject(...);
		end;
		return v13.retry(p131, p132 - 1, unpack(u37, 1, u38));
	end);
end;
function v13.retryWithDelay(p133, p134, p135, ...)
	assert(u16(p133), "Parameter #1 to Promise.retry must be a function");
	assert(type(p134) == "number", "Parameter #2 (times) to Promise.retry must be a number");
	assert(type(p135) == "number", "Parameter #3 (seconds) to Promise.retry must be a number");
	local u39 = { ... };
	local u40 = select("#", ...);
	return v13.resolve(p133(...)):catch(function(...)
		if not (p134 > 0) then
			return v13.reject(...);
		end;
		v13.delay(p135):await();
		return v13.retryWithDelay(p133, p134 - 1, p135, unpack(u39, 1, u40));
	end);
end;
function v13.fromEvent(p136, p137)
	p137 = p137 or function()
		return true;
	end;
	return v13._new(debug.traceback(nil, 2), function(p138, p139, p140)
		local u41 = nil;
		local function u42()
			u41:Disconnect();
			u41 = nil;
		end;
		local u43 = false;
		u41 = p136:Connect(function(...)
			local v123 = p137(...);
			if v123 == true then
				p138(...);
				if u41 then
					u42();
					return;
				else
					u43 = true;
					return;
				end;
			end;
			if type(v123) ~= "boolean" then
				error("Promise.fromEvent predicate should always return a boolean");
			end;
		end);
		if u43 and u41 then
			return u42();
		end;
		p140(u42);
	end);
end;
function v13.onUnhandledRejection(p141)
	table.insert(v13._unhandledRejectionCallbacks, p141);
	return function()
		local v124 = table.find(v13._unhandledRejectionCallbacks, p141);
		if v124 then
			table.remove(v13._unhandledRejectionCallbacks, v124);
		end;
	end;
end;
return v13;
