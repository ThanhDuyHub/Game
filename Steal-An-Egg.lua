loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/fcd12f3fbf588f8e87d2ca48bc83542e9666d0527d37f6112ea7fb60624ab0df/download"))()

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

settings().Rendering.QualityLevel = Enum.QualityLevel.Level0
settings().Rendering.EditQualityLevel = Enum.QualityLevel.Level0
settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level0
settings().Rendering.TextureQualityEnum = Enum.TextureQualitySetting.None
settings().Rendering.ShadowsEnabled = false
settings().Physics.VisualThrottle = Enum.ThrottleBehavior.Default
settings().Network.IncomingReplicationLag = 0

pcall(function()
    sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility)
end)

Lighting.GlobalShadows = false
Lighting.Brightness = 1
Lighting.FogEnd = 100000
Lighting.FogStart = 0
Lighting.EnvironmentSpecularScale = 0
Lighting.EnvironmentDiffuseScale = 0
Lighting.ShadowSoftness = 0
Lighting.Ambient = Color3.fromRGB(128, 128, 128)
Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("FireEffect") then
        v:Destroy()
    end
end

if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 1
    Terrain.WaterColor = Color3.fromRGB(128, 128, 128)
end

local function destroyEffects(obj)
    if obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("ParticleEmitter") then
        obj:Destroy()
        return true
    end
    if obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") then
        obj:Destroy()
        return true
    end
    if obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
        obj:Destroy()
        return true
    end
    if obj:IsA("Decal") or obj:IsA("Texture") then
        obj:Destroy()
        return true
    end
    if obj:IsA("SpecialMesh") or obj:IsA("DataModelMesh") then
        obj:Destroy()
        return true
    end
    if obj:IsA("Sound") then
        obj:Destroy()
        return true
    end
    if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then
        obj:Destroy()
        return true
    end
    return false
end

local function cleanPart(obj)
    if obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Reflectance = 0
        obj.CastShadow = false
        pcall(function()
            obj.TopSurface = Enum.SurfaceType.Smooth
            obj.BottomSurface = Enum.SurfaceType.Smooth
        end)
    end
    destroyEffects(obj)
end

local function removeModel(obj)
    if obj:IsA("Model") or obj:IsA("Folder") then
        local name = obj.Name:lower()
        local keywords = {"tree", "plant", "grass", "leaves", "bush", "flower", "prop", "rock", "debris", "particle", "vfx", "fx", "effect", "light", "fire", "smoke", "sparkle", "explosion", "trail", "beam", "decor"}
        for _, key in ipairs(keywords) do
            if name:find(key) then
                obj:Destroy()
                return true
            end
        end
    end
    return false
end

for _, v in pairs(workspace:GetDescendants()) do
    if not v:IsDescendantOf(Players.LocalPlayer and Players.LocalPlayer.Character or nil) then
        removeModel(v)
    end
end

for _, v in pairs(workspace:GetDescendants()) do
    if v.Parent then
        cleanPart(v)
    end
end

workspace.DescendantAdded:Connect(function(v)
    task.defer(function()
        if v.Parent then
            removeModel(v)
            cleanPart(v)
        end
    end)
end)

workspace:FindFirstChildOfClass("Terrain").DescendantAdded:Connect(function(v)
    v:Destroy()
end)

local function onCharacter(char)
    char:WaitForChild("Humanoid", 10)
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("PointLight") or v:IsA("SpotLight") then
            v:Destroy()
        end
    end
    char.DescendantAdded:Connect(function(v)
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("PointLight") or v:IsA("SpotLight") then
            v:Destroy()
        end
    end)
end

local localPlayer = Players.LocalPlayer
if localPlayer.Character then
    onCharacter(localPlayer.Character)
end
localPlayer.CharacterAdded:Connect(onCharacter)

for _, v in pairs(Players:GetPlayers()) do
    if v ~= localPlayer and v.Character then
        for _, d in pairs(v.Character:GetDescendants()) do
            if d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Beam") or d:IsA("Fire") or d:IsA("Smoke") or d:IsA("Sparkles") then
                d:Destroy()
            end
        end
    end
end

pcall(function()
    game:GetService("StarterGui"):SetCore("ParticlesDisabled", true)
end)
