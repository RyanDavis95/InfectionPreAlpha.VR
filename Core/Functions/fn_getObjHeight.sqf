params ["_client"];

_bbr = boundingBoxReal vehicle _client;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_height = abs ((_p2 select 2) - (_p1 select 2));

_height