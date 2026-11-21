--[[
  MuscleLegends_ATO_v1  protected build
  Loader: fetch parts -> xor -> lzss -> run
]]
local _lMzprsl={
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_ATO_v1.p1.txt",
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_ATO_v1.p2.txt"
}
local _5xlPIpf={}
for _VMkdXy4=1,#_lMzprsl do
  local _r0vufHa=game:HttpGet(_lMzprsl[_VMkdXy4])
  _5xlPIpf[#_5xlPIpf+1]=_r0vufHa
end
local _KxnC5LP=table.concat(_5xlPIpf):gsub('%s+','')
local _XL8Nsid='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local _BG6kOR2={}
for _VMkdXy4=1,#_XL8Nsid do _BG6kOR2[_XL8Nsid:sub(_VMkdXy4,_VMkdXy4)]=_VMkdXy4-1 end
local function _UAP5T6E(_NjeSovm)
  local _onscbOM={}
  local _k5z1JCg=#_NjeSovm
  local _VMkdXy4=1
  while _VMkdXy4<=_k5z1JCg do
    local _AhUmSXx=_BG6kOR2[_NjeSovm:sub(_VMkdXy4,_VMkdXy4)]
    local _FCmf6Lp=_BG6kOR2[_NjeSovm:sub(_VMkdXy4+1,_VMkdXy4+1)]
    local _gAwXnSg=_NjeSovm:sub(_VMkdXy4+2,_VMkdXy4+2)
    local _IZpFQuc=_NjeSovm:sub(_VMkdXy4+3,_VMkdXy4+3)
    local _8nC7mIo=(_gAwXnSg=='=') and -1 or _BG6kOR2[_gAwXnSg]
    local _EjYb7Pn=(_IZpFQuc=='=') and -1 or _BG6kOR2[_IZpFQuc]
    if not (_AhUmSXx and _FCmf6Lp) then break end
    _onscbOM[#_onscbOM+1]=string.char(_AhUmSXx*4+math.floor(_FCmf6Lp/16))
    if _8nC7mIo and _8nC7mIo>=0 then
      _onscbOM[#_onscbOM+1]=string.char((_FCmf6Lp%16)*16+math.floor(_8nC7mIo/4))
      if _EjYb7Pn and _EjYb7Pn>=0 then
        _onscbOM[#_onscbOM+1]=string.char((_8nC7mIo%4)*64+_EjYb7Pn)
      end
    end
    _VMkdXy4=_VMkdXy4+4
  end
  return table.concat(_onscbOM)
end
local _ZVoE167='EE8zKUA0n_nLIQhyiJuaaxk9SYLT'
local _CiJmHbM=bit32
local function _G8wUtE4(_NjeSovm)
  local _onscbOM={}
  local _6ERUAFf=#_ZVoE167
  for _VMkdXy4=1,#_NjeSovm do
    _onscbOM[_VMkdXy4]=string.char(_CiJmHbM.bxor(string.byte(_NjeSovm,_VMkdXy4),string.byte(_ZVoE167,(_VMkdXy4-1)%_6ERUAFf+1)))
  end
  return table.concat(_onscbOM)
end
local function _JXDnOVC(_NjeSovm)
  local _onscbOM={}
  local _VMkdXy4=1
  local _gX0dg96=0
  local _5HObZ56=0
  while _VMkdXy4<=#_NjeSovm do
    if _5HObZ56==0 then _gX0dg96=string.byte(_NjeSovm,_VMkdXy4);_VMkdXy4=_VMkdXy4+1;_5HObZ56=8 end
    if _CiJmHbM.band(_gX0dg96,1)==1 then
      local _xTwopJg=string.byte(_NjeSovm,_VMkdXy4)*256+string.byte(_NjeSovm,_VMkdXy4+1)
      local _udiFOBC=string.byte(_NjeSovm,_VMkdXy4+2)
      _VMkdXy4=_VMkdXy4+3
      local _aJISYZK=#_onscbOM-_xTwopJg
      for _ufyLOWv=1,_udiFOBC do _onscbOM[#_onscbOM+1]=_onscbOM[_aJISYZK+_ufyLOWv] end
    else
      _onscbOM[#_onscbOM+1]=string.sub(_NjeSovm,_VMkdXy4,_VMkdXy4)
      _VMkdXy4=_VMkdXy4+1
    end
    _gX0dg96=_CiJmHbM.rshift(_gX0dg96,1)
    _5HObZ56=_5HObZ56-1
  end
  return table.concat(_onscbOM)
end
local _80alNsU=_G8wUtE4(_UAP5T6E(_KxnC5LP))
local _udiFOBC=_CiJmHbM.band(string.byte(_80alNsU,1),255)+_CiJmHbM.lshift(_CiJmHbM.band(string.byte(_80alNsU,2),255),8)+_CiJmHbM.lshift(_CiJmHbM.band(string.byte(_80alNsU,3),255),16)+_CiJmHbM.lshift(_CiJmHbM.band(string.byte(_80alNsU,4),255),24)
local _tgExSaR=string.sub(_80alNsU,5,4+_udiFOBC)
local _RhdXvHX=_JXDnOVC(_tgExSaR)
local _cErDTQG=(loadstring or load)(_RhdXvHX,'@MuscleLegends_ATO_v1')
if not _cErDTQG then error('protected payload failed to load') end
_cErDTQG()
