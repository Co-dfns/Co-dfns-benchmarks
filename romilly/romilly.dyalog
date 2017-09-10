:Namespace romilly
  ⎕IO←0

S←⊂':Namespace'
S,←⊂'spin←{z←(¯2⊖⍵)⍪(¯1⊖⍵)⍪⍵⍪(1⊖⍵)⍪2⊖⍵ ⋄ (25,⍴⍵)⍴(¯2⌽z)⍪(¯1⌽z)⍪z⍪(1⌽z)⍪2⌽z}'
S,←⊂'granule3←{s←spin ⍵ ⋄ (4×+⌿⍺×s)>+⌿s}'
S,←⊂':EndNamespace'

g3connector←{⍺←4 ⋄ ⍺≥?25⍴⍨25,⍵}
g3inputs←{1=?⍵⍴2}

DY←⎕FIX S
CD←'romilly' #.codfns.Fix S
SOP←#.codfns.BSO'romilly'
⍝'cdgranule3'⎕NA SOP,'|granule3bb P P P'
mka←'romilly'∘#.codfns.MKA
frea←'romilly'∘#.codfns.FREA

∇Run X;conn;inpt;connp;inptp;resp;kern;cdfn;dylg
⎕←X
conn←g3connector X X
inpt←g3inputs X X
⍝connp←mka conn
⍝inptp←mka inpt
⍝resp←mka ⍬
kern←'#.romilly.(cdgranule3 resp connp inptp)'
cdfn←'#.romilly.(conn CD.granule3 inpt)'
dylg←'#.romilly.(conn DY.granule3 inpt)'
⎕←#.cmpx cdfn dylg
⍝frea connp ⋄ frea inptp ⋄ frea resp
∇

∇Benchmark
Run 5000
∇

:EndNamespace
