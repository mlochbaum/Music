#! /usr/bin/env dbqn

⟨⟨⟩,"",•path⟩⍎•FChars"synth.bqn"
lm←32×lb←⌊⌾(÷⟜600)0.85×fr
factorCounts ← •Import "factc.bqn"

fa ← 10 Hp2 10 ÷˜ FactorCounts lb÷10
b ← ∾ 7‿1‿0‿6‿1‿1/∾˜ ((2×lb)↑/⟜fa)¨ 32‿36‿27
k ← (2×lb) ↑ 0.9 × 1(-÷+)⋆ ¯10⌈10⌊ 12 Hp2⍟32 lb↑8e3
n0 ← ∾˘˝ 1‿0.9 × 0.41‿0.36 Pan⟜(23⥊∘↑⊢)˘ > (lb÷8) ((0.4×0.6⋆I∘⊣) × Square∘⥊)¨ (¯7+0‿¯2‿0⊸∾˘¯5‿¯7) Trans 1.5×fr÷32×2
n ← (6.24×lb) ↑˘ 20 Hp2 ¯12‿7e3‿2 Peak (-⌊lb÷4.1)(0.7⊸×+(0.3×⌽˘)+0.1×⌽˘⍟2) n0
#n ← (20 Hp2 ¯12‿7e3‿2 Peak 10÷˜7∾∾(-⌊lb÷4.1)↑¨3‿1) Reverb n0  # Slow

Out ↩ max × 2 Softclip ⊢
(2×lm) Write ⟨b,k,n⟩
