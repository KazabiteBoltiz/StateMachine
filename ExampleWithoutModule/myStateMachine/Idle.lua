local UIS = game:GetService('UserInputService')

local Idle = {}
Idle.__index = Idle

function Idle.new(mod)
    local self = setmetatable({}, Idle)

    self.mod = mod
    self.stateTrove = mod.stateTrove

    return self
end

function Idle:Start()
    
    --[[ 
        Here's where the real magic happens.
        
        Let's use our cleaner object (stateTrove) to 
        register some events which should stop 
        when the state ends, say, UserInputService.
    ]]

    self.stateTrove:Connect(UIS.InputBegan, function()
        print('Input was detected!')

        self.mod:ChangeState('DoubleJump') --// Switching States

    end)

    --[[ 
        This event will automatically stop running
        when the state changes, since we are
        cleaning the stateTrove in the main
        stateMachine's :ChangeState() function.
    ]]

end

function Idle:End()
end