// Created by Crowbar 0.71

$modelname "faster_female.mdl"

$bodygroup "body"
{
	studio "faster.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\custom\fasterfemale\"

$attachment "head" "Bip01 Head" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 3 "Bip01 Pelvis" -3.713255 -6.04 -5.78 3.713255 1.293671 2.97
$hbox 6 "Bip01 L Leg" -3.74 -4.12 -1.13 2.77 4.98 18.105585
$hbox 8 "Bip01 L Leg1" -3.19 -2.86 -3.34 2.25 2.19 21.440001
$hbox 7 "Bip01 R Leg" -3.91 -4.09 0 3.55 4.75 18.098333
$hbox 8 "Bip01 R Leg1" -2.89 -2.94 -3.33 2.78 2.3 21.450001
$hbox 3 "Bip01 Spine" -7.11 -3.63 -0.64 8.11 6.47 5.309685
$hbox 3 "Bip01 Spine1" -7.62 -5.27 0 6.41 3.19 4.8268
$hbox 2 "Bip01 Spine2" -6.75 -3.14 -1.14 6.26 5.87 5.792779
$hbox 2 "Bip01 Spine3" -4.36 0 0 3.14 2.98 6.66231
$hbox 2 "Bip01 Neck" -8.12 -5.55 -7.9 6.74 7.4 12.37
$hbox 4 "Bip01 L Arm" -3.19 -2.19 0 4.43 3.37 7.6
$hbox 4 "Bip01 L Arm1" -3.13 -1.48 0 1.63 4.69 11.44964
$hbox 8 "Bip01 L Arm2" -1.9 -10.21 -1.48 4.9 2.68 26.110001
$hbox 5 "Bip01 R Arm" -2.03 -4.27 0 0.55 2.04 4.972043
$hbox 5 "Bip01 R Arm1" -2.21 -4.37 0 3.18 2.25 11.585343
$hbox 8 "Bip01 R Arm2" -2.36 -2.67 -0.87 2.19 10.26 26.889999
$hbox 1 "Bip01 Head" -4.24 -3.32 -2.5 3.05 5.23 8.46

$definebone "Bip01" "" 0.233849 0.368164 39.526119 0 0 89.999982 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0 0 0 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" 3.713255 -0.000004 -0.000002 19.450599 -179.999964 -95.046078 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 0 0 18.105579 0 -0.000002 0 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" -3.713255 0.000004 0.000006 12.199876 -179.999964 -94.694624 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 0 0 18.098335 0 -0.000002 0 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 0.000001 1.293671 0.684478 0.006532 0 -83.499028 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 0 0 5.309689 0.037185 -179.999964 4.009272 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 0 0 4.826797 0.077521 -179.999964 -5.498849 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 0 0 5.792782 0.080099 -179.999964 -1.043126 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 0 0 6.662312 0 0 0.000001 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" -4.339505 -0.060113 -3.46468 78.498941 -0.000003 -179.98644 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" -0.000004 0 4.827238 63.813515 0 -1.903366 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 0 0 11.449642 -0.000002 0 0 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" 4.142603 -0.056245 -3.189651 78.580643 -179.999964 -179.998721 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 0 0 4.972042 72.808157 0 1.954588 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 0 0 11.585346 -0.000002 0 0 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" -0.001132 0.929214 1.823925 0 0 0.000001 0 0 0 0 0 0


$sequence "idle" {
	"faster_swimmer_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 60
	loop
}

$sequence "run" {
	"faster_swimmer_anims\run.smd"
	activity "ACT_WALK" 1
    { event 1100 25 "step" }
    { event 1100 75 "step" }	
	fadein 0.2
	fadeout 0.2
	fps 260
	loop
	walkframe 80 LX
}

$sequence "attack1" {
	"faster_swimmer_anims\attack1.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 18 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "attack2" {
	"faster_swimmer_anims\attack2.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 17 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "attack3" {
	"faster_swimmer_anims\attack3.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 17 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "attack5" {
	"faster_swimmer_anims\attack5.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 21 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "death" {
	"faster_swimmer_anims\death.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 89 "death" }
	{ event 1100 47 "" }
	{ event 1100 47 "suicide" }
	{ event 1100 69 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
	walkframe 86
}
