:Namespace blackscholes

S←':Namespace' 'r←0.02	⋄ v←0.03' 
S,←⊂'coeff←0.31938153 ¯0.356563782 1.781477937 ¯1.821255978 1.33027442'
S,←⊂'CNDP2←{L←|⍵ ⋄ B←⍵≥0'
S,←⊂'R←(÷(○2)*0.5)×(*(L×L)÷¯2)×((÷1+0.2316419×L)∘.*1+⍳5)+.×coeff'
⍝S,←⊂'R←(÷(○2)*0.5)×(*(L×L)÷¯2)×(×\5/⍪÷1+0.2316419×L)+.×coeff'
S,←'(1 ¯1)[B]×((0 ¯1)[B])+R' '}'
S,←'Run←{' 'S←0⌷⍵ ⋄ X←1⌷⍵ ⋄ T←⍺ ⋄ vsqrtT←v×T*0.5'
S,←⊂'D1←((⍟S÷X)+(r+(v*2)÷2)×T)÷vsqrtT ⋄ D2←D1-vsqrtT'
S,←⊂'CD1←CNDP2 D1 ⋄ CD2←CNDP2 D2 ⋄ e←*(-r)×T'
S,←⊂'((S×CD1)-X×e×CD2),[0.5](X×e×1-CD2)-S×1-CD1'
S,←'}' ':EndNamespace'

GD←{⍉↑(5+?⍵⍴25)(1+?⍵⍴100)(0.25+100÷⍨?⍵⍴1000)}
D←⍉GD 7 ⋄ R←⊃((⎕DR 2↑D)323)⎕DR 2↑D ⋄ L←,¯1↑D

DY←⎕FIX S
CD←'blackscholes' #.codfns.Fix S
ext←#.codfns.soext⍬
'cdrun'⎕NA 'blackscholes',ext,'|Run_cdf P P P'
'sync'⎕NA 'blackscholes',ext,'|afsync'
mka←'blackscholes'∘#.codfns.MKA
frea←{}'blackscholes'∘#.codfns.FREA
kern←'#.blackscholes.{cdrun ZP LP RP ⋄ sync}⍬'
cdfns←'#.blackscholes.(L CD.Run R)'
dylg←'#.blackscholes.(L DY.Run R)'

∇Run X;D;L;R;LP;RP;ZP
 D←⍉GD X ⋄ L←,¯1↑D ⋄ R←⊃((⎕DR 2↑D)323)⎕DR 2↑D
 ⎕←X
 RP←mka R ⋄ LP←mka L ⋄ ZP←mka ⍬
 ⎕←#.cmpx kern cdfns dylg
 frea RP ⋄ frea LP ⋄ frea ZP
∇

∇Benchmark
 Run¨256,2*10+2×⍳5
∇

:EndNamespace
