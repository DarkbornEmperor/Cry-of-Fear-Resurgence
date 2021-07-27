// Created by Crowbar 0.71

$modelname "slower10.mdl"

$bodygroup "body"
{
	studio "refslower.smd"
	studio "refslower_2.smd"
	studio "refslower_3.smd"
	studio "headless.smd"
	studio "headless_2.smd"
	studio "headless_3.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -1.265 -12.041 36.66

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\slower10\"

$attachment "head" "Bip01 Neck" 0 0 0 rotate 0 0 -90

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

$definebone "Bip01" "" 0.233849 0.368164 39.526119 0 -89.999921 0 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0 -89.999982 -89.999921 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" -0.000004 0.000007 3.713255 1.494732 178.76971 -179.882335 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 18.045721 0 0 0 -6.961496 0 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Leg1" 17.597597 0 0 1.491753 5.727686 -0.149714 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" 0.000004 -0.000003 -3.713255 -0.994368 178.599202 179.85541 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 18.045719 0 0 0 -7.308139 0 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Leg1" 17.597591 0 0 -0.990587 5.904614 0.169023 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 1.293671 0.684478 -0.000001 -0.000057 6.542319 -0.000229 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 5.309673 -0.003834 0 0 -3.997985 0 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 4.82679 -0.004591 0 0 -5.497187 0 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 5.792763 -0.005304 0 0 0.999467 0 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 6.662304 -0.001453 0 -0.000057 26.98631 0 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" -3.112022 1.517252 4.341911 -78.540885 152.968862 -0.000802 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" 4.827229 0 0 72.200072 6.513277 6.420955 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 11.139763 0 0.000002 -0.000006 -11.459154 0.000001 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Arm2" 10.314575 0.000001 0.000005 -0.000003 -3.997983 -89.954377 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" -2.869892 1.39966 -4.140396 78.540769 152.967305 -0.000745 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 4.972048 0 -0.000008 -72.696599 6.701156 -6.600109 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 11.58535 0 0 0.000004 -11.459146 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Arm2" 10.12706 0.000003 0.000002 0.000004 -3.997972 89.940163 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" 2.046986 0 0 0 -9.041159 0 0 0 0 0 0 0


$sequence "idle" {
	"slower10_anims\idle.smd"
	activity "ACT_IDLE" 4
	fadein 0.2
	fadeout 0.2
	fps 35
	loop
}

$sequence "turnleft" {
	"slower10_anims\turnleft.smd"
	activity "ACT_TURN_LEFT" 1
	fadein 0.2
	fadeout 0.2
	fps 65
}

$sequence "turnright" {
	"slower10_anims\turnright.smd"
	activity "ACT_TURN_RIGHT" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "flinchsmall" {
	"slower10_anims\flinchsmall.smd"
	activity "ACT_SMALL_FLINCH" 5
	fadein 0.2
	fadeout 0.2
	fps 45
}

$sequence "flinch" {
	"slower10_anims\flinch.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 40
}

$sequence "bigflinch" {
	"slower10_anims\bigflinch.smd"
	activity "ACT_BIG_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "attack1" {
	"slower10_anims\attack1.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 27 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 70
}

$sequence "attack2" {
	"slower10_anims\attack2.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 37 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 70
}

$sequence "attack3" {
	"slower10_anims\attack3.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 13 "attack" }
	{ event 1100 24 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 52
}

$sequence "walk" {
	"slower10_anims\walk.smd"
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
	fps 70
	loop
	walkframe 100 LX
}

$sequence "laflinch" {
	"slower10_anims\laflinch.smd"
	activity "ACT_FLINCH_LEFTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "raflinch" {
	"slower10_anims\raflinch.smd"
	activity "ACT_FLINCH_RIGHTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "llflinch" {
	"slower10_anims\llflinch.smd"
	activity "ACT_FLINCH_LEFTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "rlflinch" {
	"slower10_anims\rlflinch.smd"
	activity "ACT_FLINCH_RIGHTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "dieheadshot" {
	"slower10_anims\dieheadshot.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 1100 19 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 13
}

$sequence "dieheadshot2" {
	"slower10_anims\dieheadshot2.smd"
	activity "ACT_DIE_GUTSHOT" 1
	{ event 1100 18 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "diesimple" {
	"slower10_anims\diesimple.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 13 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 13
}

$sequence "diebackward" {
	"slower10_anims\diebackward.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "dieforward" {
	"slower10_anims\dieforward.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 1100 21 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 13
}

$sequence "creteappidle" {
	"slower10_anims\creteappidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "creteapp" {
	"slower10_anims\creteapp.smd"
	{ event 1100 0 "" }
	{ event 1100 25 "" }
	fadein 0.2
	fadeout 0.2
	fps 45
}

$sequence "plitappear" {
	"slower10_anims\plitappear.smd"
	{ event 1100 40 "step" }
	{ event 1100 10 "" }
	fadein 0.2
	fadeout 0.2
	fps 35
}

$sequence "plitappearidle" {
	"slower10_anims\plitappearidle.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "headdeath" {
	"slower10_anims\headdeath.smd"
	activity "ACT_DIEVIOLENT" 1
	{ event 1100 50 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}
