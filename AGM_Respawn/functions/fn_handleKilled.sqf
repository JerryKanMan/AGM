/*
  Name: AGM_Respawn_fnc_handleKilled
  
  Author(s):
    jodav
  
  Description:
    Handles the XEH Killed event
  
  Parameters:
    0: ARRAY<XehRespawnEventArgs>
      0: OBJECT - Killed unit
      1: OBJECT - Attacker
  
  Returns:
    VOID
*/

private ["_xehKilledEventArgs", "_killedUnit"];

_xehKilledEventArgs = _this select 0;
_killedUnit = _xehKilledEventArgs select 0;


// Saves the gear when the player is killed
AGM_Respawn_unitGear = [];

if (AGM_Respawn_SavePreDeathGear > 0) then {
  AGM_Respawn_unitGear = [_killedUnit] call AGM_Respawn_fnc_getAllGear;
};
