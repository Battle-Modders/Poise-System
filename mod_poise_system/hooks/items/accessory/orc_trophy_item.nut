::PoiseSystem.HooksMod.hook("scripts/items/accessory/orc_trophy_item", function(q) {
	q.m.PoiseMult <- 3.0;

	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		foreach (entry in ret)
		{
			if (entry.id == 10)
			{
				entry.icon = "ui/icons/sturdiness.png";
				entry.text = ::Reforged.Mod.Tooltips.parseString(::MSU.Text.colorizeMultWithText(this.m.PoiseMult) + " [Poise|Concept.Poise]");
			}
		}

		return ret;
	}

	// Overwrite to replace vanilla stun immunity effect with poise mult
	q.onUpdateProperties = @() function( _properties )
	{
		_properties.PoiseMult *= this.m.PoiseMult;
	}
});
