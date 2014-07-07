:Namespace Graph500

⎕IO ⎕ML←0 1

⍝ K1: Edge list → Representation
⍝ K2: Graph + Root → Parent Vector

⍝ V1: Easy, Obvious Baseline
K1∆1←{A⊣A[,⍵]∪←,⌽⍵⊣A←(1+⌈/,⍵)⍴⊂⍬}
K1∆2←{P←(⍴⍺)⍴¯1 ⋄ P[⍵]←⍵ ⋄ P⊣⍺{Z⊣P[Z←B/C]←(B←¯1=P[C←∊C])/(≢¨C←⍺[⍵])\⍵}⍣≡,⍵}

⍝ V2: Non-nested, sparse adjacency
K2∆1←{⊂[0](1,⍲/2=⌿A)⌿A←A[⍋A←(≠/A)⌿A←⍵⍪⌽⍵;]}
K2∆2←{S E←⍺ ⋄ P←(≢S)⍴¯1 ⋄ P[⍵]←⍵ ⋄ P⊣{Z⊣P[Z←B/C]←(B←¯1=P[C←M/E])/(M←S∊⍵)/S}⍣≡,⍵}

⍝ V3: Cormen, et al.
K3∆1←{S E←⊂[0](1,⍲/2=⌿A)⌿A←A[⍋A←(≠/A)⌿A←⍵⍪⌽⍵;] ⋄ B←(1+⊃⌽S)⍴⊂⍬ ⋄ B⊣B[S],←E}
K3∆2←{P←(≢⍺)⍴¯1 ⋄ P[⍵]←⍵ ⋄ P⊣⍺{⊃,/⍺∘{v⊣P[v←(¯1=P[v])/v←⍵⊃⍺]←⍵}¨⍵}⍣(⍬≡⊣),⍵}

⍝ V4: Adjacency Inner Product
K4∆1←{a⊣a[↓⍵⍪⌽⍵]←1⊣a←0⍴⍨,⍨1+⌈/,⍵}
K4∆2←{¯1+⍺{⍵+n\(⍺⌿⍨n←~m)(,⌷⍨0=⊣).×(m←0≠⍵)×1+⍳≢⍵}⍣≡1+(-⍵)⌽⍵,1↓¯1⍴⍨≢⍺}



⍝ EL(K1 R K2) RN: Run bench on files
R←{G R←(E⍺)(N⍵) ⋄ K1←⍺⍺ T G⊣⍞←'K1 ' ⋄ K2←K1⍵⍵{⍺∘(0∘⊣⍺⍺)¨⍵}T R⊣⍞←'K2 ' ⋄ ⎕←'.'}
R1←K1∆1 R K1∆2 ⋄ R2←K2∆1 R K2∆2 ⋄ R3←K3∆1 R K3∆2

⍝ D: Load Data file ⋄ E: Load Edge List file ⋄ N: Load Root Names file
D←{S←⎕NSIZE T←⍵⎕NTIE 0 0 ⋄ D←⎕NREAD T 323(S÷4)0 ⋄ _←⎕NUNTIE T
  ∧/D[1+I←2×⍳2÷⍨≢D]=0:D[I] ⋄ ⎕SIGNAL 11}
E←{((2,⍨2÷⍨≢)⍴⊢)D⍵} ⋄ N←{D⍵} ⋄ T←#.(time)

:EndNamespace
