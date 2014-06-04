// by commy2

#define RECOVER_RATE_FACTOR 0.1
#define THRESHOLD_1 0.8
#define THRESHOLD_2 0.9
#define THRESHOLD_3 0.99

_handleRecoil = 0 spawn {};
_handleBlinking = 0 spawn {};
_handleHeartbeat = 0 spawn {};
_handleStumble = 0 spawn {};

/*
if (scriptDone _handleRecoil) then {
	_handleRecoil = [1.5, THRESHOLD_2 - 1] spawn AGM_Fatigue_recoil;
};
*/

waitUntil {
	_fatigue = getFatigue player;
	if (_fatigue > THRESHOLD_1) then {
		if (scriptDone _handleHeartbeat) then {
			_handleHeartbeat = 0 spawn AGM_Fatigue_heartbeat;
		};
		if (_fatigue > THRESHOLD_2) then {
			if (scriptDone _handleBlinking) then {
				_handleBlinking = 0 spawn AGM_Fatigue_blinking;
			};

			if (_fatigue > THRESHOLD_3) then {
				if (scriptDone _handleStumble) then {
					_handleStumble = 0 spawn AGM_Fatigue_stumble;
				};
			};
		};
	};

	sleep 1;

	_fatigueNew = getFatigue player;
	player setFatigue (_fatigue - RECOVER_RATE_FACTOR * (_fatigue - _fatigueNew) max _fatigueNew);

	false
};