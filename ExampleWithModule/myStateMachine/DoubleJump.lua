local DoubleJump = {}

function DoubleJump.new(mod)
    local self = setmetatable({}, DoubleJump)

    self.mod = mod
    self.stateTrove = mod.stateTrove

    return self
end

function DoubleJump:Start()
    
    print('entered DoubleJump State! Jumping...')

    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hum = char:WaitForChild('Humanoid')

    hum.Jump = true
    
    self.mod:ChangeState('Attack')

end

function DoubleJump:End()
end