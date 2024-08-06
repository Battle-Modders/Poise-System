::PoiseSystem.HooksMod.hook("scripts/skills/actives/pound", function(q) {
	q.m.PoiseDamageMult <- 2.0;	// This will make Pound able to stun humans on a head hit as 2 handed flails have 40 PoiseDamage

	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		if (this.m.IsDamagingPoise)
		{
			ret.extend([
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = ::Reforged.Mod.Tooltips.parseString("Deal " + ::MSU.Text.colorizeMultWithText(this.m.PoiseDamageMult) + " [Poise Damage|Concept.PoiseDamage]")
				}
			]);
		}

		return ret;
	}

	q.create = @(__original) function()
	{
		__original();
		this.m.IsDamagingPoise = true;
		this.m.IsStunningFromPoise = true;
	}

	q.onAnySkillUsed = @(__original) function( _skill, _targetEntity, _properties )
	{
		__original(_skill, _targetEntity, _properties);
		if (_skill == this)
		{
			_properties.PoiseDamageMult *= this.m.PoiseDamageMult;
		}
	}
});
