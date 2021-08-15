// Created by Crowbar 0.71

$modelname "flygare.mdl"

$bodygroup "body"
{
	studio "ref1.smd"
}
$bodygroup "body"
{
	studio "ref2.smd"
}

$origin 0 -10 0

$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 50

$cdmaterials "models\vj_cofr\cof\flygare\"

$attachment "range" "joint11" 0 0 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 8 "joint1" -19.16 3.7346 -46.23 20.85 14.93 47.68
$hbox 8 "joint1" -19.16 -14.7346 45.23 20.85 -12.93 47.68
$hbox 8 "joint1" -19.16 -14.7346 45.23 -17 30.93 47.68
$hbox 8 "joint1" 18.959999 -14.7346 45.23 20 30.93 47.68
$hbox 8 "joint1" 12.96 -14.7346 45.23 14 3.7346 47.68
$hbox 8 "joint1" 4.96 -14.7346 45.23 6 3.7346 47.68
$hbox 8 "joint1" -4.8 -14.7346 45.23 -3 3.7346 47.68
$hbox 8 "joint1" -13.06 -14.7346 45.23 -10.9 3.7346 47.68
$hbox 8 "joint1" -19.16 -14.7346 -46.23 20.85 -12.93 -44.68
$hbox 8 "joint1" -19.16 -14.7346 -46.23 -17 30.93 -44.68
$hbox 8 "joint1" 18.959999 -14.7346 -46.23 20 30.93 -44.68
$hbox 8 "joint1" 12.96 -14.7346 -46.23 14 3.7346 -44.68
$hbox 8 "joint1" 4.96 -14.7346 -46.23 6 3.7346 -44.68
$hbox 8 "joint1" -4.8 -14.7346 -46.23 -3 3.7346 -44.68
$hbox 8 "joint1" -13.06 -14.7346 -46.23 -10.9 3.7346 -44.68
$hbox 2 "joint2" -5.85 -5.36 -0.94 5.99 4.6 9.894682
$hbox 2 "joint3" -6.05 -4.58 0 6.4 5.89 10.634361
$hbox 2 "joint4" -6.089649 -5 -6.17 7.415394 5.58 3.100765
$hbox 6 "joint12" -3.28 -4.16 -0.14 2.67 4.23 17.479521
$hbox 6 "joint13" -2.35 -3.11 0 3.08 3.09 18.788
$hbox 7 "joint15" -2.5 -4.22 0 3.72 4.17 17.9
$hbox 7 "joint16" -2.36 -3.12 0 2.73 2.96 18.419367
$hbox 4 "joint5" -2.36 -3.64 0 4.49 2.41 12.035321
$hbox 4 "joint6" -1.83 -1.77 0 1.43 1.36 12.969434
$hbox 4 "joint7" -5.5 -0.79 -0.01 4.97 2.34 6.56
$hbox 5 "joint8" -2.81 -2.63 -1.3 4.07 3.39 9.837327
$hbox 5 "joint9" -1.73 -1.46 0 1.52 1.67 13.208929
$hbox 5 "joint10" -5.28 -1.74 0 5.22 0.71 7.2
$hbox 1 "joint11" -3.78 -3.98 -1.86 3.51 5.72 9.44
$hbox 6 "joint14" -3.22 -7.8 -0.49 2.14 2.76 5.41
$hbox 7 "joint17" -2.88 -7.81 -0.12 2.39 2.83 5.77
$skipboneinbbox

$definebone "joint1" "" 0.202055 -0.304865 73 0 0 89.999982 0 0 0 0 0 0
$definebone "joint2" "joint1" -0.172502 -1.571487 7.844354 1.450099 0 -3.31118 0 0 0 0 0 0
$definebone "joint3" "joint2" 0 -0.000053 9.894691 2.128941 179.999964 -1.00365 0 0 0 0 0 0
$definebone "joint4" "joint3" 0 0.000031 10.634373 0 0 0 0 0 0 0 0 0
$definebone "joint12" "joint1" 3.952499 0 -0.102078 1.014193 0 179.527725 0 0 0 0 0 0
$definebone "joint13" "joint12" 0 -0.000038 17.479521 2.550694 179.999964 -2.654628 0 0 0 0 0 0
$definebone "joint15" "joint1" -3.357025 0 0.112208 1.079911 179.999964 -179.53741 0 0 0 0 0 0
$definebone "joint16" "joint15" 0 0 17.694195 1.599297 0 -2.684823 0 0 0 0 0 0
$definebone "joint11" "joint4" 0.089393 0.696556 3.100773 0 0 0 0 0 0 0 0 0
$definebone "joint5" "joint4" -6.089653 -1.442833 -2.265694 85.508163 -0.000014 169.397202 0 0 0 0 0 0
$definebone "joint6" "joint5" 0.000006 0 12.035328 8.472268 179.999964 -5.461033 0 0 0 0 0 0
$definebone "joint7" "joint6" -0.000004 0.000008 12.969442 -0.000002 0 0 0 0 0 0 0 0
$definebone "joint8" "joint4" 7.415399 -1.485497 -2.605103 88.220547 179.999964 -166.872054 0 0 0 0 0 0
$definebone "joint9" "joint8" -0.000002 -0.000008 9.837334 6.520089 179.999964 7.890435 0 0 0 0 0 0
$definebone "joint10" "joint9" 0 0.000023 13.208939 0 0 -0.000003 0 0 0 0 0 0
$definebone "joint14" "joint13" 0 0.000015 18.788029 0 0 0 0 0 0 0 0 0
$definebone "joint17" "joint16" 0 0 18.419369 0 0 0 0 0 0 0 0 0


$sequence "idle1" {
	"flygare_anims\idle1.smd"
	activity "ACT_IDLE" 4
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "idle2" {
	"flygare_anims\idle2.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "forward" {
	"flygare_anims\forward.smd"
	activity "ACT_WALK" 1
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "backward" {
	"flygare_anims\backward.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "up" {
	"flygare_anims\up.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "down" {
	"flygare_anims\down.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "right" {
	"flygare_anims\right.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "left" {
	"flygare_anims\left.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "hit" {
	"flygare_anims\hit.smd"
	fadein 0.2
	fadeout 0.2
	fps 20
	loop
}

$sequence "fall" {
	"flygare_anims\fall.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "die1" {
	"flygare_anims\die1.smd"
	activity "ACT_DIESIMPLE" 1
	{ event 1100 10 "death" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "shoot" {
	"flygare_anims\shoot.smd"
	activity "ACT_RANGE_ATTACK1" 1
	{ event 1100 37 "attack_range" }
	fadein 0.2
	fadeout 0.2
	fps 20
}

$sequence "punch" {
	"flygare_anims\punch.smd"
	activity "ACT_MELEE_ATTACK1" 1
	{ event 1100 21 "attack" }
	{ event 1100 27 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "punchdown" {
	"flygare_anims\punchdown.smd"
	activity "ACT_MELEE_ATTACK2" 1
	{ event 1100 14 "attack" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "smlflinch" {
	"flygare_anims\smlflinch.smd"
	activity "ACT_SMALL_FLINCH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}
