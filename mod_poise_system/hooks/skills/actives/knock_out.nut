::PoiseSystem.HooksMod.hook("scripts/skills/actives/knock_out", function(q) {
	q.create = @(__original) function()
	{
		__original();
		this.m.IsDamagingPoise = true;
		this.m.IsStunningFromPoise = true;
	}

	// Overwrite so we disable any vanilla logic which would otherwise apply a stun while mace mastery is learned
	q.onUse = @() function( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, ::Const.Tactical.AttackEffectBash);
		return this.attackEntity(_user, _targetTile.getEntity());
	}
});
