# FSM Workflow Written in Lua
 
This is a code-architecture workflow which takes care of all garbage cleaning to prevent memory leaks, and also organizes your code pretty well.

I've included two sub-workflows under this, one's without the StateMachine constructor module _('ExampleWithoutModule')_ I've written for the ease of use, **BUT I DO SUGGEST YOU GO THROUGH THIS WORKFLOW FIRST.** (I've explained each state in detail and it's uses)

// There's a module inside 'ExampleWithModule' which shortens the setup code. Feel free to use it. Usage has been shown inside 'init.lua'

Second one's the _'ExampleWithModule'_, which has a big reduction inside the main _'init.lua'_ module and a small reduction in each state when compared to the _'WithoutModule'_ workflow. I've explained this line reduction inside _'init.lua'_

## Usage Cases where this workflow absolutely DEMOLISHES:

-> **Minigame Management** : On the server, there could be a stateMachine, which has three states, 'inLobby', 'voting' and 'Game'. In the 'inLobby' state, it could wait for enough players, and then swtich to 'voting' state, where it could connect to a remoteEvent to add votes (which would automatically be cleaned up by the StateTrove), and after that switches to the 'Game' state to start the actual game.

-> **PvP Controllers** : A stateMachine could have multiple states, each being their own move. There could be a Kick, Punch state which could be cancelled seamlessly by the server and sent to Idle if the player was, say, Stunned by another player. Ideally, I would have a server stateMachine to complement this client-side code, because it keeps track of each state and also has a customized sanity check process for each kind of move.

## Thank you for reading!
Hope this knowledge helps your development process as much as it has helped mine.
