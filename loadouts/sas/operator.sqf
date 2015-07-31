comment "Exported from Arsenal by Kavinsky";

comment "Remove existing items";
removeAllWeapons _this;
removeAllItems _this;
removeAllAssignedItems _this;
removeUniform _this;
removeVest _this;
removeBackpack _this;
removeHeadgear _this;
removeGoggles _this;

comment "Add containers";
_this forceAddUniform "TRYK_U_B_PCUHsW3";
_this addItemToUniform "ACE_Clacker";
_this addItemToUniform "ACE_EarPlugs";
_this addVest "TRYK_V_tacv1LC_BK";
_this addItemToVest "MEU_IFAK";
_this addItemToVest "ACE_IR_Strobe_Item";
for "_i" from 1 to 4 do {_this addItemToVest "ACE_CableTie";};
_this addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 6 do {_this addItemToVest "MEU_30Rnd_MP5_HP_S";};
for "_i" from 1 to 2 do {_this addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_this addItemToVest "rhs_mag_an_m8hc";};
_this addItemToVest "rhs_mag_m18_green";
_this addItemToVest "rhs_mag_m18_red";
for "_i" from 1 to 6 do {_this addItemToVest "ACE_M84";};
_this addItemToVest "ACE_HandFlare_White";
_this addItemToVest "ACE_HandFlare_Red";
for "_i" from 1 to 2 do {_this addItemToVest "SLAMDirectionalMine_Wire_Mag";};
_this addGoggles "Mask_M50";

comment "Add weapons";
_this addWeapon "hlc_smg_mp5sd5";
_this addWeapon "RH_p226s";

comment "Add items";
_this linkItem "ItemMap";
_this linkItem "ItemCompass";
_this linkItem "Itemwatch";
_this linkItem "TRYK_SPgear_PHC2_NV";

comment "Set identity";
_this setFace "WhiteHead_16";
_this setSpeaker "ACE_NoVoice";
