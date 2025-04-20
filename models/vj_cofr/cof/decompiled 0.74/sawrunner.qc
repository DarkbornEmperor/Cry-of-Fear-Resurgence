// Created by Crowbar 0.74

$modelname "sawrunner.mdl"

$bodygroup "body"
{
	studio "ref1.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\cof\sawrunner\"

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 3 "Bip01 Pelvis" -6.65 -6.36 -4.08458 1.423037 4.63 4.82
$hbox 6 "Bip01 L Leg" 0 -6.38 -4.66 21.969999 4.27 2.95
$hbox 6 "Bip01 L Leg1" 0 -4.59 -4.68 19.357357 2.6 2.02
$hbox 6 "Bip01 L Foot" 0 -4.08 -3.63 4.39 9.38 1.52
$hbox 7 "Bip01 R Leg" 0 -6.4 -4 21.99 4.26 3.94
$hbox 7 "Bip01 R Leg1" 0 -4.59 -3.43 19.4 2.6 3.37
$hbox 7 "Bip01 R Foot" 0 -4.08 -2.96 4.39 9.38 2.2
$hbox 2 "Bip01 Spine" -0.71 -7.12 -7.82 5.840654 4.04 8.92
$hbox 2 "Bip01 Spine1" 0 -5.8 -7.05 5.309469 3.5 8.38
$hbox 2 "Bip01 Spine2" -1.25 -6.46 -7.42 6.372044 3.45 6.89
$hbox 2 "Bip01 Spine3" 0 -0.001598 -3.45 7.328548 3.28 4.8
$hbox 2 "Bip01 Neck" -3.423227 -3.93 -7.41 2.251683 3.49 8.93
$hbox 4 "Bip01 L Arm" 0 -2.41 -4.87 8.36 3.71 3.51
$hbox 4 "Bip01 L Arm1" 0 -1.63 -1.5 12.253739 5.15 5.01
$hbox 4 "Bip01 L Arm2" 0 -2.45 -1.48 11.346057 2.58 4.08
$hbox 4 "Bip01 L Hand" -0.07 -3.4 -2.91 4.71 1.32 2.7
$hbox 5 "Bip01 R Arm" 0 -2.25 -2.24 5.469253 4.69 0.61
$hbox 5 "Bip01 R Arm1" 0 -2.49 -2.99 12.743891 4.8 3.49
$hbox 5 "Bip01 R Arm2" -1.37 -2.53 -2.79 11.139763 2.78 2.5
$hbox 5 "Bip01 R Hand" -1.93 -11.11 -2.61 14.23 2.52 34.169998
$hbox 1 "Bip01 Head" -2.63 -8.47 -5.08 10.87 5.44 5.85

$definebone "Bip01" "" 0.257234 0.40498 43.478733 0 -89.999921 0 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0 -89.999982 -89.999921 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" -0.000008 0.000008 4.08458 1.494732 178.76971 -179.882335 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 19.850286 0 0 0 -6.961495 0 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Leg1" 19.357357 0 0 1.491753 5.727687 -0.149714 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" 0.000008 -0.000003 -4.08458 -0.994368 178.599202 179.85541 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 19.850304 0 0 0 -7.308138 0 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Leg1" 19.357349 0 0 -0.990587 5.904614 0.169023 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 1.423038 0.752926 -0.000001 -0.000057 6.542319 -0.000229 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 5.840652 -0.004218 0 0 -3.997985 0 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 5.309464 -0.00505 0 0 -5.497187 0 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 6.37204 -0.005834 0 0 0.999467 0 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 7.328545 -0.001598 0 -0.000057 26.98631 0 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" -3.423218 1.668976 4.776102 -78.540885 152.968862 -0.000802 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" 5.309952 0 0.000008 72.200072 6.513276 6.420957 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 12.253735 0 0 -0.000003 -11.459154 0 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Arm2" 11.346054 0.000002 0 -0.000001 -3.997982 -89.954377 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" -3.156883 1.539629 -4.554437 78.540769 152.967305 -0.000745 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 5.469254 0 0 -72.696599 6.701149 -6.600118 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 12.743889 0.000001 -0.000002 0.000002 -11.45915 0.000001 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Arm2" 11.139755 0.000002 0 0.000002 -3.997978 89.940163 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" 2.251686 0.000002 0 0 -9.041159 0 0 0 0 0 0 0


$sequence "idle" {
	"sawrunner_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 80
	loop
}

$sequence "turnleft" {
	"sawrunner_anims\turnleft.smd"
	activity "ACT_TURN_LEFT" 1
	fadein 0.2
	fadeout 0.2
	fps 70
}

$sequence "turnright" {
	"sawrunner_anims\turnright.smd"
	activity "ACT_TURN_RIGHT" 1
	fadein 0.2
	fadeout 0.2
	fps 70
}

$sequence "flinchsmall" {
	"sawrunner_anims\flinchsmall.smd"
	activity "ACT_SMALL_FLINCH" 5
	fadein 0.2
	fadeout 0.2
	fps 45
}

$sequence "flinch" {
	"sawrunner_anims\flinch.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 40
}

$sequence "bigflinch" {
	"sawrunner_anims\bigflinch.smd"
	activity "ACT_BIG_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack1" {
	"sawrunner_anims\attack1.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 11 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "walk" {
	"sawrunner_anims\walk.smd"
	activity "ACT_WALK" 1
	{ event 1100 19 "step" }
	{ event 1100 29 "step" }
	{ event 1100 39 "step" }
	{ event 1100 49 "step" }
	{ event 1100 59 "step" }
	{ event 1100 69 "step" }
	{ event 1100 79 "step" }
	{ event 1100 89 "step" }
	{ event 1100 99 "step" }
	fadein 0.2
	fadeout 0.2
	fps 60
	loop
	walkframe 100 LX
}

$sequence "laflinch" {
	"sawrunner_anims\laflinch.smd"
	activity "ACT_FLINCH_LEFTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "raflinch" {
	"sawrunner_anims\raflinch.smd"
	activity "ACT_FLINCH_RIGHTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "llflinch" {
	"sawrunner_anims\llflinch.smd"
	activity "ACT_FLINCH_LEFTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "rlflinch" {
	"sawrunner_anims\rlflinch.smd"
	activity "ACT_FLINCH_RIGHTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "dieheadshot" {
	"sawrunner_anims\dieheadshot.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 1100 27 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 21
}

$sequence "dieheadshot2" {
	"sawrunner_anims\dieheadshot2.smd"
	activity "ACT_DIE_GUTSHOT" 1
	{ event 1100 27 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "diesimple" {
	"sawrunner_anims\diesimple.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 27 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 21
}

$sequence "diebackward" {
	"sawrunner_anims\diebackward.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 1100 27 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "dieforward" {
	"sawrunner_anims\dieforward.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 1100 27 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 21
}

$sequence "appear" {
	"sawrunner_anims\appear.smd"
	{ event 1100 0 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
}
