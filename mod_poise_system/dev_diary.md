## Initial Write-Up regarding stun-rework
In Vanilla the Stun Mechanic is a very powerful debuff. There is not much that prevents a character to be permastunned, especially when they are outnumbered.
Whether you can apply a stun to the opponent only depends on your hitchance.
As a result, most of the stronger enemies (unholds, lindwurms, bosses) are inherently stun immune.

### Issues in Vanilla
- It is hard to design enemies with stun in mind. If a stun would make an enemy too easy to beat you can currently either
  - Make them Stun Immmune
  - Increase their defense; but this also makes them harder which might not be intended
- It is unrealistic how the same attack (e.g. knockout) with the same weapon stuns a small goblin just as esay/long as a big barbarian chosen or orc young
- Skills with a non-100% chance to stun can be extra frustrating on top the hitchance roll before it.
  - Sometimes an enemy lands multiple 20% stuns with a 2H flail
  - and other times your brother fails multiple 75% chance to stun with a stick
- It is hard to design skills for the player to counter stun.
  - Complete and unconditional stun immunity is very strong (see orc trophy or legends stalwart perk)
  - A chance to ignore the next stun will feel very random and unreliable
  - The current resilient perk (reduce stun duration to 1) barely does anything
  - "Ignoring the next stun" does not differentiate in any way, how strong that stun was (e.g. from a 1H weapon or 2H wepaon?). It also can't prevent the effects that came alongside the stun effect (removal of shieldwall, riposte)

### Goal:
- Different enemies should be differ in how hard they are to stun
- More enemies should be able to be stunned theoretically (e.g. Orcs) just to open up some niche plays
- Give the player more progressive and reliable ways/tools to invest into applying/counter stun

### Benefits of the Stun Threshold System
- There is one new central stat which describes how easy/hard a character can be stunned.
  - Races/enemies can now also differ in how easy they are stunned (goblins could be the easiest to stun while Unholds and Orcs are very hard to stun, but no longer immune)
  - Every skill that wants to make stuns easier/harder on a character can now change that stat in the properties. This also allows new temporary buffs/debuffs
- Every weapon can now have a stat which determines how easy it is for that weapon to stun someone
  - Higher quality weapons and named weapons can now also come with a better effectiveness for stunning
- Random chance to stun on weapons is removed. This always struck me as a crutch and poor design to have rng on top of rng for when a stun is applied
  - Admittedly there is some rng re-introduced because headshots now deal more stunpower. But the difference here is much smaller; regularly it doesn't even make a difference.
- Multiple attacks can work together to stun a bigger target because the StunThreshold only recovers on turn start.
  - A "fail" to stun someone still contributes to them being potentially stunned
  - Multiple attacks and different characters can work together to stun a target
