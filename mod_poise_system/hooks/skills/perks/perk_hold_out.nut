::PoiseSystem.HooksMod.hook("scripts/skills/perks/perk_hold_out", function(q) {
	q.m.PoiseMult <- 1.5;

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.PoiseMult *= this.m.PoiseMult;
	}
});
