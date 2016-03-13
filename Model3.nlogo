extensions [csv]
extensions [gis]
breed [data-points data-point]
breed [centroids centroid]
globals [lu lu1 one two three four five six seven seventwo eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty countingsprawl suitab wards s1 a1 a2 a3 adv csv c1 years xlfile filelist fileList1 xy Z1 Z1bf Z2 Z3 Z4 Z5 Z6 Z7 Z8 Z9 Z10 Z11 Z12 Z13 Z14 W1  W2  W3  W4  W5  W6  W7  W8  W9  W10  W11  W12  W13  W14  W15  W16  W17  W18  W19  W20  W21  W22  W23  W24  W25  W26  W27  W28  W29  W30  W31  W32  W33  W34  W35  W36  W37  W38  W39  W40  W41  W42  W43  W44  W45  W46  W47  W48  W49  W50  W51  W52  W53  W54  W55  W56  W57  W58  W59  W60  W61  W62  W63  W64  W65  W66  W67  W68  W69  W70
a i j k l n1 any-centroids-moved? update_res_count totalres_patches neigh residential_patchesneeded areaZ1 congestionfactZ1 roads newraster originalcongestionZ1 mylist attractx build-threshold attract z1a z2a z3a z4a z5a z6a z7a z8a z9a z10a z11a z12a z13a z14a ]

breed [ houses house ]
breed [ agents agent ]

houses-own [ stay-counter ]
agents-own [ patience-counter ]

turtles-own [lu_t ]
patches-own [lu_p model2 one_p two_p three_p four_p five_p six_p sevenone_p seventwo_p eight_p ten_p eleven_p twelve_p thirteen_p suitab_p fourteen_p fifteen_p sixteen_p seventeen_p eighteen_p nineteen_p twenty_p twentyo_p twentyt_p attraction attraction1]

to setup
  clear-all
  set lu gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reforestas.asc"

  ;gis:set-world-envelope gis:envelope-of lu
  set one gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/resoildas.asc"
  set two gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/resoileas.asc"
  set three gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/resoiltas.asc"
  set four gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/regwprosas.asc"
  set five gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/relvalueas.asc"
  set six gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reensenstias.asc"
  set seven gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reslopeas.asc"
  set eight gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/refloodhas.asc"
  set nine gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/reforestas.asc"
  set ten gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/mergebarrasas.asc"
  set eleven gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/wardmapas.asc"
  set twelve gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/croplandas.asc"
  set thirteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/undevas.asc"
  set fourteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/developas.asc"
  set fifteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/sprawlaras.asc"
  set sixteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/model1sprawlas.asc"
  set seventeen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/mainroadsbuffer.shp"
  set eighteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/eudistas.asc"
  set nineteen gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/eucldist_2.asc"
  set twenty gis:load-dataset "C:/Users/DEEPANK/Desktop/Bhopal Data collection/New Bhopal Plans/newrasters/landuse_1rasas.asc"






  set suitab gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu

 ; set fifteen gis:create-raster gis:width-of lu gis:height-of lu gis:envelope-of lu
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
                                                (gis:envelope-of fourteen)
                                                (gis:envelope-of fifteen)
                                                (gis:envelope-of sixteen)
                                                (gis:envelope-of seventeen)
                                                (gis:envelope-of eighteen)
                                                (gis:envelope-of nineteen)
                                                (gis:envelope-of twenty))


 ;gis:paint eleven 150  ;to color the raster or the shapefile.
 ; gis:paint two 150
;  set a gis:width-of one
;  print a
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to landuse

  gis:paint twenty 150

 ask patches with [twentyt_p > 0]
[
  ifelse (twenty_p = 1)
  [ set pcolor yellow set twentyt_p l1]
  [ifelse (twenty_p = 2)
    [set pcolor orange + 2 set twentyt_p l2]
    [ifelse (twenty_p = 3)
      [set pcolor blue - 1 set twentyt_p l3]
      [ifelse (twenty_p = 4)
        [set pcolor blue set twentyt_p l4]
        [ifelse (twenty_p = 5)
          [set pcolor magenta set twentyt_p l5]
          [ifelse (twenty_p = 6)
            [set pcolor magenta + 1 set twentyt_p l6]
            [ifelse (twenty_p = 7)
              [set pcolor red set twentyt_p l7]
              [ifelse (twenty_p = 8)
                [set pcolor red + 1 set twentyt_p l8]
                [ifelse (twenty_p = 9)
                  [set pcolor lime set twentyt_p l9]
                  [ifelse (twenty_p = 10)
                    [set pcolor lime - 3 set twentyt_p l10]
                    [ifelse (twenty_p = 11)
                      [set pcolor gray - 4 set twentyt_p l11]
                      [set pcolor lime + 2 set twentyt_p l12]

                         ]]]]]]]]]]]


end


to load

  foreach gis:feature-list-of seventeen
  [gis:set-drawing-color black
    gis:draw ? 1.0
  ]

  gis:apply-coverage seventeen "BUFF_DIST" seventeen_p          ; Applying polygon [vector] dataset into patch variable using "BUFF_DIST"as the property.


end




to load1
  ask patches with [seventeen_p = 15]                           ; coloring the patches which are under the roads.
  [ set pcolor red]
;  gis:paint eighteen 150
;  gis:paint nineteen 150
end



to load2


  ask patches [


  ifelse (eighteen_p < 0) or (eighteen_p > 0) [
  let x (1 / eighteen_p) * 100
  set eighteen_p x
  ]
  [ set eighteen_p 0]


  ifelse (nineteen_p < 0) or (nineteen_p > 0) [
    let x (1 / nineteen_p) * 100
    set nineteen_p x
  ]
  [ set nineteen_p 0]
  ]

end



to classify

  gis:apply-raster lu lu_p ; convert raster data into patch variable
  gis:apply-raster ten ten_p
  gis:apply-raster eleven eleven_p
  gis:apply-raster twelve twelve_p
  gis:apply-raster fourteen fourteen_p
  gis:apply-raster thirteen thirteen_p
  gis:apply-raster sixteen sixteen_p
  gis:apply-raster eighteen eighteen_p
  gis:apply-raster nineteen nineteen_p
  gis:apply-raster twenty twenty_p
  gis:apply-raster one twentyt_p





let p count patches with [sixteen_p > 0]
show p
set c1 (p / 10033.74)   ; unitary method is applied here, which shows how much patches in 1 ha of area is present. Necessary if the extent of model is changed.
show c1

landuse
end

to data

  set areaZ1 3602.68
  set congestionfactZ1 0.75
  set originalcongestionZ1 n1 / (areaZ1 * c1)

end

to-report congest


  report originalcongestionZ1


end

to-report zonewise


  let g (z1a + z2a + z3a + z4a + z5a + z6a + z7a + z8a + z9a + z10a + z11a + z12a + z13a + z14a)
  report g

end




to-report z1r
  report z1a
end

to-report z2r
  report z2a
end

to-report z3r
  report z3a
end

to-report z4r
  report z4a
end

to-report z5r
  report z5a
end

to-report z6r
  report z6a
end

to-report z7r
  report z7a
end

to-report z8r
  report z8a
end

to-report z9r
  report z9a
end

to-report z10r
  report z10a
end

to-report z11r
  report z11a
end

to-report z12r
  report z12a
end

to-report z13r
  report z13a
end

to-report z14r
  report z14a
end



to-report yearnumber

  report years

end


to-report attract1

  report attractx

end

to verticalsprawl

  gis:apply-raster one model2

  ask patches with [ model2 >= 0]

  [set model2 0]


  set countingsprawl count patches with [ sixteen_p > 0]
   ask patches with [ sixteen_p > 0]
  [set model2 1]


  show countingsprawl
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


to check
  ask patches [
  if sixteen_p = 9 [set pcolor blue]
  if sixteen_p = 7 [set pcolor red]
  if sixteen_p = 5 [set pcolor green]
  if sixteen_p = 3 [set pcolor orange]
  if sixteen_p = 1 [set pcolor pink]
  if sixteen_p = 0 [set pcolor cyan]
  ]


end


to manualoverride



;  if ((mo1 + mo2 + mo3 + mo4 + mo5 + mo0) < 26)
;  [
    ask patches [


  ifelse sixteen_p = 9
    [set sixteen_p mo1]
    [ifelse sixteen_p = 7
       [set sixteen_p mo2]
       [ifelse sixteen_p = 5
         [set sixteen_p mo3]
         [ifelse sixteen_p = 3
           [set sixteen_p mo4]
           [if sixteen_p = 1 [set sixteen_p mo5]

 ; ]
           ]]]]
  ]

end

to postcheck


  ask patches [

  if sixteen_p = 9 [set pcolor blue]
  if sixteen_p = 7 [set pcolor red]
  if sixteen_p = 5 [set pcolor green]
  if sixteen_p = 3 [set pcolor orange]
  if sixteen_p = 1 [set pcolor pink]
  if sixteen_p = 0 [set pcolor cyan]
  ]


end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to suitability


  set suitab gis:create-raster gis:width-of seven gis:height-of one gis:envelope-of seven ; with actual command goes as gis:create-rater width height envelope


let x 0
repeat (gis:width-of seven)
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
    let gn gis:raster-value nine x y

    ;let gfif gis:raster-value fifteen x y
  ;  while [(uls1 + uls2 + uls3 + uls4 + uls5 + uls6 + uls7 + uls8 + uls9) = 1]
  ;[
      let s2 (go * uls1) + (gt * uls2) + (gth * uls3) + (gf * uls4) +  (gfi * uls5) + (gs *  uls6) + (gseo * uls7) + (ge * uls8) + (gn * uls9)
    set s1 s2

    gis:set-raster-value suitab x y s1 ; sets the value of given raster dataset at the given cell to a new value
    ; gis:set-raster-value RasterDataset x y value
  ;]
  set y y + 1 ]
 set x x + 1 ]

gis:paint suitab 150

load
load1
load2
verticalsprawl

end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to visualise
  ask turtles [
    set lu_t gis:raster-sample suitab self ;variable lu_t will store the raster data as it reads from lu
  ]
  gis:apply-raster suitab suitab_p ; convert raster data into patch variable
  gis:apply-raster twelve twelve_p
  gis:apply-raster fifteen fifteen_p

  ask patches [


  ifelse suitab_p > 7.51
  [set pcolor pink]
  [ifelse (suitab_p > 6.5 and suitab_p < 7.51)
  [ set pcolor blue ]
  [ ifelse (suitab_p > 5.5 and suitab_p < 6.51)
    [ set pcolor red ]
    [ ifelse (suitab_p > 4.5 and suitab_p < 5.51)
      [ set pcolor green ]
      [ ifelse (suitab_p > 3.5 and suitab_p < 4.51)
        [ set pcolor grey ]
        [ set pcolor black ]

  ]]]
  ]]
end


to wardstozones
  ask patches [
    ifelse (eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4)
    [set eleven_p  1]
    [ifelse (eleven_p = 6 or eleven_p = 5 or eleven_p = 8 or eleven_p = 9 or eleven_p = 19)
      [set eleven_p  2]
      [ifelse (eleven_p = 10 or eleven_p = 11 or eleven_p = 12 or eleven_p = 13 or eleven_p = 14)
         [set eleven_p  3]
         [ifelse (eleven_p = 15 or eleven_p = 16 or eleven_p = 17 or eleven_p = 18 or eleven_p = 7)
             [set eleven_p  4]
             [ifelse (eleven_p = 20 or eleven_p = 21 or eleven_p = 22 or eleven_p = 23 or eleven_p = 24)
                  [set eleven_p  5]
                  [ifelse (eleven_p = 25 or eleven_p = 26 or eleven_p = 27 or eleven_p = 28 or eleven_p = 31)
                      [set eleven_p  6]
                      [ifelse (eleven_p = 30 or eleven_p = 31 or eleven_p = 32 or eleven_p = 33 or eleven_p = 34)
                         [set eleven_p  7]
                         [ifelse (eleven_p = 40 or eleven_p = 41 or eleven_p = 42 or eleven_p = 43 or eleven_p = 64 or eleven_p = 65)
                            [set eleven_p  8]
                            [ifelse (eleven_p = 35 or eleven_p = 36 or eleven_p = 37 or eleven_p = 38 or eleven_p = 39)
                               [set eleven_p  9]
                               [ifelse (eleven_p = 44 or eleven_p = 45 or eleven_p = 47 or eleven_p = 48 or eleven_p = 29)
                                  [set eleven_p  10]
                                  [ifelse (eleven_p = 49 or eleven_p = 50 or eleven_p = 51 or eleven_p = 52 or eleven_p = 53)
                                     [set eleven_p  11]
                                     [ifelse (eleven_p = 54 or eleven_p = 55 or eleven_p = 56 or eleven_p = 57 or eleven_p = 58)
                                        [set eleven_p  12]
                                        [ifelse (eleven_p = 59 or eleven_p = 60 or eleven_p = 61 or eleven_p = 62 or eleven_p = 63)
                                          [set eleven_p  13]
                                          [set eleven_p  14]



                                          ]]]]]]]]]]]]
  ]

  gis:apply-raster eleven twentyo_p

  ask patches [

  ifelse (eleven_p = 1)
  [ set twentyo_p mdz1]
  [ifelse (eleven_p = 2)
    [set twentyo_p mdz2]
    [ifelse (eleven_p = 3)
      [set twentyo_p mdz3]
      [ifelse (eleven_p = 4)
        [set twentyo_p mdz4]
        [ifelse (eleven_p = 5)
          [set twentyo_p mdz5]
          [ifelse (eleven_p = 6)
            [set twentyo_p mdz6]
            [ifelse (eleven_p = 7)
              [set twentyo_p mdz7]
              [ifelse (eleven_p = 8)
                [set twentyo_p mdz8]
                [ifelse (eleven_p = 9)
                  [set twentyo_p mdz9]
                  [ifelse (eleven_p = 10)
                    [set twentyo_p mdz10]
                    [ifelse (eleven_p = 11)
                      [set twentyo_p mdz11]
                      [ifelse (eleven_p = 12)
                        [set twentyo_p mdz12]
                        [ifelse (eleven_p = 13)
                          [set twentyo_p mdz13]
                          [set twentyo_p mdz14]

                         ]]]]]]]]]]]]
  ]

ask patches with [ twentyo_p > 2]
[ set pcolor red]


end

to clear
 ; set fileList []

end

to openFile

  set fileList []
 ; set fileList1 []
  file-open "builttotal.csv"
  set csv file-read-line ; reads line and report it as a string
  set csv word csv "," ;  word value1 value2 ,concatenates the inputs together and reports the result as a string
 ; show csv ; shows the first whole line of values with commas "33679,67627,29048,31176,37079,28337,30456," followed by comma at the end.

  set mylist []
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






file-close

end

;to builtpatchescount  ;; function made to provide code to the no . of patches built in one zone
;  ask patches [
;  let getactual = ((attraction > 14.9) - (attraction > 19.9)) + ((attraction > 19.9) - (attraction > 24.9)) + ((attraction > 24.9) - (attraction < 29.9))
;  ]
;end




to evolveZ1

reset-ticks
setup1

 set years 2010

 ; let zone1 count patches with [eleven_p = 1 or eleven_p = 2 or eleven_p = 3 or eleven_p = 4] ; counting no. of pixels in Zone 1 which is collection of wards 1to 4

 ; show zone1
  foreach  mylist [   set a1 ?  * c1
 ; foreach  Z1 [let a1 ?          ; here for each years increase in built area is given
  ;show max Z1
  if years = 2010
  [ set adv round(a1) ]

 ;set a1 round(a1)



    show a1

ifelse years = 2016
[set newraster gis:patch-dataset attraction
 gis:store-dataset newraster "Outfile_1.asc"]
[ifelse years = 2021
  [set newraster gis:patch-dataset attraction
  gis:store-dataset newraster "Outfile_2.asc"]
  [ifelse years = 2026
    [set newraster gis:patch-dataset attraction
     gis:store-dataset newraster "Outfile_3.asc"]
    [ifelse years = 2031
       [set newraster gis:patch-dataset attraction
        gis:store-dataset newraster "Outfile_4.asc"]
       [ifelse years = 2034
         [set newraster gis:patch-dataset attraction
         gis:store-dataset newraster "Outfile_5.asc"]
         [if years = 2035
           [set newraster gis:patch-dataset attraction
            gis:store-dataset newraster "Outfile_6.asc"]

       ]]]]]

while [attract < a1]
[go1]


    set years  years + 1  show years
]



end


to setup1

  setup-patches
  setup-turtles
  ;gis:apply-raster suitab attraction
  set build-threshold  floor (max-attraction / 2)   ; step 5 where agent decides whether or not to settle at particular patch.

  reset-ticks
end

to setup-patches

 gis:apply-raster suitab suitab_p
;gis:paint suitab 150
 ; gis:apply-raster sixteen attraction1

 ask patches [

 ifelse (sixteen_p > 0)  ; adding attraction due to new road patches
 [set attraction1 (sixteen_p + eighteen_p + nineteen_p + twentyt_p)]
 [set attraction1 sixteen_p + twentyt_p
 ]
 ]
  gis:apply-raster suitab attraction
ask patches [
  set attraction attraction + twentyt_p
  if attraction1 > 0
  [ set attraction attraction1]               ; taking the attraction from the sprawl and adding the values to the main attraction.
]
  ask patches with [suitab_p > 0]

  [
    set pcolor scale-color red suitab_p 1 10  ; accordingly setting color gradient.
  ]
end

to setup-turtles
  create-agents population                      ; agents are one of the two states of agent in this model.
  [
    set color blue
    set shape "default"
    set patience-counter agent-patience         ; The agent-PATIENCE slider controls how long the agents will search for high attraction squares before giving up and settling wherever they happen to be.
    set size 1                                   ; setting agent size to 1 so that it covers whole patch.
  ]
   ask turtles [ move-to one-of patches with [attraction = 9 ]]  ; asking the population variable to move to the patches with sprawl attraction equal to 9.
end

to go1
  ask agents
  [
    ifelse (confirmation)                      ; want to build returns true or false statement, after which block works
    [
      set breed houses                           ; if True is reported, the agent changes its breed to houses.
      set shape "sheep"            ;  setting the shape from shapes library which shows construction worker.
      set stay-counter wait-between-seeking      ; setting stay-counter to wait between seeking is at what time(ticks) agent will wait in the same place before moving over.
    ]
    [
      if (patience-counter) > 0
      [
        turn-toward-attraction                   ; function which defines how agents have to move forward.
        fd 1
        set patience-counter patience-counter - 1 ;reduces the patience counter as it moves forward.

        ifelse (model2 <= twentyo_p)

        [set attraction attraction + 0.05]           ; increasing attraction of every patch from where the agent moves to 0.01.
        [set attraction attraction + 0.001]
      ]
    ]

  ]
  ask houses
  [

    ifelse attraction <= (max-attraction * 2)    ;if attraction of particular patch is less than max-attraction which is user defined
      [ ifelse (model2 <= twentyo_p)
        [set attraction attraction + .1 ]
        [set attraction attraction + 0.001]  ]            ; it will be added 0.05 otherwise if attraction has exeeded, it will be awarded a zero and then that area is
      [ set shape "triangle" ]                       ; not attractive anymore unless other agent come.

    set stay-counter stay-counter - 1            ; after agents became houses, the stay-counter decreases with every tick
    if (stay-counter) <= 0                       ; if stay-counter becomes less than or equal to zero, houses will change to agents again.
    [
      set breed agents
      set patience-counter agent-patience       ;setting patience-counter to the value of agent-patience.
      set shape "default"
    ]
  ]
  ask patches with [suitab_p > 0]
  [
   set pcolor scale-color green attraction 2.5 10
   if (attraction > 15) and (attraction < 20)
   [set pcolor pink]
   if (attraction > 19.9) and (attraction < 25)
   [set pcolor yellow]
   if attraction > 29.9
   [set pcolor orange]

   ]


  ask patches with [ (attraction > 14.9) and (attraction < 15.1) ]
  [ set model2  2 ]
  ask patches with [ (attraction > 19.9) and (attraction < 20.1) ]
  [ set model2  3 ]
  ask patches with [ (attraction > 24.9) and (attraction < 29.9) ]
  [ set model2  4 ]
  ask patches with [ (attraction > 29.9) ]
  [ set model2  5 ]

  let z1b count patches with [model2 > 1]

 ; let z1d (abs(z1b - countingsprawl))



  set attractx z1b
  set attract z1b + adv
  show attract


  set z1a count patches with [ (model2 > 1) and (eleven_p = 1) ]
  set z2a count patches with [ (model2 > 1) and (eleven_p = 2) ]
  set z3a count patches with [ (model2 > 1) and (eleven_p = 3) ]
  set z4a count patches with [ (model2 > 1) and (eleven_p = 4) ]
  set z5a count patches with [ (model2 > 1) and (eleven_p = 5) ]
  set z6a count patches with [ (model2 > 1) and (eleven_p = 6) ]
  set z7a count patches with [ (model2 > 1) and (eleven_p = 7) ]
  set z8a count patches with [ (model2 > 1) and (eleven_p = 8) ]
  set z9a count patches with [ (model2 > 1) and (eleven_p = 9) ]
  set z10a count patches with [ (model2 > 1) and (eleven_p = 10) ]
  set z11a count patches with [ (model2 > 1) and (eleven_p = 11) ]
  set z12a count patches with [ (model2 > 1) and (eleven_p = 12) ]
  set z13a count patches with [ (model2 > 1) and (eleven_p = 13) ]
  set z14a count patches with [ (model2 > 1) and (eleven_p = 14) ]


;  if  x > 500
;
;  [stop]

  tick
end

to-report confirmation


  ifelse attraction1 > 0   ; 7 shows 1981 sprawl, it says to falsify the statement if agents come over 1972 sprawl area.
  [  report (random attraction >= build-threshold or patience-counter = 0); and model2 <= twentyo_p)
   ] ; reporting true or false based on the this code, which basically says if patch attraction no. is greater or patience for agent has ended.
  [  report (random attraction >= build-threshold or patience-counter = 0) ; and model2 <= twentyo_p) ;or if not any? turtles-on patches
  ]

end





to turn-toward-attraction
  let loc [attraction] of patch-here
  if (loc > 0) or (loc < 0)
   [
  let ahead [attraction] of patch-ahead 1
  if not ( (ahead <= 0) or (ahead >= 0) )
  [lt random 180]
  let myright [attraction] of patch-right-and-ahead agent-search-angle 1
  if not ( (myright <= 0) or (myright >= 0) )
  [lt random 180]
  let myleft [attraction] of patch-left-and-ahead agent-search-angle 1
  if not ( (myleft <= 0) or (myleft >= 0) )
  [lt random 180]
  ifelse ((myright > ahead) and (myright > myleft))
  [
    rt random agent-search-angle
  ]
  [
    if (myleft > ahead)
      [ lt random agent-search-angle ]
  ]
 ]
end
@#$#@#$#@
GRAPHICS-WINDOW
535
35
1550
821
100
75
5.0
1
2
1
1
1
0
1
1
1
-100
100
-75
75
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
210
20
287
53
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
70
82
103
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
115
87
148
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

PLOT
5
160
195
280
Ticks/Year
ticks
years
0.0
600.0
2010.0
2040.0
false
false
"" ""
PENS
"years" 1.0 1 -7500403 true "" "plot years"

MONITOR
90
180
145
225
NIL
ticks
17
1
11

MONITOR
35
180
85
225
NIL
yearnumber
17
1
11

SLIDER
5
475
130
508
max-attraction
max-attraction
0
15
15
1
1
NIL
HORIZONTAL

SLIDER
5
510
130
543
population
population
0
700
495
1
1
NIL
HORIZONTAL

SLIDER
5
545
130
578
agent-patience
agent-patience
0
100
100
1
1
NIL
HORIZONTAL

SLIDER
5
580
130
613
wait-between-seeking
wait-between-seeking
0
20
5
1
1
NIL
HORIZONTAL

SLIDER
5
615
130
648
agent-search-angle
agent-search-angle
0
360
360
1
1
NIL
HORIZONTAL

PLOT
5
285
205
435
No.of Patches Built
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot  attract"

TEXTBOX
345
15
495
45
MANUAL OVERRIDE FACTORS FOR SPRAWL
12
95.0
1

SLIDER
340
50
512
83
mo1
mo1
0
5
1
0.5
1
NIL
HORIZONTAL

SLIDER
340
90
512
123
mo2
mo2
0
5
2
0.5
1
NIL
HORIZONTAL

SLIDER
340
130
512
163
mo3
mo3
0
5
3
0.5
1
NIL
HORIZONTAL

SLIDER
340
175
512
208
mo4
mo4
0
5
4
0.5
1
NIL
HORIZONTAL

SLIDER
340
220
512
253
mo5
mo5
0
5
5
0.5
1
NIL
HORIZONTAL

BUTTON
355
260
418
293
NIL
check
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
420
260
505
293
NIL
manualoverride
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
355
295
442
328
NIL
postcheck
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
10
455
160
473
AGENT BEHAVIOURS
12
95.0
1

TEXTBOX
555
805
705
861
FACTORS FOR UNDEVELOPED LAND SUITABILITY
12
95.0
1

TEXTBOX
555
850
700
990
1. SOIL DEPTH\n2. SOIL EROSION\n3. SOIL TEXTURE\n4. GROUNDWATER PROS.\n5. LAND VALUE\n6. ENVIR. SENSITIVITY\n7. SLOPE PERCENTAGE\n8. FLOOD HAZARD\n9. FOREST AREAS\n
12
0.0
1

SLIDER
710
805
802
838
uls1
uls1
0
1
0.05
0.01
1
NIL
HORIZONTAL

SLIDER
805
805
897
838
uls2
uls2
0
1
0.05
0.01
1
NIL
HORIZONTAL

SLIDER
710
840
802
873
uls3
uls3
0
1
0.05
0.05
1
NIL
HORIZONTAL

SLIDER
805
840
897
873
uls4
uls4
0
1
0.1
0.01
1
NIL
HORIZONTAL

SLIDER
710
875
802
908
uls5
uls5
0
1
0.15
0.01
1
NIL
HORIZONTAL

SLIDER
805
875
897
908
uls6
uls6
0
1
0.05
0.01
1
NIL
HORIZONTAL

SLIDER
710
910
802
943
uls7
uls7
0
1
0.15
0.01
1
NIL
HORIZONTAL

SLIDER
805
910
897
943
uls8
uls8
0
1
0.1
0.01
1
NIL
HORIZONTAL

SLIDER
710
945
802
978
uls9
uls9
0
1
0.25
0.01
1
NIL
HORIZONTAL

PLOT
5
705
300
1075
plot 1
NIL
NIL
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Z1" 1.0 0 -16777216 true "" "plot  z1a"
"Z2" 1.0 0 -7500403 true "" "plot  z2a"
"Z3" 1.0 0 -2674135 true "" "plot  z3a"
"Z4" 1.0 0 -955883 true "" "plot  z4a"
"Z5" 1.0 0 -6459832 true "" "plot  z5a"
"Z6" 1.0 0 -1184463 true "" "plot  z6a"
"Z7" 1.0 0 -10899396 true "" "plot  z7a"
"Z8" 1.0 0 -13840069 true "" "plot  z8a"
"Z9" 1.0 0 -14835848 true "" "plot  z9a"
"Z10" 1.0 0 -11221820 true "" "plot  z10a"
"Z11" 1.0 0 -13791810 true "" "plot  z11a"
"Z12" 1.0 0 -13345367 true "" "plot  z12a"
"Z13" 1.0 0 -8630108 true "" "plot  z13a"
"Z14" 1.0 0 -5825686 true "" "plot  z14a"

MONITOR
215
380
270
425
NIL
zonewise
17
1
11

MONITOR
215
330
272
375
NIL
attract1
17
1
11

BUTTON
100
70
207
103
NIL
wardstozones
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
310
705
367
750
NIL
z1r
17
1
11

MONITOR
370
705
427
750
NIL
z2r
17
1
11

MONITOR
430
705
487
750
NIL
z3r
17
1
11

MONITOR
310
760
367
805
NIL
z4r
17
1
11

MONITOR
370
760
427
805
NIL
z5r
17
1
11

MONITOR
430
760
487
805
NIL
z6r
17
1
11

MONITOR
310
815
367
860
NIL
z7r
17
1
11

MONITOR
370
815
427
860
NIL
z8r
17
1
11

MONITOR
430
815
487
860
NIL
z9r
17
1
11

MONITOR
310
870
367
915
NIL
z10r
17
1
11

MONITOR
370
870
427
915
NIL
z11r
17
1
11

MONITOR
430
870
487
915
NIL
z12r
17
1
11

MONITOR
310
925
367
970
NIL
z13r
17
1
11

MONITOR
370
925
427
970
NIL
z14r
17
1
11

TEXTBOX
305
60
340
266
1972\n\n\n1981\n\n\n1991\n\n\n2001\n\n\n2011\n
11
0.0
1

MONITOR
215
285
287
330
NIL
attract
17
1
11

INPUTBOX
945
805
995
865
mdz1
2
1
0
Number

INPUTBOX
1000
805
1050
865
mdz2
1
1
0
Number

INPUTBOX
1055
805
1105
865
mdz3
3
1
0
Number

INPUTBOX
1110
805
1160
865
mdz4
4
1
0
Number

INPUTBOX
1165
805
1215
865
mdz5
2
1
0
Number

INPUTBOX
1220
805
1270
865
mdz6
1
1
0
Number

INPUTBOX
1275
805
1325
865
mdz7
3
1
0
Number

INPUTBOX
945
870
995
930
mdz8
4
1
0
Number

INPUTBOX
1000
870
1050
930
mdz9
2
1
0
Number

INPUTBOX
1055
870
1105
930
mdz10
1
1
0
Number

INPUTBOX
1110
870
1160
930
mdz11
3
1
0
Number

INPUTBOX
1165
870
1215
930
mdz12
4
1
0
Number

INPUTBOX
1220
870
1270
930
mdz13
2
1
0
Number

INPUTBOX
1275
870
1325
930
mdz14
1
1
0
Number

TEXTBOX
370
335
480
353
MANUAL OVERRIDE
12
95.0
1

TEXTBOX
345
430
495
448
LANDUSE ATTRACTION
12
94.0
1

SLIDER
285
450
322
542
l1
l1
0
5
3
0.1
1
NIL
VERTICAL

SLIDER
325
450
362
542
l2
l2
0
5
5
0.1
1
NIL
VERTICAL

SLIDER
365
450
402
542
l3
l3
0
5
4
0.1
1
NIL
VERTICAL

SLIDER
405
450
442
542
l4
l4
0
5
3
0.1
1
NIL
VERTICAL

SLIDER
447
450
480
542
l5
l5
0
5
1
0.1
1
NIL
VERTICAL

SLIDER
485
450
522
542
l6
l6
0
5
2
0.1
1
NIL
VERTICAL

SLIDER
285
545
318
637
l7
l7
0
5
1
0.1
1
NIL
VERTICAL

SLIDER
325
545
362
637
l8
l8
0
5
2
0.1
1
NIL
VERTICAL

SLIDER
365
545
402
637
l9
l9
0
5
0
0.1
1
NIL
VERTICAL

SLIDER
405
545
442
637
l10
l10
0
5
0
0.1
1
NIL
VERTICAL

SLIDER
445
545
482
637
l11
l11
0
5
0
0.1
1
NIL
VERTICAL

SLIDER
485
545
522
637
l12
l12
0
5
3
0.1
1
NIL
VERTICAL

TEXTBOX
145
465
275
631
l1 : RESIDENTIAL\nl2 : RESIDENTIAL PRP.\nl3 : COMMERCIAL\nl4 : COMMERCIAL PRP.\nl5 : INDUSTRIAL\nl6 : INDUSTRIAL PRP.\nl7 : PUBLIC/S-PUBLIC\nl8 : PUBLIC/S-PUBLIC PRP.\nl9 : RECREATION\nl10: RECREATION PRP.\nl11: ROAD NETWORKS\nl12: AGRICULTURE
11
93.0
1

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

person construction
false
0
Rectangle -7500403 true true 123 76 176 95
Polygon -1 true false 105 90 60 195 90 210 115 162 184 163 210 210 240 195 195 90
Polygon -13345367 true false 180 195 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285
Circle -7500403 true true 110 5 80
Line -16777216 false 148 143 150 196
Rectangle -16777216 true false 116 186 182 198
Circle -1 true false 152 143 9
Circle -1 true false 152 166 9
Rectangle -16777216 true false 179 164 183 186
Polygon -955883 true false 180 90 195 90 195 165 195 195 150 195 150 120 180 90
Polygon -955883 true false 120 90 105 90 105 165 105 195 150 195 150 120 120 90
Rectangle -16777216 true false 135 114 150 120
Rectangle -16777216 true false 135 144 150 150
Rectangle -16777216 true false 135 174 150 180
Polygon -955883 true false 105 42 111 16 128 2 149 0 178 6 190 18 192 28 220 29 216 34 201 39 167 35
Polygon -6459832 true false 54 253 54 238 219 73 227 78
Polygon -16777216 true false 15 285 15 255 30 225 45 225 75 255 75 270 45 285

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
