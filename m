Return-Path: <SRS0=fmOE=IU=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1998C433C1
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Mar 2021 08:04:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C593461585; Mon, 22 Mar 2021 08:04:56 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9959261967;
	Mon, 22 Mar 2021 08:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9959261967
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hildawu@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12M84pxI6000901, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs04.realtek.com.tw[172.21.6.97])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12M84pxI6000901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Mar 2021 16:04:51 +0800
Received: from localhost.localdomain (172.21.132.99) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 16:04:51 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x59A_76A3
Date: Mon, 22 Mar 2021 16:04:45 +0800
Message-ID: <20210322080445.22416-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.99]
X-ClientProxiedBy: RTEXMBS03.realtek.com.tw (172.21.6.96) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

From: hildawu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8822C BT controller.(UART I/F)

Release Version:0x59A_76A3

Signed-off-by: hildawu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cs_fw.bin | Bin 60956 -> 62132 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
index cf51ee96fe4bb6f9ed371c6f411c1556b4989724..635cec593ba0e5d823b8b64fec366ee4048c6f6e 100644
GIT binary patch
delta 6489
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

delta 5454
zcmV-U6|w5H<pZ4D0~%6gVQh3|V`$4Ings&@0RRF31OWUxlqXb*u^Mh;H=wdWnxM0x
zutGF~G=R&Xvp~zBvOwwpWdm!UvS7jrYo4-T!ocuZpuq5Wpq#WoGHvR>@Oq$|lfPpx
ze~`0~vS8YfvXQf8+L5z>+mW=9vw+)?w34%c+mf`Bvw+)@w3D-d+mo}v@Oashw3D-d
z+mo|E>jcu0vuN3pvuW9qw3D-d+mp1Dvw+)^w3M@e+my7Fvw+)_w3V}f+m*DHvw+(K
zl9jV(+Lg1FvS8YkvzD@8+Lp7HvS8Yl4zriCVA_|nm$G2mm$R6Ydt^g@h_XQH0A+`>
zh_YbXh_i^YVA_bYiLzkYiL;5aVA_eZin3tZinEHcVA=p`An{1RiL;5aWZH?din3tZ
zinEHcVA_hai?U$ai?fTeVA_kbjIv<bjI)fgVA_ncjj~|cjkAriVA_qdj<R6dj<b%k
zVA_tdRN0QRkFsFekF$?|vS8YevOwwpWskBz>HuYqvOwwpWsb9svS8YdvX8T8+K;nr
z+K;o3vS8Yevyif2+K{u5vS8YfvXQf3+L5wS*^#nB*^#nG*#K$-ZMf=>vjA)XZp-cx
z?Ey`!HMQe_#Taau>H$g;?2+RDYhm2L++p2h+-2PVY>eszTIOMYgtB1Tgt9>D0A+--
zK<WTx5wbw=gQ9}7fWtuWVxobvV8Vg3fwExQfwO|LVA=$0fwEx2fwO|LVA_JSg0f)R
z36}_w2ao{o1!DkZP%06CVgM3=Z~zj3U;q+;4cica0Jsu>WC#*~k*E-WxCRn{DXtKJ
zFcT7hJO~nig{}~Pfb<d)fW@c~fNTj8fI+MffD987fPJSBfXoOIfR&~YfJ_z=fQh&e
zfSC*tfcy*+fGHFafL*{4fSJG$fHkoYfS3ppfSIijfPfPcfDOP9fP@ngfJvzkfOr!U
zfEmURfLs$2fGx!kfLK)$fGxHVfEm&dfIJKmfQ8x+fUFFE5`d-F5P$>@5`gW}5P&QX
z5`cxI5P&=n5`cBj5P;YX5`e`J5rEO95P)O_5`ej-5P(<@5`dMy5P%E~5`ZP85P&cg
z5`Yz@5P<X(5`Zn>5P-B65`Y=L5P%c~5`YD|5P)D45`Z<q5P+Bk5`fjf5P*mV5`eMH
z5P)b85`Y<h%n*R^5E6jF%MgI<5E6i)4iSI=6cT{F4H1Cg6B2-R4-tTL6cT{hst|xI
z6cT{(3=x3I3=x1F3KD>QzYu^h2oiu12N8fV+Yo>i{t$p|%n*S55fXrK2@-(W#1McD
zvk-vo#t?uE3=)7HzYu^>3KD?zwh(}16B2+-6B2+*iM<ejHN6mk#kmlGS-B8^2)Gh}
zfVdKXHL4JReft1_1h^7_c(@XP9m5cS_zV(&nZpo(91IeGI0X`b*&z{tJP;Cq#kvrH
zI1-aCXo?kVxDtSHxDtQ>YXh=i!XW4XY5-+xlkq)E3G`VKfNZxCfNQfMX%_<leUmwC
zJCo#ZfRhw$Z~_DHldM2Mlg4c_2e2a%fGtJ`lVfm&5>P4;fK)0GfK{s_hj0KAfLbb(
z`fy+aNA?$!U2z)&NA@3+dvPTLXZ8n^qj5b0hxQ1Q<8em=hxQheEpits?6?wu*j*BU
zP}~xLX($GO@L3Xoz+Do6up<$GK?o6mEk*}`Y3Bfd2@A7sa^?X7{im~5bT|P6XY?79
zk##Wxhx7-N#dYHXup^VIc2)-crx1Y2u9F6LS^}A{vm$s}0Rk<ulYV)20-3V2_Ic_8
z9<(D7fb>}sfM5U;fGG$DfbIJQfLY%GfFaHSfEBc}{(J@j0@bpU27V?2ak7&xeu4r)
zx0AAdN-7Pf5P(Ie5P;#f5P;3L5P${e5P+%X5P(_c5P&$i5`dAL0D$q~5P%)xlO}&s
zljMIu1m<T5){`iJbOJfJlb(PclYoC@lb~-vlVo>t0|oUHli7Da3$P;*fGtJ`fZebV
zv$KHx0RzSL2a~gcRT{7(5r8d52Y~%!1!4oTK<WTx1(yKt17k(Ivm%3H0h9cM-~u`7
zv)+Z=0|SKh36s5vHwO8_5P+~Fv-*j~0R!Xr7?Z<`p#rcYlV*(G0_g>_MvX)P17r6E
zlZ}p70<a^K=8o0_WAg%&zmKW{^bC`0kTe4H6O*BkBm(polgE%W0`wh|{g5I8^ahh5
zkv}!CBN2dAt=<4FMhAeUngD>|ngD?GSrULDrVxO7xDtRh!~=kIxDtSH01|-6G!lTA
zxDtRcla-Mp0<p-Gx{<OH&$tqRn79&vjJOhj002M$edLpVl12`gxDtSjxDtQ>0Du5}
z<dXtGItgLm5P)^y5P;T`6_b|&?ZcC<lO6&^4U^83x_{{f5rEmM0D%2t1!4ry0c$$4
zV8Q`wYwJ0(V8S`GI<!EWjOsbGjp`6=i|mZ*32cq(H?)lEH?)oF0rvrHi|mZ*0`>t+
zjp{(#GqPatTA~nZZ0Z6kF|$C!0BSI^K*KPzK*KDu!0=e20c&jP4k|6O!t|V?{7a1M
z;`D%`!js#T4}T}J0c!xlYwISmVA>|Lk)tNE0Kx)lOX`g3QNtv%K<WTxBeFp10A(Yx
zK<WTxBC<g00A(VwVDV?7fNYEGjq70XXTl$~z@-Fh&Ff&r0PzaK4YL4hpzw&ppzuk<
z8M8pc1(yVn0Ph21d$<ySe7F*Ti~s<%|NsB+0000C|C4!^8y;-95`b{H5`frU5`b&C
z5`b~s5P-G)5P)6#5P+4pv$B@n0UIgK5P<c@0f2A-5`ciX5`ZW=5`a+L5`gi^0h5oE
znE`B*DU~IYHbP31{FoSj`C|=Y4A2y^K<WTx0%rwk1kw_-60!x-L!<g_;_?x02GS6+
zAn=c(De@U_2h<?&kfI3GAn;D23DQEN3epO)K<WW(39>-y0A)~T4VMg%0PhE5Vfzq(
z+_(~eup<$GY_}4CEk*}`Df1A3`(p`W2+%;R1ZThW3vvfwzw`~0+nFl^qVN@y37S6+
zup<$GEk*}`fzl9w5w??7nr;njxDtSHxDtSE7X*M|lhK+#e~h>ifB*mx0GPNEfPLf;
zfCU-^fcj$#VhYg-&_t{RXF&84a^Ub6VSt=Kq!Dt!@Eu?hS`A<Ya-i@XU<O(RU;}Gz
z>VWVABIXbdauQ(U5EOF2@Ec$iS_WVea#3Ita-i@FVAv2Wa)9s-U_NqBVA2poq+_K2
z_aA9MGHvQ1fAk1)1z-g50&8ySHX_6jMWn#+0V+qNW~2lKKr(IWf@fl~K<X^)pzszd
zeP>9kpz;`OU$dC%66}%VVDN6NWHT)50q_7@VDN6t2Vq#W66<Z`;P)SFVDOI1pz;`N
zc<NKL66#6gVDN6Lpj&|O6JVfgVDN6rj}RMcX2eIte~S=IvOuDM@CPaZY)i6&5JIE^
zas^-maui?zat>g85J#~`vOwyAng44{>jPVKV1b!LvOwyfm~s$9qycSgDgzKhq-iPu
zZ9uX>>HuYA5I?g(!#}b>>IT#XltQE=q+_I7DodnTDm$`3>ITyWlOQp|XEEdd_aACZ
z>;~30f3iU80c{4BhG!KJLZn41B&1PiKrut4MdAPVA8JhLEwVuB0A*rlk!J?eE3!c9
z0c{48gJ&wTE)XiRED&O(0BREuNHqaX|8C6fz2u{(BBv#{^{=2cE$!~@1T7=7K<WTx
z8V~_W%<5z6>tPiTL!=$Ef~0k;Kr)T$Zt4Rne;Tqt>HuXJvT~{cOLEEu5JIE_Di*Rp
z>HuXHvOwyPXA74KkqM9h?*?N4Wrh6(fKc2LfYP`UfCc3cfG{Nzfbp9EfB~EUfSCgk
zfX}!RfW3bQfJl)5fHeaVfMk&XfTaQvfNZxCfDPynfWZI}fY|~9fcj$#VhYg-&_JvN
zUS|OG8FEoz0Q4GK2Vem70dgK-0Q3cNKwwZ1A@m<|IAA339BEGJ1R((Q9dbcnMGz*k
zK<a~}eWC(tZ0bHDfT#d&1kns_BC<g0=4UhzA+lhq|MwqiZ0dbyOv@gV$3`K4Si^m1
z7P3H^tgHWQK<Xh(6%YYy6S82!5fBoxK<WTx60!knV8Riy0T2$dK<WTx1rQIiK<WTx
z0crsd0BQ@D3Xutr0PhB40A-EX1b~s%0e~O@0Jdzm5`c^Z5`b&C5`c-M5P;9P5`evb
z2Y`vR5P<z-1!6?3An^=x3SkG6jh`C^)VLCWr3aI)pB{gq*ARf|1p<KkV+mpi&_t{R
zXMpqoatL66^a*lsU|{kPa-i@8V8alAoS^a;YKXV1tYoCcq*(1{GYwl3>gnPKU<+Fa
zU;}eKU<7k7V6PApb01)=5LTLCssr>6a|U5R@KB-xa-i@6VFwTlbAa$3VL<RuqJZ!k
zDt5DlqXB<yiZZO~bhSXm1!_y`jOs<hju3R3fkS}s3M6o}0d1hfZ?s_C0c&gPblQOs
z7j}PPpzu<n5ORBAhNJ*)X|h1-=4W*f6Lxc9bee%f2qa^)0dBy=Vzgk~0c&gPblRZu
z7;AX#TC)=Ewd26>Z>3)&pzu<n4st4B3UXOtClHhFpdeXHv=Zx$<CL4BL<l8JwE=Fx
z#Y?q--2rTi?3CM}@)&D)>O-><>Ph3k@K2&KB1W=6>Husl5Jj?tqADb0!bG(JYisL7
zvSi9cvOwx5Y#<PTq@eK(YFO++lV_nX2{y7o>HuX+Dm9azp)G$Zw4kH`Ypm-SBchxZ
zB`C85l#J^VE1>ZVOL*!avl8lQ;)9|DYmDm%E5NEDvOwwpYy)f{vOwwpZ4t6Sq6{KL
zsDShdasyz1^Z;@NVL+IRsv5FD>HuX3vOuB*A_lXCqXcS=>P5o|mk5vm?*(H}+!BD;
zT@rw5xDtSDxDq;maJUkHHO~Qn1?3QcjJOhj001BWn79&vedG{;C^`~=6|@k5y$lC{
z*iaIH0Qd(0*+&I{VF(3)VUwAnPdfG25P;Fw5P&hu5P<p95P*Tx5P(V45P((75P%)G
z5P)nM5`ZQ85P)sX5P&Ep5`ay{5P$?15`e|GlOm(qT}9jwfQSSVfSLLbfUp)4fXVa_
zfRqdpfSu|PfSe2xfF<t`fGiCXfWhJrfG`abfN%g3fB*mhfY!JYfHCC|fUFi0fMw_q
zfGiLafS9-vfRPLmfX}!RfY7)SfQ*w_q@M+S_Yi=Xll`Pe4Sn|zfS9-vfB<SlGzXI*
zr5gd5lWnC_2AH@KfW#w{#-+XijFW|?D*=p?v8EFNjFZKtmj#Tt5`f&3VW$%T+>>>u
zpADF}5`Y4-Am~}D0A-kyA*de#n3F-MGXdPQb*LKw0gRK8sdEB-;gbfc#sSom&8jm3
zup^TKtD*{+xDtSH01|+(Ba^PHG6ujS5rFaHljf^(4w$$SfPe-PfP@ATfUqNzW~?R#
zn79&v(c_bnta=8}BN2eGBa;%XDhkrL5`X{z2mpQLlSZw60<a^K#;ryIup^TWu37@H
zBa>>bLK3he5r7D|5`Zm62Y@)Z5`aOsv%aoM0UF%65`dVv5`Y{50Je+-5`dYq5P%4{
z5`ZnTlOnK64$im|fUV&WfV`jpuxaO$da!m5&bShQec=#*yr2NEY3Gyvu!<v?xDtSA
z=MaEww-SIH0RXm)1QLJ<xDtRZvJil<BN2ctMhBChQ!$g=v1A3@xDtSvlSQ&;0hqI`
zvL^x(n79&vo#POIup<$GEk*}`NGh}Dv<?9gjJOhjP}~xL^jQ*sG&mA~+_MF?8vzN7
zxDtTUxDtTelPS0NCa@zBfGtJ`fW3bQfK}uWfa&NEfQk$ffQ$?hfF1JyfS9-vfDIFq
zM!22=up^V^xatD1Ba_m(Y7LCI5`gqs5`bip0D#t$NxJg^+><@KXCl<N5`b+f0f3AI
z5`aDM5P-dZ2Y|`x5P$#x0RVmE5P;S2lg7L5Ce*kRfNd!OfUckbuy_U%fP4lLfV2e?
zfb|*?fUpG;fS9-vfUqO8+Ptm-LSf$!fB*ml0Da^Tfb>}sfS9-vfDIE7fJg=sfKUb!
zfbkL$fUqMGfYi7WfU)xsfc@nVfNd!OfZYcXfV`jpu<7WN%D%D|n79&v{pApVup<$G
zEk*}`vGWjs-3POhzZwB5n79&v#3K=aY_}4CvEUGZjJOhj$@UO{)VLCWZ7BhO-Ruy6
zvE2}WedLqYz*-WpBN2ctMhAeHxDtT<<q&|e^OHis+8&s=5`eHH5r8d52Y@-C1As9R
z5rEXV5`b+f0f52ylRCmuB5mRjfRwHhfYi7WfNd!OfW3bQfEoe-wu}T4fN%g3fGzox
zuEM4kefJQ6k(&U3Y_}4C;hF$|*e?=*up_f-!$JWK+_(~eY_}4CjJOhj&Xc*s(*vda
z5R;F^xdXNR5R*&B)e@!r5P)pA5`f8o2Y>*a5P+~Fvogn`0Rn;2lh(+p10nwqvxCVM
z0S~Yv5r8d52Y?8i5P%{75R<3ModY5N5R*sCWdkAq5R<RVi4Qdc5rC!q5P$%j5P%{7
z5R*sDjTfc-5P+~F5r6=k5P&U42Y_t15`ZE95R>c7=_{rD5P+~F5r8d52Y_t15`X}l
z5P$%k5P)$35rC1K0DuIY5P;#D0DvL?5R?DSl@B%k5P;PL5r8!W5r6^x5R;?MbqbLN
z5rD`H5`gs(lOoSD0qnC?&tC!pup_g!(P9Atup_e?({cd<up^U>)EWY%36rYSE&<e&
z+0-Wi?2`f2!vXA*#nr<Jup<$GU{(@<?30n!;{oimb=N-u8tk|dfLy2tfGs%&fNAFd
zfD~C0fI$cmfUqNz&e$pvkp>Zf$P5yI^$-z&5DgN54Iq;W*<JxKvuW8M16Gw55r7;K
z5`ZBU5rDV_5`di%5r7a85`b|N5r9Aj5`c{w5r9Yr5`aMx5r9wz5`f_r5r8xX5`gIw
z5r8lT5`fJV5r7m15`fqR5`cjp5rD-S5r8Ecliu7?0<a^qGTkx(L9incfN%g3fXFlw
zfGtJ`fMJXSfaEh0fQ%^-fG{c%fOsYmfYc}vfCMQKfXJi=faoI;fXpQkfJi10fLx&m
zfH1SA-g5&1ERz}Hg9a?Q5`YaCv!deO1O_m<5`eHHlZNM(5-_<Efb|*?fC94vvLNVS
z+8rRXF6g=g7B%t^fWh$)fSukDfHCe6fU({XfKA`C{_AE22n${S016|T1(Pv5K$EQU
E2qN_vsQ>@~

-- 
2.17.1

