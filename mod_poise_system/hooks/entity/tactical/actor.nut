::PoiseSystem.HooksMod.hook("scripts/entity/tactical/actor", function(q) {
	q.onInit = @(__original) function()
	{
		__original();
		this.getSkills().add(::new("scripts/skills/special/rf_poise_effect"));
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
