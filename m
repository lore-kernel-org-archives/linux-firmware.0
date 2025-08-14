Return-Path: <SRS0=pAsw=22=realtek.com=shumingf@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4813CCA0ED1
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Aug 2025 09:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16181C4CEED; Thu, 14 Aug 2025 09:21:13 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 482EAC4CEEF
	for <linux-firmware@kernel.org>; Thu, 14 Aug 2025 09:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 482EAC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 57E9L02N01491855, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1755163260; bh=RyNVX24BRGMtxla6FYPqsrLYof/wj6IMGgucTwRcmIQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=CKPJI+4tRYWkGnFUe98Wto1i6CNxbLKgXWEqOKtKV5Njz763Qx8w92lZl+E0nVIvK
	 SSerUNKQu8G1hUu83N1XC8zsrjtYdwb76JWPFbd2DFM84TVL9lhkotlDlW8OsQD2zj
	 eaREpWrcnHffw7Ishu1nOry4yvQ6M6GEW6Of4DZNAOT4E5KY1QBWMxFDDUC3/qyWaI
	 farjMnCcBSPEzzGJhiQCR2Z6ZWRmmIvo/b0QToygQ7TIPV5IxG5G6ZFuYfjXbZltir
	 FNi3dGtpO7AHomNGygEcIIu8f5609C2oqS3PYA/NUNNpeX7KmPQ4jsKgK16Kh6xZjS
	 xxjVsp7CMJowQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 57E9L02N01491855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-firmware@kernel.org>; Thu, 14 Aug 2025 17:21:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:21:00 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:20:59 +0800
From: <shumingf@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <flove@realtek.com>, <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2] realtek: rt1321: Add patch firmware of MCU
Date: Thu, 14 Aug 2025 17:21:05 +0800
Message-ID: <20250814092105.2733490-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.24.54.4]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTKEXHMBS06.realtek.com.tw (10.21.1.56)

From: Shuming Fan <shumingf@realtek.com>

This patch added the patch firmware of rt1321 MCU.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 WHENCE                                  |   3 +++
 realtek/rt1320/rt1321-patch-code-va.bin | Bin 0 -> 7232 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 realtek/rt1320/rt1321-patch-code-va.bin

diff --git a/WHENCE b/WHENCE
index f46cf46f..b8225a0a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3463,6 +3463,9 @@ Version: 0.0.1
 File: realtek/rt1320/rt1320-patch-code-vc.bin
 Version: 1.0.0
 
+File: realtek/rt1320/rt1321-patch-code-va.bin
+Version: 1.3.0
+
 Licence: Redistributable. See LICENSE.rt1320 for details.
 
 --------------------------------------------------------------------------
diff --git a/realtek/rt1320/rt1321-patch-code-va.bin b/realtek/rt1320/rt1321-patch-code-va.bin
new file mode 100644
index 0000000000000000000000000000000000000000..a9b9d50e19bdcf21cdf8095d26107f3142f3a12e
GIT binary patch
literal 7232
zcmXZgcf42g9|!Q$ya}alWE8h<WQ2&WnXImzoxMW#R<>JFcJ>~Zki9}S8QFVe%j()f
zWajsL{e1p<en01Z&+GF#qkF%Ps-|jz5mi;SViQ{vRhwd4)>^k?4cjw6P*dg|SZ_TK
zC$J-1I4|dNKIZ)Sne#ibKRXlIbb*QN!kpigIlq=UzZ)C4AjfkdqUz3kSeR3|2y@<|
zWxiOM_h9z#$?U&4ld}XHS;zG6#oO4M$*Jcw_F?v4k~wcFqUy_hSenUShBaK4ja-hK
zvmcYcJn!HNY~hMbet#x^B_@Amq8h+_ScS=7mB}AiY~VK5t1<bj^E$4<<gdvOxfYYZ
zHj_VysMcXV3}*7zW%Ac6uFu`9H(>HN<n<iF<TvtTZp7qo%;axERGTs%He>QPXY#iw
z4&`9$Et&kScoVl~^0(n^Zp-9v$K-EMRKu7LJ23e>GWk2Pkvnre?!x5n${V>GlfOHE
z=N=rvJ=w&)h-!GTI_1CpTXDMMt(ke7Vq1>2ZpXfC&l=XSksUaN^RPWTvK8kgs`)sX
z^K%Y6G5d5b^94BEx(iQZS0=x<%)2r93zp*xv9)#gGGCY%STDlyT$DL~G0tEQ=Kl0#
zA1==HSb{sSjw9HMP3%on^~FAHuwIhWxl}pcx41NOf0p48F3Y}Lj?L`HDO{d8e+8mi
zk@?V{>Aw<x<H{V!0YtS5(|=VqaUhe^z*$_4*?)Cr|23HX*W`6vi^*S`$sfezuR~OW
zIg#tKiR&@>>ofTqF!>uY`9nC0jcn#dO#a49{wBpu+1YwCrvK&~%`KSxp-ldkO#W6(
z{?^R%*oMvAmdW3a$=|*>jLF}D>AxeBzY~+cGn2mylfNsIzZ=tkcjo@=!Q}7B<nL7+
z&gAdS^xubLxG$4Gg2~^HZMZ)hc>vS@Kqmhn*79Ix-$OWuhcfwxG5rr`@{eE(k7V+X
zV)Bk=6Gsx&sNyl4Vtp*r>$r0K_~Hr7^`FQ|Jc%_tnT>2>14ozRV_0WBmZ(nQWS+|O
z9>*4rFZ0tl-1>B$!ZVosGuf7BG5Keg<LA(_n!qkRm+5yN)93u+1<d`qka<2AG5cT4
z?!1JkE@k$=jF<9qX8$Y7{7NSODklGGKFe#E-&4&@{<Td0bxi(5qPm{Rzk%oQMkaq!
zncu_)>zj+Wl;gLu&hgur{cmUXzk|uYliB|+X8*g{!h4wf$;|KXd&~Sjrr-U=Da`$O
zfD`#3JMf`0f0&llBOJj;*~G`n@yCl#F#V?%pDf3pVx8kpGyR`o`cGr}Kg;xgj_LnA
z)9;1ii_CSr#6$TqXYmz&!dE$$ua)`hyvzCxPT-roif?fW-{y3_LsZj??=t<~<0QV%
z?E3-J_d_=DqjLOX)>(f-R5Li4pECVFV+%ho^Dj8u`b*~hp2_65Fz@$QO#av9_&2ny
zzGdF;@0fnyGktz2{>VJPS<L<WiP`^W_T?``HJjQ0SLXfxjoE)rng7n@|H0({S>}JS
zwe{aj{y$9qTz2Qbgn!uo<+ozq@77Fy8)n>=xxRMA_T_jD>m2XE>^~2)e@Ev0d71ZP
zK4$;<*}_g`-kEv77bx>COuw$hTIT+AV?7sS-tUFVygMzcg*k$Yu!)P7<BJu0F#UTL
z7ca+`V4dT2O#fa?|K3dhdZvFLrvH*mzom+OnV(yldB2z8EH2Bu-^(%YcfT@Uo_ATV
zz@c1`dB6KJ{Z?Y~Rwk+e%=@znbN#DwSq@}=u7O>-TA8oTe%5Q0`I=?ER++EO70d^f
z`8s7jxXjmOo%woYzCOEIZ@?+skkdJYs2YnKv5ob{oWxC-ew(t9n=$8a&i34bxvxWs
zYD*5_Rvg8xnSHh?^KCiYdOPO)?V0>xWxWF%taoJ2+li=lW<Kn~Jl|b8jk~cgcV{#A
zVEXULd_UNW$sf*H+?#p+`!L@R_GNNLFz@GntmXb3$pbi$2NKmmoXmqclZP<pA6n*z
zvEKS{j^+`}bsWiN9>w%OnmKPI(|;86{o)v=|FImx<Jg_YGyP9s`k%=3KZ(gXnd#re
z^dHUiAH(z?OH`*Y{ZHjgj$_UrU*@MV{ZD85pTYD$lj(OB)BkLy-#JYG2~59pnSSRn
z{mw65!1TM26L}Gnb1{>D37dIoIer<Fe>od?1(SazlYbSHe|7O1Ccl~Ke=U=L9g{zi
z&Ah%Gzk$iWk&T?h<ln^P-^}FSQoNPPzm4gCJClD0lYb|3f9_%%-p%CR!(p7v<loC$
z-p5hApK~~c$$x<Le2~e1h%J1W$$x|+_$ZtB7*Rc5e1gfJ%KW>0viKDLwSJn(e}+qO
z8uNSUS)zK5Kk|7#!58={Uu62cROT<2`70di_^UjXua)`hW&Q?p{+k@fx0sx_S;u!c
zmD7ppU8etgO#k<b9~3|2p^ksVC-^aw{|U!)26O(W%=w=cKWDE03+DR2WUhZEbNwwu
z^;MaF%|6!Oa5TRy^Y7ST{XL)M59Roe#aYbt{lrH8%o_f}?Kztl@K@%!|Hkf|LsY+W
zIR9Y2AN<Lj|5us+&E)^X<j*bhf0_Jh+<*D4nEcl4%QnooEtB7lW7wX_uVMZkcVMn>
z9=^qnL^W@5K4$;<nf*I4e^)w}wTJxw>+8bo-<8?FmZ-Wh`!C2dxDc~{cedxk%>7w}
z?YJm&;$lSAgL%F^%Y1RxSuer-KplT%FP_WZ%-`>N=6d@u*S92-zZCPH^d+jLnf;e3
z^JUBN<(QxA$Lzm+nXkb6tXE_+`!oBm#O%K^v;P3*Jz9mif2%V0Zy@uYHE;%3WAayL
z`mMnxuE{}Mi|My^nGd36wN7zxnXk(h$Jb--@A}O5vkl68L+1GmDK@gR^+v4c#?19@
z!r9!EGq@Ske{-h)7EJ%4WxgfTZ!0E$>*6*{{<dYl9n)`nrr$8;`}Ypa{yQ@J@5JoC
zGiPuY=Kk)=*SH&Ve|InL!Svgc>9-eG;c(92-b}xJn11^*`;TC2?#Iu$Kd<BgWqu&@
z{qG<)@L=Zo9K!TGl&B74@((ZbBg*k3i$}56{OB?t$-F<K*vw;?>pPZte~#l&9?ySx
z0&{&QGS_z!yYb|*ZesQy&0OCYPUl$W{-45$JeB$PK90G+<2i(<aSBgo&O3vs&McnA
zHr8iz63=1o-vp-5xy<?JG5?;=XYS7hM0Ftt@FI@l#mqjJl=-C`ZhaX$@p2~r3MTJL
zCjY9kzM7WRHO%kvX4dms-oopc^CmLiudgrj8<_t;zp>0GmHAC&elzbdzopD?E%V#T
z{B|~*-%;jwGSA^IHt=rdy6z#W$;^j)IhOZv8t-RcPGK`2VD9gO9Kwf~>wlQD_z3fS
zALVa+jLCVNdA?6D@7Gk0<dYo8r-<rlPUbV5$!W~_&zAXf%>8?wqxk}J9WSz(FERaJ
zX3l$s>HjM8{p2;K|LYvWH`twTGX39T`oGQee}~DL&h&qm>Hi+n|9z(a2SoKD)BhvR
z<j2hUpOpCwrvIl*|Ie8IpELcwVETW_^qa}_Z(;g<#q|4{>Gw_XTc+Q4oXGE)oFAC{
zAKA=V<@irb{?BaSFHHVyCjVC^|F_~CCjWP){~t{LpG^K=Z06tP_&-ekTsHDwCchg0
zUw$hlzjd(<li!x<-;T*|&*axI_ooBfa2_VNBZqNbCVxKW`OMEz?8G_j%;ftL_W%A}
znEbA6VJ(y2tsGyFb=C`UD!UWa!p#1QFn?DTWuD_=W!{6?zb9L9@!}H2I*xF>7n|6d
IsOpRV16vyXiU0rr

literal 0
HcmV?d00001

-- 
2.34.1

