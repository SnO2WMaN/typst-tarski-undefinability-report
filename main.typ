#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "中学生の算数についての限界",
  authors: (
    "SnO2WMaN",
  ),
)

//空きすぎなのでなんとかする
#let to = $arrow$
#let power = $arrow.t$

= 中学生の算数 <jha>

次の@jha.c[問題] と@jha.j[問題] は日本の中学生なら出来るらしい．
なおここでは，数とは$0,1,2,3,dots$とします．

== 計算 <jha.c>

次の式を計算してください．$+$は数の足し算，$times$は数の掛け算，$power$は数の冪算とします．
なお，普通は冪算$2 power 3$は$2^3$のように表記されるでしょう．

+ $2$の次の数
+ $1 + 2$
+ $4 + 0$
+ $3 times 2$
+ $7 times 0$
+ $2 power 3$
+ $4 power 0$

== 判定 <jha.j>

次の主張が正しいか誤っているかを確かめてください．ただし，$x$は数であるとします．

+ $1 + 1 = 2$である．
+ $2 + 4 = 5$である．
+ $4 + 5 = 9$ではない．（この主張は「$4 + 5 eq.not 9$である」と同等である．）
+ $11 < 4 times 3$である．
+ $x times 4 = 12$となるような$x$が存在する．
+ $x times 7 = 23$となるような$x$が存在する．
+ 全ての$x$について，$0 < 2^x $である．
+ $x times 3 = 129$となるような$x$は存在しない．（この主張は「全ての数$x$について$x times 3 eq.not 129$である」と同等である．）
+ $x$の次の数が$0$であるような$x$が存在する．

== 数 <Num>

#let Num = $cal(N)$

ここで考えた数$0,1,2,3,dots$の加算無限集合を，数の集合，または単に，数と呼び，$Num$と表すことにする．
すなわち，$Num = {0,1,2,dots}$である．

=== 中学生の算数

#let nextnum = $sans("succ")$

@jha.c[問題] と@jha.j[問題] で行った「次の数」演算$nextnum$，足し算$+$，掛け算$times$，冪算$power$，等価判定$=$，大小判定$<$について考える．
「どうやって計算，判定するのか」の厳密な定義は一旦棚上げし，我々のよく知っている方法で計算できるとする．以下を注意しておく．

- $nextnum$は$Num$上の1項演算$Num to Num$である．
- $+,times,power$は$Num$上の2項演算$Num^2 to Num$である．

$BB eq.def { top,bot }$とする．$=,<$は関数$Num^2 to BB$である．例えば$1$と$3$について$1 = 3$を判定したとき，正しいなら$top$を，誤っているなら$bot$を返す関数であると考える．

$nextnum,+,times,power,=,<$をまとめて中学生の算数と呼ぶことにする．

=== 素数は中学生の算数の範囲なのか？

一般に，素数とは1と自分自身を除いた全ての数で割り切ることが出来ない2以上の数であると定義される．

素数は，中学生の算数の範囲で十分に定義出来ることを示す．

+ 「$x$が$y$を割り切る」という判定$x|y$は「$y = x times z$となるような$z$が存在する」と言い換えることが出来るので，中学生の算数の範囲である．
+ 「$x$が$y$を割り切ることは出来ない」という判定も中学生の算数の範囲である．
3. 「$x$は2以上である」という判定は「$x=2$または$2 < x$である」と言い換えられるので，中学生の算数の範囲である．
+ 「$x$を割り切る$y$は存在しない」という判定は中学生の算数の範囲である．
5. 任意の$n in Num$について「$n$は2以上であり，なおかつ，全ての$y$について$y$が1と$n$ではないならば$y$が$n$を割り切ることは出来ない」という判定は中学生の算数の範囲である．

最後に定義した判定は，まさに素数の定義である．

ところで上の，日本語における定義には「または」「なおかつ」「ならば」「ではない」「〜となるものが存在する」「全ての〜について」という論理的な操作が自然に登場して，またこれらは日本語話者として自然な形で扱えた．これらをより形式的に扱えないだろうか，という要請に答えるものが，以下で定義する1階論理である．

= 1階論理

1階論理とは @1stlogic[定義] で定義されるシステムである．そしてこの文書では2階論理などを考えないので，以降は単に論理と呼ぶ．

== 言語について

最も土台となる言語という概念を考える．言語とは記号列を生成するシステムであり，項と論理式という概念はあるルールを満たした特定の記号列であると考えられる．

=== 言語

#let lang = $cal(L)$
#let alphabet = $Sigma$

言語#lang は，次の2つの要素で構成される概念である．

+ アルファベット$alphabet_lang$
+ 記号$f_0,dots,f_(n-1),P_0,dots,P_(m-1)$に対して何個までプライム$'$を付けてよいか？の宣言

==== アルファベット

言語#lang のアルファベット$alphabet_lang$とは，次の8個以上の記号の集まりのことである．
わかりやすくするため，赤文字であるものが一つの記号である．

#let alphabetelm(elm) = [#text(fill: red)[#elm]]

+ #alphabetelm[$'$]（プライムと呼ぶ．）
+ #alphabetelm[$v$]
+ #alphabetelm[$f_0$]，#alphabetelm[$f_1$]，（中略），#alphabetelm[$f_(n-1)$]（ただし$f_2$はあるが$f_1$はないといったケースも許す．）
+ #alphabetelm[$P_0$]，#alphabetelm[$P_1$]，（中略），#alphabetelm[$P_(m-1)$]（ただし$P_2$はあるが$P_1$はないといったケースも許す．）
+ #alphabetelm[$not$]
+ #alphabetelm[$arrow$]
+ #alphabetelm[$exists$]
+ #alphabetelm[$($]（左カッコと呼ぶ．）
+ #alphabetelm[$)$]（右カッコと呼ぶ．）
+ #alphabetelm[$,$]（コンマと呼ぶ．）

==== プライムの個数の宣言

言語#lang のアルファベット $alphabet_lang$が記号$f_i$および$P_j$を持っているとき，$f_i$と$P_j$に何個までプライム$'$を付けることが出来るかは，#lang の要素として宣言されていなければならない．

「$f_0$にはプライムを0個付けることが出来る．」すなわち「$f_0$にはプライムを付けてはならない．」という宣言も可能である．

===== プライムの個数宣言の例

例えば，ある言語 $lang_1$のアルファベット$alphabet_(lang_1)$が$f_2$を持っているとき，「$lang_1$では$f_2$にプライム$'$を2個まで付けることが出来る．」と宣言しなければならない．

他方，別の言語 $lang_2$のアルファベット$alphabet_(lang_2)$も$f_2$を持っていたとしても，「$lang_2$では$f_2$にプライム$'$を付けてはならない．」と宣言されているなら，言語$lang_1$と$lang_2$は区別される．

=== #lang の記号列

言語 #lang のアルファベット $alphabet_(lang)$ の要素を任意個並べたものは#strong[#lang の記号列]と呼ばれる．

#let strings(l) = $Sigma^*_#l$

#lang の記号列を全て集めたものは #strings(lang) と表記する．

=== #lang の項 <term>

言語 #lang の記号列のうち，次の条件を満たすものは#strong[#lang の項]と呼ばれる．

// TODO:

=== #lang の論理式 <formula>

言語 #lang の記号列のうち，次の条件を満たすものは#strong[#lang の論理式]と呼ばれる．

// TODO:

=== #lang の略記

以下の略記は，#lang を問わず用いて良いものとする．$phi,psi$は#lang の論理式とし，$w$は#lang の変項であるとする．

- $phi or psi$は$phi to psi$の略記とする．
- $phi and psi$は$not (not phi and not psi)$の略記とする．
- $phi arrow.l.r psi$は$(phi to psi) and (psi to phi)$の略記とする．
- $forall_w phi$は$not exists_w not phi$の略記とする．
- $v_m$はプライム$'$が$0 lt.eq m$個付いた$v$，すなわち$v^(overbrace(prime dots.h.c prime, 0 lt.eq m))$の略記とする．

== 構造と解釈について

言語#lang は単なる記号列の生成システムであり，それ自体では何も意味しない．#lang の記号列，より正確には#lang の項と論理式を意味を持たせるためには，構造と解釈と呼ばれる概念を考える必要がある．
#lang の項や論理式は，#lang の解釈によって，意味のあるものとして扱うことが出来るのである．

=== 構造

#let structure = $cal(M)$
#let domain = $D$
#let assignment = $F$

言語#lang の上の構造 $cal(M)_(lang)$ とは，次の2つの要素で構成される概念である．

+ 領域 $domain_(cal(M))$
+ 対応付け $assignment_(cal(M))$

このことを，$structure_lang colon.eq angle.l domain_(cal(M)),assignment_(cal(M)) angle.r$と表記する．

==== 領域

構造$structure_lang$の領域$domain_(cal(M))$ とは，何らかの集合であるとする．

==== 対応付け

構造$structure_lang$の対応付け$assignment_(cal(M))$とは，特定の#lang の記号列に対して$domain_(cal(M))$ および$BB$上の関数を対応付けるものであるとする．なお，$BB eq.def { top,bot }$とする．

+ #lang の記号列 $f_i^(overbrace(prime dots.h.c prime, 0 lt.eq m))$に対して，関数$f^m_i:(domain_(cal(M)))^i arrow domain_(cal(M))$を対応付ける．特に$i=0$のとき$f^m_0 in domain_(cal(M))$である．
+ #lang の記号列 $P_i^(overbrace(prime dots.h.c prime, 0 lt.eq m))$に対して，関数$P^m_i:(domain_(cal(M)))^i arrow BB$を対応付ける．特に$i=0$のとき$P^m_0 in BB$である．
+ それ以外の記号列に対しては，$assignment_(cal(M))$は何も対応付けない．

#lang の記号列$sigma$が1または2の条件を満たすなら，対応付けられる関数を$assignment_(cal(M))(sigma)$と表す．

=== 解釈

#let interpret = $cal(I)$
#let eval = $epsilon$

#lang 上の解釈 $interpret_lang$とは，次の2つの要素で構成される概念である．

+ 言語#lang の上の構造 $structure_lang colon.eq angle.l domain_(cal(M)),assignment_(cal(M)) angle.r$
+ 付値 $eval_(cal(I))$

このことを，$interpret(lang) colon.eq angle.l structure_lang, eval_(cal(I)) angle.r$と表記する．

==== 付値

構造$interpret_lang$の付値 $eval_(cal(I))$ とは，特定の#lang の記号列に対して$d in domain$を割り当てるものとする．なお，$BB eq.def { top,bot }$とする．

==== 付値の変異

// TODO:

==== 解釈の変異

// TODO:

#let IP(expr) = $bracket.l.double #expr bracket.r.double_(interpret(lang))$

==== 項の解釈

#lang の項$tau$を解釈$interpret_lang$ で解釈することを，$IP(tau)$と表記する．

@term[項の定義] に沿って，項の解釈を以下のように定める．

==== 論理式の解釈

#lang の項$phi$を解釈$interpret_lang$ で解釈することを，$IP(phi)$と表記する．

@formula[論理式の定義] に沿って，論理式の解釈を以下のように定める．

==== 真，偽，充足

論理式$phi$が$top$として解釈されることを，$phi$は真として解釈される，あるいは単に，$phi$は真であるという．

逆に，論理式$phi$が$bot$として解釈されることは，$phi$は偽として解釈される，あるいは単に，$phi$は真であるという．

論理式$phi$がある解釈$interpret_lang$ で真であるとき，$interpret_lang$ は$phi$を充足するという．

== 論理 <1stlogic>

#let logic(l) = $sans(#l)$

=== 定義

論理$logic(L)$とは，ある言語$lang_(logic(L))$と，$lang_(logic(L))$上に定まる構造$structure_(lang_(logic(L)))$の2つの要素からなる概念である．

=== 略称

正確に言ったり表記するとあまりにも長く煩雑なので，以下の略称を定める．

- 言語$lang_(logic(L))$のアルファベット$alphabet(lang_(logic(L)))$を，$logic(L)$のアルファベット$alphabet_(logic(L))$と呼ぶ．
- 言語$lang_(logic(L))$で定まる項を，$logic(L)$の項と呼ぶ．
- 言語$lang_(logic(L))$で定まる論理式を，$logic(L)$の論理式と呼ぶ．
- 構造$structure_(lang_(logic(L)))$を，$logic(L)$の構造$structure_(logic(L))$と呼ぶ．
- 構造$structure_(logic(L))$の領域$domain_(cal(M))$を，$logic(L)$の領域$domain_(logic(L))$と呼ぶ．
- 構造$structure_(logic(L))$の対応付け$assignment_(cal(M))$を，$logic(L)$の対応付け$assignment_(logic(L))$と呼ぶ．
- 言語$lang_(logic(L))$の解釈$interpret_(lang_(logic(L))) colon.eq angle.l structure_(logic(L)), eval_(cal(I)) angle.r$を，$logic(L)$の解釈と呼ぶ．

また，論理$logic(L)$について考えていることが明らかなら，$logic(L)$は省略することもある．

=== 開論理式

=== 文

$logic(L)$の論理式$phi$が開論理式ではないなら，$phi$は$logic(L)$の文であるという．

==== 文についての注意

$logic(L)$の文は，任意の$logic(L)$の解釈で必ず真か偽のどちらかである．
すなわち，何も付値が固定されていない解釈で解釈したとしても，必ず真偽が言えるということである．

また当然ながら，$logic(L)$の文がある$logic(L)$の解釈$interpret_1$で真なら，別の$logic(L)$の解釈$interpret_2$でも真である．同様に，$interpret_1$で偽なら$interpret_2$でも偽である．

この観点から，文$phi$は$logic(L)$は真である，または，文$phi$は$logic(L)$で偽である，という．

=== 条件付き文

$logic(L)$の論理式が$v_0,dots,v_(n-1)$に開いた開論理式であるとする．この全ての自由変項$v_0,dots,v_(n-1)$をそれぞれ$d_0,dots,d_(n-1) in domain_(logic(L))$で閉じた論理式は，$logic(L)$の$v_0 colon.eq d_0,dots,v_(n-1) colon.eq d_(n-1)$での条件付き文であるという．

すなわち，$phi$が$v_0,dots,v_(n-1)$に開いているとき，$phi bracket.l v_0 colon.eq d_0,dots.h.c, v_(n-1) colon.eq d_(n-1) bracket.r$が$v_0 colon.eq d_0,dots,v_(n-1) colon.eq d_(n-1)$での条件付き文である．ただし，$d_0,dots,d_(n-1) in domain_(logic(L))$とする．

定義より明らかだが，条件付き文$phi bracket.l v_0 colon.eq d_0,dots.h.c, v_(n-1) colon.eq d_(n-1) bracket.r$の解釈を行う解釈$interpret$には「少なくとも$v_0,dots,v_(n-1)$を$d_0,dots,d_(n-1) in domain_(logic(L))$に割り当てる付値$eval$を持つ」という制約が付く．

==== 条件付き文の注意

注意をもう一度踏まえるが，条件付き文はあくまでも解釈に制約を付けるというだけであって，実際に論理式を書き換えているわけではない．

しかし，直感的にも分かるとおり，論理式$phi$を条件付き文として解釈した結果と，$phi$に現れる$v_0,dots,v_(n-1)$を実際に$d_0,dots,d_(n-1) in domain_(logic(L))$に書き換えた新しい文$phi'$の解釈の結果は一致する．

= 冪乗付き算術

#let AE = $logic("AE")$

これから，冪乗付き算術 #AE と呼ばれる論理を定義する．

=== 冪乗付き算術 <AE>

論理#AE は冪乗付き算術と呼ばれる．

=== 冪乗付き算術の言語 $lang_AE$ <AE.lang>

次のように定める$lang_AE$は冪乗付き算術の言語と呼ばれる．

+ $lang_AE$のアルファベット$alphabet(lang_AE)$は記号$f_0,f_1,f_2,P_2$を含んだ12個の記号の集まりであるとする．
+ $f_0,f_1$には，プライムを付けてはならない．
+ $f_2$には，プライムを2個まで付けて良い．
+ $P_2$には，プライムを1個まで付けて良い．

==== $lang_AE$での略記 <AE.lang.abbrev>

非常に煩雑になるため，以下の略記を用いる．以下，$tau_0,tau_1$は項，$phi$は論理式，$w$は変項であるとする．

#let zero = $mono(0)$
#let suc = $mono(s)$

+ $zero$は$f_0$の略記とする．
+ $suc(tau_0)$は$f_1(tau_0)$の略記とする．
+ $mono(1)$は$suc(zero)$の略記，$mono(2)$は$suc(mono(1))$の略記，$mono(3)$は$suc(mono(2))$の略記のように再帰的に略記を定める．
+ $+$は$f_2$の略記とする．また，$(tau_0 + tau_1)$は$f_2(tau_0,tau_1)$の略記とする．
+ $times$は$f_2'$の略記とする．また，$(tau_0 times tau_1)$は$f_2'(tau_0,tau_1)$の略記とする．
+ $power$は$f_2''$の略記とする．また，$(tau_0 power tau_1)$は$f_2''(tau_0,tau_1)$の略記とする．
+ $=$は$P_2$の略記とする．また，$(tau_0 = tau_1)$は$P_2(tau_0,tau_1)$の略記とする．
+ $<$は$P_2'$の略記とする．また，$(tau_0 < tau_1)$は$P_2'(tau_0,tau_1)$の略記とする．
+ $(tau_0 eq.not tau_1)$は$not(tau_0 = tau_1)$の略記とする．
+ $(tau_0 lt.eq tau_1)$は$((tau_0 < tau_1) or (tau_0 = tau_1))$の略記とする．
+ $exists_(w < tau_0) phi$は$exists_w ((w < tau_0) and phi)$の略記とする．
+ $exists_(w lt.eq tau_0) phi$は$exists_w ((w lt.eq tau_0) and phi)$の略記とする．
+ $forall_(w < tau_0) phi$は$forall_w ((w < tau_0) and phi)$の略記とする．
+ $forall_(w lt.eq tau_0) phi$は$forall_w ((w lt.eq tau_0) and phi)$の略記とする．
+ カッコ$(,)$は，論理式の解釈を変えない範囲で自由に省略できるとする．

==== $lang_AE$での項や論理式の例

// TODO:

=== 冪乗付き算術の構造 $structure_AE$ <AE.structure>

次のように定める$structure_AE$は冪乗付き算術の標準構造と呼ばれる．

+ $structure_AE$の領域$domain_AE$は@Num[定義]で定義した数$Num$であるとする．
+ $structure_AE$の割り当て$assignment_AE$を次のように定義する．ただし，ここでは混乱を避けるため，@AE.lang.abbrev[定義]で定めた略記$zero,suc,+,times,power,=,<$を$zero_(lang_AE),suc_(lang_AE),+_(lang_AE),times_(lang_AE),power_(lang_AE),=_(lang_AE),<_(lang_AE)$と書く．
  + $zero$は数$0$に対応させる．
  + $suc_(lang_AE)$は中学生の算数の「次の数」演算$nextnum$に対応させる．
  + $+_(lang_AE)$は中学生の算数の足し算$+$に対応させる．
  + $times_(lang_AE)$は中学生の算数の掛け算$times$に対応させる．
  + $power_(lang_AE)$は中学生の算数の冪算$power$に対応させる．
  + $=_(lang_AE)$は中学生の算数の等価判定$=$に対応させる．
  + $<_(lang_AE)$は中学生の算数の大小判定$<$に対応させる．

=== 冪乗付き算術の解釈の例

@AE.lang[定義]と@AE.structure[定義]より，適切な$AE$の解釈の元では，$AE$の項は数，$AE$の論理式は中学生の算数における何らかの式として解釈される．これを観察してみよう．

// TODO:

= Gödel数

ここからは，再び言語$lang$だけの世界に立ち戻り，$lang$の記号列に一意に数$n in Num$を割り当てることを考える．このように一意に割り振られる数はGödel数と呼ばれる．また割り当てることはGödel数化やGödelナンバリングと呼ばれる．

== アルファベットのGödel数

#let goedelnumA(a) = if a == none [$g^alphabet$] else [$g^alphabet(#a)$]

言語$lang$のアルファベット$alphabet_lang$の要素に対して，以下のように数$n in Num$を割り振る写像$goedelnumA("_") : Sigma_lang to Num$を考える．// TODO: goedelnumA

+ $goedelnumA(') colon.eq 1$
+ $goedelnumA(not) colon.eq 2$
+ $goedelnumA(to) colon.eq 3$
+ $goedelnumA(exists) colon.eq 4$
+ $goedelnumA("(") colon.eq 5$
+ $goedelnumA(")") colon.eq 6$
+ $goedelnumA(",") colon.eq 7$
+ $goedelnumA(f_i) colon.eq 9+2i$
+ $goedelnumA(P_i) colon.eq 10+2i$

$lang$のアルファベットに割り当てられた以上の数は，$lang$のアルファベットのGödel数と呼ばれる．

== 記号列のGödel数

まず，$lang$のアルファベットのGödel数の中で最も大きい数を$m$とする．

$lang$のGödel数の基数$p_lang in Num$とは，$m$より大きい最小の素数である．


== $lang_AE$のGödel数の例
