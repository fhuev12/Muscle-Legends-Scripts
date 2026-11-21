--[[
  MuscleLegends_AutoLift_v1  protected build
  Loader: fetch parts -> xor -> lzss -> run
]]
local _FFX3mLW={
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_AutoLift_v1.p1.txt",
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_AutoLift_v1.p2.txt",
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_AutoLift_v1.p3.txt",
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_AutoLift_v1.p4.txt",
"https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/parts/MuscleLegends_AutoLift_v1.p5.txt"
}
local _tkOyRfL={}
for _ig6M9ZN=1,#_FFX3mLW do
  local _Ss02R8y=game:HttpGet(_FFX3mLW[_ig6M9ZN])
  _tkOyRfL[#_tkOyRfL+1]=_Ss02R8y
end
local _l06v940=table.concat(_tkOyRfL):gsub('%s+','')
local _BFBiWkB='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local _X3h28H3={}
for _ig6M9ZN=1,#_BFBiWkB do _X3h28H3[_BFBiWkB:sub(_ig6M9ZN,_ig6M9ZN)]=_ig6M9ZN-1 end
local function _muT98GC(_KOx5bO6)
  local _HGzkyN6={}
  local _Rvgm7C9=#_KOx5bO6
  local _ig6M9ZN=1
  while _ig6M9ZN<=_Rvgm7C9 do
    local _OKw0BTt=_X3h28H3[_KOx5bO6:sub(_ig6M9ZN,_ig6M9ZN)]
    local _1WN9Obn=_X3h28H3[_KOx5bO6:sub(_ig6M9ZN+1,_ig6M9ZN+1)]
    local _cwF5KFQ=_KOx5bO6:sub(_ig6M9ZN+2,_ig6M9ZN+2)
    local _GK8a0nj=_KOx5bO6:sub(_ig6M9ZN+3,_ig6M9ZN+3)
    local _19fNpIb=(_cwF5KFQ=='=') and -1 or _X3h28H3[_cwF5KFQ]
    local _0eTJJUN=(_GK8a0nj=='=') and -1 or _X3h28H3[_GK8a0nj]
    if not (_OKw0BTt and _1WN9Obn) then break end
    _HGzkyN6[#_HGzkyN6+1]=string.char(_OKw0BTt*4+math.floor(_1WN9Obn/16))
    if _19fNpIb and _19fNpIb>=0 then
      _HGzkyN6[#_HGzkyN6+1]=string.char((_1WN9Obn%16)*16+math.floor(_19fNpIb/4))
      if _0eTJJUN and _0eTJJUN>=0 then
        _HGzkyN6[#_HGzkyN6+1]=string.char((_19fNpIb%4)*64+_0eTJJUN)
      end
    end
    _ig6M9ZN=_ig6M9ZN+4
  end
  return table.concat(_HGzkyN6)
end
local _cPwFEt9='Cjm1q7yzwtwIn9_4ghzy4ACMxLzF'
local _SOBeePz=bit32
local function _d5o4TkM(_KOx5bO6)
  local _HGzkyN6={}
  local _ue3jBWK=#_cPwFEt9
  for _ig6M9ZN=1,#_KOx5bO6 do
    _HGzkyN6[_ig6M9ZN]=string.char(_SOBeePz.bxor(string.byte(_KOx5bO6,_ig6M9ZN),string.byte(_cPwFEt9,(_ig6M9ZN-1)%_ue3jBWK+1)))
  end
  return table.concat(_HGzkyN6)
end
local function _VGaoMQf(_KOx5bO6)
  local _HGzkyN6={}
  local _ig6M9ZN=1
  local _s3rUDqY=0
  local _tDWihhq=0
  while _ig6M9ZN<=#_KOx5bO6 do
    if _tDWihhq==0 then _s3rUDqY=string.byte(_KOx5bO6,_ig6M9ZN);_ig6M9ZN=_ig6M9ZN+1;_tDWihhq=8 end
    if _SOBeePz.band(_s3rUDqY,1)==1 then
      local _sNDwc9G=string.byte(_KOx5bO6,_ig6M9ZN)*256+string.byte(_KOx5bO6,_ig6M9ZN+1)
      local _4y4afBD=string.byte(_KOx5bO6,_ig6M9ZN+2)
      _ig6M9ZN=_ig6M9ZN+3
      local _MouyBvF=#_HGzkyN6-_sNDwc9G
      for _5dUsN5K=1,_4y4afBD do _HGzkyN6[#_HGzkyN6+1]=_HGzkyN6[_MouyBvF+_5dUsN5K] end
    else
      _HGzkyN6[#_HGzkyN6+1]=string.sub(_KOx5bO6,_ig6M9ZN,_ig6M9ZN)
      _ig6M9ZN=_ig6M9ZN+1
    end
    _s3rUDqY=_SOBeePz.rshift(_s3rUDqY,1)
    _tDWihhq=_tDWihhq-1
  end
  return table.concat(_HGzkyN6)
end
local _S15TrGd=_d5o4TkM(_muT98GC(_l06v940))
local _4y4afBD=_SOBeePz.band(string.byte(_S15TrGd,1),255)+_SOBeePz.lshift(_SOBeePz.band(string.byte(_S15TrGd,2),255),8)+_SOBeePz.lshift(_SOBeePz.band(string.byte(_S15TrGd,3),255),16)+_SOBeePz.lshift(_SOBeePz.band(string.byte(_S15TrGd,4),255),24)
local _QRbzk1Y=string.sub(_S15TrGd,5,4+_4y4afBD)
local _snnbk9J=_VGaoMQf(_QRbzk1Y)
local _ViGwFK7=(loadstring or load)(_snnbk9J,'@MuscleLegends_AutoLift_v1')
if not _ViGwFK7 then error('protected payload failed to load') end
_ViGwFK7()
