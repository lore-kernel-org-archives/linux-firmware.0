Return-Path: <SRS0=J+/L=EI=realtek.com=shumingf@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A92CD98D8
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Jun 2026 06:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB3F71F000E9; Fri, 12 Jun 2026 06:19:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781245198;
	b=09Y/OY7spZKm4VSP0WWhRPpoJHDr6LOQzUE/LsNjqf+9OOlgo22FJggQWv6mEq+/BWMt
	 i06gu2Knhu4do1OafEEDBOdV0x3LKik2z66IRL/sFAUPyx7somn1JSVKOrRStM3lrJ9yk
	 KOrqDW41eKQ75VStjxiIM9y1i/Z+xC0/3Y0xoNLBkRUZRM9zqJUb0lsdDqG5yqDriF1hG
	 uABlXB5IlzL+5bUGrbR4ZqRzcWNqp0x72Y3PzQT87VzdQnuqmAcrAjIx53Y+PBnOgoaP/
	 fnwiyYAUPdafHSfp6OLlgW1FesYGVH8GhEdGmnrEqAZZnEcu0tHkxLh5TR29cwknlFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781245198;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=pX9DdnxOfl1tjCdr8NnZMNYgyThbpyRNqQnegXdbUsw=;
	b=Hw2FsqVLvhyhXKE0eTOsC6dgcBIfGJHetDotO0OvzJeElExY067C9GdH1cciMh8dm9N6
	 0u8GRlR3eu/Qo+51SrJfJiKW3hhliiwmelo5WEJXqHZvzOyQrblNfLflQxzIEJklVXV9n
	 uV97ZVcHGKn2J+QEntJVPnKBYrb/GF/ldS3/MO0efWFT/gsqdaBgDpXE7JkM3uB18plVl
	 rXVCeqBUHT0FhE+Yil6nsPGaaZpdCGuybb0N/QCLXZBRo5K5i8icm0gKqxTT9c0LoNi3e
	 aXSUjigA1eO8cbN+YuoOmCSAQEQx2knNXImeShXhm+rK7XiEc7oBbKQASKzcPJsDd4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ibdhfHID;
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC5521F00A3A
	for <linux-firmware@kernel.org>; Fri, 12 Jun 2026 06:19:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=ibdhfHID
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DC5521F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65C6JrTR22515427, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781245193; bh=pX9DdnxOfl1tjCdr8NnZMNYgyThbpyRNqQnegXdbUsw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ibdhfHIDXPFflRczp8lsQN6kL/PdfeYu0CUkd8p58wzAYsVAv3Nbi3MZ4gs/z/bF6
	 K9XUT+Mw7LFVSan/cNVouToCSnRp43AxWsTjh4Y6jXl7Qsq68O+JFKAU9z8lv7gPMT
	 q07mU6IasAYPOy1tqNq4QqBfjbVq07czOv3XvUpniUD3jQoeTgO+zkWhLaJSTspo0p
	 31bGp3/NPqsrOFYhUE7m4BPzoerbQw1YS06TjtNNpTCtwSTSFaHX22G8vlxwAWW7xv
	 0x1bmII5EBtGii9CufJvx/lxA4WmvEajqpelEgi5RgGN7KrmjsBNyTKymbYfJZj1s0
	 k+zwokpyayIig==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65C6JrTR22515427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Jun 2026 14:19:53 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Jun 2026 14:19:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Jun 2026 14:19:47 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.17 via Frontend Transport; Fri, 12 Jun 2026 14:19:47 +0800
From: <shumingf@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <flove@realtek.com>, <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
	<derek.fang@realtek.com>, Shuming Fan
	<shumingf@realtek.corp-partner.google.com>
Subject: [PATCH] realtek: rt1321: Update the patch code to v1.10
Date: Fri, 12 Jun 2026 14:19:44 +0800
Message-ID: <20260612061944.358264-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.corp-partner.google.com>

This patch code will use for rt1321 VA0 and VA1.

Signed-off-by: Shuming Fan <shumingf@realtek.corp-partner.google.com>
---
 WHENCE                                  |   2 +-
 realtek/rt1320/rt1321-patch-code-va.bin | Bin 7232 -> 24592 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index 787b131a..7f97367e 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3613,7 +3613,7 @@ File: realtek/rt1320/rt1320-patch-code-vc.bin
 Version: 1.0.0
 
 File: realtek/rt1320/rt1321-patch-code-va.bin
-Version: 1.3.0
+Version: 1.10.0
 
 Licence: Redistributable. See LICENSE.rt1320 for details.
 
diff --git a/realtek/rt1320/rt1321-patch-code-va.bin b/realtek/rt1320/rt1321-patch-code-va.bin
index a9b9d50e19bdcf21cdf8095d26107f3142f3a12e..db291df4081481bdfb24a9268e418e0a10513eba 100644
GIT binary patch
literal 24592
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
U{eL?@=N&|KXYsD$r2ohN19rrpZvX%Q

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

-- 
2.54.0

