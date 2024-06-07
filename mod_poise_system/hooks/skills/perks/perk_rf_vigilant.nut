::PoiseSystem.HooksMod.hook("scripts/skills/perks/perk_rf_vigilant", function(q) {
	q.m.CurrPoiseBonus <- 0;

	q.create = @(__original) function()
	{
		__original();
		this.m.Description = ::Reforged.Mod.Tooltips.parseString("This character\'s eye is keen, his movements keener. Gain a Action Points and additional [Poise|Concept.Poise] for every available Action Point whenever you end your turn.");
	}

	q.isHidden = @(__original) function()
	{
		return __original() && this.m.CurrPoiseBonus == 0;
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		// Delete AP tooltip if not relevant (ending turn with just 1 AP)
		if (this.m.CurrBonus == 0)
		{
			foreach (index, entry in ret)
			{
				if (entry.id == 6 && entry.icon == "ui/icons/action_points.png")
				{
					ret.remove(index);
					break;
				}
			}
		}

		if (this.m.CurrPoiseBonus != 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/sturdiness.png",
				text = ::MSU.Text.colorizeValue(this.m.CurrPoiseBonus) + ::Reforged.Mod.Tooltips.parseString(" [Poise|Concept.Poise]")
			});
		}

		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.PoiseMax += this.m.CurrPoiseBonus;
	}

	q.onTurnEnd = @(__original) function()
	{
		__original();
		this.m.CurrPoiseBonus = 10 * this.getContainer().getActor().getActionPoints();
	}

	q.onCombatFinished = @(__original) function()
	{
		__original();
		this.m.CurrPoiseBonus = 0;
	}

// New Overrides
	q.onTurnStart <- function()
	{
		this.m.CurrPoiseBonus = 0;
	}
});
