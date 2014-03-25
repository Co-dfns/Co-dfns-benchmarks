:Namespace Graph500

⎕IO ⎕ML←0 1

⍝ Kernel Functions
⍝
⍝ Kernel 1: Convert an edge list into a graph representation for Kernel 2.
⍝ Kernel 2: Compute parent vector of component based on a graph and root.

⍝ Version 1
⍝
⍝ This first version is designed to be easy to understand and take the 
⍝ most obvious approach to solving the problem without any tricks. It 
⍝ should form a baseline.

Kernel1_1←{A⊣A[,⍵]∪←,⌽⍵⊣A←(1+⌈/,⍵)⍴⊂⍬}
Kernel2_1←{P←(⍴⍺)⍴¯1 ⋄ P[⍵]←⍵
  P⊣⍺{Z⊣P[Z←B/C]←(B←¯1=P[C←∊C])/(≢¨C←⍺[⍵])\⍵}⍣≡,⍵
}

⍝ Version 2
⍝
⍝ This version attempts to be faster by using a non-nested representation 
⍝ of the sparse adjacency matrix. It makes much heavier use of filters 
⍝ and boolean masks.

Kernel1_2←{⊂[0](1,⍲/2=⌿A)⌿A←A[⍋A←(≠/A)⌿A←⍵⍪⌽⍵;]}
Kernel2_2←{S E←⍺ ⋄ P←(≢S)⍴¯1 ⋄ P[⍵]←⍵
  P⊣{Z⊣P[Z←B/C]←(B←¯1=P[C←M/E])/(M←S∊⍵)/S}⍣≡,⍵
}

⍝ Version 3
⍝
⍝ This version follows as closely as possible the algorithm in 
⍝ Cormen, et al. Which is as follows:
⍝
⍝   BFS(G, s)
⍝     for each vertex u ∊ V[G] - {S}
⍝       do P[u] ← ¯1
⍝   P[s] ← NIL
⍝   Q ← ⍬
⍝   ENQUEUE(Q, s)
⍝   while Q ≠ ⍬
⍝     do u ← DEQUEUE(Q)
⍝       for each v ∊ Adj[u]
⍝         do if color[v] = WHITE  // I use P[v] = NIL
⍝           then P[v] ← u
⍝             ENQUEUE(Q, v)

Kernel1_3←{
  S E←⊂[0](1,⍲/2=⌿A)⌿A←A[⍋A←(≠/A)⌿A←⍵⍪⌽⍵;]
  B←(1+⊃⌽S)⍴⊂⍬
  B⊣B[S],←E
}
Kernel2_3←{P←(≢⍺)⍴¯1 ⋄ P[⍵]←⍵
  P⊣⍺{⊃,/⍺∘{v⊣P[v←(¯1=P[v])/v←⍵⊃⍺]←⍵}¨⍵}⍣(⍬≡⊣),⍵
}

⍝ Version 4
⍝
⍝ This implementation uses a CSR representation.

Kernel1_4←{
  S E←⊂[0](1,⍲/2=⌿A)⌿A←A[⍋A←(≠/A)⌿A←⍵⍪⌽⍵;]
  R←S⍳⍳⌈/S
  M←(≢R)=R
  (M/R)←(0,M)/R,≢R
  R E
}
Kernel2_4←{

}

⍝ Run
⍝
⍝ Run the benchmark using the appropriate kernels and reading 
⍝ from a given file to obtain the data.

Run←{
  G←LoadEdgeList ⍺
  R←LoadRootNames ⍵
  ⎕←'Running Kernel 1'
  K1←⍺⍺ #.time G
  ⎕←'Running Kernel 2'
  K2←K1 ⍵⍵{⍺∘(0∘⊣⍺⍺)¨⍵}#.time R
  ⎕←'Done'
}

Run1←Kernel1_1 Run Kernel2_1
Run2←Kernel1_2 Run Kernel2_2
Run3←Kernel1_3 Run Kernel2_3

⍝ LoadData
⍝
⍝ Load Raw Data from a file

LoadData←{
  S←⎕NSIZE T←⍵ ⎕NTIE 0 0
  D←⎕NREAD T 323 (S÷4) 0
  _←⎕NUNTIE T
  ∧/D[1+I←2×⍳2÷⍨≢D]=0:D[I]
  ⎕SIGNAL 11
}

⍝ LoadEdgeList
⍝
⍝ Load the data from a given file

LoadEdgeList←{((2,⍨2÷⍨≢)⍴⊢)LoadData ⍵}

⍝ LoadRootNames
⍝
⍝ Load the root names from a file

LoadRootNames←{LoadData ⍵}

:EndNamespace