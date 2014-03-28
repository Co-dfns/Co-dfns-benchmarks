:Namespace Blackscholes

    ⎕IO←0

⍝ These are some constants that are defined by default in the 
⍝ Accelerate version.

    riskfree←0.02
    volatility←0.03

⍝ The Accelerate solution starts with a horner function:

    HORNER←{X←⍺ ⋄ X×{⍺+X×⍵}/⍵}

⍝ It follows up with the following CNDP function:

    coeff←0.31938153 ¯0.356563782 1.781477937 ¯1.821255978 1.33027442
    rsqrt2pi←÷0.5*⍨○2

      CNDP←{
          k←÷1+0.2316419×L←|⍵
          rsqrt2pi×(*¯2÷⍨L×L)×k HORNER coeff
      }

⍝ Finally, this is a transliteration of the reference implementation 
⍝ in the Accelerate program.

      BS∆REF←{
          r←riskfree ⋄ v←volatility ⋄
          ↑{
              price strike years←⍵
              sqrtT←years*0.5
              d1←((⍟price÷strike)+(r+(v×v)÷2)×years)÷v×sqrtT
              d2←d1-v×sqrtT
              expRT←*(-r)×years
              cnd←{⍵>0:1-CNDP ⍵ ⋄ CNDP ⍵}
              cndD1←cnd d1 ⋄ cndD2←cnd d2
              R←((price×cndD1)-strike×expRT×cndD2)
              R((strike×expRT×1-cndD2)-price×1-cndD1)
          }¨⊂[1]⍵
      }

      GEN∆DATA←{
          sp←5+?⍵⍴25
          os←1+?⍵⍴100
          oy←0.25+100÷⍨?⍵⍴1000
          ⍉↑sp os oy
      }
      
⍝ Now let's see if we can make the above faster. 
⍝ This comes from the EspenHaug.com/APL.png code for Black Scholes
⍝ The main adjustments here come from using large scalar operations
⍝ over simple vectors as opposed to nested vectors. We also 
⍝ eliminate the need for the HORNER function.

      CNDP2←{
          K←÷1+0.2316419×L←|⍵
          R←(÷(○2)*0.5)×(*(L×L)÷¯2)×{coeff+.×⍵*1+⍳5}¨K
          (1 ¯1)[B]×(0 ¯1)[B←⍵≥0]+R
      }

    r←riskfree
    v←volatility

      BS∆V1←{S X T←⊂[0]⍵
          expRT←*(-r)×T
          D1←((⍟S÷X)+(r+2÷⍨v*2)×T)÷vsqrtT←v×T*0.5
          D2←D1-vsqrtT
          R←(S×CD1←CNDP2 D1)-X×expRT×CD2←CNDP2 D2
          R,[0.5]((X×expRT×1-CD2)-S×1-CD1)
      }

:EndNamespace
