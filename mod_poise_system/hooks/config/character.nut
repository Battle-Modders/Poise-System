::Const.CharacterProperties.IsImmuneToStunFromPoise <- false;
::Const.CharacterProperties.PoiseMax <- 100;
::Const.CharacterProperties.PoiseMult <- 1.0;
::Const.CharacterProperties.getPoiseMax <- function()
{
	return ::Math.floor(this.PoiseMax * this.PoiseMult);
}
::Const.CharacterProperties.PoiseDamage <- 0.0;		// Only weapons are meant to provide and set this value
::Const.CharacterProperties.PoiseDamageMult <- 1.0;
::Const.CharacterProperties.getPoiseDamage <- function()
{
	return ::Math.floor(this.PoiseDamage * this.PoiseDamageMult);
}
