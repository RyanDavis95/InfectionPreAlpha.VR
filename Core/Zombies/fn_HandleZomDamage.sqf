params["_unit","_selectionName","_damage","_source","_projectile","_hitPart"];
private["_tmpDmg"];
_unit = _this param [0, objNull];
_selectionName = _this param [1, ""];
_damage = _this param [2, 0];
_source = _this param [3, objNull];
_projectile = _this param [4, ""];
_hitPart = _this param [5, 0];
_tmpDmg = 0;
_alpha = missionNamespace getVariable "INF_AlphaZombie";
    _faceModifier = 0;
    _neckModifier = 0;
    _headModifier = 0;
    _pelvisModifier = 0;
    _abdomenModifier = 0;
    _diaphragmModifier = 0;
    _chestModifier = 0;
    _bodyModifier = 0;
    _armsModifier = 0;
    _handsModifier = 0;
    _legsModifier = 0;
    _overallModifier = 0;

// Modifiers for different hit locations
if (vehicleVarName _unit == _alpha) then {
    _faceModifier = 0;
    _neckModifier = 0;
    _headModifier = 0.025;
    _pelvisModifier = 0;
    _abdomenModifier = 0;
    _diaphragmModifier = 0;
    _chestModifier = 0;
    _bodyModifier = 0;
    _armsModifier = 0;
    _handsModifier = 0;
    _legsModifier = 0;
    _overallModifier = 0;
} else {
    _faceModifier = 0;
    _neckModifier = 0;
    _headModifier = 0.05;
    _pelvisModifier = 0;
    _abdomenModifier = 0;
    _diaphragmModifier = 0;
    _chestModifier = 0;
    _bodyModifier = 0;
    _armsModifier = 0;
    _handsModifier = 0;
    _legsModifier = 0;
    _overallModifier = 0;
};

/* Handle Individual hit box components */
switch (_selectionName) do {
    case "face_hub": {_tmpDmg = (_unit getVariable "INF_faceDmg") + (_damage * _faceModifier); _unit setHitPointDamage ["hitFace", _tmpDmg]; _unit setVariable ["INF_faceDmg", _tmpDmg, false];};
    case "neck": {_tmpDmg = (_unit getVariable "INF_neckDmg") + (_damage * _neckModifier); _unit setHitPointDamage ["hitNeck", _tmpDmg]; _unit setVariable ["INF_neckDmg", _tmpDmg, false];};
    case "head": {_tmpDmg = (_unit getVariable "INF_headDmg") + (_damage * _headModifier); _unit setHitPointDamage ["hitHead", _tmpDmg]; _unit setVariable ["INF_headDmg", _tmpDmg, false];}; 
    case "pelvis": {_tmpDmg = (_unit getVariable "INF_pelvisDmg") + (_damage * _pelvisModifier); _unit setHitPointDamage ["hitPelvis", _tmpDmg]; _unit setVariable ["INF_pelvisDmg", _tmpDmg, false];};
    case "spine1": {_tmpDmg = (_unit getVariable "INF_abdomenDmg") + (_damage * _abdomenModifier); _unit setHitPointDamage ["hitAbdomen", _tmpDmg]; _unit setVariable ["INF_abdomenDmg", _tmpDmg, false];}; 
    case "spine2": {_tmpDmg = (_unit getVariable "INF_diaphragmDmg") + (_damage * _diaphragmModifier); _unit setHitPointDamage ["hitDiaphragm", _tmpDmg]; _unit setVariable ["INF_diaphragmDmg", _tmpDmg, false];};
    case "spine3": {_tmpDmg = (_unit getVariable "INF_chestDmg") + (_damage * _chestModifier); _unit setHitPointDamage ["hitChest", _tmpDmg]; _unit setVariable ["INF_chestDmg", _tmpDmg, false];}; 
    case "body": {_tmpDmg = (_unit getVariable "INF_bodyDmg") + (_damage * _bodyModifier); _unit setHitPointDamage ["hitBody", _tmpDmg]; _unit setVariable ["INF_bodyDmg", _tmpDmg, false];}; 
    case "arms": {_tmpDmg = (_unit getVariable "INF_armsDmg") + (_damage * _armsModifier); _unit setHitPointDamage ["hitArms", _tmpDmg]; _unit setVariable ["INF_armsDmg", _tmpDmg, false];}; 
    case "hands": {_tmpDmg = (_unit getVariable "INF_handsDmg") + (_damage * _handsModifier); _unit setHitPointDamage ["hitHands", _tmpDmg]; _unit setVariable ["INF_handsDmg", _tmpDmg, false];}; 
    case "legs": {_tmpDmg = (_unit getVariable "INF_legsDmg") + (_damage * _legsModifier); _unit setHitPointDamage ["hitLegs", _tmpDmg]; _unit setVariable ["INF_legsDmg", _tmpDmg, false];};
    case "": {_tmpDmg = (_unit getVariable "INF_overallDmg") + (_damage * _overallModifier);  _unit setDammage _tmpDmg; _unit setVariable ["INF_overallDmg",_tmpDmg,false];};
    default {};
};


// Keep blood effects present
_unit setHit ["chest", 0.4];
_unit setHit ["hands", 0.4];
_unit setHit ["body", 0.4];
_unit setHit ["legs", 0.4];
_unit setHit ["head", 0.4];

/* Override Default damage by returning 0*/
0