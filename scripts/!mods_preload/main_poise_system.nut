::PoiseSystem <- {
	ID = "mod_poise_system",
	Name = "Reforged Poise System",
	Version = "0.1.9",
	GitHubURL = "https://github.com/Battle-Modders/Poise-System",
}

::PoiseSystem.HooksMod <- ::Hooks.register(::PoiseSystem.ID, ::PoiseSystem.Version, ::PoiseSystem.Name);
::PoiseSystem.HooksMod.require(["mod_reforged"]);

::PoiseSystem.HooksMod.queue(">mod_reforged", function() {
	::PoiseSystem.Mod <- ::MSU.Class.Mod(::PoiseSystem.ID, ::PoiseSystem.Version, ::PoiseSystem.Name);

	::PoiseSystem.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, ::PoiseSystem.GitHubURL);
	::PoiseSystem.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

	::include("mod_poise_system/load");		// Load mod adjustments and other hooks

	::Hooks.registerCSS("ui/mods/mod_poise_system/css_hooks/controls.css");
});

::PoiseSystem.HooksMod.queue(">mod_reforged", function() {
	::include("mod_poise_system/config/z_nested_tooltips");
}, ::Hooks.QueueBucket.FirstWorldInit);
