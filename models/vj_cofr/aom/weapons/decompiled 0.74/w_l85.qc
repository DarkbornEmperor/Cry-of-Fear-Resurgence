// Created by Crowbar 0.74

$modelname "w_l85.mdl"

$bodygroup "studio"
{
	studio "l85_1.smd"
}
$bodygroup "studio"
{
	studio "l85_2.smd"
}


$surfaceprop "weapon"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 55

$cdmaterials "models\vj_cofr\aom\weapons\l85\"

$attachment "muzzle" "Line06" 0.4 53 1.4 rotate 0 85 0
$attachment "shell" "Line06" -2.5 12 0 rotate 0 0 0

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 0 "Line06" -6.03 -1.28 -5.98 1.23 52.459999 13.52

$definebone "Line06" "" -1.182498 -2.549896 0.976728 0 0 89.999982 0 0 0 0 0 0


$sequence "idle1" {
	"w_l85_anims\idle1.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "idle2" {
	"w_l85_anims\idle2.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_l85_physics.smd"
{
	$mass 0.477739
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone " "

}
