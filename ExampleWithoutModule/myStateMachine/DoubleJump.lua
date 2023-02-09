local DoubleJump = {}
DoubleJump.__index = DoubleJump

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

    --[[
        Here I've uses an example of a single-
        impulse state. 
        
        States may not be a complex gathering of events,
        loops, etc. Each state could just run a few
        lines of code without connecting to any Signals.
        
        This is normal and the best use case is the
        DoubleJump! We just make the player jump and
        then forget about it, because there's nothing
        else to do!
    ]]

    hum.Jump = true
    
    self.mod:ChangeState('Attack')

end

function DoubleJump:End()
end