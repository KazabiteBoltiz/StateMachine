local Timer = require(somewhere.Timer)

local Attack = {}
Attack.__index = Attack

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

    --[[
        Wait, what is this? Why are we adding the timer
        to the trove? Isn't it always going to run and 
        change the state reliably? 

        Well not always. Suppose there's a Stun mechanic
        that forces the player to switch states.
        Without this line, the player would be stunned
        and then immediately would switch to idle, 
        because the timer doesn't know if it should
        stop, which is gamebreaking.

        Ideally, you want to add everything in the Trove
        which doesn't remain there. That way, if another
        script changes the state of this stateMachine,
        the Trove knows that it has to clean up to
        allow the interrupted transition to the new State.
    ]]

end

function Attack:End()
end