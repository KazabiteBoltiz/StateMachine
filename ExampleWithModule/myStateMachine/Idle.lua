local UIS = game:GetService('UserInputService')

local Idle = {}

function Idle.new(mod)
    local self = setmetatable({}, Idle)

    self.mod = mod
    self.stateTrove = mod.stateTrove

    return self
end

function Idle:Start()
    
    self.stateTrove:Connect(UIS.InputBegan, function()
        print('Input was detected!')

        self.mod:ChangeState('DoubleJump') --// Switching States

    end)
    
end

function Idle:End()
end