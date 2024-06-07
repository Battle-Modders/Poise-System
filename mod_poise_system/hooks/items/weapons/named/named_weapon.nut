
::PoiseSystem.HooksMod.hook("scripts/items/weapons/named/named_weapon", function(q) {
	q.getValuesForRandomize = @(__original) function()
	{
		local ret = __original();

		local baseWeapon = ::new(this.m.BaseWeaponScript);
		ret.PoiseDamage <- baseWeapon.m.PoiseDamage;

		return ret;
	}
});
