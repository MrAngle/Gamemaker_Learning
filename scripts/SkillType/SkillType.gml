// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum MY_SKILL_TYPE {
	PHYSICAL,
	
    FIRE,
    WIND,

    WATER,
    ELECTRIC,
    ICE,
    EARTH,
    MAGIC,
    POISON
}


/// getName(skillType)
/// @param skillType Typ umiejętności z enuma MY_SKILL_TYPE
/// @return string Nazwa umiejętności

function getMY_SKILL_TYPEName(skillType) {
    switch (skillType) {
        case MY_SKILL_TYPE.PHYSICAL: return "Physical";
        case MY_SKILL_TYPE.FIRE: return "Fire";
        case MY_SKILL_TYPE.WIND: return "Wind";
        case MY_SKILL_TYPE.WATER: return "Water";
        case MY_SKILL_TYPE.ELECTRIC: return "Electric";
        case MY_SKILL_TYPE.ICE: return "Ice";
        case MY_SKILL_TYPE.EARTH: return "Earth";
        case MY_SKILL_TYPE.MAGIC: return "Magic";
        case MY_SKILL_TYPE.POISON: return "Poison";
        default: return "Unknown";
    }
}