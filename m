Return-Path: <SRS0=FtFU=AS=realtek.com=hayeswang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3578C77B61
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Apr 2023 12:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A9A5C4339B; Thu, 27 Apr 2023 12:01:58 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7FF7C433EF
	for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 12:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A7FF7C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 33RC1hgyE017226, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 33RC1hgyE017226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 20:01:43 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 27 Apr 2023 20:01:46 +0800
Received: from fc34.localdomain (172.22.228.98) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 27 Apr
 2023 20:01:45 +0800
From: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH linux-firmware] rtl_nic: update firmware of USB devices
Date: Thu, 27 Apr 2023 20:01:11 +0800
Message-ID: <20230427120111.28912-404-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.228.98]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

-rtl8153b-2.fw
   version: rtl8153b-2 v2 04/27/23

-rtl8156a-2.fw
   version: rtl8156a-2 v2 04/27/23

-rtl8156b-2.fw
   version: rtl8156b-2 v2 04/27/23

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 rtl_nic/rtl8153b-2.fw | Bin 1088 -> 1880 bytes
 rtl_nic/rtl8156a-2.fw | Bin 3816 -> 4024 bytes
 rtl_nic/rtl8156b-2.fw | Bin 5448 -> 7256 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_nic/rtl8153b-2.fw b/rtl_nic/rtl8153b-2.fw
index 7ca22a65efb73082156bc89491953c49730d1b75..bb8e16ad12023fbe432b63bd03abd3a8bef4dc8b 100644
GIT binary patch
delta 1384
zcmZWpeM}o=7=Q12EjJjH@?{IOK);X}pp=g>&9>HM=DHAKG#Zm>7@u1rIzCF5sG~P$
z2y88&H5nODQ2)@sw9ZSMqV6c|Rb`H0tJGM>TjZnSvRxBq7(?(aQ380$``kUhd%o^>
z&-1WkFv(gtc2#oX53ilhGptp-)_VA!-CHPbtf;0hyKLwDR$H67xw53Zw60K}YtiTG
z%8K;|iuI*n`@+%FEdqcS09e$ngHdXIbMw*lWYBf!B6(Nt&UiPQm%;px%2!jI#ue48
z(nXnBG@5ct5DPFf6=!|!*(YmSYR&bhYwFK5G}h>KdcCd^CFoCvC*T`!2)f{Ra2Y-o
zt_wGY&xQNKm&5nNk~!tvQ4d{z)g<JN9()3fbsuW*JTdXsAjs;v)YX37v=OD-%iV^-
zvI%<d!Zud4$Kp%MI!5g@$VCP@yIdp)F|_ZrN%YX|F|Sx!(c!yO%@H_RGyz6Q=6Db=
z;GJxattBMsQ5m`q<qoO$NyO1K4wJDxspF}f+6ffeUajRGDp6@6rQ=Fx9EXpCFKncg
zInMOopaWzmIg;a$U~)|2D8_Qq%lzv3*ICdpZA#?Ltl0|`q_fRYgUJ$_VkiZMfA`fm
zE@0)dEbjXOiS*ln4EDxApY&$;&6YltCIMDBrZKq{g!)Z6d;yC!2{VrHnv7%oz6=$g
z0W;kOOPDe^A8`W(<-EgHInOJqd#krfOxUIMn{XevK9{eaFY|*C2&w03yv)Dqd+=|B
zzqTSw?($jwPqS_XoLw>m0N8L>p`Ya8MV2+U-oWy=ITn51G(W@6aQhKMq%*+9JNpz#
zy-8bMo~2BVJ;j?+d7fhX+-K9q(-4!&5!*JG4^b<`A;yy_wg>0HH=PyDh|Cz3iXNN=
z*Va<vq%3Ge96C<nk6E3jcwX!_w2qkYC<znXhT69&Ll5o+U%#o2$yL?Hlp?U<gB>*#
z9435QZ=`8Kw)-XD^W3~stXS+_+$wFZ1Db=HpfaeXRHySPEx`yG5p#^2Q*9gs*+33b
z_wz0j5yga`YSxynm6jjXmS9$-tSpIKLf6MeO^MFiY$RMlM&~Qw2+_{q&=S!^RIB+4
z?-^sM>a!BF@qUSn>ojI^o{?zYtWM~14?m;)pd`unIXY*JNxnsA!o+Re$%cpx_kgb=
zGQb+aCa|LEJn1JxSsuEBOec6NCZvbO5Xk9a4T6HokQPfPqKO`foVKSa7J3P|&{Rh)
z^v0UpCVJXm#YkAtI)K_4lZc}6946=NGWocjU}L@eehM2P=9#fO9FVj2hg_Q6YbUrE
zXFm!I42DMCfcC_T0IZ@FL07IT9Fus#k)NjoEzPyB)OY-E0aWM?f=ippPzw*hmtiNI
zgg?M3I1T;qCpZItfxp7v;H*O~SP<ky{&on6ax1x9=8psbgE2VsU_7_3D6d#EYEtnl
z?24PX0y0GxMQxv;SpaSCnWX%mdoc=JIlsduZ<mg{Fc)yqo3S=}yn3$$03nVKak0aN
Ni*_86jIFqs_y-NcX72z1

delta 625
zcmcb?cYve*T^GlS<#%#~PZmv?HLtW>`-<c9;<@?mPqea3D=Q7X*A$iHSQwfbC+Qj~
zlo=`*8t5At>l<1!zyTAGRRJU-7#N<Z{b5+(@#jCY#vd*Q1+8To?_>{&O_BK^$zu{{
z{6lD-BU}@LQD0h|6km{7lAIBroS%{!Z)9L-X<%t!#xOzPf!YJB2N4f)9<)AK`e5IK
z8xL+j`267OgYOT1KKT9M?*p*|45b%6c|Y(U;6KVB$1#s*F3&NpdHphcJ$xnSJ^y`V
zI>4}Fnjym-l_w2MCYS#oPAFOkRQ==dk3$SH8FRiJ$(oZht6!!*uO|<zoaF%1A%<Nm
zG=3a^1vXgpgXD4XLvLm=NWSZQS2!PN;42`>_2DL1?8VGRxH#Kkkj@XXJ}(&VFkCqe
zb=HvsN5IZH1auV7T!gcL_8er`c|=U%$~KTnHV=lmPmiyk%*|xVIC-)olQ^UE<VYsj
zdgDV5g%dp-W*Qt~ko1`O<Dd`FLcdNwutT^}cua*L>-kJno=8IVh=KLoLs9h+g$L1-
zU~F=k;f`D<D5QP~NgQBEz39pJLGXa!QHIHl%&L<O*yVtjje~)K5g1_&jFZJ!%`}0m
sf}F(M<Wh`SGcmA;H(+3WApJn+LBfOL$=$3^8UIZ#W-|pEz`y_^0DxxyLI3~&

diff --git a/rtl_nic/rtl8156a-2.fw b/rtl_nic/rtl8156a-2.fw
index eec923b2cc01b8927f727c381508e00b61dbbe37..5012cd28709750a1fdd283e5edef893b0ef82922 100644
GIT binary patch
delta 1075
zcmZ8gZA@EL7(T82g!Z<jU7@tA1xf+Uq`lxMvbbtCcJD?=(9BF?(g3A0g9=+${h?`V
zhygb!@g{~ccIR)iEL&*IB#xcijoV2`7e_NC)_6M`ce5{UXEI|X)YEDj@%%W?d7t+=
z@A-Jn;dftoHdKg=UVfB5YS4%k?hA^+n@{`~MLp}@u45lfO#X3Wdf$n_sN418-hn;1
zEr{Ek?X7r6E8YgmO^ilR2EbbY{N~sKUlLn|Q1g}sq&pXs`&zaw?xv->!Os4^!9l-f
zPD|)Ub)5Dc%|FwBxFruAef?GM*g#-t#5?r9Z`g}FaomODZf~#yoGxg&Dz1(DnERZ&
z$fdZ3?EdVr>_m1oyODj672oCViXpfn9I>!)K%(1~Hz8cGE!dShP2RwYOmIri=vg}r
ztd1E+aFg85*9R3$JuPR&4ETmt*2E9T+h*6oX+=iMH}eh2y2QhIV0t|Dc>FvP-$%Vc
zs4a1PEK=sHsDq-qJ@%X=2jY^rG%kzxL2zn=tQMT`=?bupG$?4*xlb(E87y!M)oFwe
zsHkYS4o9jVNwuJZcaTa!pQNseOlpuxZkmf30-Rf>vLb!x1?J&@R+C&8C&1E6O)zcG
zwXefTD+|Y>Bql_O{p{+TuIA>P5w6WeYf_Ub#Bb*-xi%Icwi2<CGF!Z;Z|gkkwp<Go
z`K88}g+`-CP#PNqBUhX71ha&Pu1)|eL2riG9y(&}o#`#zSmlmrmJ}z!HD70OD<A_h
z_FP!pz8=2*=f5SMmP({{%(=fK`sJP{T}bqtyhg4Fzq0Vu_v9TR12e1&xul>s*b4ek
z)QZhurNzIySIfe;1yU~v1dJv=FfayWXZ`szWkdfWrGgyUt|j1<m<7vUyfzx2T`T%&
zTzn)xE9yCL;~*rMh&jb~!vl#4^D6%)1m+|k9{#ERXU8+Us`9<C1Lc?bBM@gM%}YE1
zNfdw0OF%c%orsz*^Np~Dc^-`xZ%al*p)T0PfH8%qJ@1BYMim1lYziwqn2Pavq9PV8
z$In49K1+aD6GA;g8?^mTe|Cqy3hA^+r$I;|ltEwuF=bM@0<MN{f9eD1SeN8!SsJEK
z7#2M;m0TJ?AL$LMPkl(%>}thZ05z|+s;7N+ph5|MDaoiisn66{O*38;JgGRWc4($`
zzZ?3ip~+!6U7&23Mfw$z_EWE5u3DGV`K~wcA^MHOe*f{I<HPR-ye_x1!?l;1z<hrL
D;3~{r

delta 855
zcmdlX|3bDtxj$^<vSi-3Q+sPZl(F9VrJuo(e6#nh(q@+PnW7qwmy1erEDTM}5_OFf
z$_y0@O!N&+^^FV};D8ClVq;*4VPJTs_J?7C$DjZ88h`j1u2{~nvC(`dW1+rF@sHm>
z-=w58{uu%uf;oZ@1hV)c+OMBysSgcyiZ4hkNzRB*&QD2=H!?6XG%z+ah%Yl?=>9M8
zK;wb!gVqN#A8dJW<-xB93J)zGraoN#aM!~#4<A1~@JQkSL+K4qz7GNi1dcMuam?eH
z%Xf@xUcU@q4`0c7&wn3XUoahD*zv)e;f~4^mM0BNCYS#oPAFOd)baiB_d^Ua8FSpf
z9m$%LGpk=FuO|<zMdt;}0j5I?yJp!m99Dawd|dI+n^_E!?>gTV&IcO!3P_54xCIt_
zF|!daerd8HqoO9m7M3lnTiCYj2RiGfr}&5M2X+9Rm7xrBSQFe)YYwcPT+b*gxB%>U
z-VZYl%m6!n`sB5YlCCG-cY(w`80H>4E()<{7Q!CggKv;*WjPFTsg?SHD=JS8bjTe$
zP|y$bTE9oeWPT=b#+b?KOtSSpha3uLc+B*0nCWqdL2`zI$4uFSJ~Nvn{W|@?KC%Uh
zddz$S6l;Wwaij2<3PHB~^8*E;D%><hsA=C&OcMi}b`+ss4j5=p5L_S+VjP2?$z_H+
zwwtw?XES;^A8|S0ey~yc><iZe&WBp0Prisaz#x6>MMLUsrMqg(qCy{i510Yv_rCBt
zV0f@YdglxG10F#B))y=ct_NKY^-FJfp>jaupw^+yLaZ5#Y@kSIVA#aY!_Ha&Old)r
z1^L{W7$!`P<C7EM0SY961Q{mm=-VN2V6q^;h5;i(N@7W3d{JVq5i~KD85qTv7AG-$
z;_~8E<L?#xED|MtKvGSncQz>LPJY2B!?6f#%H~F(37V4)_*f@9@rg~2;7<Sm=>%ya

diff --git a/rtl_nic/rtl8156b-2.fw b/rtl_nic/rtl8156b-2.fw
index 7bf4dda806e30772949ddd10ed30703d89b2a833..417fbd3407dd51670d25e473fe2b0ee56d33163b 100644
GIT binary patch
literal 7256
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
U03CP-6$E-F(C^6fXTj(H0NqYnNB{r;

literal 5448
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
WY=BL04#J<o&o0bS{}mLC?|%a~eNV6e

-- 
2.40.0

