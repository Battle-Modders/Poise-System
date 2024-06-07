::PoiseSystem <- {
	ID = "mod_poise_system",
	Name = "Reforged Poise System",
	Version = "0.1.0",
}

::PoiseSystem.HooksMod <- ::Hooks.register(::PoiseSystem.ID, ::PoiseSystem.Version, ::PoiseSystem.Name);
::PoiseSystem.HooksMod.require(["mod_reforged"]);

::PoiseSystem.HooksMod.queue(">mod_reforged", function() {
	::PoiseSystem.Mod <- ::MSU.Class.Mod(::PoiseSystem.ID, ::PoiseSystem.Version, ::PoiseSystem.Name);

	::include("mod_poise_system/load");		// Load mod adjustments and other hooks
});

::Hardened.HooksMod.queue(">mod_reforged", function() {
	::include("mod_poise_system/config/z_nested_tooltips");
}, ::Hooks.QueueBucket.FirstWorldInit);
