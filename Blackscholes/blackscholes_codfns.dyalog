:Namespace

  r←0.02
  v←0.03
  
  coeff←0.31938153 ¯0.356563782 1.781477937 ¯1.821255978 1.33027442
  
  CNDP2←{
    K←÷1+0.2316419×L←|⍵
    a←L×L
    a←*a÷¯2
    R←a×{coeff ⎕ptred ⍵*1+⍳5}¨K
    a←÷6.283185307*0.5
    R←a×R
    B←⍵≥0
    a←B ⎕index 0 ¯1
    a←a+R
    b←B ⎕index 1 ¯1
    b×a  
  }
  
  bs∆codfns←{S←0⌷⍺ ⋄ X←1⌷⍺ ⋄ T←⍵
    expRT←-r
    expRT←*expRT×T
    a←v*2
    a←r+a÷2
    b←⍟S÷X
    a←b+a×T
    D1←a÷vsqrtT←v×T*0.5
    D2←D1-vsqrtT
    a←S×CD1←CNDP2 D1
    R←a-X×expRT×CD2←CNDP2 D2
    b←X×expRT×1-CD2
    s←⍴S
    s←s,2
    s⍴R,b-S×1-CD1
  }

:EndNamespace