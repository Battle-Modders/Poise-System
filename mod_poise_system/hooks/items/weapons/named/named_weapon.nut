
::PoiseSystem.HooksMod.hook("scripts/items/weapons/named/named_weapon", function(q) {
	q.getBaseItemFields = @(__original) function()
	{
		local ret = __original();
		ret.push("PoiseDamage");
		return ret;
	}
});
