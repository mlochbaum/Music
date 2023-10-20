#! ./run_once

la←⌊⌾(÷⟜100)0.66×fr
lb←0.52×fr
Out ↩ max × 2 Softclip ÷⟜2

k ← 0.5  PanAP la ↑ 1.7×1(-÷+)⋆(¯240⌽(2 Hp1 (⌊4+|∘⊏)⊸⌽)⍟40) 8×((+˝2⋆¯10‿¯15×⌜⊢)∘I × ·(1-×˜)⊸×∘Saw⥊⟜47) fr÷3
s ← 0.54 PanAP (Concat + 0.1×(¯1.5×la)⌽2 Rep ⊑) 2‿3 ((4×la)↑Add)∘↑¨ <(-0.76‿1.5‿2.78×la) Shift¨ (7‿6.7‿5.4÷10) {𝕨×1(-÷+)⋆+´𝕩(+˝Sine∘(⥊×1+0.2÷8⋆I∘⊣)×⎉1 2⋆(-8-0‿3‿1‿6)×⌜I∘⊣)¨200‿253‿451‿590}¨7‿12‿34×1e3
h ← 0.49 PanAP ∾ (9‿3‿4‿6÷9) × 2 Rep ((la÷4)(+≍-)400) ↑¨ <0.4 × ¯5‿400‿0.8 Peak ¯4‿1500‿1 Peak (I 200) Fadefront ((Sin ·+`(2×π)|8÷˜↕)×1⌊1.4×2⋆¯11×I)8e3

b ← 0.44 PanAP (1.4÷max) × 60 Hp2 ¯4‿180 LShelf ¯9‿12e3 HShelf ⊏ Read "bass"

N ← -⟜'0'
_f_ ← {𝔽∘⥊⟜Note × 2⋆(¯5e¯4×𝕘)×↕∘⊣}
_sf ← {Sine _f_ 𝔽}

j ← lb ↑ (2e3 4 _sf "f#1") Add (fr÷3) 1 _sf "g1"
MC ← 0.2 × 2 Softclip 4×⊢ ⋄ MS ← (⌊lb÷4) 2 _sf ⊢
m0 ← (2×lb) ↑ MC∘MS "a"
m1 ← ∾⟜(0¨) (¯2×lb) ↑ (lb÷2) ↑ MC∘MS "f#4"
m2 ← 2e3 ⌽ ∾(2 Rep (2×lb) ↑ (-lb) ↑ ⊢)¨ MC +˝ MS¨ "34"⋈˜⌜"bbeb"
ll ← (¯4×lb)↑0.2 × (lb÷2) Triangle _f_ 1 "b2"

c ← (0¨∾3⊸Rep) (¯4×lb)↑ 2×¯7‿3500 Hshelf ¯4‿1400‿0.7 Peak ((×˜×4⋆˜¬)∘I×White∘⥊⟜0) ⌊3.2×lb
g ← ⥊ (N"01010001") ×⌜ 500 Hp2 4e3 Lp2 1e3 Lp1 (lb÷2) ↑ 2e3 (-⟜¬1|π⋆˜↕∘≠) _f_ 2 "b"

BS← (Saw + 3×·Triangle⊢÷2-(lb≤≠)×3⋆˜(1.25×lb)÷˜⌽∘↕∘≠) _f_ 0.3
bl← 0.4 × 360‿0.8 Lp2q 2 Softclip 4× 40 Hp2 ∾ "01201334"N⊸⊏(lb×4÷˜N"62832") BS¨ "bgddc"⋈¨'1'
bk← 250 Lp1 (2|/lb×2÷˜N∾"135"⊸∾¨"214"‿"7") × ∾˜bl

#(64×la) Write ⟨k,s,h,b⟩
(64×lb) Write ⟨j,bk,m0,m1,m2,ll,c,g⟩
