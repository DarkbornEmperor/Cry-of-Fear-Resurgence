// Created by Crowbar 0.71

$modelname "ghost.mdl"

$bodygroup "studio"
{
	studio "ps2_slave_reference.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 43

$cdmaterials "models\vj_cofr\aom\abomination\"

$attachment "rhand" "Bip01 R Hand" 0 0 0 rotate 0 0 0
$attachment "lhand" "Bip01 L Hand" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 3 "Bip01 Pelvis" -5.79 -7.78 -7.05 5.41 11.79 7.36
$hbox 6 "Bip01 L Thigh" -0.33 -5.56 -2.91 21.709999 4.19 2.62
$hbox 6 "Bip01 L Calf" 0 -0.91 -1.91 13.41135 1.95 1.22
$hbox 6 "Bip01 L Foot" 0 -3.37 -6.49 9.52 8.72 4.51
$hbox 6 "Bip01 L Toe02" -4.05 -0.76 -3.34 1.18 3.53 3.07
$hbox 0 "Bone10" 0 -3.146075 0 5.692028 0 2.191403
$hbox 0 "Bone11" -3.69 -0.18 -2.23 0.17 1.98 0.27
$hbox 0 "Bone14" -0.9 -3.08 -0.14 1.93 0.65 3.33
$hbox 7 "Bip01 R Thigh" -0.35 -5.54 -2.33 21.700001 4.2 3.2
$hbox 7 "Bip01 R Calf" 0 -0.93 -0.93 13.411351 1.93 2.2
$hbox 7 "Bip01 R Foot" 0 -3.4 -4.8 9.52 8.7 6.2
$hbox 7 "Bip01 R Toe02" -4.04 -0.76 -3.36 1.19 3.53 3.04
$hbox 0 "Bone17" -1.59 -3.1 -0.14 1.23 0.63 3.33
$hbox 0 "Bone19" -1.268985 0 -3.144119 0 5.650652 0
$hbox 0 "Bone20" -0.65 -3.65 -0.15 1.85 0.21 2.01
$hbox 2 "Bip01 Spine" 0 -7.09 -4.34 6.150888 4.2 4.66
$hbox 2 "Bip01 Spine1" -1.61 -7.1 -5.81 6.181765 4.13 6.13
$hbox 2 "Bip01 Spine2" 2.24 -2.76 -2.9 18.209999 2.107881 13.23
$hbox 2 "Bip01 Spine3" 0 -1.24 -8.21 10.41 9.23 8.55
$hbox 2 "Bip01 Neck" 2.018904 -2.02 1.100415 40.408092 20.569212 33.525345
$hbox 4 "Bip01 L Clavicle" 0 -0.000002 -4.26 12.39 6.87 3.5
$hbox 4 "Bip01 L UpperArm" 0 -3.12 -2.55 22.314192 3.8 3.28
$hbox 4 "Bip01 L Forearm" 0 -2.76 -2.89 14.5 3.18 3.12
$hbox 4 "Bip01 L Hand" 0 -1.88 -2.4 8.31 4.4 2.61
$hbox 4 "Bip01 L Finger01" 0 -0.63 -0.71 5.39 2.18 1.1
$hbox 4 "Bip01 L Finger11" 0 -0.88 -0.52 5.29 2 1.32
$hbox 5 "Bip01 R Clavicle" 0 -0.000002 -3.37 12.56 6.9 4.35
$hbox 5 "Bip01 R UpperArm" 0 -2.93 -3.34 22.314194 4 2.64
$hbox 5 "Bip01 R Forearm" -0.04 -2.66 -3.13 14.32 3.28 3.03
$hbox 5 "Bip01 R Hand" -0.14 -2 -2.47 8.13 4.28 2.54
$hbox 5 "Bip01 R Finger01" 0 -0.8 -1.04 5.18 1.96 0.78
$hbox 5 "Bip01 R Finger11" 0 -1.03 -1.12 5.08 1.83 0.7
$hbox 2 "Bip01 Neck1" -4.02 -6.28 -6.73 5.02 6.29 6.81
$hbox 1 "Bip01 Head" 5.18 5.41 5.65 5.09 5.58 5.78
$hbox 0 "Bone05" -2.57 -7.17 -3.24 2.94 0 3.17
$hbox 0 "Bone06" -3.51 -6.96 -1.24 0 0 1.12
$hbox 0 "Bone07" -6.67 -6.38 -2.92 0 0 2.63
$hbox 0 "Bone22" -1.56 -2.91 0 0 0 3.55
$hbox 0 "Bone26" 0 -2.93 0 1.76 0 3.58
$skipboneinbbox

$definebone "Bip01" "" -0.022323 10.384099 31.132935 0 0 89.999982 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 -0.000008 8.274171 0 0 0 0 0 0 0 0 0
$definebone "Bip01 L Thigh" "Bip01 Pelvis" 6.353377 0.49999 -10.250006 3.16393 -179.999964 169.27322 0 0 0 0 0 0
$definebone "Bip01 L Calf" "Bip01 L Thigh" 0 -0.000002 18.50765 20.194701 0 95.374672 0 0 0 0 0 0
$definebone "Bip01 L Foot" "Bip01 L Calf" -0.000002 -0.000008 13.411247 0 0 0 0 0 0 0 0 0
$definebone "Bip01 L Toe0" "Bip01 L Foot" -0.724176 1.972244 10.763889 50.330445 0.000001 69.185343 0 0 0 0 0 0
$definebone "Bip01 L Toe01" "Bip01 L Toe0" 0 0 10.602711 35.229743 -179.999964 21.35585 0 0 0 0 0 0
$definebone "Bip01 L Toe02" "Bip01 L Toe01" 0.000004 0.000001 2.657053 -0.00002 0.000015 0.000006 0 0 0 0 0 0
$definebone "Bone10" "Bip01 L Foot" -4.589483 4.288651 3.402456 62.185806 0.000002 -130.747019 0 0 0 0 0 0
$definebone "Bone11" "Bone10" 0 0 6.862724 0.000001 -0.000002 0.000009 0 0 0 0 0 0
$definebone "Bone13" "Bip01 L Foot" -0.038408 5.701916 3.215847 23.742282 0 -111.168022 0 0 0 0 0 0
$definebone "Bone14" "Bone13" -0.000001 -0.000007 6.53743 0.000009 -0.000003 -0.000006 0 0 0 0 0 0
$definebone "Bip01 R Thigh" "Bip01 Pelvis" -6.353377 0.00001 0.000009 4.253696 0 136.811039 0 0 0 0 0 0
$definebone "Bip01 R Calf" "Bip01 R Thigh" 0 -0.000002 18.507759 6.972665 0 -153.519061 0 0 0 0 0 0
$definebone "Bip01 R Foot" "Bip01 R Calf" 0 0.000008 13.411423 0 0 0.000007 0 0 0 0 0 0
$definebone "Bip01 R Toe0" "Bip01 R Foot" -0.276459 -2.086391 10.763331 0.117743 -179.999964 39.016506 0 0 0 0 0 0
$definebone "Bip01 R Toe01" "Bip01 R Toe0" 0 0.000001 2.639122 0.096432 0 -2.492816 0 0 0 0 0 0
$definebone "Bip01 R Toe02" "Bip01 R Toe01" 0.000001 -0.000002 2.63913 0.000003 0 0.000006 0 0 0 0 0 0
$definebone "Bone16" "Bip01 R Foot" 1.457017 -5.568357 3.231642 2.961045 -179.999964 -109.587346 0 0 0 0 0 0
$definebone "Bone17" "Bone16" 0 0 6.550838 -0.000001 -0.000001 0.00001 0 0 0 0 0 0
$definebone "Bone19" "Bip01 R Foot" -3.785042 -5.195669 3.429313 40.728234 -0.000008 114.816272 0 0 0 0 0 0
$definebone "Bone20" "Bone19" -0.000001 0 6.589848 0.000001 0.000024 -0.000002 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 0.000004 3.416843 -0.969418 59.440247 0 -120.602166 0 0 0 0 0 0
$definebone "Bip01 Spine1" "Bip01 Spine" 0 -0.000002 6.150856 13.004997 -179.999964 -6.463824 0 0 0 0 0 0
$definebone "Bip01 Spine2" "Bip01 Spine1" 0.000001 0 6.181618 0 -0.000003 -0.000003 0 0 0 0 0 0
$definebone "Bip01 Spine3" "Bip01 Spine2" 1.371944 0.68171 7.8881 30.713059 0.000002 -14.111449 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine3" 0 -0.000003 9.041988 0.000005 -0.000002 -0.00001 0 0 0 0 0 0
$definebone "Bip01 L Clavicle" "Bip01 Neck" 1.39397 4.376474 -7.725079 61.784382 0.000011 -114.939202 0 0 0 0 0 0
$definebone "Bip01 L UpperArm" "Bip01 L Clavicle" 0.000011 0.000001 8.356135 21.312538 -179.999964 -161.188339 0 0 0 0 0 0
$definebone "Bip01 L Forearm" "Bip01 L UpperArm" -0.000004 -0.000001 22.314278 38.656381 -179.999978 -70.764291 0 0 0 0 0 0
$definebone "Bip01 L Hand" "Bip01 L Forearm" -0.000004 -0.000008 13.466597 0.000007 0.000003 -0.000015 0 0 0 0 0 0
$definebone "Bip01 L Finger0" "Bip01 L Hand" 2.008808 2.902691 5.802355 11.97533 0.000009 -20.256705 0 0 0 0 0 0
$definebone "Bip01 L Finger01" "Bip01 L Finger0" -0.000002 0.000004 3.530643 0.441166 0.000003 -0.234453 0 0 0 0 0 0
$definebone "Bip01 L Finger02" "Bip01 L Finger01" 0.000002 -0.000008 3.530638 -0.000012 0.000001 0.000003 0 0 0 0 0 0
$definebone "Bip01 L Finger1" "Bip01 L Hand" 3.013517 0.994289 6.030513 21.403164 0.000008 -4.17562 0 0 0 0 0 0
$definebone "Bip01 L Finger11" "Bip01 L Finger1" 0 0.000004 3.608325 0.449981 0.000009 -0.217681 0 0 0 0 0 0
$definebone "Bip01 L Finger12" "Bip01 L Finger11" -0.000002 0.000004 3.608354 -0.000012 0.000005 -0.000016 0 0 0 0 0 0
$definebone "Bip01 R Clavicle" "Bip01 Neck" 3.932177 -1.743822 -7.491257 60.877278 -179.999978 -115.136594 0 0 0 0 0 0
$definebone "Bip01 R UpperArm" "Bip01 R Clavicle" -0.000004 -0.000004 8.356116 8.979125 -0.000001 -67.454634 0 0 0 0 0 0
$definebone "Bip01 R Forearm" "Bip01 R UpperArm" -0.000002 0.000002 22.314228 74.277112 -179.999909 5.937008 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Forearm" -0.000002 0.000004 13.46656 0.000006 0.000012 0.000009 0 0 0 0 0 0
$definebone "Bip01 R Finger0" "Bip01 R Hand" 3.449533 -0.27501 5.831156 23.229212 0.000004 5.936423 0 0 0 0 0 0
$definebone "Bip01 R Finger01" "Bip01 R Finger0" -0.000004 0.000005 3.530628 0.472536 -0.000002 -0.162305 0 0 0 0 0 0
$definebone "Bip01 R Finger02" "Bip01 R Finger01" -0.000001 0.000003 3.530666 0.000021 -0.000003 0.000014 0 0 0 0 0 0
$definebone "Bip01 R Finger1" "Bip01 R Hand" 2.682316 1.744164 6.007837 17.249078 0.000006 -14.220508 0 0 0 0 0 0
$definebone "Bip01 R Finger11" "Bip01 R Finger1" 0 0.000001 3.608322 0.470929 0.000011 -0.167747 0 0 0 0 0 0
$definebone "Bip01 R Finger12" "Bip01 R Finger11" 0.000002 0.000002 3.608303 0.000012 0.000009 0.000014 0 0 0 0 0 0
$definebone "Bip01 Neck1" "Bip01 Neck" 1.655781 0.680071 2.900162 43.629251 0.000004 -17.891197 0 0 0 0 0 0
$definebone "Bip01 Head" "Bip01 Neck1" 0 -0.000001 2.848845 -0.000006 0.000001 -0.000013 0 0 0 0 0 0
$definebone "Bone05" "Bip01 Spine2" 9.602355 4.750745 2.126537 45.45452 -179.999964 160.722124 0 0 0 0 0 0
$definebone "Bone06" "Bone05" 0.000002 -0.000002 6.586599 29.159368 -179.999964 9.027347 0 0 0 0 0 0
$definebone "Bone07" "Bone06" 0.000004 0 6.262634 23.064251 -0.000007 6.299786 0 0 0 0 0 0
$definebone "Bone08" "Bone07" 0.000006 -0.000006 3.801207 0.000004 -0.000015 -0.000007 0 0 0 0 0 0
$definebone "Bone09" "Bone08" 13.853214 -3.562071 1.052895 0.000003 -0.00001 -0.000006 0 0 0 0 0 0
$definebone "Bone22" "Bone09" 0.389465 1.722048 0.605185 6.342357 -180.000005 17.646987 0 0 0 0 0 0
$definebone "Bone23" "Bone22" 0.000004 0.000008 3.469854 -0.000006 -0.00002 -0.000005 0 0 0 0 0 0
$definebone "Bone26" "Bone09" -0.413589 -1.428719 0.59123 14.674993 -179.999978 -15.523649 0 0 0 0 0 0
$definebone "Bone27" "Bone26" 0 -0.000002 3.543673 -0.000005 -0.000009 0.000014 0 0 0 0 0 0
$definebone "Bone30" "Bone08" -1.143333 0.407587 0.370869 56.521601 -180.000005 13.821529 0 0 0 0 0 0
$definebone "Bone31" "Bone30" 0.000004 -0.000006 2.927265 -0.000009 -0.000007 0.000002 0 0 0 0 0 0


$sequence "idle" {
	"ghost_anims\idle.smd"
	activity "ACT_IDLE" 2
	fadein 0.2
	fadeout 0.2
	fps 150
	loop
}

$sequence "idle2" {
	"ghost_anims\idle2.smd"
	activity "ACT_IDLE" 2
	fadein 0.2
	fadeout 0.2
	fps 150
	loop
}

$sequence "idle3" {
	"ghost_anims\idle3.smd"
	activity "ACT_IDLE" 8
	fadein 0.2
	fadeout 0.2
	fps 150
	loop
}

$sequence "crouch" {
	"ghost_anims\crouch.smd"
	activity "ACT_CROUCH" 1
	fadein 0.2
	fadeout 0.2
	fps 15
}

$sequence "walk1" {
	"ghost_anims\walk1.smd"
	activity "ACT_WALK" 1
	{ event 1100 1 "step" }
	{ event 1100 16 "step" }
	fadein 0.2
	fadeout 0.2
	fps 75
	loop
	walkframe 32 LX
}

$sequence "walk2" {
	"ghost_anims\walk2.smd"
	activity "ACT_WALK" 1
	{ event 1100 1 "step" }
	{ event 1100 16 "step" }
	fadein 0.2
	fadeout 0.2
	fps 75
	loop
	walkframe 32 LX
}

$sequence "walk3" {
	"ghost_anims\walk3.smd"
	activity "ACT_RUN" 1
	{ event 1100 1 "step" }
	{ event 1100 16 "step" }
	fadein 0.2
	fadeout 0.2
	fps 75
	loop
	walkframe 32 LX
}

$sequence "right" {
	"ghost_anims\right.smd"
	activity "ACT_TURN_LEFT" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "left" {
	"ghost_anims\left.smd"
	activity "ACT_TURN_RIGHT" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "attack1" {
	"ghost_anims\attack1.smd"
	activity "ACT_MELEE_ATTACK1" 4
	{ event 1100 7 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "flinch2" {
	"ghost_anims\flinch2.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "laflinch" {
	"ghost_anims\laflinch.smd"
	activity "ACT_FLINCH_LEFTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "raflinch" {
	"ghost_anims\raflinch.smd"
	activity "ACT_FLINCH_RIGHTARM" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "llflinch" {
	"ghost_anims\llflinch.smd"
	activity "ACT_FLINCH_LEFTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "rlflinch" {
	"ghost_anims\rlflinch.smd"
	activity "ACT_FLINCH_RIGHTLEG" 1
	fadein 0.2
	fadeout 0.2
	fps 100
}

$sequence "dieheadshot" {
	"ghost_anims\dieheadshot.smd"
	activity "ACT_DIE_HEADSHOT" 1
	{ event 1100 26 "death" }
	fadein 0.2
	fadeout 0.2
	fps 25
	walkframe 32
}

$sequence "diesimple" {
	"ghost_anims\diesimple.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 6 "death" }
	fadein 0.2
	fadeout 0.2
	fps 15
	walkframe 26
}

$sequence "diebackward" {
	"ghost_anims\diebackward.smd"
	activity "ACT_DIEBACKWARD" 1
	{ event 1100 13 "death" }
	fadein 0.2
	fadeout 0.2
	fps 20
	walkframe 28
}

$sequence "dieforward" {
	"ghost_anims\dieforward.smd"
	activity "ACT_DIEFORWARD" 1
	{ event 1100 19 "death" }
	fadein 0.2
	fadeout 0.2
	fps 40
	walkframe 18
}

$sequence "collar1" {
	"ghost_anims\collar1.smd"
	activity "ACT_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "collar2" {
	"ghost_anims\collar2.smd"
	activity "ACT_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 18
}

$sequence "jump" {
	"ghost_anims\jump.smd"
	fadein 0.2
	fadeout 0.2
	fps 45
	walkframe 30
}

$sequence "stairsup" {
	"ghost_anims\stairsup.smd"
	fadein 0.2
	fadeout 0.2
	fps 45
	loop
	walkframe 24 LX LZ
}

$sequence "pushup" {
	"ghost_anims\pushup.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "grab" {
	"ghost_anims\grab.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "updown" {
	"ghost_anims\updown.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "downup" {
	"ghost_anims\downup.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "jibber" {
	"ghost_anims\jibber.smd"
	{ event 1008 19 "" }
	{ event 1008 52 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "jabber" {
	"ghost_anims\jabber.smd"
	{ event 1008 9 "" }
	{ event 1008 39 "" }
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
