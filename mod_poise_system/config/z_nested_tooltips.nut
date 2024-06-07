::Reforged.NestedTooltips.Tooltips.Concept.Poise <- ::MSU.Class.BasicTooltip(
	"Poise",
	::Reforged.Mod.Tooltips.parseString("Poise depicts how well an entity resists stuns. It is reduced by [stunning attacks|Concept.StunningAttack] and some other skills which can damage Poise. At the start of an entities turn or whenever its Poise reaches 0, it is reset to the maximum value.")
);
::Reforged.NestedTooltips.Tooltips.Concept.PoiseDamage <- ::MSU.Class.BasicTooltip(
	"Poise Damage",
	::Reforged.Mod.Tooltips.parseString("Poise Damage is granted by certain weapons and improved by various skills. It determines how well [stunning attacks|Concept.StunningAttack] perform.")
);
::Reforged.NestedTooltips.Tooltips.Concept.StunningAttack <- ::MSU.Class.BasicTooltip(
	"Stunning Attack",
	::Reforged.Mod.Tooltips.parseString("A Stunning Attack subtracts the [Poise Damage|Concept.PoiseDamage] for this attack from the targets [Poise|Concept.Poise] on a hit. If it reduces the targets [Poise|Concept.Poise] to 0 or below, the target will be stunned. Does not affect enemies who are immune to stuns.")
);

::Reforged.Mod.Tooltips.setTooltips(::Reforged.NestedTooltips.Tooltips);
