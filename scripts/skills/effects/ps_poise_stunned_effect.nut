// Variation of the regular stunned_effect which is not removed automatically if the entity is immune to vanilla stuns

this.ps_poise_stunned_effect <- this.inherit("scripts/skills/effects/stunned_effect", {
	m = {},

	// We replace the original function because we can't easily predict the result of the statusResisted roll
	function onAdded()
	{
		local statusResisted = this.getContainer().getActor().getCurrentProperties().IsResistantToAnyStatuses ? ::Math.rand(1, 100) <= 50 : false;
		statusResisted = statusResisted || this.getContainer().getActor().getCurrentProperties().IsResistantToPhysicalStatuses ? ::Math.rand(1, 100) <= 33 : false;

		if (statusResisted)
		{
			if (!this.getContainer().getActor().isHiddenToPlayer())
			{
				::Tactical.EventLog.log(::Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " shook off being stunned thanks to his unnatural physiology");
			}

			this.removeSelf();
		}
		else
		{
			this.m.Container.removeByID("effects.shieldwall");
			this.m.Container.removeByID("effects.spearwall");
			this.m.Container.removeByID("effects.riposte");
			this.m.Container.removeByID("effects.return_favor");
			this.m.Container.removeByID("effects.possessed_undead");
		}
	}

	// We call the original function to grant better compatibility with hooks
	function onUpdate( _properties )
	{
		this.stunned_effect.onUpdate(_properties);

		local actor = this.getContainer().getActor();
		if (actor.getCurrentProperties().IsImmuneToStun)
		{
			this.m.IsGarbage = false;	// Revert the removal on entities, which are immune to stun

			if (this.m.TurnsLeft != 0)
			{
				_properties.IsStunned = true;
				actor.setActionPoints(0);

				if (actor.hasSprite("status_stunned"))
				{
					actor.getSprite("status_stunned").setBrush(::Const.Combat.StunnedBrush);
					actor.getSprite("status_stunned").Visible = true;
				}

				actor.setDirty(true);
			}
			else
			{
				if (actor.hasSprite("status_stunned"))
				{
					actor.getSprite("status_stunned").Visible = false;
				}

				actor.setDirty(true);
			}
		}
	}

});
