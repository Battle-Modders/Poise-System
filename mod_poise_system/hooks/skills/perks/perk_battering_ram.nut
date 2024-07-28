::PoiseSystem.HooksMod.hook("scripts/skills/perks/perk_battering_ram", function(q) {
	q.m.PoiseMult <- 1.5;

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.PoiseMult *= this.m.PoiseMult;
	}

	q.getDescription = @() function()
	{
		return ::Reforged.Mod.Tooltips.parseString(::UPD.getDescription({
			Effects = [{
				Type = ::UPD.EffectType.Passive,
				Description = [
					"Gain " + ::MSU.Text.colorGreen("50%") + " more [Poise|Concept.Poise]",
				],
			}],
		}));
	}
});
