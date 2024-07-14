::PoiseSystem.HooksMod.hook("scripts/skills/effects/indomitable_effect", function(q) {
	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);
		_properties.IsImmuneToStunFromPoise = true;
	}
});
