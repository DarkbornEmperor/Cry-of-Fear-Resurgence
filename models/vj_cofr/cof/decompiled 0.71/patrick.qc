// Created by Crowbar 0.71

$modelname "patrick.mdl"

$bodygroup "body"
{
	studio "ref.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\cof\patrick\"

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 3 "Bip01 Pelvis" -6.04 -5.78 -3.713255 1.29367 4.2 4.38
$hbox 6 "Bip01 L Leg" 0 -5.8 -4.23 19.98 3.88 2.69
$hbox 6 "Bip01 L Leg1" 0 -4.17 -4.25 17.597597 2.36 1.84
$hbox 6 "Bip01 L Foot" 0 -3.71 -3.3 3.99 8.53 1.39
$hbox 7 "Bip01 R Leg" 0 -5.82 -3.64 19.99 3.87 3.58
$hbox 7 "Bip01 R Leg1" 0 -4.17 -3.12 17.639999 2.36 3.06
$hbox 7 "Bip01 R Foot" 0 -3.71 -2.69 3.99 8.53 2
$hbox 2 "Bip01 Spine" -0.64 -6.47 -7.11 5.309685 3.67 8.11
$hbox 2 "Bip01 Spine1" 0 -5.28 -6.41 4.82679 3.19 7.62
$hbox 2 "Bip01 Spine2" -1.14 -5.87 -6.75 5.792767 3.14 6.26
$hbox 2 "Bip01 Spine3" 0 -0.001453 -3.14 6.662317 2.98 4.36
$hbox 2 "Bip01 Neck" -3.112024 -3.57 -6.74 2.046985 3.18 8.12
$hbox 4 "Bip01 L Arm" 0 -2.19 -4.43 7.6 3.37 3.19
$hbox 4 "Bip01 L Arm1" 0 -1.48 -1.36 11.139763 4.68 3.93
$hbox 4 "Bip01 L Arm2" 0 -2.22 -0.64 10.314597 2.33 3.69
$hbox 4 "Bip01 L Hand" -0.07 -3.09 -2.26 4.28 1.2 2.45
$hbox 5 "Bip01 R Arm" 0 -2.04 -2.03 4.972048 4.27 0.55
$hbox 5 "Bip01 R Arm1" 0 -2.26 -2.21 11.585355 4.36 3.17
$hbox 5 "Bip01 R Arm2" -1.25 -2.3 -2.53 10.127057 2.51 2.19
$hbox 5 "Bip01 R Hand" -0.28 -6.08 -4.76 7.62 2.29 19.690001
$hbox 1 "Bip01 Head" -3.05 -6.1 -4.06 9.58 20.15 5.42

$definebone "Bip01" "" 0.233849 0.368164 39.526119 0 -89.999927 0 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0 -89.999982 -89.999927 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" -0.000004 0.000007 3.713255 1.494732 178.76971 -179.882335 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 18.045721 0 0 0 -6.961494 0 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Leg1" 17.597597 0 0 1.491753 5.727687 -0.149714 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" 0.000004 -0.000003 -3.713255 -0.994368 178.599202 179.85541 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 18.045723 0 0 0 -7.308137 0 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Leg1" 17.597595 0 0 -0.990587 5.904615 0.169023 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 1.293671 0.684478 -0.000001 -0.000057 6.542319 -0.000229 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 5.309681 -0.003834 0 0 -3.997985 0 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 4.82679 -0.004591 0 0 -5.497187 0 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 5.792763 -0.005304 0 0 0.999467 0 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 6.662312 -0.001453 0 -0.000057 26.98631 0 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" -3.112026 1.517254 4.341911 -78.540885 152.968862 -0.000802 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" 4.82723 0 0 72.200072 6.513274 6.420959 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 11.139763 0 -0.000001 0 -11.459154 -0.000001 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Arm2" 10.31459 0.000002 0.000002 0.000001 -3.997982 -89.954377 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" -2.8699 1.399662 -4.140396 78.540769 152.967305 -0.000745 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 4.972048 0 0 -72.696599 6.701142 -6.600127 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 11.58535 0 0 0.000001 -11.459154 0 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Arm2" 10.127056 0.000001 0.000001 0.000001 -3.997983 89.940163 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" 2.046982 0 0 0 -9.041159 0 0 0 0 0 0 0


$sequence "idle" {
	"patrick_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 35
	loop
}

$sequence "walk" {
	"patrick_anims\walk.smd"
	activity "ACT_WALK" 1
	{ event 1100 8 "step" }
	{ event 1100 16 "step" }
	fadein 0.2
	fadeout 0.2
	fps 50
	loop
	walkframe 16 LX
}

$sequence "attack1_1" {
	"patrick_anims\attack1_1.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 2 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack1_2" {
	"patrick_anims\attack1_2.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 2 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack1_3" {
	"patrick_anims\attack1_3.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 2 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "diesimple" {
	"patrick_anims\diesimple.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 19 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 13 LX
}

$sequence "flinch" {
	"patrick_anims\flinch.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}
