extensions [gis]
breed [data-points data-point]
breed [centroids centroid]
globals [lu lu1 one two three four five six sevenone seventwo eight nine suitab s1 a i j k l n any-centroids-moved? update_res_count totalres_patches neigh] 
turtles-own [lu_t ]
patches-own [lu_p one_p two_p three_p four_p five_p six_p sevenone_p seventwo_p eight_p suitab_p ]
to setup
  clear-all
  set lu gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/lu.asc"
  ;gis:set-world-envelope gis:envelope-of lu 
  set one gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/relfy_road.asc"
  set two gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/reclafy_rail.asc"
  set three gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/wa_st_recl.asc"
  set four gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/prox_res_ras.asc"
  set five gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/mining_area.asc"
  set six gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/cid_recl.asc"
  set sevenone gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/reclass_newc21.asc"
  set seventwo gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/residential_recl.asc"
  set eight gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/agri_un_recl.asc"
  set nine gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/ind_suitab_f.asc"
  
  set suitab gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu
  set five gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu            ; five dataset is wider and lengthier than other maps, possibility is that the resolution failed to match other datasets, so to make it equal we make this command.
  
  
  gis:set-world-envelope (gis:envelope-union-of (gis:envelope-of lu)
                                                (gis:envelope-of one)
                                                (gis:envelope-of two)
                                                (gis:envelope-of three)
                                                (gis:envelope-of four)
                                                (gis:envelope-of five)
                                                (gis:envelope-of six)
                                                (gis:envelope-of sevenone)
                                                (gis:envelope-of seventwo)
                                                (gis:envelope-of eight)
                                                (gis:envelope-of nine))
 
  gis:paint lu 255 
  
;  set a gis:width-of one
;  print a
end


to classify
  ;ask turtles [
   ; set lu_t gis:raster-sample lu self
;  ]
  gis:apply-raster lu lu_p 
;  ask patches [
;
;  ifelse (lu_p = 1) or (lu_p = 3) [ set pcolor yellow ] [      ;; residential
;  ifelse (lu_p = 4) or (lu_p = 5) or (lu_p = 6) or (lu_p = 7) or (lu_p = 8) [ set pcolor blue ] [      ;; commercial
;  ifelse (lu_p = 9) or (lu_p = 10) or (lu_p = 11) or (lu_p = 12) or (lu_p = 13) or (lu_p = 14) or (lu_p = 15) [ set pcolor red ] [ ;; PSP UTIL
;  ifelse (lu_p = 16) [ set pcolor magenta ] [       ;; Industrial
;  ifelse (lu_p = 17) or (lu_p = 18) [ set pcolor cyan ] [   ;; water body
;  ifelse (lu_p = 19) or (lu_p = 20) or (lu_p = 21) [ set pcolor green ] [     ;; play grounds
;  ifelse (lu_p = 22) or (lu_p = 23) [ set pcolor orange ] [    ;; heritage
;  ifelse (lu_p = 24) or (lu_p = 25) [ set pcolor black ] [     ;; roads
;  ifelse (lu_p = 26) or (lu_p = 28) [ set pcolor lime ] [   ;; agri
;  ifelse (lu_p = 29) [ set pcolor brown ] [                  ;; vacant
;  ifelse (lu_p = 30) [ set pcolor turquoise ] [                  ;; forest
;   ] ] ] ] ] ] ] ] ] ] ]     ]          ;; 
end
   
 

to xpand
  set pcolor green
end

to classify1
  
  ask patches [
    sprout 1]
  
  ask turtles[
  if lu_p = 1 [ set shape "square" set color black ]
  if lu_p = 26  [set shape "circle" set color yellow]
  ]
end

to relfy_road
  ;set one gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/relfy_road.asc"
  gis:paint one 199 
  ;gis:set-world-envelope gis:envelope-of lu
  ;set one gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu
  gis:apply-raster one one_p 
  ask patches [
  ifelse (one_p <= 0) or (one_p >= 0)
 [ set pcolor blue ]
 [ set pcolor red ]

  ;ask patches [
   ; if (one_p = 1) or (one_p = 2) or (one_p = 3)   [set pcolor yellow ]
    ;if (one_p = 4) or (one_p = 5) or (one_p = 6) or (one_p = 7) or (one_p = 8) [set pcolor blue ]
   ]
  
end
to reclafy_rail
  ;set two gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/reclafy_rail.asc"
  gis:paint two 199 
  ;gis:set-world-envelope gis:envelope-of lu    
  gis:apply-raster two two_p 
  
  ask patches [
    if (two_p = 1) or (two_p = 2)   [set pcolor yellow ]
    if (two_p = 4) or (two_p = 5) [set pcolor blue ]
  ]
  
end

to wa_st_recl
  ;set three gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/wa_st_recl.asc"
  gis:paint three 199 
 ; gis:set-world-envelope gis:envelope-of lu    
  
  gis:apply-raster three three_p 
  
  ask patches [
    if (three_p = 1) or (three_p = 2)   [set pcolor yellow ]
    if (three_p = 4) or (three_p = 5) [set pcolor blue ]
  ]
  
end
to prox_res_ras
  ;set four gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/prox_res_ras.asc"
  gis:paint four 199 
 ; gis:set-world-envelope gis:envelope-of lu  
    
 gis:apply-raster four four_p 
ask patches [
  ifelse (four_p <= 0) or (four_p >= 0)
 [ set pcolor blue ]
 [ set pcolor red ]  
]
end
to mining_area
  ;set five gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/mining_area.asc"
  gis:paint five 255 
  ;gis:set-world-envelope gis:envelope-of lu    
  
   gis:apply-raster five five_p 
ask patches [
  ifelse (five_p <= 0) or (five_p >= 0)
 [ set pcolor blue ]
 [ set pcolor red ]  
]
  
end
to cid_recl
 ; set six gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/cid_recl.asc"
  gis:paint six 199 
 ; gis:set-world-envelope gis:envelope-of lu    
  
    gis:apply-raster six six_p 
ask patches [
  ifelse (six_p <= 0) or (six_p >= 0)
 [ set pcolor blue ]
 [ set pcolor red ]  
]
  
  
end
to reclass_newc21
  ;set sevenone gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/reclass_newc21.asc"
  gis:paint sevenone 199 
  ;gis:set-world-envelope gis:envelope-of lu  
  gis:apply-raster sevenone sevenone_p 
  
  ask patches [
    if (sevenone_p = 1) or (sevenone_p = 2)   [set pcolor yellow ]
    if (sevenone_p = 4) or (sevenone_p = 5) [set pcolor blue ]
  ]
  
    
end
to residential_recl
 ; set seventwo gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/residential_recl.asc"
  gis:paint seventwo 199 
  ;gis:set-world-envelope gis:envelope-of lu    
  
   gis:apply-raster seventwo seventwo_p 
ask patches [
  ifelse (seventwo_p <= 0) or (seventwo_p >= 0)
 [ set pcolor blue ]
 [ set pcolor red ]
  
 ; ask patches [
  ;  if (seventwo_p = 1) or (seventwo_p = 2)   [set pcolor yellow ]
   ; if (seventwo_p = 4) or (seventwo_p = 5) [set pcolor blue ]
  ]
  
  
end
to agri_un_recl
  ;set eight gis:load-dataset "E:/NetLogo 5.2.0/extrasexamples++++++/mywork/agri_un_recl.asc"
  gis:paint eight 199 
 ;gis:set-world-envelope gis:envelope-of lu
     gis:apply-raster eight eight_p 
  
  ask patches [
    if (eight_p = 1) or (eight_p = 2)   [set pcolor yellow ]
    if (eight_p = 4) or (eight_p = 5) [set pcolor blue ]
  ]
  
end

to suitab_ind_f
  gis:paint nine 1
end

to suitability
  
  
  set suitab gis:create-raster gis:width-of sevenone gis:height-of one gis:envelope-of sevenone
  
  ;gis:apply-raster suitab suitab_p
  
  ;ask patches  [
  
;suitab_p = one_p + two_p + three_p + four_p + five_p + six_p + sevenone_p + eight_p
 ; ]
;gis:paint suitab_p 189 

let x 0
repeat (gis:width-of one)
[ let y 0
  repeat (gis:height-of sevenone)
  
  [ ;ask patches
    let go gis:raster-value one x y
    let gt gis:raster-value two x y
    let gth gis:raster-value three x y
    let gf gis:raster-value four x y
    let gfi gis:raster-value five x y
    let gs gis:raster-value six x y
    let gseo gis:raster-value sevenone x y
    ;let gset gis:raster-value seventwo x y
    let ge gis:raster-value eight x y
    ;let s1 gis:raster-value suitab x y
    ;if ((go <= 0) or (go >= 0)) and ((gt <= 0) or (gt >= 0)) and 
    let s2 (go * 0.2034) + (gt * 0.1767) + (gth * 0.0774) + (gf * 0.1314) +  (gfi * 0.1108) + (gs *  0.0668) + (ge * 0.0642) + (gseo * 0.1568) ;+ gset + (gfi * 0.1108)
    ;set s1 s1 + (go + gt + gth + gf + gfi + gs  + ge) ;gseo + gset
    set s1 s2
    
    gis:set-raster-value suitab x y s1
     
  set y y + 1 ] 
 set x x + 1 ]
 
;gis:apply-raster suitab suitab_p 

gis:paint suitab 255

;ask patches [
;  ifelse suitab_p > 0.0536 ;and (suitab_p < 0.1)
; [ set pcolor blue ]
; [ set pcolor red ] ]

;ask patches [
;  ifelse (suitab_p = )  [set pcolor red ]
;    [set pcolor  blue ]

;]
end

to land_suitability
  gis:apply-raster suitab suitab_p 
 
;; ask patches [
;;  ifelse (suitab_p > 0 )  [set pcolor red ]
;;    [set pcolor  blue ]
;;
;;]
; 
 
; ask patches [
;    sprout 1]
;  
;  ask turtles[
;  if suitab_p > 6 [ set shape "square" set color red ]
;  ;if lu_p = 26  [set shape "circle" set color yellow]
;  ]
  
  end
;to resampling
;  gis:set-sampling-method lu "BILINEAR"
;;  set lu1 gis:create-raster  gis:width-of lu gis:height-of lu  gis:envelope-of lu
;;  gis:resample lu1 gis:envelope-of lu gis:width-of lu gis:height-of lu 
;  gis:paint lu 1
;end

to setup1
  ask patches [sprout-data-points 1]
  set-default-shape data-points "circle"
  ask turtles [
 
 ifelse (lu_p <= 0) or (lu_p >= 0)
 [ set color blue ]
 [ set color red ]]
show count turtles with [lu_p = 1]
  ask turtles
 [ifelse (lu_p = 1) or (color = "blue") 
 [set color blue]              ;never use lu_p or any patch variable directly, ask patches or turtles.
 [die]]
 
 set-default-shape centroids "x"
 reset-centroids
 
end

to reset-centroids
  set any-centroids-moved? true
  ask data-points [ set color red ]
  
 let colors base-colors
;let colors  one-of [ red green blue yellow ]
  ask centroids [die]
  create-centroids num-centroids [  ;num-centroids is a variable
    move-to one-of data-points ;with [data-points = 1]
    set size 10
    set color random 200;last colors + 1
    set colors random 200 ;butlast colors
  ]
  clear-all-plots
  reset-ticks
end

to go1
  if not any-centroids-moved? [stop]
  set any-centroids-moved? false
  assign-clusters
  update-clusters
  tick
end  
to assign-clusters
  ask data-points [set color [color] of closest-centroid - 2]  
end
to update-clusters
  let movement-threshold 0.1
  ask centroids [
    let my-points data-points with [ shade-of? color [ color ] of myself ]
    if any? my-points [ 
      let new-xcor mean [ xcor ] of my-points
      let new-ycor mean [ ycor ] of my-points
      if distancexy new-xcor new-ycor > movement-threshold [
        set any-centroids-moved? true
      ]
      setxy new-xcor new-ycor
    ]
  ]
  update-plots
end
to-report closest-centroid
  report min-one-of centroids [ distance myself ]
end
  to-report square-deviation
  report sum [ (distance myself) ^ 2 ] of data-points with [ closest-centroid = myself ]
end
  
  
  
  
  
  
  
  ;;;;;;;Final outcome;;;;;
  ;globals [ x y ]


to pop_proj
  if (chooser = "linear")
  [linear_cal]
  if (chooser = "exponential")
  [exponential_cal]
;  if(chooser = "geometric")
;  [geometric_cal]
  if(chooser = "logistics")
  [logarithmic_cal]
  
end

to setup2
  reset-ticks
 
end

to land_use_colors

ask patches [

  ifelse (lu_p = 1) or (lu_p = 3) [ set pcolor yellow ] [      ;; residential
  ifelse (lu_p = 4) or (lu_p = 5) or (lu_p = 6) or (lu_p = 7) or (lu_p = 8) [ set pcolor blue ] [      ;; commercial
  ifelse (lu_p = 9) or (lu_p = 10) or (lu_p = 11) or (lu_p = 12) or (lu_p = 13) or (lu_p = 14) or (lu_p = 15) [ set pcolor red ] [ ;; PSP UTIL
  ifelse (lu_p = 16) [ set pcolor magenta ] [       ;; Industrial
  ifelse (lu_p = 17) or (lu_p = 18) [ set pcolor cyan ] [   ;; water body
  ifelse (lu_p = 19) or (lu_p = 20) or (lu_p = 21) [ set pcolor green ] [     ;; play grounds
  ifelse (lu_p = 22) or (lu_p = 23) [ set pcolor orange ] [    ;; heritage
  ifelse (lu_p = 24) or (lu_p = 25) [ set pcolor black ] [     ;; roads
  ifelse (lu_p = 26) or (lu_p = 28) [ set pcolor lime ] [   ;; agri
  ifelse (lu_p = 29) [ set pcolor brown ] [                  ;; vacant
  ifelse (lu_p = 30) [ set pcolor turquoise ] [                  ;; forest
   ] ] ] ] ] ] ] ] ] ] ]     ]          ;; 

end


to linear_cal
  let year_index 13
  let year_indexprev 12
  tick-advance 12

 
 
 
  repeat 10
 
  
  [ 
   let z (28961 * year_index - 91969) 
   let z1 (28961 * year_indexprev - 91969)
   
  let new_population z
  set year_index year_index + 1
  set year_indexprev year_indexprev + 1
  
 ; print new_population
  
  let old_population z1
  tick
  let z2 (z - z1)
  let delta_population z2
  let ratio (delta_population / patch_density)
  let residential_patchesneeded ratio                                                       
  print residential_patchesneeded
  
 ;ask patches [                                                                             ; to ask how many residential patches are present
    
    ;show count patches with [ (lu_p = 1) or (lu_p = 3)]
    
    set totalres_patches count patches with [ (lu_p = 1) or (lu_p = 3)]
  
  print totalres_patches
  
 
 
 let patch_density1 (old_population / totalres_patches)
 
 ;print patch_density1
 
 ;]

 set update_res_count totalres_patches
 while [update_res_count <= (residential_patchesneeded + totalres_patches)]
 
 [residential_new]
 
 ;print update_res_count
 
 ]
   
  
end


to residential_new
  
  
  
  ask one-of patches with  [((pcolor = brown) or (pcolor = turquoise))  ]
  
  [  
      tryres
     ;land_use_colors
      
  
  ]
    
  set update_res_count update_res_count + 1
    
  print update_res_count
    
  end

to tryres
   
   ;ask patches
  set neigh count neighbors with  [pcolor = yellow]
    
    ;print neigh
    
  
   
 if ((suitab_p > 4) and (neigh > 2))
  
  
  [set pcolor yellow
 
   set plabel update_res_count]
  
    
end
  
  
   
to exponential_cal
  let x 12
  tick-advance 12
  repeat 10
  
  [ 
   let z (3535.1  * e ^ ( 0.3813 *  x)) 
  let y z
  set x x + 1
  
  print y
  tick
 
 ]
   
  
end

to logarithmic_cal
  let x 12
  tick-advance 12
  repeat 10
  
  [ 
  ; let z (110961 [ ln *  x ] - 88542 ) 
 ; let y z
  set x x + 1
  
  ;print y
  tick
 ]
   
  
end
@#$#@#$#@
GRAPHICS-WINDOW
458
10
1478
851
50
40
10.0
1
2
1
1
1
0
0
0
1
-50
50
-40
40
0
0
1
ticks
30.0

BUTTON
15
46
78
79
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
102
86
135
NIL
classify
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
159
93
192
NIL
classify1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
14
203
95
236
Land use
gis:paint lu 200
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
15
243
104
276
NIL
relfy_road
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
16
281
109
314
NIL
reclafy_rail
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
17
318
109
351
NIL
wa_st_recl
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
19
355
124
388
NIL
prox_res_ras
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
20
395
118
428
NIL
mining_area
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
21
435
94
468
NIL
cid_recl
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
21
474
140
507
NIL
reclass_newc21
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
21
513
135
546
NIL
residential_recl
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
22
551
138
584
NIL
agri_un_recl
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
107
46
190
79
NIL
suitability
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
112
104
212
137
NIL
suitab_ind_f
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
106
161
219
194
NIL
land_suitability
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
108
201
181
234
NIL
setup1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
107
243
279
276
num-centroids
num-centroids
0
200
42
1
1
NIL
HORIZONTAL

BUTTON
116
283
229
316
NIL
assign-clusters
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
117
322
235
355
NIL
update-clusters
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
128
360
191
393
NIL
go1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
122
398
238
431
NIL
reset-centroids
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

CHOOSER
309
46
447
91
chooser
chooser
"linear" "exponential" "logarithmic"
0

INPUTBOX
310
110
465
170
patch_density
900
1
0
Number

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
