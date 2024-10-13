local RepS = game.ReplicatedStorage
local Packages = RepS.Packages
local Trove = require(Packages.Trove)
local Signal = require(Packages.Signal)

--[[

    by @KazabiteBoltiz

    Utility module to automate most of the
    stateMachine setup work.

    .Create() 
        
        -> ScriptInst : The parent of all stateModules
        you want registered (Only children considered,
        not descendants, though you can change that).
        
        -> Mod : The 'object' of the statemachine module 
        (basically, 'self' but you're sending it here).

        -> defaultState : string; the name of the state
        you want the machine to go to after constructing
        the stateMachine methods.

        mod.StateChanged can be connected to. It returns
        the name of the newState which the machine 
        switched to.

        All trash must be attached to mod.StateTrove,
        which cleans up everytime the state changes.

        :AddState and :RemoveState can be used during
        runtime, it'll work just fine.
]]

local StateMachine = {}

function StateMachine.Create(scriptInst, mod, defaultState)

    mod.StateTrove = Trove.new()
    mod.StateChanged = Signal.new()
    mod.States = {}
    mod.State = nil

    for _, stateScript in ipairs(scriptInst:GetChildren()) do
        if stateScript:IsA('ModuleScript') then  
            local newState = require(stateScript)
            mod.States[stateScript.Name] = newState
            newState.__index = newState
            newState.Name = stateScript.Name
        end
    end

    function mod:ChangeState(newState)
        if mod.State then
            mod.State:End() 
        end
        mod.StateTrove:Clean()
        mod.StateChanged:Fire(newState)
        mod.State = mod.States[newState].new(mod)
        mod.State:Start()
    end

    function mod:AddState(stateMod)
        if mod.States[stateMod.Name] then return end
        mod.States[stateMod.Name] = require(stateMod)
    end

    function mod:RemoveState(stateMod)
        if not mod.States[stateMod.Name] then return end
        if stateMod.Name == mod.State.Name then
            mod:ChangeState(defaultState)
        end
        mod.States[stateMod.Name] = nil
    end

    mod:ChangeState(defaultState)
end

return StateMachine
