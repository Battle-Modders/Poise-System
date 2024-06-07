::include("mod_poise_system/config/poise.nut");	// The default must have been defined so that it can be used in character.nut

::includeFiles(::IO.enumerateFiles("mod_poise_system/hooks"));		// This will load and execute all hooks
