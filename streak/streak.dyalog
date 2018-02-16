:Namespace streak

S←':Namespace' 'Run←{R←?⍵⍴2*29 ⋄ s←+\is←¯1↓R<1⌽R ⋄ ⌈/0,s-⌈\s-s×is}' ':EndNamespace'

DY←⎕FIX S
CD←'streak' #.codfns.Fix S
SOP←'streak',#.codfns.soext⍬
'cdrun'⎕NA SOP,'|Run_cdf P P P'
mka←'streak'∘#.codfns.MKA
frea←{}'streak'∘#.codfns.FREA

∇Run RC;L;LP;R;RP;ZP;kern;dylg;cdfn;_
⎕←RC
⍝ R←?RC⍴2*29
⍝ RP←mka R
⍝ ZP←mka ⍬
⍝ kern←'#.streak.(cdrun ZP 0 RP)'
cdfn←'#.streak.(CD.Run RC)'
dylg←'#.streak.(DY.Run RC)'
⎕←#.cmpx cdfn dylg
⍝ frea LP ⋄ frea RP ⋄ frea ZP
∇

∇Benchmark;_
Run¨256,2*13+⍳10
∇

:EndNamespace
