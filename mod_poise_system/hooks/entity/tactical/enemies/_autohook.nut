local adjustPoiseMax = function( _entityTacticalPath, _poiseMax )
{
	::PoiseSystem.HooksMod.hook("scripts/entity/tactical/" + _entityTacticalPath, function(q) {
		q.onInit = @(__original) function()
		{
			__original();
			this.m.BaseProperties.PoiseMax = _poiseMax;
		}
	});
}

adjustPoiseMax("enemies/direwolf", ::PoiseSystem.Poise.Default.Beast);
adjustPoiseMax("enemies/ghoul", ::PoiseSystem.Poise.Default.Beast);
adjustPoiseMax("enemies/hyena", ::PoiseSystem.Poise.Default.Beast);
// adjustPoiseMax("enemies/lindwurm", ::PoiseSystem.Poise.Default.Lindwurm);
adjustPoiseMax("enemies/serpent", ::PoiseSystem.Poise.Default.Beast);
adjustPoiseMax("goblin", ::PoiseSystem.Poise.Default.Goblin);
adjustPoiseMax("human", ::PoiseSystem.Poise.Default.Human);
adjustPoiseMax("enemies/unhold", ::PoiseSystem.Poise.Default.Unhold);
adjustPoiseMax("human", ::PoiseSystem.Poise.Default.Human);
