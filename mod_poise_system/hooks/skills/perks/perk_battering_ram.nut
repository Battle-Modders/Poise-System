::PoiseSystem.HooksMod.hook("scripts/skills/perks/perk_battering_ram", function(q) {
	q.m.PoiseMult <- 1.5;

	// Overwrite - This perk no longer grants stun immunity
	q.onUpdate = @() function( _properties )
	{
		_properties.PoiseMult *= this.m.PoiseMult;
	}
});
