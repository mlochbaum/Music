#! ./run_once

la←⌊⌾(÷⟜100)0.66×fr
lb←0.52×fr
Out ↩ max × 2 Softclip ÷⟜2

N ← -⟜'0'
_f_ ← {𝔽∘⥊⟜Note × 2⋆(¯5e¯4×𝕘)×↕∘⊣}
_sf ← {Sine _f_ 𝔽}
g0← 2e3 Hp2 -⟜» (I 100) Fadefront 2e3 ((1-2|1.2⋆5+(⋆3)|↕∘≠) × 3e3 Hp1 ·Saw 7568¨) _f_ 4 "b"

k ← 0.5  PanAP la ↑ 1.7×1(-÷+)⋆(¯240⌽(2 Hp1 (⌊4+|∘⊏)⊸⌽)⍟40) 8×((+˝2⋆¯10‿¯15×⌜⊢)∘I × ·(1-×˜)⊸×∘Saw⥊⟜47) fr÷3
Sg← {𝕨×1(-÷+)⋆+´𝕩(+˝Sine∘(⥊×1+0.2÷8⋆I∘⊣)×⎉1 2⋆(-8-0‿3‿1‿6)×⌜I∘⊣)¨200‿253‿451‿590}
s ← 0.54 PanAP (Concat + 0.1×(¯1.5×la)⌽2 Rep ⊑) 2‿3 ((4×la)↑Add)∘↑¨ <(-0.76‿1.5‿2.78×la) Shift¨ (7‿6.7‿5.4÷10) Sg¨7‿12‿34×1e3
h0← 0.4 × ¯5‿400‿0.8 Peak ¯4‿1500‿1 Peak ((Sin ·+`(2×π)|÷⟜8) × ÷⟜200⌊1⌊ 1.4×·⋆¯1e¯3⊸×)↕8e3
h ← 0.49 PanAP ∾ (9‿3‿4‿6÷9) × 2 Rep ↑⟜h0¨ (la÷4)(+≍-)400
t ← 0.32 PanAP ¯5e3 ⌽ ⥊ (N"0000000100001001001111") ×⌜ (⌊11÷˜4×la) ↑ g0

br0 ← 0.55 × 1 ∾ (⋆⟜(30×1+2×↕⊸÷∘≠)1|2.33⋆˜↕1e3) ∾ ÷⟜(+´⌾(×˜))(××0⌈0.3-˜|)g0
brev ← 50 Hp2 ¯7‿420‿0.9 HShelf 2‿800‿0.7 Peak ¯3‿1600‿0.8 Peak ¯9‿12e3 HShelf br0
b ← 0.45 PanAP brev (≠∘⊢(↑Add↓)Reverb) (1-1300×1000 Hp1 1200 Lp1⊢×|∘-⟜»)⊸× (24÷2⋆24)×⊏¯1⊑Read "bass"

j ← k +○(lb⊸↑)⎉1 ja ← (2e3 4 _sf "f#1") Add (fr÷3) 1 _sf "g1"
MC ← 0.2 × 2 Softclip 4×⊢ ⋄ MS ← (⌊lb÷4) 2 _sf ⊢
m0 ← (2×lb) ↑ MC∘MS "a"
m1 ← ∾⟜(0¨) (¯2×lb) ↑ (lb÷2) ↑ MC∘MS "f#4"
m2 ← 2e3 ⌽ ∾(2 Rep (2×lb) ↑ (-lb) ↑ ⊢)¨ MC +˝ MS¨ "34"⋈˜⌜"bbeb"
mb ← (¯4×lb) ↑ 0.2 × (lb÷2) Triangle _f_ 1 "b2"

w ← (0¨∾3⊸Rep) (¯4×lb)↑ 2×¯7‿3500 Hshelf ¯4‿1400‿0.7 Peak ((×˜×4⋆˜¬)∘I×White∘⥊⟜0) ⌊3.2×lb
g ← ⥊ (N"01010001") ×⌜ (lb÷2) ↑ g0
c ← 0¨⊸∾ lb ↑ ((⋆¯7e¯4⊸×) × ·⌽5e3 Lp1 1-2|1.001⊸⋆|⋆⟜(¬2e¯4)) ↕7529
cq← 0¨⊸∾ c

BS← (Saw + 3×·Triangle⊢÷2-(lb≤≠)×3⋆˜(1.25×lb)÷˜⌽∘↕∘≠) _f_ 0.3
bl← 0.5 × 360‿0.8 Lp2q 2 Softclip 4× 40 Hp2 ∾ "01201334"N⊸⊏(lb×4÷˜N"62832") BS¨ "bgddc"⋈¨'1'
bk← 250 Lp1 (2|/lb×2÷˜N∾"135"⊸∾¨"214"‿"7") × ∾˜bl

init ← (∨˜I 5×la)⊸Fadefront⌾⊑ ((la×⊑)(+⎉1´⥊⎉1¨)1⊸↓)¨ ⟨
  ⟨ 9, k,h⟩
  ⟨32, k,s,h,b, ((¯32×la)↑(4×la)↓⊢)˘t⟩
  ⟨32, k,s,h,b,t⟩
  ⟨10, k⟩∾(10×la){(¬×˜I𝕗)×𝕗⊸⥊}⎉1¨⟨s,h,b,t⟩
⟩
tra ← {l←⌊+´la‿lb×¬⊸⋈𝕩 ⋄ k +○(l⊸↑)⎉1 𝕩×ja}¨I 7
WriteFull ∾≍ Stereo¨ init ∾ tra ∾ (((16×lb)×⊑)(+⎉1´⥊⎉1¨)1⊸↓)¨ ⟨
  ⟨1, j,          m0,m1,m2,mb⟩
  ⟨1, j,bk,w,     m0,m1,m2,mb⟩
  ⟨4, j,bk,w,cq,g,m0,m1,m2,mb⟩
  ⟨1, j,bk,  c ⟩
  ⟨1, j,bk,w,c ,∾⟜(0¨)m1⟩
  ⟨1, j,bk,w,c ,(3⊸Rep∾0¨)m1,∾⟜(0¨)(4×lb)↑m2⟩
  ⟨1, j,bk,  c ,∾⟜(0¨)m1,((2×lb)/∾˜1‿1‿1‿0)×m2⟩
  ⟨2, j,bk,w,cq,∾(3‿5×4×lb)⥊¨(2×lb)⊸↑⊸⋈g,m0,m1,m2,mb⟩
  ⟨2, j,bl,w,∾⟜(0¨)c,g,mb⟩
  ⟨2,   bl,(15⊸Rep∾0¨)c,g⟩
  ⟨2, j,bk,w,0¨⊸(∾∾∾˜)c,m0,m1,m2,mb⟩
  ⟨÷4,m0,m1,m2⟩
⟩
