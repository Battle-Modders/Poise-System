::PoiseSystem.HooksMod.hook("scripts/skills/skill", function(q) {
	q.m.IsDamagingPoise <- false;
	q.m.IsStunningFromPoise <- false;
});

::PoiseSystem.HooksMod.hookTree("scripts/skills/skill", function(q) {
	if (q.contains("create"))
	{
		q.create = @(__original) function()
		{
			__original();

			if (this.m.IsStunningFromPoise && "StunChance" in this.m)
			{
				this.m.StunChance = 0;	// Skills that now use the Composure system should no longer use the StunChance
			}
		}
	}

	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		if (this.m.IsDamagingPoise && this.getContainer().getActor() != null)
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Poise Damage: " + this.getContainer().getActor().getCurrentProperties().getPoiseDamage()
			});
		}

		if (this.m.IsStunningFromPoise)
		{
			foreach(index, entry in ret)
			{
				if (entry.text.find("%[/color] chance to s"))	// remove the entry about stunchance. This string is weird because it also needs to catch strike_down_skill
				{
					ret.remove(index);
					break;
				}
			}

			ret.push({
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Breaking the targets Poise will stun it"
			});
		}

		return ret;
	}
});
