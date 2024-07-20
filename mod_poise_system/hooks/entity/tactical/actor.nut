::PoiseSystem.HooksMod.hook("scripts/entity/tactical/actor", function(q) {
	q.onInit = @(__original) function()
	{
		__original();
		this.getSkills().add(::new("scripts/skills/special/rf_poise_effect"));
	}

	q.getTooltip = @(__original) function( _targetedWithSkill = null )
	{
		local ret = __original(_targetedWithSkill);

		foreach(index, entry in ret)
		{
			if (entry.id == 9)	// last vanilla progressbar (fatigue)
			{
				local barText = this.getCurrentProperties().IsImmuneToStunFromPoise ? "(Immune)" : (this.getPoise() + " / " + this.getPoiseMax());
				ret.insert(index + 1, {
					id = 10,
					type = "progressbar",
					icon = "ui/icons/sturdiness.png", // vanilla icon that is only used in one place in vanilla in a single tooltip entry in `orc_berserker_potion_effect`
					value = this.getPoise(),
					valueMax = this.getPoiseMax(),
					text = barText,
					style = "resilience-slim"
				});
			}
		}

		return ret;
	}

// New Functions
	q.getPoise <- function()
	{
		local poiseEffect = this.getSkills().getSkillByID("effects.poise");
		if (poiseEffect != null)
		{
			return poiseEffect.getPoise();
		}

		return 0;
	}

	q.getPoiseMax <- function()
	{
		return this.getCurrentProperties().getPoiseMax();
	}
});

::PoiseSystem.HooksMod.hookTree("scripts/entity/tactical/actor", function(q) {
	// When entities are permanently stun immune then they should probably also be immune from poise stuns.
	q.onInit = @(__original) function()
	{
		__original();
		this.m.BaseProperties.IsImmuneToStunFromPoise = this.m.BaseProperties.IsImmuneToStun;
	}
});
