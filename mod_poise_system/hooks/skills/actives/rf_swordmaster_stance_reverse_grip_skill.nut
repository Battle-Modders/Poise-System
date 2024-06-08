::PoiseSystem.HooksMod.hook("scripts/skills/actives/rf_swordmaster_stance_reverse_grip_skill", function(q) {
	q.onUpdate = @(__original) function( _properties )
	{
		__original(_properties);

		local weapon = this.getContainer().getActor().getMainhandItem();
		if (weapon != null && weapon.isItemType(::Const.Items.ItemType.MeleeWeapon) && weapon.getPoiseDamage() == 0)
		{
			if (weapon.isItemType(::Const.Items.ItemType.TwoHanded))
			{
				_properties.PoiseDamage += 180;
			}
			else if (weapon.isItemType(::Const.Items.ItemType.OneHanded))
			{
				_properties.PoiseDamage += 120;
			}
		}
	}
});
