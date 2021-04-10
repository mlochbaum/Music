#! ./run_once

fr ↩ opt.freq ↩ 44100
lm←16×lb←0.4×fr

HL ← {h‿l𝕊𝕩: h Hp1 l Lp1 𝕩}

w ← 1.4e4 Lp2 ¯2‿3000 HShelf 20÷˜+˝(0.8+0.06×¯7e3‿8e4⌽⎉0‿1 Sine (lm÷2)⥊2×fr÷lm) ×⟜(2⊸Rep)⎉1 +˝ (Square (1+6‿10 HL 0.3×Pink)⊸×)⎉1 1‿6‿2‿1/(2⋆2-˜↕4)×⌜(1.6×fr)⥊˘Note¨"g3"‿"e2"
c ← lm ⥊ lb ↑ 2e3 Lp2 ⋆-I 200
d ← ¯400 ⌽ ∾ 0‿0.96‿0.83 × (3‿3‿2×lb÷2) ↑¨< ×⟜(0.02+40⋆·-·I ¯1⊑≢) Sine (2×lb)⥊Note'g'
b ← (0⥊˜2×lm) ∾ 2.6÷˜4e3 Lp1 (I 400) Fadefront (I ⌊¯0.14×lm) Fadeback (1.3-0.3××˜)⊸× Saw (⊏⥊˜lm-≠)⊸∾  (⊑+((×˜×3-2⊸×)⍟5 I 0.9×lm)×-˜´) Note∘∾⟜'0'¨"ge"
s ← lm⥊ (-lm÷2) ↑ (4×lb) ↑ (⌊¯2.26×lb) Shift (500-˜lb÷2)⊸↑⊸∾ 0.2 × ¯1⌈1⌊ 120÷˜ ⌊⌾(64⊸×) (⌊2÷˜≠)⊸⌽ (⋆∘(2÷˜×˜)∘×⟜4 × ·Saw(Note'd')¨) (¯1↓⌽)⊸∾I 5e3

(4×lm) Write ⟨w,c,d,b,s⟩
