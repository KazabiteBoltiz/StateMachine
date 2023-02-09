--[[
    Make sure you've the read the 'WithoutModule'
    workflow first, because I've explained things
    there clearly.
]]

local StateMachine = require(script.Parent.StateMachine)

local myStateMachine = {}
myStateMachine.__index = myStateMachine

function myStateMachine.new()
    local self = setmetatable({}, myStateMachine)

    StateMachine.Create(script, self, 'Idle')

    --[[
        GGs! This one line from the module has shortened
        our main stateMachine code, the work which is 
        always repetitive.

        The code inside the states remains the same, but
        if you notice, I've removed 'state.__index = state'
        in each state module. This is because the 
        'StateMachine' constructor module takes care of it!
    ]]

    return self
end

return myStateMachine
