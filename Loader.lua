if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BASE = 'https://raw.githubusercontent.com/ThanhDuyHub/Game/refs/heads/main/'

local games = {
    [1962086868]    = 'Tower%20Of%20Hell.lua',
}

local file = games[game.CreatorId]
if file then
    task.wait(math.random())
    pcall(function()
        loadstring(game:HttpGet(BASE .. 'donation.lua'))()
    end)
    loadstring(game:HttpGet(BASE .. file))()
end
