::PoiseSystem.HooksMod.hook("scripts/skills/racial/rf_orc_racial", function(q) {
	q.onAdded = @(__original) function()
	{
		__original();
		this.getContainer().getActor().m.BaseProperties.PoiseMax = ::PoiseSystem.Poise.Default.Orc;
	}
});
