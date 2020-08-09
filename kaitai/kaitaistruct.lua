local class = require("kaitai.class")
local stringstream = require("kaitai.string_stream")
local KaitaiStream = require("kaitai.kaitaistream")

local KaitaiStruct = class.class()

function KaitaiStruct:_init(io)
    self._io = io
end

function KaitaiStruct:close()
    self._io:close()
end

function KaitaiStruct:from_file(filename)
    local inp = assert(io.open(filename, "rb"))

    return self(KaitaiStream(inp))
end

function KaitaiStruct:from_string(s)
    local ss = stringstream(s)

    return self(KaitaiStream(ss))
end

return KaitaiStruct