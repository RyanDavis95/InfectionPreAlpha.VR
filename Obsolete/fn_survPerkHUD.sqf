disableSerialization;

_perkLayer = "Perk1";
_perkLayer call BIS_fnc_rscLayer;
_perkLayer cutRsc ["sprintPerk","PLAIN"];

_cLayers = INF_CurrentPerkLayers;
_newArr = _cLayers + [_perkLayer];
INF_CurrentPerkLayers = _newArr;

_perk1 = uiNamespace getVariable "sprintPerk";
_titlePos = player getVariable "INF_PerkOneTitleLocation";
_basePos = player getVariable "INF_PerkOneBaseLocation";

(_perk1 displayCtrl 4101) ctrlSetPosition _titlePos;
(_perk1 displayCtrl 4101) ctrlCommit 0;
(_perk1 displayCtrl 4102) ctrlSetPosition _basePos;
(_perk1 displayCtrl 4102) ctrlCommit 0;
(_perk1 displayCtrl 4103) ctrlSetPosition _basePos;
(_perk1 displayCtrl 4103) ctrlCommit 0;
(_perk1 displayCtrl 4104) ctrlSetPosition _basePos;
(_perk1 displayCtrl 4104) ctrlCommit 0;

_ability1 = _perk1 displayCtrl 4104;
_ability1 progressSetPosition 1;