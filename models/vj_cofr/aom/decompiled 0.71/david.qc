// Created by Crowbar 0.71

$modelname "david.mdl"

$bodygroup "body"
{
	studio "david.smd"
}
$bodygroup "knife"
{
	blank
	studio "david_p_knife_reference_crowbar.smd"
}
$bodygroup "glock"
{
	blank
	studio "david2_p_glock.smd"
}
$bodygroup "shotgun"
{
	blank
	studio "david3_p_shotgun_p_spas12_reference.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -3.867 -4.988 37.825

$cdmaterials "models\vj_cofr\aom\david\knife\"
$cdmaterials "models\vj_cofr\aom\david\pistol\"
$cdmaterials "models\vj_cofr\aom\david\shotgun\"
$cdmaterials "models\vj_cofr\aom\david\"

$attachment "knife" "Bip01 R Hand" 20 2 5 rotate 0 0 0
$attachment "pistol" "Bip01 R Hand" 10.5 0.85 3.75 rotate 0 0 0
$attachment "shotgun" "Bip01 R Hand" 30.5 2.75 6.5 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox -18.848 -26.982 -0.857 23.056 18.791 73.2

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

$definebone "Bip01" "" 0.009833 1.128318 39.526119 0 -89.999927 0 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" -0.000009 0 0 -89.980215 -89.999927 0 0 0 0 0 0 0
$definebone "Bip01 L Leg" "Bip01 Pelvis" -0.000004 0.000007 3.713254 -2.374738 176.778628 -179.684382 0 0 0 0 0 0
$definebone "Bip01 L Leg1" "Bip01 L Leg" 19.308924 0 0 0 -7.870147 0 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Leg1" 15.436488 0 0 -2.388776 4.659065 -0.181857 0 0 0 0 0 0
$definebone "Bip01 R Leg" "Bip01 Pelvis" 0.000004 -0.000003 -3.713254 2.37491 176.778628 179.684491 0 0 0 0 0 0
$definebone "Bip01 R Leg1" "Bip01 R Leg" 19.308924 0 0 0 -7.87015 0 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Leg1" 15.436487 0 0 2.388775 4.659064 0.181857 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 1.293671 0.684478 -0.000001 -0.000057 6.542319 -0.000229 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 5.309685 -0.003834 0 0 -3.997986 0 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 4.826786 -0.004591 0 0 -5.497187 0 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 5.792767 -0.005304 0 0 0.999468 0 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 6.662174 -0.001517 0 -0.000057 21.486319 0 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck" 2.046986 0 0 0 -6.041153 0 0 0 0 0 0 0
$definebone "mouth" "Bip01 Head" 0.049095 1.528282 -0.033794 -89.999982 166.508182 0 0 0 0 0 0 0
$definebone "Bip01 L Arm" "Bip01 Neck" -3.242962 1.212004 4.34191 -76.055222 -167.059255 -35.276725 0 0 0 0 0 0
$definebone "Bip01 L Arm1" "Bip01 L Arm" 3.602411 0 0.000004 62.891624 -4.911857 3.872167 0 0 0 0 0 0
$definebone "Bip01 L Arm2" "Bip01 L Arm1" 10.711311 0 0.000002 -0.000004 -21.959181 0.000002 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Arm2" 9.04789 0.000002 0 -6.861576 5.089469 -91.348377 0 0 0 0 0 0
$definebone "Bip01 L Finger0" "Bip01 L Hand" 2.366783 0.17189 -1.682507 26.386027 5.94764 4.480013 0 0 0 0 0 0
$definebone "Bip01 L Finger01" "Bip01 L Finger0" 0.928314 0.000002 0.000004 0.000004 -0.000004 -0.000001 0 0 0 0 0 0
$definebone "Bip01 L Finger02" "Bip01 L Finger01" 0.928314 0.000002 0.000002 0.000004 -0.000004 -0.000001 0 0 0 0 0 0
$definebone "Bip01 L Finger1" "Bip01 L Hand" 4.076889 -0.386311 -0.044143 -2.49294 3.004815 -0.176472 0 0 0 0 0 0
$definebone "Bip01 L Finger11" "Bip01 L Finger1" 1.389626 0 0 0 9.490866 0 0 0 0 0 0 0
$definebone "Bip01 L Finger12" "Bip01 L Finger11" 1.364563 0 0 0.000001 -0.503063 0 0 0 0 0 0 0
$definebone "Bip01 R Arm" "Bip01 Neck" -3.242962 1.212038 -4.341906 76.055277 -167.060567 35.275294 0 0 0 0 0 0
$definebone "Bip01 R Arm1" "Bip01 R Arm" 3.602412 0 0 -62.891624 -4.911856 -3.872166 0 0 0 0 0 0
$definebone "Bip01 R Arm2" "Bip01 R Arm1" 10.711304 0 0 0.000002 -21.959185 -0.000001 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Arm2" 9.047888 0 0 6.861573 5.089466 91.348371 0 0 0 0 0 0
$definebone "Bip01 R Finger0" "Bip01 R Hand" 2.366783 0.17189 1.682507 -26.386033 5.947643 -4.480012 0 0 0 0 0 0
$definebone "Bip01 R Finger01" "Bip01 R Finger0" 0.928314 0 -0.000002 -0.000006 -0.000001 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Finger02" "Bip01 R Finger01" 0.92831 0 0.000002 -0.000006 -0.000001 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Finger1" "Bip01 R Hand" 4.076889 -0.386309 0.044144 2.492936 3.004815 0.176474 0 0 0 0 0 0
$definebone "Bip01 R Finger11" "Bip01 R Finger1" 1.389624 0 0.000002 -0.000006 9.490871 0.000002 0 0 0 0 0 0
$definebone "Bip01 R Finger12" "Bip01 R Finger11" 1.364565 0 0.000001 -0.000005 -0.503061 0.000001 0 0 0 0 0 0
$definebone "SHOTGUN" "Bip01 R Hand" 2.447906 -0.548503 0.080735 -1.584286 95.523747 -74.622194 0 0 0 0 0 0

$poseparameter "aim_pitch" -90 90 loop 0
$poseparameter "aim_yaw" -90 90 loop 0
$poseparameter "head_yaw" -90 90 loop 0
$poseparameter "head" -90 90 loop 0
$poseparameter "XR" -50 50 loop 0

$weightlist "weights_david_neckturn" {
	 "Bip01" 0
	 "Bip01 Pelvis" 0
	 "Bip01 L Leg" 0
	 "Bip01 L Leg1" 0
	 "Bip01 L Foot" 0
	 "Bip01 R Leg" 0
	 "Bip01 R Leg1" 0
	 "Bip01 R Foot" 0
	 "Bip01 Spine" 0
	 "Bip01 Spine1" 0
	 "Bip01 Spine2" 0
	 "Bip01 Spine3" 0
	 "Bip01 Neck" 0
	 "Bip01 L Arm" 0
	 "Bip01 L Arm1" 0
	 "Bip01 L Arm2" 0
	 "Bip01 L Hand" 0
	 "Bip01 R Arm" 0
	 "Bip01 R Arm1" 0
	 "Bip01 R Arm2" 0
	 "Bip01 R Hand" 0
	 "Bip01 Head" 1
}

$weightlist "weights_ref_shoot_shotgun" {
	 "Bip01" 0
	 "Bip01 Pelvis" 0
	 "Bip01 L Leg" 0
	 "Bip01 L Leg1" 0
	 "Bip01 L Foot" 0
	 "Bip01 L Toe0" 0
	 "Bip01 L Toe01" 0
	 "Bip01 L Toe02" 0
	 "Bip01 R Leg" 0
	 "Bip01 R Leg1" 0
	 "Bip01 R Foot" 0
	 "Bip01 R Toe0" 0
	 "Bip01 R Toe01" 0
	 "Bip01 R Toe02" 0
	 "Bip01 Spine" 1
	 "Bip01 Spine1" 1
	 "Bip01 Spine2" 1
	 "Bip01 Spine3" 1
	 "Bip01 Neck" 1
	 "Bip01 L Arm" 1
	 "Bip01 L Arm1" 1
	 "Bip01 L Arm2" 1
	 "Bip01 L Hand" 1
	 "Bip01 L Finger0" 1
	 "Bip01 L Finger01" 1
	 "Bip01 L Finger02" 1
	 "Bip01 L Finger1" 1
	 "Bip01 L Finger11" 1
	 "Bip01 L Finger12" 1
	 "Bip01 R Arm" 1
	 "Bip01 R Arm1" 1
	 "Bip01 R Arm2" 1
	 "Bip01 R Hand" 1
	 "Bip01 R Finger0" 1
	 "Bip01 R Finger01" 1
	 "Bip01 R Finger02" 1
	 "Bip01 R Finger1" 1
	 "Bip01 R Finger11" 1
	 "Bip01 R Finger12" 1
	 "Bip01 Head" 1
	 "SHOTGUN" 1
}

$animation "aimup_corrective_animation" "barney_anims\aimup_corrective_animation.smd" {
}

$animation "aimcenter_corrective_animation" "barney_anims\aimcenter_corrective_animation.smd" {
}

$animation "aimdown_corrective_animation" "barney_anims\aimdown_corrective_animation.smd" {
}

$animation "aimright_corrective_animation" "barney_anims\aimright_corrective_animation.smd" {
}

$animation "aimleft_corrective_animation" "barney_anims\aimleft_corrective_animation.smd" {
}

$animation "neck_right_corrective_animation" "barney_anims\neck_right_corrective_animation.smd" {
}

$animation "neck_center_corrective_animation" "barney_anims\neck_center_corrective_animation.smd" {
}

$animation "neck_left_corrective_animation" "barney_anims\neck_left_corrective_animation.smd" {
}

$animation "aimleft" "barney_anims\aimleft.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimleft_corrective_animation" 0
}

$animation "aimcenter" "barney_anims\aimcenter.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimcenter_corrective_animation" 0
}

$animation "aimright" "barney_anims\aimright.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimright_corrective_animation" 0
}

$animation "aimup" "barney_anims\aimup.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimup_corrective_animation" 0
}

$animation "aimdown" "barney_anims\aimdown.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "aimdown_corrective_animation" 0
}

$animation "3way_headturn_neutral" "barney_anims\3way_headturn_neutral.smd" {
	fps 30
}

$animation "neck_right" "barney_anims\neck_right.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "neck_right_corrective_animation" 0
	weightlist "weights_david_neckturn"
}

$animation "neck_center" "barney_anims\neck_center.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "neck_center_corrective_animation" 0
	weightlist "weights_david_neckturn"
}

$animation "neck_left" "barney_anims\neck_left.smd" {
	fps 30
	// Crowbar writes this subtract option to prevent jigglebone and poseparameter problems when delta sequences are recompiled.
	subtract "neck_left_corrective_animation" 0
	weightlist "weights_david_neckturn"
}

$sequence "aim_pitch" {
	"aimup"
	"aimcenter"
	"aimdown"
	autoplay
	blend "aim_pitch" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "aim_yaw" {
	"aimright"
	"aimcenter"
	"aimleft"
	autoplay
	blend "aim_yaw" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "david_neckturn" {
	"neck_right"
	"neck_center"
	"neck_left"
	autoplay
	blend "head" -90 90
	blendwidth 3
	delta
	fadein 0.2
	fadeout 0.2
}

$sequence "ref_aim_shotgun" {
	"david_anims\ref_aim_shotgun.smd"
	"david_anims\ref_aim_shotgun_2.smd"
	activity "ACT_IDLE_STEALTH" 1
	blend "XR" -70 70
	blendwidth 2
	fadein 0.2
	fadeout 0.2
	fps 12
	loop
}

$sequence "ref_shoot_shotgun" {
	"david_anims\ref_shoot_shotgun.smd"
	"david_anims\ref_shoot_shotgun_2.smd"
	activity "ACT_RANGE_ATTACK2" 1
	blend "XR" -70 70
	blendwidth 2
	fadein 0.2
	fadeout 0.2
	fps 20
	weightlist "weights_ref_shoot_shotgun"
}

$sequence "ref_aim_onehanded" {
	"david_anims\ref_aim_onehanded.smd"
	"david_anims\ref_aim_onehanded_2.smd"
	activity "ACT_IDLE_HURT" 1
	blend "XR" -70 70
	blendwidth 2
	fadein 0.2
	fadeout 0.2
	fps 12
	loop
}

$sequence "ref_shoot_onehanded" {
	"david_anims\ref_shoot_onehanded.smd"
	"david_anims\ref_shoot_onehanded_2.smd"
	activity "ACT_RANGE_ATTACK1" 1
	blend "XR" -70 70
	blendwidth 2
	fadein 0.2
	fadeout 0.2
	fps 25
	weightlist "weights_ref_shoot_shotgun"
}

$sequence "ref_aim_crowbar" {
	"david_anims\ref_aim_crowbar.smd"
	"david_anims\ref_aim_crowbar_2.smd"
	activity "ACT_IDLE" 1
	blend "XR" -70 70
	blendwidth 2
	fadein 0.2
	fadeout 0.2
	snap
	fps 12
	loop
}

$sequence "ref_shoot_crowbar" {
	"david_anims\ref_shoot_crowbar.smd"
	"david_anims\ref_shoot_crowbar_2.smd"
	activity "ACT_MELEE_ATTACK1" 1
	blend "XR" -70 70
	blendwidth 2
	{ event 1100 6 "attack" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
	weightlist "weights_ref_shoot_shotgun"
}

$sequence "run" {
	"david_anims\run.smd"
	activity "ACT_RUN" 1
	{ event 1100 1 "step" }
	{ event 1100 14 "step" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 40
	loop
	walkframe 24 LX
}

$sequence "walk" {
	"david_anims\walk.smd"
	activity "ACT_WALK" 1
	{ event 1100 6 "step" }
	{ event 1100 14 "step" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 20
	loop
	walkframe 16 LX
}

$sequence "die_simple" {
	"david_anims\die_simple.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 9 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 22
}

$sequence "die_backwards1" {
	"david_anims\die_backwards1.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 26
}

$sequence "die_backwards" {
	"david_anims\die_backwards.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 1100 14 "death" }
	{ event 1100 30 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "die_forwards" {
	"david_anims\die_forwards.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 1100 14 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 26
}

$sequence "headshot" {
	"david_anims\headshot.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 1100 22 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 24
}

$sequence "die_spin" {
	"david_anims\die_spin.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 1100 16 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "gutshot" {
	"david_anims\gutshot.smd"
	activity "ACT_DIE_GUTSHOT" 1
	{ event 1100 22 "death" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 26
}
