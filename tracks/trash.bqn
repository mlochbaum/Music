#! ./run_once

lm←16×lb←0.51×fr
Poly ← {+⟜(𝕩⊸×)´𝕨}

s ← 0¨⊸∾ lb ↑ 0.6 × (0.5×+˝(Sine×2⋆(-8-0‿3‿1‿6)×I∘≠˘)5e3⥊˘200‿253‿451‿590) Add 0.8×6‿40‿4 Peak ¯4‿5e3 HShelf ¯8‿1e4 HShelf 6‿700‿0.7 Peak ((Sin·+`(2×π)|8÷˜↕)×1⌊1.4×2⋆¯11×I)9e3
h ← (lb÷2) ⌽ 0.5 × lb↑ ¯3‿300‿0.4 Peak 1.5‿2e3 HShelf (+´¨⊔⟜÷1‿7‿14‿40) Reverb (-⟜(⊢˝)∘((π÷2) ÷˜ 10⊸× +○(Tan⁼ 10⊸×) 2⋆¯9⊸×)∘(3×I) × (300 Hp1 ¯1+2|3.2⋆˜5+(9×⋆3)|↕) + 2×(√⌊0.4⊸⋆)∘I × 8e3 Hp1 Saw∘⥊⟜7461×Triangle∘⥊⟜2e3) lb
m ← -⟜(h⥊˜≢) ∾≍ ((0.75‿1.1×⌜(×˜+·⋆∘-∘×˜12×-⟜(÷8))I lb÷2) Fadefront⎉1 -∘≠∘⊢ ↑ {(1∾4÷˜1>𝕨|↕lb÷2)⊸Reverb⌾⌽𝕩})⟜h¨ fr÷("5333733367456342"-'0')Trans Note"a#1"
k ← lb ↑ 0.6 × 2÷˜(⍋(1.1⋆˜↕∘≠)+70⊸×)⊸⊏⊸+ (0.8×12‿260‿1.6 Peak (White×(1⌊6×¬⊸⌊)∘I∘≠)200⥊0) Add +˝ 2‿8‿60 (√∘⊣÷˜·(1(-÷+)⋆∘-)×⌜) 20 Hp2 ((Sine∘((10×White)⊸+)×2⋆¯20×I∘≠)lb⥊80) Add 1.8×((2⋆¯14⊸×)∘I × ·Triangle⥊⟜41) 2×lb
b ← 0.6 × 10 Hp2 ¯10‿140‿8 Peak 4‿70‿3 Peak 8e3 Lp1 ¯5‿1200 HShelf ¯6‿800‿0.5 Peak (1 - (30⊸× ⌊ 2⋆¯3⊸×)∘I∘≠)⊸× Saw lb⥊0.1-˜4÷˜Note"a#"
d ← 0.4 Pan 0.8 × ⌊⌾(26⊸×) Tan⁼ ⥊4‿215‿4 Peak (Sine∘⥊⟜(Note∘∾⟜"#"÷2⋆'f'⊸≤)˘⟜"cacagafg" ×⎉1 (0.8-0.3×·Cos 0.2-˜(+`÷⟜fr)∘⥊⟜((2×π)×fr÷lb)) × 2÷˜1-0⌈3⋆˜Saw∘⥊⟜(4×fr÷lb)) 4×lb
c ← (¯14‿1200⊸LShelf∾3⊸Rep) (2×lb)↑(-600+0.75×lb)↑0.4 × 20 Hp2 ¯5‿90‿1.4 Peak ¯12‿4e3 HShelf 1-˜2× 1|+`π×↕240
ch ← (Note"a#") Trans˜ 'a'-˜>⟨
  "mmmmmmmmkkkkkkkkiiiiiiiimmmmmmmm"
  "ppppppppppppqqrqppppppppqppprrrr"
  "uuuurrsuuuruttutrrsursruttrsuuut"
⟩
#p ← 0.53 Pan 0.6 × (0.5×(-600-˜lb÷3)⊸⌽)⊸+ (I 300) Fadefront ((0.1(⋆-×⟜¬)I lb)⥊˜≢)⊸× Tan⁼⌾(3⊸×) +˝ (Triangle+0.1×Sine∘÷⟜2)∘(lb⊸/)˘ ch
p ← 0.54 Pan 0.25 × (0.1×(-lb÷2)⊸⌽)⊸+ Tan⁼⌾(3⊸×) ((0.1‿1.1‿¯1.5‿¯0.5‿1.5‿¯0.6 Poly I lb)⥊˜≢)⊸× +˝ (Triangle+0.1×Sine∘÷⟜2)∘(lb⊸/)˘ ch
a ← 0.54 Pan 0.5 × (800 Hp1 0.4×(-lb÷6)⊸⌽)⊸+ ¯10‿4e3 LShelf ((1‿¯1‿2‿¯1 Poly I∘≠)⊸× ∾((×˜⌾¬I 100)Fadefront 2⋆¯5e3÷˜↕)¨2‿1‿2‿1‿2×lb÷8) (⥊˜⟜≢×⊢) Saw (lb÷8) / ⥊⍉3‿2‿1‿2/0‿1‿0‿2⊏ch

#(4×lm) Write ⟨k,c,s,h,m,b,d,p⟩

bf ← (1‿0‿¯3‿2 Poly I 3×lm) Fadeback (24×lm)⥊b
pf ← (12×lm) ((4×⋆⟜0.6××˜∘¬)∘I∘⊣ × ⥊)˘ p
in ← lm↑((lm-2×lb)⥊k) Add ((0⥊˜¯400+2.75×lb)∾3⊸Rep∾0¨∾2⊸Rep) (2×lb)↑k
WriteFull in ∾⎉1 +´ (Stereo ((24×lm)↑⊑⊸⥊⟜0∾-˜´⊸⥊)⎉1)¨´ ⟨
  lm×⟨0‿24, 0‿24, 1‿24, 2‿24, 4‿24, 4‿20, 10‿22, 12‿20, 16‿24⟩
     ⟨k   , bf  , s   , h   , c   , d   , pf   , a    , m    ⟩
⟩
