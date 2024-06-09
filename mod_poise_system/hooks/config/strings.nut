// This is loaded AFTER perk_defs.nut is loaded

local adjustedDescriptions = [
	// Vanilla Perks
	{
		ID = "perk.mastery.mace",
		Key = "SpecMace",
		Description = ::UPD.getDescription({
			Fluff = "Master maces to beat your opponents into submission, armored or not.",
			Requirement = "Mace",
			Effects = [{
				Type = ::UPD.EffectType.Passive,
				Description = [
					"Skills build up " + ::MSU.Text.colorRed("25%") + " less [Fatigue|Concept.Fatigue].",
					"Gain the [Bear Down|Perk+perk_rf_bear_down] perk.",
					"Deal " + ::MSU.Text.colorGreen("50%") + " more [Poise Damage|Concept.PoiseDamage].",
					"The Polemace no longer has a penalty for attacking targets directly adjacent."
				],
			}],
		}),
	},
	{
		ID = "perk.hold_out",
		Key = "HoldOut",	// Current name is 'Resilient'
		Description = ::UPD.getDescription({
			Fluff = "Keep it together!",
	 		Effects = [{
 				Type = ::UPD.EffectType.Passive,
 				Description = [
					"Gain " + ::MSU.Text.colorGreen("50%") + " more [Poise|Concept.Poise]",
					"Any negative status effect with a finite duration (e.g. Bleeding, Charmed) has its duration reduced to " + ::MSU.Text.colorGreen(1) + " turn.",
					"Status effects that have their effects grow weaker over several turns (e.g. Goblin Poison) are at their weakest state from the start."
				]
 			}]
	 	})
	},
	{
		ID = "perk.steel_brow",
		Key = "SteelBrow",
		Description = ::UPD.getDescription({
	 		Fluff = "\'I can take it!\'",
	 		Effects = [{
 				Type = ::UPD.EffectType.Passive,
 				Description = [
 					"Hits to the head no longer cause critical damage to this character, which also lowers the risk of sustaining debilitating head [injuries|Concept.Injury] significantly.",
 					"Hits to the head against this character no longer deal " + ::MSU.Text.colorRed("50%") + " more [Poise Damage|Concept.PoiseDamage]."
 					"Grants passive immunity against [Cull|Perk+perk_rf_cull]."
 				]
 			}]
	 	})
	},

	// Reforged Perks
	{
		ID = "perk.rf_vigilant",
		Key = "RF_Vigilant",
		Description = ::UPD.getDescription({
			Fluff = "\'On the battlefield, you must always be ready to defend at a moment\'s notice, or strike at a narrow opportunity!\'",
			Effects = [{
				Type = ::UPD.EffectType.Passive,
				Description = [
					"At the end of your [turn|Concept.Turn], gain " + ::MSU.Text.colorGreen("half") + " of your remaining [Action Points|Concept.ActionPoints], rounded down, as additional [Action Points|Concept.ActionPoints] during your next [turn|Concept.Turn].",
					"At the end of your [turn|Concept.Turn], gain " + ::MSU.Text.colorGreen("+10") + " [Poise|Concept.Poise] for every unspent [Action Point|Concept.ActionPoints] until the start of your next [turn|Concept.Turn]."
				]
			}]
		})
	}
];

foreach (description in adjustedDescriptions)
{
	::UPD.setDescription(description.ID, description.Key, ::Reforged.Mod.Tooltips.parseString(description.Description));
}
