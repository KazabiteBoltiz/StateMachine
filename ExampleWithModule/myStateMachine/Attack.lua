local Timer = require(somewhere.Timer)

local Attack = {}

function Attack.new(mod)
    local self = setmetatable({}, Attack)

    self.mod = mod
    self.stateTrove = mod.stateTrove

    return self
end

function Attack:Start()
    
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char.PrimaryPart

    local myHitbox = Instance.new('Part')
    myHitbox.Anchored = true
    myHitbox.CanCollide = false
    myHitbox.CFrame = hrp.CFrame * CFrame.new(0,2,-5)

    --// Do Detection Magic here...

    self.stateTrove:Add(myHitbox, 'Destroy')

    local endTimer = Timer.new(.5)
    endTimer.Tick:ConnectOnce(function()
        print('.5 Seconds Have Passed!')
        self.mod:ChangeState('Idle')
    end)
    endTimer:Start()

    self.stateTrove:Add(endTimer, 'Destroy')
end

function Attack:End()
end