/*
 * Author: KoffeinFlummi
 * 
 * Sends a civilian crowd away (chance of failure).
 * 
 * Arguments:
 * 0: Unit to be sent away (Object)
 *
 * Return value:
 * none
*/

#define DISTANCE 50
#define RADIUS 10

private ["_unit", "_chance", "_x"];

_unit = _this select 0;

player playActionNow "GestureGo";

if (count (weapons player) > 0) then {
  _chance = 0.8;
} else {
  _chance = 0.5;
};

BWA3_sendAway = {
  _noLegs = (_this select 0) getVariable "BWA3_NoLegs";
  if (isNil "_noLegs" or !(_noLegs)) then {
    (_this select 0) setUnitPos "AUTO";
  };
  (_this select 0) doMove [(getPos (_this select 0) select 0) + DISTANCE * (eyeDirection (_this select 1) select 0), (getPos (_this select 0) select 1) + DISTANCE * (eyeDirection (_this select 1) select 1), 0];
};

{
  if (count (weapons _unit) == 0 and random 1 < _chance) then {
    [[_x, player], "BWA3_sendAway", true, false] spawn BIS_fnc_MP;
  };
} foreach (_unit nearEntities ["Civilian", RADIUS]);