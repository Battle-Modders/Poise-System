::PoiseSystem.HooksMod.hook("scripts/skills/effects/shieldwall_effect", function(q) {
	q.m.PoiseMult <- 1.25;

	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		// Remove mention about stun immunity
		foreach (index, entry in ret)
		{
			if (entry.id == 6 && entry.icon == "ui/icons/special.png")
			{
				ret.remove(index);
				break;
			}
		}

		ret.push({
			id = 8,
			type = "text",
			icon = "ui/icons/sturdiness.png",
			text = ::Reforged.Mod.Tooltips.parseString(::MSU.Text.colorizeMult(this.m.PoiseMult) + " more [Poise|Concept.Poise]")
		});

		return ret;
	}

	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);

		local item = this.getContainer().getActor().getItems().getItemAtSlot(::Const.ItemSlot.Offhand);
		if (item.isItemType(::Const.Items.ItemType.Shield) && item.getCondition() > 0)
		{
			_properties.PoiseMult *= this.m.PoiseMult;
		}
	}
});
