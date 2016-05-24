_perkLayer = "Perk1";
_perkLayer call BIS_fnc_rscLayer;
_perkLayer cutRsc ["lightningPerk","PLAIN"];

_cLayers = INF_CurrentPerkLayers;
_newArr = _cLayers + [_perkLayer];
INF_CurrentPerkLayers = _newArr;

_perk1 = uiNamespace getVariable "lightningPerk";
_titlePos = player getVariable "INF_PerkOneTitleLocation";
_basePos = player getVariable "INF_PerkOneBaseLocation";

(_perk1 displayCtrl 9101) ctrlSetPosition _titlePos;
(_perk1 displayCtrl 9101) ctrlCommit 0;
(_perk1 displayCtrl 9102) ctrlSetPosition _basePos;
(_perk1 displayCtrl 9102) ctrlCommit 0;
(_perk1 displayCtrl 9103) ctrlSetPosition _basePos;
(_perk1 displayCtrl 9103) ctrlCommit 0;
(_perk1 displayCtrl 9104) ctrlSetPosition _basePos;
(_perk1 displayCtrl 9104) ctrlCommit 0;

_ability1 = _perk1 displayCtrl 9104;
_ability1 progressSetPosition 1;