#! /usr/bin/env dbqn

•state•Eval•FChars"synth.bqn"
Triangle ↩ ¯0.25⊸Triangle
ADSR ← {a‿d‿s‿r‿l: ∾⟨I a , s+(l-a+r)↑(¬s)×I-d , s×I-r⟩}
lm←16×lb←0.52×fr

l ← (2×lb) ↑ 0.2 × 2⊸Softclip 4×(Sine×2⋆¯6×I∘≠) (⌊lb÷4)⥊Note"a"
k ← lb ↑ ((0.3×Pink×(⊢×2⋆¯4⊸×)∘I∘≠)1e3⥊90) Add ((Sine×2⋆¯4×I∘≠)2e3⥊90) Add ((2⋆¯10⊸×)∘I × ·Sine⥊⟜(8÷˜Note"g")) fr÷3
ll ← (¯4×lb)↑0.2 × (Triangle×2⋆¯6×I∘≠) (lb÷2)⥊2÷˜Note"b"
b ← (4×lb)↑0.4 × (ADSR 1e3‿6e3‿0.7‿2e3∾≠)⊸× 400 Lp1 (Saw∘×⟜(1+4⊸×)+Triangle∘(2×⊣×1+⊢))⟜(0.1×3⋆˜I∘-∘≠) lb⥊8÷˜Note"b"
m ← ∾⟜(0¨) (¯2×lb) ↑ (lb÷2) ↑ 0.2 × 2 Softclip 4×(Sine×2⋆¯6×I∘≠) (⌊lb÷4)⥊2×Note"f#"
n ← 2e3 ⌽ ∾(2 Rep (2×lb) ↑ (-lb) ↑ 0.2 × 2 Softclip 4×·+˝·(Sine×2⋆¯6×I∘≠)˘ (2⋆↕2)×⌜(⌊lb÷4)⥊Note)¨ "bbeb"
s ← 1e3 ⌽ ⥊ ("00110010"-'0') ×⌜ (lb÷2) ↑ (Pink×2⋆¯4×I∘≠)2e3⥊160
c ← (0¨∾3⊸Rep) (¯4×lb)↑ 2×¯7‿3500 Hshelf ¯4‿1400‿0.7 Peak ((×˜×4⋆˜¬)∘I×White∘⥊⟜0) ⌊3.2×lb

(4×lm) Write ⟨k,n,m,l,ll,b,s,c⟩
