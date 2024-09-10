Return-Path: <SRS0=g6Bl=QI=realtek.com=shumingf@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29D7ECE564
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Sep 2024 08:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C618C4CEC3; Tue, 10 Sep 2024 08:22:23 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FEE5C4CEC6
	for <linux-firmware@kernel.org>; Tue, 10 Sep 2024 08:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FEE5C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48A8LvbvE1791214, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1725956517; bh=yN8+a3TH/bTpDIFZneqjFfp9UQewg9M9OS6PgHFnk10=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=XtX3f0XwfYETTFB3Xo+whUSxokNEszZwAIFoQo9cF0MYPDPe2bUPW8YYi2ta+HgAN
	 B0qW5fFnoXru5W4m2dKEnwENyhZk4GjLgk7tgk6XZH2jiBbUO+wWLKj/Y0T3IW2FRi
	 0isppXoZt2qRuqYEoJz/QOq9E1E/TZSDP5NKiKh6bkMjPxgCnI0cbiFzp+BnHm5qDy
	 D0obecEN/2SKSIxKRGUt7K6yxoA7pVp8GpqT0mzCbp+9M6Om3JFSMGuPAD9Vgeebyu
	 /MsJRPOZHZFNEyR+MLanJiO53m8rYBoqVpF00RMWT80fZDXSL3jsDS7zvovvXG04CQ
	 P4YS6LljqaPGg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48A8LvbvE1791214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 16:21:57 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 16:21:58 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 10 Sep 2024 16:21:57 +0800
From: <shumingf@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <flove@realtek.com>, <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <charles.peng@realtek.com>, <oliva@gnu.org>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] realtek: rt1320: Add patch firmware of MCU
Date: Tue, 10 Sep 2024 16:21:47 +0800
Message-ID: <20240910082147.2075327-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch added the patch firmware of rt1320 MCU.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 WHENCE                                   |  17 +++++++++++++++++
 realtek/rt1320/rt1320-patch-code-vab.bin | Bin 0 -> 24480 bytes
 realtek/rt1320/rt1320-patch-code-vc.bin  | Bin 0 -> 15232 bytes
 3 files changed, 17 insertions(+)
 create mode 100644 realtek/rt1320/rt1320-patch-code-vab.bin
 create mode 100644 realtek/rt1320/rt1320-patch-code-vc.bin

diff --git a/WHENCE b/WHENCE
index cff34e0c..bac7c864 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3494,6 +3494,23 @@ Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
+Driver: rt1320 - Realtek rt1320 ASoC audio driver.
+
+File: realtek/rt1320/rt1320-patch-code-vab.bin
+Version: 0.0.1
+
+File: realtek/rt1320/rt1320-patch-code-vc.bin
+Version: 1.0.0
+
+Licence:
+ * Copyright © 2024, Realtek Semiconductor Corporation
+ *
+ * Permission is hereby granted for the distribution of this firmware
+ * data in hexadecimal or equivalent format, provided this copyright
+ * notice is accompanying it.
+
+--------------------------------------------------------------------------
+
 Driver: vt6656 - VIA VT6656 USB wireless driver
 
 File: vntwusb.fw
diff --git a/realtek/rt1320/rt1320-patch-code-vab.bin b/realtek/rt1320/rt1320-patch-code-vab.bin
new file mode 100644
index 0000000000000000000000000000000000000000..0840ecf0bf3f198173561062584de58880760d01
GIT binary patch
literal 24480
zcmXZjcf8i)8wc=jMcGN^*vd)St2nlk(XmHTb_m(o*-lE?B4mpwdxc|@(XoX%wurKR
zWM=n!f4Kj8Klk@~?(4el`+I+%=Q+Koj;<E1tE#FMhq5(MwP9Y&!zRwlS!`S4?Mi$;
zc65Dyw&McD1zB&r5No+G@8%**p7wm7i!${)F!dKBs*cQyPE7vJO#a1-HO%{$VDc}?
zo4FK|e`$WqWtjZSGVfoGsFr75bYb#$W%94UX4diuc4P9d$UE7c$=`#?zY>#wWhVbB
zM71jOVl^iJ>P-GMifgj3@mfs&wVC}{hsocQ$={2~zb=!1J)){(UaZgL-+;-#Ase_6
z`*C9?|0cYhn=<(~<L9hr^7rN_ZcbENFfX=b@^8iD@5AJ8;4R#m$-fQL|F%s2?f4<L
zXY%jB<lm8~c4A)a%;evN$={dBzbkKJKPLZfO#c2%{sElH-I@G*F!}c+s=b&Odo%g>
zVe;?GW)9>d+>gn>KX2jzO#VUqk_VRfLCpC&xWosS_#sUFLphX(5!K<$izAr&M>6$~
zDh}b^#z!;tkKqI!%hW%Psee3^{{$xgi9|J&d2tex|70frDaBK{pYdr-{?mCY&tUSO
z$*<YS<R8XSJd3D?GcQIk`OjwZk7P4P@hYCf<Ug0$zw?;<=kr@$z~sM>$$t@1UCg`~
z&E&s?$$x2a3|}(7jLCmFvp-ib`NuN(uVnIH#q7`3M0E}G;#wyEbxi*2*}xlk2*)w`
zZ)Eo8CMN%QCjZSG%v;#V2}CuqSRMag{Z?#oy)_eWQ=Esxjpt<#wq@$KV}H)aCeF{c
zT!5$+WNR+ONnDt7xCm3HJy9*nLF~ZuxER~9V~Ka-7~{@N{>7PzH6^|Tv;HNSK9}Mf
zT$)>Q8D{>nOy1=<o6B=9yD;;+as{ry^jXWSuN&*QBGY$wqUupxiK)9Xvp=ga`?D%{
z=W0y-)tS6&u!d_A)mj|HwK<aOFn#tc@m|dQb<6ejn2B{IzCP3c22B4OGIcg$>Tk>@
zZo(FBN>rN_>)FP*Hz#s)rvELN`CBscw_^J0LsSi%hg-8Jx8YE3%Q@VRsJ3VN-+`IG
zW4XRlac5@zyKoWqW!|?dlfNJ9xLdj2pN7={cHr(z|9dcf@5xczi^;b)Q-2@k{Orqm
z4kW7m*pd4){U5;eKZxylAk*JL%y~YTEgZ}RcnFjKP$vIjJer3S)e+46Bbf_FG4qEo
z>pPm6e+;wkW4RxXWAYu(I-bDHJCUe{7Ej`E<CEEkr*J4w<piF_<UgG=c?OgBO#a5k
z5+BB2jn66$XVyQ0<9RmQa3s^mC?@|oO#O4&hvzZ%&u2c5E@0|k$ke}xsedt3e{_jo
z!qmUCIEJZz8B_mqrv4R7{jp5`E7`=WIE7ae)iuRyS!;Y9NAP;4&J9c-<Cy$6miSF2
zKEA|nX7b-s#uI2*O=RxhtxW#gnCI_yroTIw=jTq=@vd_HZW>ni6z^r$bsu~1e&!rc
zV&*@<)PIoa_aUNc;(UCVJ^2WS@=>P#V?^~h2k{A}-zS-K_EZ@^&Ga|9Tz`g!)w9g=
z^&HdR^Gsh;*vw|;`Fer5zb`WVy~KLHOjNJ1BVT3udyRAWI&*)gGX1?lRBtl<zs2-B
zjmiHulm8ta%@(41mzn=w8NbiW|A3kQVTpgl5yl@g>;Hs#o~N^kpYk1kMpQG3pEK+K
zf?4-W_UA0#%rBYseZ|52n#unSbH2YV@&9qC@pqiV@0s<_=6L?Vv-l%t@+T($&#dDw
zO#NSpYEJPt)*AoLtmh9V|DVi${lzB!&GhvTQO#w}Pj$k7^IP#I!`966(S|vH^Dyh0
zmyK*oRPBoMG52SFCjSC#<bq88g*b!@b2b;@4Q$WUS(KUIftkM;8`+VW--(&unVG*h
zKVc33;u6gKC7Jn4aX&82tbZA1{<6&c<v5VbGxNJJ``eW*T!E-+i`_Wfct!SLccxAc
z?#h*z{au-<w+eF~Rwb&{IEkxs4%cAntXbk~agg!aJcsKr`FoalFLpFum&v~#$FYv{
za((9hZ@^o*At!Sq=A3R^;+t?K<4u|Rn=yaC)pIa=vyqz<)fUAqS!cWzGp|p%-oU(Z
zYi578VFR~i`rnT4aeI#84ov?$vI}=2s+~)G7tS&6Tilg-KKe2Hvm38vf2NNC%s%hV
zChoy0+>@yGD(=nnw-1}SFS~Of^ZBqJ)8GC~{R4`Fm~|Y;?C(Jw#)Fx2JD8b&2vh%1
zzQe<a>hR(bO#LI7`bTjBhwxJ#&D1}Jsef$oIHvybO#KshAx~uL59M^8RN^Ny&&w&y
zyi@ruPh;wz&IX=QJd?RUjZFPv9L2L(!{J0VqQuW;`Wsms#oV8BnEuXXeh-~j;^#B<
zFJKcdWD74Ms*8)Gnf@**@k^Qh$1wd~#*Vz4V|fK@IF_w=B?s{;<~(1`%)f>?AJ;PV
zuVXW>C#oBY<JiXd#uC4YnLnO+er{&==N9JtPGBP^GWBm|`n!!oc{}Iu4rYJuWcs^{
zOYm;C@E)SNm#Kdr)8GB9;UwmKJ;3CDkjeiLlfQ|%-w$&<A7LXO<t#qN%zvDN`9z67
zNyF-?;?rz0p3I!zXUg?wi_dYm>(4X&O=0$-nGJk_*`F7gzFy)ezD!iFFzbJn=kPVQ
z<Lk`*naZsH4JQAaypL~jb53LCzs*j3hne5P%zu~JpZCi3_nE>U5Y>kq&yRREKW3i0
zPni7ES;tSA`kxWijN<1^e_yZ<XEOC?G5hc(YxxyN@@r1!H%$I-Ih_Av@_)zV`JN4&
z&FtR~%>MmY{E0a~KQsA%A*x?Xd=69pw-W!IS>GSbx%`u<{}%`IZ#MEDqMBQ*PW<ow
zw_=Oyt(kb6;yg_M^D_OnWjnTG`k#;Ke}1O_1xkEDrjLa<hzm1+-!D?)?V0`;E%6S_
z{alRsUh7!motXR6nW?`xQPmWeVES8<J-8I}zNMM(`DK{>TbB9vx8?W)muEe@u!&un
zepVo=TINMJPU4Ep`nt1)J&0;0W_>I30<OY#T$OqLR%7~Goef;0#Mfj#U)EywZ*3<3
zIvmBG%>MOa@~_L0T#w0L$K+q1$-e=Ue?!)ABj)pAV<!J5O#V%o_iaX0^-TWWY~<!l
z{w<jNTe68;v6+4N3>&x^w`THh!%^IpnZF(L`)Yfpza2P{JF<a05!KGj{9V|>zD)nS
zmUzDs-;L?Ne~Aw$@!gsJ_uvTb$<*JAIZu1DmisX0Z(rvA4`e;}W7fAnGw%SR8pNl0
zAnSM#Q~%%+A6z_y>HkoU;$h7D4(D7R!PGyJtMRB3AHtlsqdAzzu#v|S)p5n+nfWI$
z{h!F3i=nLNNlgDIGj&fPs#A-nG4oI7ojikC=b23XMyCESHu5Z@8eSa1I^(n1%#r2#
zsNy*s?)tgx!Sk5+ozFaf7qBBQWS;Abi0b0vXr{kQnCJ6S=KhRfJuhR{cRADV6+|_b
zd2uBt@hWEhSF?rJ5Y@FD#Os*n=X$o|4b1r%$Mk<A8+cQRkLSPN|IGcpg~>mGqd1Yd
z54SS;Z(}2GXY${{<iC^2e;1SgZr1P~=J~vr$$uY{|9<9ulZfg8CjW!X{eOtb-&Eoc
zv&r}oHuF*D`FxCdJ|AZrKEYe~B$NLs=J|Y@xj&P+8=v8de3q!5EAi)fg7Fk~W^;+Z
zz`@2ZvXL*9>n|5yVe-Gq?AL3>*O}*IDr@-$yYWp9<6A^Et;FAEcjI^1fh{HeZi&Cg
z6<mLxm+*rU|B!XYA8{H#F4sRPPG|1Vr_8>5#(eJ0U_XA&+@CKvmNPkuvzYaKS>j)@
z#rW$I|AxJdzh&;<|Cryy-?1IPXU_9%rv491{U4b=e=6gjnfkwQ4u540=MdFzO#a__
zHUD7p|H-W5FE;US{>*=fYHqO_`d|K5%=6ir`>_qPzImAYH!sg-TlQi*_T_y1p7V1Y
z7vN4@kQZ|yrvHVR{EHA(d!|1>YX8mOfyuuZv+o_5H+Ew3cjh=Q&g8A(MO=c(za*1?
zDWY1M$-fNK|FTT}<#;@oXWrO_$={XZxB_2iE%WzQH|GAV$lRaqoW>qyyb|k-S7r-W
zA*xlG7ppP-t<E`Iqqrv98?RO3Yjc+II;>$&qUy!*T$lOxw)OZk>)40um-q%;(0D`U
z{%^#bw~d+pH(~nUl%u#A^Y>pp(_im$eRHP%7DTmWiEqX9->2BX^uIN0xeXWMwk5tD
zQ-6EbaR;_=N21!PxHHq=E=+%Ynf`ZW&Otw>zulPn{fh&b_wCNq--D?3Eb+aV`Fk_@
z_hA?A%gG!_RQs_F_h&aAz+oIz;s-MG4=VA4ndf?Ni66q8uS1#V<*?%6#UnV_^&{EH
zqljuq@o1+0F}#JxGWCz+mOP%xe*%;L#Ntrq^YbKTe@<r3|0%5Jsm%LNV=Yf-K0nW3
zK0nVSs>Tu@#;pG=rvC5}A5r3GGoP;`na|fzC4LU`{G7|_JddC7e9q(r9K;K`3@>8(
zyqKs)Gw0(HHuKVQeN6E(X8$i|1FzsHj^!S_l3D*%%=x&wcnxztuPyQGILr8Y*6;?R
z8prI<jm-JIiODmbyYptIzgw98CJ@!c;;l@7w=w<Q&UU<m`TcMw)8Ac8-n*Il_Yl>+
z%>LZRD|tUNe^QA*z~q0B$^TG^H!=AiX7WG6<bRYs_!v<=&g6fBXYolU|5MEGkEfaS
zP3AN{LsZWepJVDj&(xp7PHZmY7nu4lGWB0#>c31>uQ2srWq!ZB#?*hE`Tm>A%zuM9
z7jH5X-y*7M?8vuE{2g{NZeiZ=E_43g<2b(0o%jK>-Vd4eeZ=Jdn0YQfA*$(2{ZC8$
zvvPd~^S;lS`d^gzOg?Bli{tnuQ~#?n{+g-(4f7m*%k1C(nEm^XdCtD)bk1h-|G@P3
zBOCb>H|5Vvf4`LYuQaUY6n`u6-#N?mKbZaflfUt=691dIKmQcxvb}M2(tqc_6|>&f
z{F!Yyo%1mL&&%}Rmg&D;iO<LMH$Rhqf#QNp{)I|>VWz)DnEu*x9xlpSc3|o+#?<e~
z>FmVpZ|5>zoY~(R-pD1G{+49=TZ+B7G^cYJroUyG{+46vFVEKO!Wrz!{QL3>C0@&a
zjJvUpD>C<|JJV+mqFRZ`zjBGMQm(IBT#X&YS1<83nDetH$8jxYeQR?x*I_<CdosVz
zdok-<ms#I>?8Le<UZ1JI0kggh*}{#O{ok15xe4>UZ_4cNX3X!0dbVM2PUPmy`nKQz
zZpq}|irKe59LEM`Kepx|Zo~AoEz`$#%>CV-b=-lOzavrY#C#9!%&c!0W_^8`_wCB`
z(T~}`-I&jd{#=U#h-!DHzde|`dlvU%*1tE?-#*Om<9*r8fz18ik6HizO#K5mii4Q?
z2Qu{!;!qyU)EUg=KZMDDD6{^<O8jsp{}Igkk7NsvBB~+9qnY&|!_+^PdH-?j$K#px
zoxs#Ru{e~ee^QB`%vr{#upLij>Yv8(Je^t38BCrtnf#4R{b5Y~vzYqBOMC=V|7>R7
z$l@q2Y<v!r|6C^jc_n^6lm7zN@<QIqi<tLa%zS^1W)m;rG+s(nV~UqC{awyxUctO?
zEYt6mOn+A~{awu(UPDyZauBcM2wu<Z&kfA;FphP+kuAK5sKzrdZf5G=!ql6<p`6J4
ze!i8de;Y^fcBcLvM0ID0-^Dq`cNgzr?%%x}&-<9)@AsGZB<A<?18l<wnfebg^_!Ub
z4>SEe!e&0o=lB@&{>RyoPcZYIWcqlDssA+7|KxK0nc}l0{u~F1KhOO*rNo<==kW#B
z@kRd3mx$`+;ww!4SDDX?*UI(RnR76e>F<paf0Mn8-(vp0oW}3@Hb?Uv-oO_A$ak6i
z?=kt`C#nyMA2RtrD)Eom&-fGOjnkR@pECJBV?KXp@CSa*<o|-nKa;3t6~AQie^ugN
z^LXQLm^XgQ<o_R&|2r<v@0t9wnfyO6`F~_1e`5CMXD0tICH^b(xjKi*{~MG4cP9TI
z9LPU8n}0F)=WllAKSVXRSe^V|{#H!=);ybS_!#G5`kS}J+tRRVSDcTjKR>5)0k-FY
zyp#(u^A~3FFT#7-o>||b%=$W%_+rfZIx>YiG5I@lG#6*?e+|Fm63qEuk~#lNaT=Fq
z&i^t@{biYRzZ_?Ad8W@U9M7)IzbCA~pIOU%KXzjiS7Zyj6IBo9#Y$|$m6`ghupL)r
zp3l{o`l~a~%NoqQHHm61X8mh(DA!^7?8)@ki+TRm<x*Ua>7$O>r}dfo8!+`ZWDjn{
z)Zds*+=TCNQ=;0eSkKh&&GfxFYq&*;Z&~77aj5HkIEM{Pe_OMb+wfd&%URrx`TW|R
z>2C*4;f_pyJ2Cz3T;jX1*|;x9a#uF6AJgA%JdyqRD+e(3cQ5fhnEv);`rE6-_h$BQ
zA0EtoIg<nV@Ap5`-~LSf12}<$_$d!$>L0|xJech`nE8EuNQocH)IW@=e>l_M5zPJ^
z$^3iLQB3_IoX(?}`o}Q!k7XT?WA^8Grv3>`-4j{Ep+t33iJ#1&#;0%&Pi5+##_>Fz
zxj$!c7SCkvPa~6m7?b}jcHwZM8o~5`HqYTmX8tH<{y7}ZbJ>OGaWc;*stcI)UC3^{
zh{JesiH~OHUsB?ivbXV=62FY;?{c={6~(c|D>>NptJuh^iRzl-wak8A$7Wt%uHR4`
z$JD=(J$MuIzVXcG=*_I<Exel(n9uErtmmz4;%#ip+llH9=Ea?y#JiaLayMIe4^iFA
zLA;NRyr1nji3{)nroRW-z=uk_iTVBXFvsu_CjX-x#mAWadYsAs1oQXzlT7}nnBPB7
zGx;Yo`JZ78pDpp{nEcN(`KK`NYbL4}nEWqt1YctEzs%%+g}HyPGX1<(e4TTRr?QrB
zush#m2fjsA)7Zqf+01wN3|qJv-(?%V$BBHOss91<_tS?=e;+XkKW4s%K4I?Hbf&*g
zIhda@^JlONKWF;;g5x-ovp9>%|0PrZD^BFs%=~Xk{97jf|2UZ6mH79pH=fPp|AFK9
zBa{CpCjZZ@<1cLHugv=AFzf$~!}&XV@DH}*pUnKfnEHS71pdSP4wy^$!1yoTin-pJ
z|9<~7;dwZQ^D_6pZLuA{H=d6@IX}PP0-VSNiE1HceG9V-7b)@fOn-|q`8zQ8Wig`a
zSnR~~-?_vW=Q!h<5?_MpV@XcuQq1Sx(j3NRnEhLp>3=z*TE5tY*}txA;0heTTIRfV
zWBOZ>ncuzGgQ>GpiLcCA#;Y)SRwb&{IG(FB&+{5go;6E+EvEk3?80?8nLSIq7qk9#
znSRzQ))m+1VAnTbBR3?fjfxvH^Ecs8Zpzf(jGwTcxj(%*j+-;<*n+t~Te1ze;zagg
zJ2sT~)=d6wnEcx^`M2X!+@3?Y17~wb4&+Y!gF7?*@4`m*C8}ME{h0i_G3)PN9KgB8
zyEFao!F<2$$zj}!sP<+Z_u(||Tdof*?#Jx^{_Md6nBP@{xGN82@*l(%crY*FV4^yN
zO+1vDcUZZ8IO~m%VCEmme7+sU4je*MM{^R7VfO7<j^%MBemn;mpTLnkk=g&DC4Lff
z{!ivqp2CZHDnH<9O#Rcj63^geJd=Id$l)BuE<B4lf5VAt1l#azW`9RA`#Y+{&tc}D
zTjJ-jxAFNUegSj;E@UfSRJ^!2nz{d%u#uM%)tKUC%>2ul`BxOjGWY*VW_?#N`+GIB
zzt<4ewIzNX)Bp8M|2LHQIA;HD<kP%~IiKU1|9|mjW_`D?nG={kCbBng<sjb15xkwb
zKX)+Se|IwH<1V)FZlb!UcrTOxJ|_SD%=}4g-~$}P2buHnP>DA&zh56_>OaDKzdu^y
zk1^-*aVGy0O#UaC^ZOLH;L}Y0$xQxdm_DCndp^hHf1aZ`h3T)Ess94o@I@y7OWcJo
zb9cVNCcetddyS}GXYSKf*76OW!#6pLZxPkB5`VkI-zo7Hb`gJ<ssA2R|9$4Ze8ANI
zkjeiMFW|>a{!fT%I*0JnGX9K>#xt1x`<&_j3#R{>L^X@)|4SzSS4{t3Gw=I`sJ<=n
z|CRW6CH_6Th|ezZADI4rEb*UcSp8h$zm)i|B|e8;#D8PX@9(^qfAC`d$@KFVvp;_`
z=l>t({LdwPQ2cj3TCs~^YffexqMC<!{^n&Xwk@_R&d2QE{7n4?nEDIy5-!BlUzoW+
zi*OgVXYS9U%>H&@_H8ku>c|f4#O!ZpW<85@7Hf!V2@dCyoWiA;`@b}ke;H=}vdsMD
znDf0nyRb`%cV+f}g%Yo&VbzW4e?_MM?o9q3O#YRa{3|o_S7G{Fm0h?Rvp=hIHrL=M
zT$A~JU5i=&+HA{ph^i;E{$5P|b(#9>G4HEmSFT^;8!+qNkh^drroWAu`?m@6`Lrq9
zaWkT-FY(?SYP>n;a0|BQmK?;bn16rh!<lR#s;xPk+c5oY%aPoU>2G_c{~bzvM`r(a
zV*1;e`TW_1soS@>D^tH8XK**>^QM1^4`6;j?9S}p9!&i`iE6Ln-b{b{l=!~P`Uf(9
zKkdit&;I550i10-h^P)^`a6i}@8IHKroTg&{to3yJgmeI=WoVGF#R3L79K@ZLyAW;
z{T;*Sc`PULI5zNjrv3>`{S)~Mhcfj~D)Ezfx$!9+z*C9pG*05_%<uX$nE7Y2o{dcY
zVa)uqxFUxW)d*((+06Wr%=}R$ehxbtpUccYkL&XM62E}Se<9!IMa=w*nR76j-}4eq
z<)yrVWB3&>V;f%1+}|sh^F5Y1KUZ=Hui|W8&3u1f!=HF9)8BP$#p{bVaIWz<*78Pn
z=S|FWH=d|&X8OB@Pjdp7=S057TbcWJ8`IzI%=|mJIq&2k-o-o@ce5SuA*y?s_1(wJ
zzn|%I5;Ok+X8wa*h7U3Gn>ZgIX6iq}DSVV&`53dmk2C9kf|>UuvrkVkb)IJOPi7;Z
z;Y>cu<bRGizt1!0cM4H87hhoNzgXfgF?C*M17Bh4zsj+EjWv9osXvve{|5Kwo6P*T
zh-w<^_%@sQPPyJve3z;J9#ijqCjSS__xFb!!;d(J9~VDio}cL@{wZe}f5z0GQT&|a
zjlUqOnM|HpO#UyK^?k*8`882}!_)aKQ~!S@{#}WGU!2XHuOB#-KQib4C(hu{O#WY(
z{J(NG=P>*C8#DiRX8s@CiGT76{#D|C^J(LM_zCCo8&;?N*Iz5PHEhi+pbZnAhgtu;
z%)cMD<r{3rdd|n(pZVFs1&C@v=EXwH{aKi~KZ`K?+n)LN%|)60>A>vkV#SWk{prL(
z?99<zoS9$4d><^q)L)W0|4R|o(#2(%`pYu)mt%J>&)mN*O#QB$#TA(Rwan*tw-R5G
z>92dS2h-n5tmVqg{aA&+a#be(Y9+op^E|D=?9-Zjmur>y+MM5b9j1QI67R+Izb?CQ
zJx*pFQLWFMj}4gm8x}VzZp^{1Z^A}yN>rN_>p8=?cZqM#)Zc>t{{7F?--^xb!_;YD
zKA*N`=5NFN{@Iq9za8`aygf622WI|`T$?*F^LOST?!uAm%go=EsQNMUcVp)FXIBnj
z=I_qb--DNNPiFpJO#QvthWjw{_hse}WN+@r-2eTVc?a-b4r11MAd~+fF2aMEb1;}W
zABV7shcfr|FrqrVcm&h`ktKc<Q)dVpcr<hWj^S7y%NicX)IXkscmnhJcp@`@C{dln
zI-bmCo>H!#T0D)Ze>zj|3?~1X%=v6&)<2AMcvf*ZbG}EE_}QFgJd&wDs(22^8=p&5
z=P`NCXYyabtnWhR^Xnp_x|sQV9L?0fq{J^R@iE2A_`Ue$oXRUWkYkz8k1Lt{S26jo
z=Doaz*}rQ!gx7I4uV+60ZeV_gjAQ2C$h`li;&|r2|GAm9yoIZA0*7%TQQgYy?`_Qf
z-_9F(2kUt!Gyg8G!MmB?2lo)wy(NAhS24bymvB;vKTzTiawXRvVpldX{XSgck1(HW
zk225KV<rALv%V*o`}QPL_$i`#nu9o*`M!9DxzEp*_;bwpdY&zuQm!{M30~lMzR3Lh
z=1a`|f0_AwdxhDbSDF2JjoF{qS<k6V{Wo|m-(>oHi;Hm@Q~zzg$ajdUrT8wB|2;PF
zedcrY1NP^K%=$lK@_x)le!}eEbdKStOy8dsXE5jgbEdy9cr0g@_$;QsFWJPenDh8G
zQGLU__?GGKf6V&7;~xB;dH-yt{trz3AB#UR^?zpS|HAzH&accm<}mqxW9t9TY5aqz
z{w)5*HpYMRdH%zEPR?cat2+I^`K{R5ur+hJO>rKkzj=8!+ZNk#edGC<{hgmDZ~^AI
zT9D~~A%4$=Ih~7eC$?vvFCPN`=I_AWj2C0(cVusNV&-?|R4&du|22GrOK?1wWcFt%
z=Ke3uoWEt5{a=<nxEynimS^&GVI8|N`?>;A)iS>?x^WU$WbRLQ&SDRuT8X(oE3=WS
zFnLyGzAsi|_J4IYa}DNmaZQfqTFm~g&CFYeN!*jDdNKREE{AeG*08R`*JtW)z-720
zlV_t6-<VndCQSWJ*^8U8AM2U=y_xlGUfhDYe_NLLR%|iu!_;pes;x_W8z%p@CB9vW
zZ(rg&F!^^Z@tsP1XO4G$7Y<`z{=i+C@ArPJ<8FM1{fTNoad&2a_h19}WLxgV(cGI^
z-#+E~zD$CFM71BYzx#724`2@tD)9rE{XK|F@L;y%;1WNCsedR_|1hq{!<qd(g2{g*
zlm95za0pQy%}G3l`TcV&XYx4K^LW<s1ZICuWX}CiW`9m%6Hn&bJcX!EEuO~ocRHu=
z4CZ_COkT=HroUm#y3S$}3@54)C4M$fG#<&tIjY3ZVfN=-=KP(<?Em>CegRYeLN@av
zuFH#={Ta>Fzl7PJOF4&QnDcj8iC@kE##gY8V~Og@62FSs|EpQUYfAju62Fc^UBAA>
zZz%C`9Pj##Y~)S+l;fHGy_rqCh1uT;L^ZK^E3>}anEkz-+21>u{k@Y}-(Af9-pwSq
zhp6r?@%xzly`SAVsl*>(_V+<%e;;D@x2eP*X6iq}?C+z@{yxU+@8eAUCz$m=$vJ$A
z+25y2d@=_ZKf@k;mZ+X9@#mTSox&P6m-q`M{vwnAr4oO+#9v{p>#wqruQB`kI<vo1
znf1NF5qy)`r?-e|T8Y2StBv1b*5AU`e3$utc#n;IpUd+DPUeRt{t=%x{+Rjw_X%I+
zbk^}xcIIb9HKX`BvwvSO_jM-oJvfW`@8iDY7=BgaU(>MqruZ$>-~Tw3-!b*S=d+y6
zCjP({{zz0m6@TV%<6oHj`zy0QbC~<_8&m&x&fy>B`kyqc{$lp`Z;s?Y%>20}UY+q@
zf34W)dTXY?HoS-Pu$J>O>u$>%*^c#`kJ-QZnf?|ass)P+G5s&h^t%X$vOV)XxG2+q
z2ae@p9L0`o#ZD#OnJvbPmv{|(8!y4EZ%Jl<mtxkpG}Fj3Y~r%a{N;#h`C=EQzpk9X
z6`1<9+?Cx}#}%1#*PW<(u%0V1{jbcNk5$;nRhj-*<0P)mnOuWYxF%7p#q96eyp!uN
zefDHu_G0>5mwmV%v%Wg^=lV?j4frcJEN;X+-y1XgvkCM2dQ(2c&6wXO^=!l5oXE|Y
z^>4wfe@ph{RvgMcY-R&dZO!E0hWYo6ZJGYI<3ik?$-e`We@9N{P8`6Unfbf06Z<mr
zcV*`H<8bcA%<o^~1DO7HXY%jC?CYM)-#>dXpD%ke`?C+TulsTq2Qv3(zY^b{bBqsQ
z4F?g`fhB$r+ZrFt1O}J*Ax!^=GW{RMyzlT5KZ28tkK{-m#oVVMtmn}j&to`@$1>mV
z$1(jM&#dnRW_>5JD~Fc&NzD3AX6l~8^mi&zoyPQcI@8}7%=^wP@kXY<VN8E#G5rl^
zJx8#XXEXhcWcnM$^mh)^-?>bG=dlCNFYybQ{w`$dUc@wZF;R_X`n!bb?^5P{V@muo
zroYRX{;pv98_RlL$??33jl7!a?;57RYnlG8WBR+Ex$ifW_&BD&8=1N{F^!EUs+*bq
zZejYHz`So_iQmffcN^2+?M#1nu%36amUpp{cQgIn!}NDAn|L2{KJO>0NyP^^-1tG}
z{6EAzA5Gkq53`Psl<SYuuzHO3e4Od;3C`h@%=v$csGerlH<=gk87BX;%;)oSOn=X_
zfm4{zm1d%Pf!V(oIf^f_hA*=lUt#9I%IwQ)MD==cD%%*p!Dhb6yzeb$-P72SZ*wT$
zVft%f`g@n@|2;0w_e=Z(8de`N{e8sr_c7=26VByy&furKlAkg8XE1-Ce$LeYg8zR1
zv(b1KH|3X1{;x{>YZ_MH6u;%a-~XKI`gi>I`=67HXS0q!Fn#?<R6iAeX7=G1Ht<(A
zaSj{#8&m&x&f*_T|9|o~{#D|CGx`51&Smanb>@H1Pb+49t(o_=VI${Z>dng*wk4`|
z#rargJU>%+fpUF8)*COxS}x36xd_u|d-mm`O#dC2`HL|HIucbUW`1Yh&BgfxYuKMl
zF#EG4yKpH^=F-e_z6{%NS>`-0$9#@0U*cVu`CUtV1@<<sE%9#5{1v$}yO--diYqbm
zS1$2YnEI;{)oSd>)tP?QD6YxY#%pmf*JdNvA*!CmUQGUV*}(OfeX3*Dzdo~n8!-26
z!{SE#_xqnST;GJ(b5myiX8eowtYvRze>Z3P+=9u!C5Lb;&SoDDWCQ=^)<m^Uaogf{
G#s34O3U~hi

literal 0
HcmV?d00001

diff --git a/realtek/rt1320/rt1320-patch-code-vc.bin b/realtek/rt1320/rt1320-patch-code-vc.bin
new file mode 100644
index 0000000000000000000000000000000000000000..7acc305c3aead29c5a412129c0146a7736b43c3a
GIT binary patch
literal 15232
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
IUz}6?9}u7+pa1{>

literal 0
HcmV?d00001

-- 
2.34.1

