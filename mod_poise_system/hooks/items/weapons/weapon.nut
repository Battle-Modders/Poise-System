::PoiseSystem.HooksMod.hook("scripts/items/weapons/weapon", function(q) {
	q.m.PoiseDamage <- 0;

	q.getTooltip = @(__original) function()
	{
		local ret = __original();

		if (this.getPoiseDamage() != 0)
		{
			ret.push({
				id = 21,
				type = "text",
				icon = "ui/icons/special.png",
				text = ::Reforged.Mod.Tooltips.parseString("[Poise Damage|Concept.PoiseDamage]: " + this.getPoiseDamage()),
			});
		}

		return ret;
	}

	q.onUpdateProperties = @(__original) function( _properties )
	{
		__original(_properties);
		if (!this.getContainer().getActor().isDisarmed())
		{
			_properties.PoiseDamage += this.getPoiseDamage();
		}
	}

// New Functions
	q.getPoiseDamage <- function()
	{
		return this.m.PoiseDamage;
	}

	q.isHybrid <- function()
	{
		return this.m.WeaponType != 0 && (this.m.WeaponType & (this.m.WeaponType - 1)) != 0;
	}
});

// Apply default poise damage values for every weapon depending on type
::PoiseSystem.HooksMod.hookTree("scripts/items/weapons/weapon", function(q) {
	q.create = @(__original) function()
	{
		__original();

		// We adjust poise damage values dynamically so that weapons from mods will automatically have a value assigned based on their type
		if (this.m.PoiseDamage == 0)
		{
			if (this.isItemType(::Const.Items.ItemType.TwoHanded))
			{
				if (this.isWeaponType(::Const.Items.WeaponType.Flail))
				{
					this.m.PoiseDamage = 40;	// Orc Flails currently don't have an extra value
				}
				else if (this.isWeaponType(::Const.Items.WeaponType.Mace))
				{
					if (this.isHybrid() || this.m.RangeMax == 2)	// e.g. Goedendag or Polemace
					{
						this.m.PoiseDamage = 120;
					}
					else
					{
						this.m.PoiseDamage = 160;
					}
				}
			}
			else if (this.isItemType(::Const.Items.ItemType.OneHanded))
			{
				if (this.isWeaponType(::Const.Items.WeaponType.Mace))
				{
					if (this.m.FatigueOnSkillUse == 5)		// quick and dirty check for orc maces
					{
						this.m.PoiseDamage = 120;
					}
					else
					{
						this.m.PoiseDamage = 80;
					}
				}
			}
		}
	}
});
