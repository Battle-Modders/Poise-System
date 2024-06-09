::PoiseSystem.HooksMod.hook("scripts/skills/actives/shieldwall", function(q) {
	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		foreach (entry in ret)
		{
			if (entry.id == 6 && entry.icon == "ui/icons/special.png")
			{
				entry.icon = "ui/icons/sturdiness.png";
				entry.text = ::Reforged.Mod.Tooltips.parseString("Gain " + ::MSU.Text.colorizeMult(1.25) + " more [Poise|Concept.Poise]");
				break;
			}
		}

		return ret;
	}
});
