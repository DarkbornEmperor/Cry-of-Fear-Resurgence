// Created by Crowbar 0.74

$modelname "police4.mdl"

$bodygroup "body"
{
	studio "police.smd"
	studio "police2.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\cof\police4\"

$attachment "eyes" "Bip01 Head" 0 0 0 rotate 0 90 0
$attachment "flashlight" "Bip01 Spine3" 1 6.8 4.4 rotate -20 85 0

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 3 "Bip01 Pelvis" -4.69 -4.44 -6.75 4 5.56 6.75
$hbox 6 "Bip01 L Leg" 2.66 -3.69 -3.09 18.16 4.88 3.31
$hbox 6 "Bip01 L Leg1" 0.38 -3.97 -2.84 17.6 4 2.94
$hbox 6 "Bip01 L Foot" -0.59 -2.34 -2.63 3.79 8 2.19
$hbox 7 "Bip01 R Leg" 2.47 -3.69 -3.16 18.129999 4.88 3.38
$hbox 7 "Bip01 R Leg1" 0.31 -3.97 -2.84 17.6 3.94 2.97
$hbox 7 "Bip01 R Foot" -0.56 -2.34 -2.19 3.81 8 2.66
$hbox 3 "Bip01 Spine1" -3.25 -5.5 -5.5 4.83 5.5 5.5
$hbox 2 "Bip01 Spine2" -0.06 -5.53 -7.59 8 7 7.59
$hbox 2 "Bip01 Spine3" -2.25 -6.81 -6.31 6.5 5.09 6.31
$hbox 2 "Bip01 Neck" -3.11 -1.5 -3 2.05 3.5 3
$hbox 1 "Bip01 Head" 0.09 -3.66 -3 8.41 5.09 3
$hbox 4 "Bip01 L Arm" 0.94 -2.88 -4.13 5.44 4.28 3.5
$hbox 4 "Bip01 L Arm1" -2.16 -2.34 -2.56 11.56 3.41 2.38
$hbox 4 "Bip01 L Arm2" 0.59 -1.81 -2.19 10.75 2.84 2.41
$hbox 4 "Bip01 L Hand" 0 -1 -2 3 1.5 3.5
$hbox 5 "Bip01 R Arm" 1.38 -2.84 -3.56 5.69 4.31 4.31
$hbox 5 "Bip01 R Arm1" -1.88 -2.47 -2.16 11.81 3.28 2.81
$hbox 5 "Bip01 R Arm2" 0.44 -1.97 -2.34 10.59 2.72 2.22
$hbox 5 "Bip01 R Hand" 0 -1 -2 3 1.5 3.5
$skipboneinbbox

$definebone "Bip01" "" 0 0 39.526119 0 -89.999921 0 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0 -89.999982 -89.990126 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" -0.000908 0.000642 3.713253 1.508866 178.775707 -179.8728 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 18.045727 -0.000004 0.000001 0 -6.961494 0 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Leg1" 17.597607 0.000005 0.000002 1.491753 5.727687 -0.149714 0 0 0 0 0 0
$definebone "Bip01 L Toe0" "Bip01 L Foot" 3.793089 6.40722 0 0 89.999982 0 0 0 0 0 0 0
$definebone "Bip01 L Toe01" "Bip01 L Toe0" 0.93574 0 0 0 -0.000001 0 0 0 0 0 0 0
$definebone "Bip01 L Toe02" "Bip01 L Toe01" 0.93574 0 0 0 -0.000001 0 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" 0.000908 -0.000638 -3.713253 -0.980141 178.604802 179.864836 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 18.045706 -0.000002 -0.000006 0 -7.30814 0 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Leg1" 17.597586 0 0 -0.990587 5.904614 0.169023 0 0 0 0 0 0
$definebone "Bip01 R Toe0" "Bip01 R Foot" 3.793089 6.407215 0 0 89.999982 0 0 0 0 0 0 0
$definebone "Bip01 R Toe01" "Bip01 R Toe0" 0.935741 0 -0.000001 0 0 0 0 0 0 0 0 0
$definebone "Bip01 R Toe02" "Bip01 R Toe01" 0.93574 0 0 0 0 0 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 1.294075 0.68469 0.000198 -0.011459 13.044817 -0.012949 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 5.309422 -0.003808 -0.000001 0 -7.995971 0 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 4.826347 -0.004529 0 0.000057 -10.994435 0 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 5.792839 -0.005302 0 0 1.998991 0 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 6.662899 -0.000959 0 -0.000115 53.972619 -0.000057 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" 2.046963 0.000008 0 0.000115 -34.028494 0 0 0 0 0 0 0
$definebone "Dummy08" "Bip01 Head" 1.03862 0.548053 -0.144017 0.000057 -105.991784 -0.000057 0 0 0 0 0 0
$definebone "Bone02" "Dummy08" -0.064003 -0.023544 0.026161 0 0.000014 0 0 0 0 0 0 0
$definebone "Dummy05" "Bip01 Head" 1.447384 3.718271 -0.082106 0.000057 -105.991784 -0.000057 0 0 0 0 0 0
$definebone "Bone09" "Dummy05" -0.105178 0.080605 -0.026823 0 0.000014 0 0 0 0 0 0 0
$definebone "Dummy04" "Bip01 Head" 3.013905 3.984641 -0.088975 0.000057 -105.991784 -0.000057 0 0 0 0 0 0
$definebone "Bone05" "Dummy04" -0.084186 -0.02565 -0.001098 0 0.000014 0 0 0 0 0 0 0
$definebone "Dummy03" "Bip01 Head" 4.77821 3.972489 -0.079803 0.000057 -105.991784 -0.000057 0 0 0 0 0 0
$definebone "Bone07" "Dummy03" -0.058555 -0.021324 0.004244 0 0.000014 0 0 0 0 0 0 0
$definebone "Dummy10" "Bip01 Head" 1.640621 -1.968784 -0.099219 0.000057 -105.991784 -0.000057 0 0 0 0 0 0
$definebone "Bone13" "Dummy10" 0.055574 -0.028923 0 0 0.000014 0 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" -2.085419 2.764389 4.341912 -78.540885 125.982238 -0.000516 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" 4.827229 -0.000001 0.000011 71.869764 12.869497 12.684875 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 11.139771 -0.000003 -0.000002 0.000005 -11.459163 0.000003 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Arm2" 10.31459 0.000001 0 0.000006 -3.997994 -89.954377 0 0 0 0 0 0
$definebone "Bip01 L Finger0" "Bip01 L Hand" 1.646744 0.449553 -1.702247 25.340605 15.884406 8.823662 0 0 0 0 0 0
$definebone "Bip01 L Finger01" "Bip01 L Finger0" 0.928312 -0.000001 -0.000006 0.000003 0.000009 0 0 0 0 0 0 0
$definebone "Bip01 L Finger02" "Bip01 L Finger01" 0.928316 -0.000002 0 0.000004 0.000009 0 0 0 0 0 0 0
$definebone "Bip01 L Finger1" "Bip01 L Hand" 2.975832 -0.386309 -0.044145 -2.498718 0.002011 -0.045668 0 0 0 0 0 0
$definebone "Bip01 L Finger11" "Bip01 L Finger1" 1.438881 0.000001 -0.000001 0.000014 17.99088 0 0 0 0 0 0 0
$definebone "Bip01 L Finger12" "Bip01 L Finger11" 1.485298 0 0 0.000017 5.996999 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" -1.923027 2.549736 -4.140393 78.540707 125.981186 -0.000516 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 4.972046 -0.000006 -0.000011 -72.357064 13.23153 -13.029464 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 11.585346 -0.000002 -0.000001 0.000006 -11.459171 -0.000005 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Arm2" 10.127064 -0.000002 0.000004 0.000006 -3.998001 89.940163 0 0 0 0 0 0
$definebone "Bip01 R Finger0" "Bip01 R Hand" 1.533669 0.109715 1.664493 -23.662019 24.962839 -13.364531 0 0 0 0 0 0
$definebone "Bip01 R Finger01" "Bip01 R Finger0" 0.928312 0.000003 -0.000006 0 -0.000012 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Finger02" "Bip01 R Finger01" 0.928316 -0.000002 -0.000002 -0.000001 -0.000007 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Finger1" "Bip01 R Hand" 2.683744 -0.427341 0.044209 2.498708 0.002632 0.05988 0 0 0 0 0 0
$definebone "Bip01 R Finger11" "Bip01 R Finger1" 1.438889 -0.000002 -0.000002 -0.000025 18.990393 -0.000003 0 0 0 0 0 0
$definebone "Bip01 R Finger12" "Bip01 R Finger11" 1.48531 -0.000001 0.000001 -0.000024 -0.000013 -0.000004 0 0 0 0 0 0


$includemodel "vj_cofr/cof/shared_animations.mdl"
