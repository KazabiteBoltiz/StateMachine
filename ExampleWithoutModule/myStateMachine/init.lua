--[[ 
    Ideally should be a Knit Controller/Service,
    but I've made this stateMachine a usual
    module which you construct and then run.
    
    Has states parented to it which it registers
    and uses when the states are changed.

    The change in state takes care of cleaning anything.
    
    THIS IS NOT A FRAMEWORK.
    IT'S A WORKFLOW.
]]

local Trove = require(somewhere.Trove)

local myStateMachine = {}
myStateMachine.__index = myStateMachine

function myStateMachine.new()
    local self = setmetatable({}, myStateMachine)

    self.State = nil
    self.States = {
        Idle = require(script.Idle),
        DoubleJump = require(script.DoubleJump),
        Attack = require(script.Attack)
    }

    --[[ 
        Cleaner Objects which each state
        can Attach to.
    ]]
    self.stateTrove = Trove.new()

    return self
end

function myStateMachine:ChangeState(newStateName)
    if not self.States[newStateName] then return end

    if self.State then 
        self.State:End()
        self.stateTrove:Clean() --// Clean all events, instances
    end
    self.State = self.States[newStateName].new(self)
    self.State:Start()

end

return myStateMachine
