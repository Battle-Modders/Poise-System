# Description

This mod is the first implementation of the Stun Threshold system.

# Current Summary

### Terms
- **Poise Damage** : New stat on weapons and some active skills that determines how well they inflict stuns
- **Maximum Poise**: New character stat on entities that determines how well they can resist stunning attacks
- **Poise**: New stat on entities that is lost upon receiving stunning attacks and reset when it hits 0 or at the start of that entitys turn

## Overview
- All Maces and all two-handed flails have a fixed **Poise Damage**.
  - 2H Flails: **40**
  - 1H Human Maces: **80**
  - 1H Orc Maces: **120**
  - 2H Hybrid Maces and Polemaces: **120**
  - remaining 2H Maces: **160**
Here are the base Maximum Poise values for entities
  - Default = 100
  - Goblin = 60
  - Human = 100
  - Orc = 150
  - Beast = 100	// Direwolf, Hyena, Snake, Ghoul
  - Unhold = 300
- All stunning attacks (Knock Out, Knock Over, Strike Down, Charge, Unstoppable Charge) now attack the Poise of the target
- Reducing the Poise to 0 or below with a stunning attack will stun them for 1 turn
- Reducing the Poise to a value equal or below their negative maximum Poise will apply a 2 turn stun
- Headshots grant 50% more Poise Damage
- Enemies that are immune to stuns via base properties (Lindwurm, Geist, Schrat, Ifrit, etc.) are also immune to stuns from Poise Damage

### Perk Adjustments
- **Resilient** grants 50% more Poise
- **Battering Ram** (Orcs, Unholds) no longer grants stun immunity. It now grants 50% more Poise.
- **Steelbrow** negates the Headshot bonus for Poise Damage
- **Mace Mastery** grants 50% more Poise Damage while a Mace is equipped
- **Vigilant** grants +10 Poise when your end your turn for every remaining Action Point until the start of the next turn
- **Versatile Swordsman** grants +120 Poise Damage if a one-handed sword is equipped and +180 Poise Damage if a two-handed sword is equipped

### Skill Adjustments
- All skills that had a Stun Chance (!= 0) before now use the Composure system
- **Shieldwall** grants 25% more Poise
- **Pound** grants 100% more Poise Damage
- **Charge** inflicts 100 Poise Damage and dazes the target if no stun was applied
- **Unstoppable Charge** inflicts 150 Poise Damage (if stun was rolled as opposed to knock back) and staggers the target if no stun was applied

### Items
- **Orc Trophy** no longer grants stun immunity. It now grants 200% more Poise

## Todo
- Icon for new Composure effect
- Icon for Composure stat lines
- Smarter enemy AI that can predict stuns
- Some casual playtesting

# Requirements

- Reforged

# Known Issues:

# Compatibility

- Is safe to remove from- and add to any existing savegames
