// Created by Crowbar 0.71

$modelname "crazyrunner.mdl"

$bodygroup "body"
{
	studio "runningcrazy.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\crazyrunner\"

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 3 "Bip01 Pelvis" -4.44 -1.909691 -6.27 5.69 4.2 6.78
$hbox 6 "Bip01 L Leg" -4.55 -3.33 0 5.78 4.99 14.55
$hbox 6 "Bip01 L Leg1" -6.2 -3.5 0 4.35 5.19 17.22526
$hbox 6 "Bip01 L Foot" -5.92 -3.16 -1.2 2.31 2.83 4.16
$hbox 7 "Bip01 R Leg" -4.72 -4.28 0 5.31 3.63 12.703526
$hbox 7 "Bip01 R Leg1" -7.01 -4.77 -0.48 5.78 2.74 17.228325
$hbox 7 "Bip01 R Foot" -6.07 -2.16 -0.1 2.39 1.41 4.54
$hbox 2 "Bip01 Spine" -7.18 -7.68 0 4.7 6.47 6.106346
$hbox 2 "Bip01 Spine1" -3.52 -5.32 -0.02 6.63 5.74 6.283793
$hbox 2 "Bip01 Spine2" -4.86 -5.66 -1.77 5.92 7.98 9.4
$hbox 2 "Bip01 Spine3" -2.36 -7.13 0 3.69 0 8.48
$hbox 2 "Bip01 Neck" -3.45 -5.272034 -3.524451 4.19 5.92 2.51
$hbox 4 "Bip01 L Arm" -1.06 0 0 0 1.68 3.64
$hbox 4 "Bip01 L Arm1" -3.16 -1.58 -0.87 2.03 3.72 7.45
$hbox 4 "Bip01 L Arm2" -2.53 -2.97 0 3.24 2.23 17.10239
$hbox 4 "Bip01 L Hand" -1.05 -11.2 -2.67 4.04 1.93 3.98
$hbox 5 "Bip01 R Arm" -2.06 -3.76 0 4.44 2.08 6.113457
$hbox 5 "Bip01 R Arm1" -3.26 -2.42 -1.96 3.24 2.27 10.568612
$hbox 5 "Bip01 R Arm2" -2.11 -2.03 -0.23 3.37 2.69 12.408042
$hbox 5 "Bip01 R Hand" -2.04 -2.69 -1.49 2.78 1.34 3.78
$hbox 1 "Bip01 Head" -8.82 -7.28 -15.88 1.33 3.87 8.46

$definebone "Bip01" "" 0.575593 0.423389 45.608368 0 89.999982 63.435307 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0.342863 0 0 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" 0.000001 -1.909691 3.819431 4.00973 0 118.988097 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 0 0 12.99696 10.829593 0 -1.27724 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Leg1" 0 0 17.225266 0.000002 0 -0.000003 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" -0.000006 1.909691 -3.819431 5.138114 0 116.302808 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 0 0 12.703526 11.328809 0 -1.701568 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Leg1" -0.000001 0 17.228329 0.000002 0 0.000001 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" -0.787151 1.330662 0.665321 14.314549 -179.999964 62.669492 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 0 0 6.10635 3.357934 -179.999964 -4.853869 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 0 0 6.283791 2.459365 -0.000001 -9.605865 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 0 0 8.450058 2.969068 -0.000002 12.446881 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 0 0 6.225204 0 -0.000002 0 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" 1.27564 -5.272036 0.621986 63.980814 -0.000002 21.828031 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" 0 0 3.055607 0.709554 -179.999964 -18.138522 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 0.000008 0 6.533024 78.098958 -0.000033 -173.483062 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Arm2" 0.000002 0.000002 17.10239 0 0.000007 0.000003 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" 0.179766 4.940069 -3.524452 0.40405 -179.999964 127.016028 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 0 0.000004 6.113461 11.04577 -179.999964 -54.698286 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 0.000001 0.000001 10.568607 6.01789 -179.999964 -15.28944 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Arm2" 0 0.000002 12.408039 -0.000001 0.000003 0.000002 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" -2.574744 0.857898 1.36554 0 -0.000002 0 0 0 0 0 0 0


$sequence "idle" {
	"crazyrunner_anims\idle.smd"
	activity "ACT_IDLE" 4
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "attack" {
	"crazyrunner_anims\attack.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 12 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "walk" {
	"crazyrunner_anims\walk.smd"
	activity "ACT_WALK" 1
	{ event 1100 0 "step" }
	{ event 1100 7 "step" }
	{ event 1100 13 "step" }
	{ event 1100 19 "step" }
	{ event 1100 24 "step" }
	{ event 1100 31 "step" }
	{ event 1100 36 "step" }
	fadein 0.2
	fadeout 0.2
	fps 40
	loop
	walkframe 36 LX
}

$sequence "dieheadshot" {
	"crazyrunner_anims\dieheadshot.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "dieheadshot2" {
	"crazyrunner_anims\dieheadshot2.smd"
	activity "ACT_DIE_GUTSHOT" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "diesimple" {
	"crazyrunner_anims\diesimple.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "diebackward" {
	"crazyrunner_anims\diebackward.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "dieforward" {
	"crazyrunner_anims\dieforward.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}
