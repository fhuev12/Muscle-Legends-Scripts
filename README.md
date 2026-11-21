# Muscle-Legends-Scripts

Protected (LZSS + XOR + Base64) builds of two Muscle Legends automation scripts.

## Load

```lua
-- teleport / auto-train GUI
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/MuscleLegends_ATO_v1.lua"))()
```

```lua
-- auto lifting
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhuev12/Muscle-Legends-Scripts/main/MuscleLegends_AutoLift_v1.lua"))()
```

Requires an executor that provides `game:HttpGet`, `bit32` and `loadstring`.

## Layout

- `MuscleLegends_ATO_v1.lua` - loader (2 parts)
- `MuscleLegends_AutoLift_v1.lua` - loader (5 parts)
- `parts/*.pN.txt` - encrypted payload shards (do not edit)

## Integrity

Decoded payloads reproduce the original sources byte-for-byte:

- ATO: `d3a2d30e3e13d94f0d43da26fb9bd1ac87d1e15405db6eeabd97cde2ca0c61bd`
- AutoLift: `7a015a1250c55e94a65661a2ea692cb3e53484815d83bd7ee26ae6fdea98f0af`

## Warning

These are third-party automation scripts. Using them violates the Roblox Terms of Service and may result in account penalties. Use only on accounts you can afford to lose.
