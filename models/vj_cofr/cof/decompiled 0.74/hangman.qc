// Created by Crowbar 0.74

$modelname "hangman.mdl"

$bodygroup "body"
{
	studio "ref.smd"
}


$surfaceprop "flesh"

$contents "solid"

$illumposition -0.117 -4.354 26.51

$eyeposition 0 0 72

$cdmaterials "models\vj_cofr\cof\hangman\"

$cbox 0 0 0 0 0 0

$bbox 0 0 0 0 0 0

$hboxset "default"
$hbox 0 "krok" -9.13 -4.72 -0.8 11.07 4.97 10.1
$hbox 0 "kedja" -7.58 -5.62 0 4.13 6.03 13.61
$hbox 0 "fotter" -3.97 -6.02 0 4.6 5.55 21.065914
$hbox 0 "knan" -6.89 -8.5 0 5.7 9.84 22.533558
$hbox 0 "midja" -9.16 -9.65 0 0 9.39 10.039665
$hbox 0 "magen" -4.43 -10.46 0 0.66 8.65 8.771913
$hbox 0 "revben" -4.96 -3.19 0 9.92 2.37 7.109878
$hbox 0 "brost" -4.71 -10.87 0 6.3 12.13 7.07
$hbox 0 "nacke" 0 -8.661673 -4.751932 2.528183 10.116019 2.956259
$hbox 0 "huvud1" -2.9 -1.52 -0.88 0 1.84 5.502522
$hbox 0 "huvud2" -2.6 -3.33 -1.43 3.34 2.73 5.835734
$hbox 0 "huvud3" -2.3 -2.45 -0.89 2.31 2.73 5.833313
$hbox 0 "huvud4" -2.25 -2.04 -1.13 2.25 1.72 4.840471
$hbox 0 "h_arm1" -4.33 -4.89 0 4.82 2.34 19.200001
$hbox 0 "h_arm2" -2.98 -2.42 0 5.07 4.84 17.186178
$hbox 0 "h_hand" -1.62 -1.72 -3.52 3.87 3.47 4.38
$hbox 0 "l_arm1" -3.75 -6.34 0 4.64 3.1 15.17
$hbox 0 "l_arm2" -4.82 -4.92 -1.31 3.55 5.19 18.628794
$hbox 0 "l_hand" -2.69 -1.45 -2.2 3.36 1.02 1.41
$hbox 0 "huvud5" -1.13 -1.12 -0.15 1.12 1.04 2.79

$definebone "krok" "" 0.448655 0.000047 148.129211 0 89.999982 179.501893 0 0 0 0 0 0
$definebone "kedja" "krok" 0 0 9.583664 3.795099 0 -0.11992 0 0 0 0 0 0
$definebone "fotter" "kedja" 0.000002 0 12.862274 6.160673 -179.999964 -2.866737 0 0 0 0 0 0
$definebone "knan" "fotter" 0 0 21.065887 4.192103 -179.999964 -4.790556 0 0 0 0 0 0
$definebone "midja" "knan" 0 0 22.533546 5.029883 0 3.508335 0 0 0 0 0 0
$definebone "magen" "midja" -0.000001 0 10.039658 4.868192 -179.999964 0.940911 0 0 0 0 0 0
$definebone "revben" "magen" 0 0 8.771915 8.449525 0 -5.39199 0 0 0 0 0 0
$definebone "brost" "revben" 0 0 7.109886 6.496371 0 8.386439 0 0 0 0 0 0
$definebone "nacke" "brost" -0.000001 0 6.266792 0.000003 0 0.000002 0 0 0 0 0 0
$definebone "huvud1" "nacke" 0.546184 0.231194 2.956257 13.114315 -179.999964 4.54235 0 0 0 0 0 0
$definebone "huvud2" "huvud1" 0 0 5.502529 0.108863 -179.999964 0.0864 0 0 0 0 0 0
$definebone "huvud3" "huvud2" 0 0 5.835732 0.070876 0 1.640892 0 0 0 0 0 0
$definebone "huvud4" "huvud3" 0 0 5.833313 0.050705 -179.999964 1.169579 0 0 0 0 0 0
$definebone "h_arm1" "nacke" 2.528184 -8.661667 -3.389484 32.119716 -179.999964 -168.233843 0 0 0 0 0 0
$definebone "h_arm2" "h_arm1" 0.000002 0.000001 19.076332 3.435749 -179.999964 101.877729 0 0 0 0 0 0
$definebone "h_hand" "h_arm2" -0.000002 0 17.186174 -0.000004 -0.000006 -0.000003 0 0 0 0 0 0
$definebone "l_arm1" "nacke" 1.658238 10.116016 -4.751938 34.996896 -179.999964 172.788254 0 0 0 0 0 0
$definebone "l_arm2" "l_arm1" -0.000002 -0.000001 11.144207 85.885538 179.999978 -76.691256 0 0 0 0 0 0
$definebone "l_hand" "l_arm2" 0 0 18.628784 0.000008 0.000007 -0.000008 0 0 0 0 0 0
$definebone "huvud5" "huvud4" 0 0 4.840471 -0.000001 0 0.000001 0 0 0 0 0 0


$sequence "idle" {
	"hangman_anims\idle.smd"
	activity "ACT_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}
