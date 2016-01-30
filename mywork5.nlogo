extensions [csv]
extensions [gis]
;extensions [csv]
breed [data-points data-point]
breed [centroids centroid]
globals [lu lu1 one two three four five six seven seventwo eight nine ten eleven twelve thirteen fourteen suitab wards s1 a1 a2 csv c1 years filelist fileList1 xy Z1 Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9 Z10 Z11 Z12 Z13 Z14 W1  W2  W3  W4  W5  W6  W7  W8  W9  W10  W11  W12  W13  W14  W15  W16  W17  W18  W19  W20  W21  W22  W23  W24  W25  W26  W27  W28  W29  W30  W31  W32  W33  W34  W35  W36  W37  W38  W39  W40  W41  W42  W43  W44  W45  W46  W47  W48  W49  W50  W51  W52  W53  W54  W55  W56  W57  W58  W59  W60  W61  W62  W63  W64  W65  W66  W67  W68  W69  W70
a i j k l n1 any-centroids-moved? update_res_count totalres_patches neigh residential_patchesneeded]
turtles-own [lu_t ]
patches-own [lu_p one_p two_p three_p four_p five_p six_p sevenone_p seventwo_p eight_p ten_p eleven_p twelve_p suitab_p fourteen_p]
to setup
  clear-all
  set lu gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reforestas.asc"
  set one gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reforestas.asc"
  ;gis:set-world-envelope gis:envelope-of lu
  set two gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/resoildas.asc"
  set three gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/resoileas.asc"
  set four gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/resoiltas.asc"
  set five gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/regwprosas.asc"
  set six gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/relvalueas.asc"
  set seven gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reensenstias.asc"
  set eight gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reslopeas.asc"
  set nine gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/refloodhas.asc"
  set ten gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/mergebarrasas.asc"
  set eleven gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/wardmapas.asc"
  set twelve gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/croplandas.asc"
  set thirteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/undevas.asc"
  set fourteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/developas.asc"




  set suitab gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu

;set eleven gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu
 ;set twelve gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu



  gis:set-world-envelope (gis:envelope-union-of (gis:envelope-of lu)
                                                (gis:envelope-of one)
                                                (gis:envelope-of two)
                                                (gis:envelope-of three)
                                                (gis:envelope-of four)
                                                (gis:envelope-of five)
                                                (gis:envelope-of six)
                                                (gis:envelope-of seven)
                                                (gis:envelope-of eight)
                                                (gis:envelope-of nine)
                                                (gis:envelope-of ten)
                                                (gis:envelope-of eleven)
                                                (gis:envelope-of twelve)
                                                (gis:envelope-of thirteen)
                                                (gis:envelope-of fourteen))

  gis:paint four 150  ;to color the raster or the shapefile.

;  set a gis:width-of one
;  print a
end


to classify

  gis:apply-raster lu lu_p ; convert raster data into patch variable
  gis:apply-raster ten ten_p
  gis:apply-raster eleven eleven_p
  gis:apply-raster twelve twelve_p
  gis:apply-raster fourteen fourteen_p
show count patches with [eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4]

set c1 (count patches with [eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4] / 2413.425)   ; unitary method is applied here, which shows how much patches in 1 ha of area is present. Necessary if the extent of model is changed.
show c1


end



to classify1 ;just to test the assignment of shapes

  ask patches
    [
    sprout 1
    ]

  ask turtles[
  set shape "circle" set color grey

  if twelve_p = 0 [ set shape "circle" set color red ]
  if twelve_p = 2  [set shape "circle" set color yellow]
  ]
end


to suitability


  set suitab gis:create-raster gis:width-of seven gis:height-of one gis:envelope-of seven ; with actual command goes as gis:create-rater width height envelope


let x 0
repeat (gis:width-of one)
[ let y 0
  repeat (gis:height-of seven)

  [ ;ask patches
    let go gis:raster-value one x y  ; gis:raster-value RasterDataset x y [reports the value of the given raster dataset in the given cell]
    let gt gis:raster-value two x y
    let gth gis:raster-value three x y
    let gf gis:raster-value four x y
    let gfi gis:raster-value five x y
    let gs gis:raster-value six x y
    let gseo gis:raster-value seven x y
    let ge gis:raster-value eight x y
    let s2 (go * 0.2034) + (gt * 0.1767) + (gth * 0.0774) + (gf * 0.1314) +  (gfi * 0.1108) + (gs *  0.0668) + (ge * 0.0642) + (gseo * 0.1568) ;+ gset + (gfi * 0.1108)
    set s1 s2

    gis:set-raster-value suitab x y s1 ; sets the value of given raster dataset at the given cell to a new value
    ; gis:set-raster-value RasterDataset x y value

  set y y + 1 ]
 set x x + 1 ]

gis:paint suitab 150

end


to visualise
  ask turtles [
    set lu_t gis:raster-sample suitab self ;variable lu_t will store the raster data as it reads from lu
  ]
  gis:apply-raster suitab suitab_p ; convert raster data into patch variable
  gis:apply-raster twelve twelve_p




  ask patches [

;    sprout 1]
;
;  ask turtles[
  ;set shape "circle" set color grey
  if fourteen_p = 0  [ set pcolor green ]   ; works in 5 to 7.5
  ;if eleven_p = 2  [set shape "circle" set color yellow]
  ]
end


;to check
;  ask turtles[
;  if suitab_p > 6 and eleven_p = 2 [set shape "square" set color yellow]
;  ]
;
;end

to clear
 ; set fileList []

end

to openFile
  let x 0
  repeat 14
  [
  set fileList []
 ; set fileList1 []
  file-open "built.csv"
  set csv file-read-line ; reads line and report it as a string
  set csv word csv "," ;  word value1 value2 ,concatenates the inputs together and reports the result as a string
 ; show csv ; shows the first whole line of values with commas "33679,67627,29048,31176,37079,28337,30456," followed by comma at the end.

  let mylist []
  while [not empty? csv]
  [
    let $x position "," csv  ; position string1 string2 reports the first position of string1, here position  of "," is 6th starting from 0, so shown as 5.
    ;show $x ; shows output of 5, which is just the no. of digits in the population.
    let $item substring csv 0 $x ; extract item, reports just a section of the given string. extracting value from 0 to 5 with 0 inclusive and 5 exclusive.
   ; show $item ; showing the values of the population as for example "12345"
    carefully [set $item read-from-string $item] [] ; convert if number, interprets the given string as it is,
   ; show $item ; the "" are gone and the values become numbers.
   ; set $item $item * 10

    set mylist lput $item mylist ;appends value to the end of a list.
   ; show mylist ; appending the numbers in every step.
    set csv substring csv ($x + 1) length csv ; remove item and comma
    ;show csv
  ]
  ;set fileList lput mylist fileList
  show mylist
      if x = 0 [ set Z1 mylist
               show Z1
               ]
      if x = 1 [ set Z2 mylist
               ;show Z2
               ]
      if x = 2 [ set Z3 mylist
               ;show Z3
               ]
      if x = 3 [ set Z4 mylist
               ;show Z4
               ]
      if x = 4 [ set Z5 mylist
               ;show Z5
               ]
      if x = 5 [ set Z6 mylist
               ;show Z6
               ]
      if x = 6 [ set Z7 mylist
               ;show Z7
               ]
      if x = 7 [ set Z8 mylist
               ;show Z8
               ]
      if x = 8 [ set Z9 mylist
               ;show Z9
               ]
      if x = 9 [ set Z10 mylist
               ;show Z10
               ]
      if x = 10 [ set Z11 mylist
               ;show Z11
               ]
      if x = 11 [ set Z12 mylist
               ;show Z12
               ]
      if x = 12 [ set Z13 mylist
               ;show Z13
               ]
      if x = 13 [ set Z14 mylist
               ;show Z14
               ]
 set x x + 1
  ]
  ;show fileList1
 show Z1
 show Z2
 show Z3
 show Z4
 show Z5
 show Z6
 show Z7
 show Z8
 show Z9
 show Z10
 show Z11
 show Z12
 show Z13
 show Z14

file-close

end




to evolveZ1

reset-ticks

 set years 2011

 ; let zone1 count patches with [eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4] ; counting no. of pixels in Zone 1 which is collection of wards 1to 4

 ; show zone1
  foreach  Z1 [set a1 ?  * c1
 ; foreach  Z1 [let a1 ?          ; here for each years increase in built area is given
  ;show max Z1
 set a1 round(a1)

 while [ n1 < a1]
 [ask one-of patches with [(eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4) and (fourteen_p = 0)]
   [ ifelse not any? patches with [ pcolor = red ]
     [set pcolor red]
     [ ask one-of patches in-radius 3  [ set pcolor red]
   ]

   ]



;  while [ (n1 < a1) ]            ; numbers entered to run the loop
;  [ask one-of patches with [suitab_p > 6.5 and eleven_p = 1]       ; ask one of the patches is used as it will ask one patch at every time rather than all the patches in once
;      [set pcolor yellow
;        ;sprout 1
;
;      ]

   ifelse (n1 + 1 = a1)          ; a1 changes as the it moves to second value in list, hence stop function is used to halt the process.
   [ set years  years + 1  show years  ]

   [ show a1]

 show n1


tick

if  ( years > 2011 )

 [ set a2 a1

   set a2 a2 - a1

   let z1res a2 / Z1R
  let z1com a2 / Z1C
  let z1pubs a2 / Z1PS
  let z1rec a2 / Z1RC

  show a2
  show z1res
 ]

if (years = 2013)
[stop]

 set n1 n1 + 1 ]

     ]

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
@#$#@#$#@
GRAPHICS-WINDOW
515
10
1535
651
50
30
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
-30
30
0
0
1
ticks
30.0

BUTTON
5
20
68
53
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
70
20
142
53
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
145
20
210
53
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
5
70
82
103
NIL
visualise
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
5
120
82
153
NIL
openFile
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
5
195
87
228
NIL
evolveZ1
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
165
160
315
178
ZONE 1 CALCULATIONS
11
0.0
1

SLIDER
105
195
197
228
Z1R
Z1R
0.35
0.75
0.6
0.05
1
NIL
HORIZONTAL

SLIDER
205
195
297
228
Z1PS
Z1PS
0.00
0.15
0.05
0.05
1
NIL
HORIZONTAL

SLIDER
305
195
397
228
Z1RC
Z1RC
0.00
0.15
0.15
0.05
1
NIL
HORIZONTAL

SLIDER
405
195
497
228
Z1C
Z1C
0.00
0.10
0.05
0.01
1
NIL
HORIZONTAL

PLOT
5
240
500
640
plot 1
ticks
Develoed area
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"c1" 1.0 2 -817084 true "" "plot count patches with [eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4]plot c1"
"n1" 1.0 0 -7500403 true "" "plot n1"

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
NetLogo 5.3
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
1
@#$#@#$#@
