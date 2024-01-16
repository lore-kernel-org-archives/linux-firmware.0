Return-Path: <SRS0=5Rr5=I2=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE73C4706C
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Jan 2024 11:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1F9BC433C7; Tue, 16 Jan 2024 11:57:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDC2AC433F1;
	Tue, 16 Jan 2024 11:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDC2AC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e86a9fbd9so1489485e9.1;
        Tue, 16 Jan 2024 03:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705406216; x=1706011016; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOKejWAkXR51MdNtk3AJV6RSC3H33uWuVfD2/hs+heI=;
        b=eFPlFxDOc8QnE7QwLahjVqc0HqZ7xQumG0Zc6PuJ6UqQwAThA4qaYMdEwbpv0cjyjj
         tuqG0YuoqJsoY6ScONnvdJ/87rrQwheRx2moYnv3AMgABc3Co84k03zbCbmMRAPGASNH
         gmqrYQoNklUIRXHiF2780pQ1gUkQxjZAu3kl0qpCc9gbfU9gkW5nclPxcZ3AK49W+PGO
         rBveFHGSJDdaqyt8ZHVXja+epCNuhkf/aI96z5Yc2ncaMf1yVLJDif8K8IZzZPMtdrNS
         5rBMmGo7c8u23rtPBzcdMBZw+wo4yc3CkT2H++/gON/xibfCqcaIIyRCoG6FNy/vSN9j
         P86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705406216; x=1706011016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOKejWAkXR51MdNtk3AJV6RSC3H33uWuVfD2/hs+heI=;
        b=DqWiHaW46IlNzuklek48kW27R0AhMmnN6TQdgKP/D8yXXwZt5Hc7SQ+khRu8GddM5J
         GR6HzP7RCjnYD3y0YmOmt7ursCGeCkxghX+f2qUMM2+/xsYUvf5IarAzb2Sq+v959ffd
         Moh8E33fanwyhgMaGx+o7WWnwVfUbFjg/IhG+2g/+va1jzzAwYnOfHTJWK/aeLIZdiSG
         WNwlfqq3upSdv/K25nVmz2jrMMz7MS1LrnQr25gF3ypxpxDxleg/ATmIdrbEjNl9JYFH
         S3Wnfqseom7W1mfSmIb/JV9NNlgBr/c1FHOO0gGD26qYSm56cDicT8W+NQCZzG3UBiwc
         aiqg==
X-Gm-Message-State: AOJu0Yx88Sg1EdXpmLyCguxC43YFpFwtRD+v9dgKTPPq4DUNOY1dTtr/
	joGYGTD1z+q1Ic1yMZ+99hQEmANaBAk=
X-Google-Smtp-Source: AGHT+IFuEcU8ZJKdiU8DFe5CtDZwqpe7pVzA7ntoicioTaEJhBy/RAGP39WjtOxWihnEdn35uP/o9Q==
X-Received: by 2002:a7b:c7c5:0:b0:40e:5fa7:db4d with SMTP id z5-20020a7bc7c5000000b0040e5fa7db4dmr3716540wmk.154.1705406215613;
        Tue, 16 Jan 2024 03:56:55 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id az32-20020a05600c602000b0040e85e0b8ecsm1304593wmb.19.2024.01.16.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 03:56:55 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] RTL8192E: Remove old realtek WiFi firmware
Date: Tue, 16 Jan 2024 11:56:51 +0000
Message-ID: <20240116115651.18758-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTL8192E is now supported by the firmware in rtlwifi and
the driver has evolved considerably since this was added in
2009 and AFAICT this firmware isn't referenced in the driver.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 RTL8192E/boot.img | Bin 344 -> 0 bytes
 RTL8192E/data.img | Bin 848 -> 0 bytes
 RTL8192E/main.img | Bin 42944 -> 0 bytes
 WHENCE            |  11 -----------
 4 files changed, 11 deletions(-)
 delete mode 100644 RTL8192E/boot.img
 delete mode 100644 RTL8192E/data.img
 delete mode 100644 RTL8192E/main.img

diff --git a/RTL8192E/boot.img b/RTL8192E/boot.img
deleted file mode 100644
index 16998bb5097f4796d1de31a51083cddd1e08269d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 344
zcma)&F^<AO3`M^Mg(oyAI6xw0Bw$<UTnt^rQsf9*BF?Z<Qtn3DZVy076Dc=<BXArF
zq*-U8L89A{W@LM8|7WKFL67j|Y8fo1pL7dkt~m^0NOFT~KSrAyvV3-h0SVQ9oqJDI
z6)>gSEJ3tN-{#Ig#yY_6fPJg?n_udM8c<$ZNmO%(PnoIa5m~2MIb%vD^tp#VL9_P%
z(^Njye6nq;LX>s0to^>tlw%P%;#2T69c=e?ilMNF!TB*`Xk?@;G79&T_@^_cUCiSK
LmfwGMnPJ#JPb)!C

diff --git a/RTL8192E/data.img b/RTL8192E/data.img
deleted file mode 100644
index 4cabc4aff61054f555de7cc21016c47a0529b6cc..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 848
zcmb8sy=zlZ9LDkI+{7dr&=ds~ixdUzP;8;TqR`r=nnEOEo3;{5Tbh;%VuOaF;BW@f
zn~F&XhYm$LI25wv4^ZeJxHyP(aBy(wpy1#i;NbV<-birs-h6VN^SkHmCQ|b<?mMM~
zydS3Q)y)T!*RJY%puDoJ+gmZ0^;xfVS2<nN0KFie(`lVlm+95I78u>HQ#zsJ^n!d;
z2i2hi-X+ticdBYe*EJy53v#cUtxnUSiV8~WOmp@zdO<$yW^2D!=U(&{<FQz5Pb{8@
zV(-3Wa`b*VcnghZhi>H3u0zVs6z9rwE{z3`uNFtb8Y!%eJenU~E-svx!gN6zd;Bn5
zZ>SUo-5PDB;Zi<~xs_HeXst=khm{0v3O$%YA2OK58nz|V1&fBHvsl6gK2f`fP3%aX
zTgyFbt9#2*WDr|YG-ZtO_;`^>G}>xi$NfgkYhG6Id$6Grt@FxiqG2_eK%doAH@;cj
z_VL@QK)o=CaV%NgxrsHa=`>hxqD1@Fs+hqxKH>{z|I;qxe}O%pziGo-{t>XRZ_&Ve
zt4a?zSLF$wg1sv{_zKo)w|dBGwHsHgo_)7^$$R{@L1s>sG1WB6@WEMXQLslX1NNw`
SV-s8d;Ec7OmcP~Nh5rYm$G^$|

diff --git a/RTL8192E/main.img b/RTL8192E/main.img
deleted file mode 100644
index 7703afdf9a9b784a705105b0379438d062d74e6d..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 42944
zcmcG%3v^s(dGGz~J)_Y`R_rZVwkL^6W~7m&BuY9lN>HiV43eBEkQODRG;R5)Dm#e-
zDRm%l(vp^)k?c5FjucxYX%Fo;k>m?Ka%8BXS*HecWarXT`ZaV>N?Ur+aS{TQwx$=L
zG%(-q|L#5V*l~c>b<V7{wfBDadwJgHdEV#tUQ|qOw_@E6E2fIpWG#;yzv4yP?e)KG
zeH%us!M$HRqMIdt`T2bDq8*kfTDspXaEbis^DC8}{z_$Hfak=~M4um8&sNLk`|bJp
zQRT|!I(P2bVLLOq{J42tC2MRgR$eKOn01!+{ANCBsr-1QGFLQ9K2Z5S<@~&FiP_Sg
z9o!r9iH4IrznAAEdA)p{`G>~#>>};Hd?IOi-?xRaJrlD#_x#2o>N_;P=l+H9J-cVe
z_uMlZ?s*^Ay<G3-{R8CrFNtMK3#uxt`F`(y!7Erh$M=APAO{Sd`Rk1<(KTR+`4D(R
zv(}Nyzte}NbL)uu>n--Bk0w;lHEG+i*Qb&4P|lK@sORzlOI>SL|1&(dBra>WgeBje
zAT2>!qA+A$Fk;Px16EHzeY-Jew=F?^0XTx9-641<XJVZDxq)WkzdpNaT^8K==JokU
z>w5aV?A#!9iu>2xW=WOPH#$7c_k7KB8)a{e%O-mI?cOQqrysbSCZE!FRMQIYwsiA|
zWvrpA2#1KCQxmgh6Ejg8Hrm^61Ht9M`qQdo{*YM*a78%0K5<#X65#G%@&~L*cn4oQ
zrofZ?y(MTb>sfVwEXbK3gq>s1p)tG41~R!|(dx{4bKxlU@oO#W-Hdnl<2|8r`Fg&)
z@`Vt-dc1rm?@N?>Au0!c>s5fdr|d)~H&JbWFvvOD@7yy@xhZ?PD`!hVPW(JE7qwyA
zGMBfGSVH&`e#@sI?eZC1gWo@zFPnk$h_@pA-CxBYIGyLiA>lQ~?R_=h$}8W_8b8UP
zuP)-Jo&&Z6T-(&RrTbDx6T)lvm?e6ivG=Oq;vMsUVrgng@Mgf_dJ7IQe&OHN(3%SH
z@EADJSK$|0xjg1yQibQeW%^s?ox&EY3m&v2<x=}gdyb~fyHsVUBf^Lu6kXbuAV+P`
zgR#98JZ}rGU~GS1%~b0;GtQDP_9c({)v?w?UxZJ_>LO$L`9tBJlU&a%gnORj`rNtY
zqcK*Orw%v9C_f+0*t&@^X!_~OX~8#NirVe`v;_{=31m?}vS@4FJIJ#<PahXPZmkPP
zEm-)hWhSTgEH;_{xP`lO@X_UczJ=?v=J)jb9&*Kd(l>i-e9y_pN_(E6AHI!cB^#2+
znP=u`YjS+gbCab#i~DyXpO9_(mQPGp`s$CS9GwP&yzT6|yyxXGvp_!j`dm=9bk8$h
zdU9;f=O{lhA)0N2W&^@qBy%TDNj|NyzGTu!&j*9>IKL)KKC1g9uz&EV9T$%1YnHx!
zsoLNC*3^*tr+%w{uFrpH8y7xd8Q1sET2}qF@>I_CeerR|&SZtQFWiJw%KNJm>bKn)
z<~RA4d=g<}H-!1ecI`Q-?@zWw-=19S`oBoK{$o4$JY!3R9JqK6JOqsMz#h!zB}WhO
zO*E$e&&@sUV9$Q=6ZT3C{9VBRHRuscmy8aZ75bMo&Rg|7RYD%RG<(HLT{(?O=(J<v
zAY-i*<htQe_`jhq5h8DbFu&FNns{MiP^I{V(U@G=6}Eymr?(Oj-ZHAI$u^8D8~prb
z-J2|bqb+80)%R$;dTG@+Sqd|K30u>%wZEt~tdzY1{%^=9tZuS2HbQYzpBH!z7;}18
zTe@o;Ol<WW&(D^^=7n%<WMM4K(9XZ>dtuxvjMbmeGwrm_?i|~XJiVfO#**M7#fU8C
zXDY9B_gk9u2A)qVt#f?rqlOHdhPU<8I8>W+ypuPeY-3z@IexF!^}OEWx{$K9bydE5
zc3qY4#(C>sE8pBe<-66sPVU;Xs6JHbN*kBkVsDP|UY}1?J~~?(`>(TOW53(^;W1<q
zW2#}YVo5OhX6QRZA6|eDcbhlQI3U%xyL$7IuU99n(p|DnWX!)Q|6^l&o`LsHiU;ZU
zM{TAnhkQt3A3W1D9%kldk>NY3&!4R1pRtc>Ou?slo9#juCT#&YgPB*2t+RMUeW4%E
z0ec!cXW`Sr?2N6Qowb%jbMVt*SFZD8;w$=>rXTe{d}G9a^usIMX_Y)Q?0&)0^K;II
z_>K*A<<EgV`y*h_{+O^AL^sg^xzLO3eqQh3zd4^WPvaAvl9CMVIS^)g#=SKBft^>#
zA>&R?j5|K{#oLV8&q*H77t!ZMONuUzzKcOFqVJyPs`RzRqU2|z6^C=eL+3+d+w-T;
z2lbh-aD!Fsu1v1`l(YN3H$URWZy1#9*9F^SrLp(u?qmheQ?s^?Gz`s4Xz-GRU^&D)
zV>QdTA7T7u8F%?$%x+b=*3fRyoig|89@lg4_^hQElk|w6`onVvW3y|ZGmtEj%z&oJ
z{bOM>cP|*VI=!DOBcOQ~y!tM9_T5u6mf1fxwqJdWY@787VEb*pPq;qUouB^LLZW};
zkz`E&EyZ)`-}NKt-}U3rA9;SQx;q<&&1v&r(ldDZfbKC~J`m$&x6)#~>?ZHu2{+_@
zuae`u?~U_@N{jP`HF@t=a-8>W(vj{?7eCJ!>B2tDPJVa~`hl@AiXJTY=Dgxi4qp6e
z3mNAx+Qyy(EvW@`#Y71inb_E0*lGpy*ZSDKlCK?8U$tQBMO!=lHEWuF!7dWcr(U)e
zaMh9bTY3)7*v7p7_WM-F>_N-S9<oah&Duq?b9UjO!<OZHn;GNt5IQLZZR!}CH^gIe
zma%!eRXW<B&8*cO$;Y(0e&}4<wEi&KbX;$(5p9Og$QAm19=Xyb{Adg@HVd-t<SR+G
zShCHq@v`~;3tmA_*up0*zi<p$Bb^=DDg_%0a|?fD-3y<xt_A6H?3j7R<ipNOo62np
zz+uBdza=y@^Wj{6t@(ZHt<txl66c}uh87=s`B!&XCHO=8K;dR&6TTL(W(1pmbC4_C
zQmOd2X0E_q|7X8B%(axQ5&4?x=?^oqiTje+CCE-}mONu7p>j2LN#TQ^^6vlOF|Y3&
z9p4L_$^1I=9!`<Hp}F50GE4Y932SKe3wP_j$!}g~Td+CTT!s&XJlUkWo7WmboAFlP
z<`>2*=uzZJ{Z(j^7V%`>=DIq>4_1%7nC<FlGH;)kmHti~P=A^~qVm+UJF@?!H}C;=
zh@U5JF!XQYbE=#4BI)-jefkFTtLgXzJ7i}}A!Vv*>#TyU(3=b1kL?=*+wGZ6`I1K~
zJP-6XN}e>AY_)6$o_(HEf<f<g%C);vS2a!goBIE>aA&2WJX0(0Rw)S2ev8qUdK>J`
zHSdq`PX6yxzA<e{Kfb4Q7p@;hUp<@<uHOX3>0jcF4u6H0D-imfK(!fWd^_ovo44(@
z4*Oyu@7*xm;pEz<y7H30-W|7fcw0#O1@Qb|GI?*bx5FDKbXY^MWDOhrs{x>J6W3O7
z4E=2Rw%j@foGlJZ*Gs0RG}gsqt)rE@M34MV4}I+Lvo6L>qiiFajeWAlY^V1w+8?CN
zEkTETGn#R<RGw+x@eR+)Ggp(RTG!Nh@=?!RnRM5_Z|Ewsb!#jAx<jK4?!Mbr>F#(W
znGFq_ANiEARHoCu3S8nj;8I=q8yUwl$!t;iuwVW2<-=F-U43JjoP#Ts?Sy8(r23$3
zy`$}JaEKiTZR^!O{b-c`>-^Lx{|(AtO?P;R(ub?*)cIQ~<7}e(qrUXKWQ-l^%Hb~|
zUs`U%{tAKH%ClB4zsBWF9ZePbE8j&n1U7>V=wDOG4_dk~z6P1uwZxb!YHVTC=X#zA
zGxJD#+4T59C#yc2<eK0nhEb6%D;(SMP_FQdRVI<Y==*vr7acF~?BqtZO#ZN^{yP7f
zxJIYf*_DUGTD=5*C7dd5v-;sq<x$#-@BZd0Et3CRd{X`Ha3f&i?`lUp;&89@n770W
zRTzM|UUFFQ<Fn;7j%=pr;8$NJvGoL#;IZUzr-SLmp@<%{=fHGh(4l%`m>O63whB}H
zT`)c3lbD3JUd%?kH5iqBg7m`2tRlWC?2PdV4(!=to;bq>)oFFvqLWW`U6N_{*%<cM
z4ED5OtS@$wuil>R$~*p5+d~n)9BlCJNBYTkPWl1TR`4YJ4Mp$>SC-uD7oI_WB-ew3
zi>$8>T-~0@+x0;Q<Dx^cE{9M0AX>!w?Q4<m-uh+nBep@S@Zx;baqE`<ekeQ+AzF|U
zSEBpZRA$GHrw{Es-gKyRypeA{SCT8$WU0^RlXbKUt8Kvs;F+|~S}}xP-*ItB-w)}2
z7rt%kvo5b<F2F+kE8Vlz%S>#+C)g%gY-`}_n+oGT@yfRp7j_;Guny33{l$f`<MI_-
zC(*s?5BeJa{djBI>h2V}YWntE)VFm{iRbBCVMRw*b$G4sO?~P+?O?aS*Rp%~(bj9~
zP2uLp#z7r8IDr1H>&jRA56mUC5#z25PUiG%{&An@!{#6J^<MaS^bUA@Z2UMj<8lA7
zvEwQK#caDjLoBkC#XmTn+}ujtW0`h;DN5U4I-WM<9(uWgj#T{O57ZWUn{;QKDeXgg
zB&|_*rC|fUQI8Q!$zkk}52@{|+H5o5)`FXC3p}3pE1~ZP`At_NOKuK3&d@bET=RTe
z&GU$!^U36P>i(?SIP@6!`v^SrC_FTMJaslc{B&Q^7OhCkPcp$@SHj*;;JZgM*solt
z*fuf|eI(mLJmse&xczP`PQiDIe_vPe`=|0g^~8C)Y3EM_f0Q@sqx!YJt@5{L`tEo4
z+)}jKa&g_a(at;cZ2s^2*hCdu+ai0XgLp@hSmf*Q$D6^G(^cofK-q4=aqTTQ&%gvM
ze-)=Oe$LxxzjdJUkJNMC{-!OpR&B(vr5(P&6?S?;_@eArYRfXNLdta6fWsMWo=fA(
z@5VGH-W1Uo82=PHJ6?PZ82=B^CDmU`7xA6=FNWuJ@F2cyh53dm??HcfPkj(hWB$6W
z=6R(0tZ#Z2|HZT(sipPV{1W8B(S<$Gh%%zff0h@rF)v)8wtf^ZMDY3WXX+01HE#QS
z<3K#|&A86j;)_Rr1Ydkvyim&<wELv^qA-RH5ZO)bPS+x1`iN1?@5DY+EFWC<JhSWn
zohSuHJkbkoApg^uD}s^Ae+VY0XSi4EadnJkovczl(62I2S=FQZepp@T$Cdi3ep$Z%
z;%Ru>>%lKmELXl3aoc2h%!bOLCAsRjQe5?1X|4vYMy_VAwOlt&FA+Nlv9&_`IXoKd
z?$(6HGPah@m27Zs%&zBqo~w(io2$Up!_~{xmyit+T5)`gd6Rl{*vrH|62YQ;6to9A
ze=4cxi6P5K*XH{-b}44IH(}|pgdbSfO~)=l)3g{i`fuAPHpA^1WY!`&RC7kmpAj#l
z?mFhK>Us_&v-7i{Y^jjzc{!QCChd2@#~ygd&VQA@lp>g(z<R@PJ#6(OVQ1->Equm?
z(R(-Hw+`aB7SV&Z;-?Pbr}p8)_TsDdpzjM_30McHe|ZNmgf{&?eCN1dz<wOPS||9?
z(_K^2v}+G9`hS?ob(ZL7A`?3J)hFiBx|ZOF#d6NV`>=zKCnmOA#xLJSe8GFb>c5?^
z|Hb^-JI(Xn7v#Vb;R&=ZxC(#PQsBp!pG)p-v^3963p18&E_?SZ%wo^e9|z|k?em)&
zv-P@zKgnH$@KInt+JHTAy?nIG$K_FaZzq=EJ#s3F-?x;^R~hkMYZ*B43)e1MqW9b2
z5?<6@aGB3s)!0;ECx&v5bYKS%<02N3v}E%MWUFV1qpMmL?MuLy-#_)o->}B@{e@fX
zx~uS^;etggXLH>%F2<X*so;vj4Dr=L%JVGU;QGGvk2ks~?=bB#Uo$lvL1t6V$N!$b
zMX)%2N()C<&oSOYJ5V0BdTh2jd<Pe|CdO`0oU)&rAH#-XoMJ<r?n@L;_w=8JW~VK`
z!B*$jdMWtClxGE(;3;26T>OA-#I{^7x^BK%^DK-b-X|3+n#0FRtVO$B<P$UWTC$cb
zY^$$ag_PLbZ?Ct3sa2B)EI)bBHd+h4tGjSfu^dZX?&xa4W+TE7`nRLY=eVxt+lGzA
zD;Ck4h1~kkE>k+Rb9^seQ{U#V7r!NwJ>wCt&)?2?1^yKp!v~MNU=4*`=3)C_;1*W3
zLQBzBH1+=wpO(JqUdw0WL(rjI$k}o>=Z9T6f3X)?YdaPWTkyfp_{Tr^DW5orPn^VK
zF2t+O<=m$62LJrD;N;oo`Re#N!E;Ca9PoT${M^j*1@Uvs`cmcddRG4!-&se$t;xLW
zCw)}^(pLXf>dx}Lcn%&0V>}d<M|sIZ?C~sIbw_zB==ha9%!{0rXJcGXx+YI>PM+2{
zPqHRY`kXvXaUS9^QCsjBc6j|$@R=X;dy{yXcy1FBh-BxF!S5PB%1b>nc750w@hN`(
zgVETSI%OB?skIo{fyke%=7crg^`k9>IkMpeThF(&zR3?@Y}J=ZQykqIFX>mzeX3;Z
z3->V6-)q+~rvC%@Gr*q6uS;hZ;ALP~g5TCl9$6zXP<(LOU8npHv{{|n;k}vnpMk$J
zn!66SDL(PZ`;Zf|r`w%utKJ#EQ-f9qtVxwsoDSLL`2$lOojZ|j__oZQSu7WWsgsPy
zST^Frd`0r1Oj`JiwGhL#D^Hp)INi9VI`yG7w3NmzJd|oi4s%bgTdJ(qnAUZbZ%x3w
z#+ox%Y{t*(QCuMbN(ZES<cry|=9`VVpU7tN6AKI0HOVD>=u6ttpWaNYPyEoc73+Fb
zsjmGst;HWWKjV>D-uk6r6Xkxx{H|5p@i&gj2bRAsxz!vj{ouE(e#02gEv-vG_#n>%
z<oiYG2i>jyJ4;CMV&_=6(dpK(n44zYUr9tDFFkWZq0x4sV`HB-^7+~)<jY-|qHnk>
z#18uNngbrQ#bDW1<x4hV#Vq<Z>*8DJG^^=@XM@>f0{w2GVq(@sx%}0{>{=Hq|4Kcr
zHli42`g{2EtI)N})wbm~=lk<r7KV=JoKJmbZg=C@$L;lFhwTl_?Koc(S_HN{<#-#K
zG>JCyeI>JrGv-Nq12jr=)zkmassB|S5z{e&sK|+q=$0mXFd$ZB9_8x0OT4>y>ak&!
ztIoM9o$qzVoT8J%K75Mqmu@0H=rb;|T&tTb{emNEu@LhGID#*(LIa9^$kj&tu14`M
zy4QF0m5EPn!5?~>`mVR@{Y{zVLCWAmZ=3`VnpcJbIpJ1w<3X|V=jun?zmu+i(3W6%
zm!AyV!R=F4*ITt?ir6i^*e%`IFoW1Meb_WT*fa&~m@e#?JowMrsovbgSBYU9u$yGZ
z$YzwCnD6fxm(3_!v3!E@^OD*02}@1Q*!sB>*2?%ro?<KVKJhim&)JY{n~yX{^2C}S
zU-a*RXB2k?UlX^W6UQ>S@%LNm;Vr~-uP3g11LL}GBN64R`zad;H^kUH!+t)njyaOL
z)_&PB8ncC$EhxO*yzntgwJtMHR`;EyumoNBL7zeYo*;)^@pZk&v`&fEwjR1cPa@Zb
z|Ly3eypj{nUeP!BugtmxE(pUoUX<^Xe!)lQ`S)OFCU%EbEX#Jw`fU+!Y<hvLi49B6
zj!SkhvN8k69PFG-F>x}RN3N{%2YPc_N5vYdF4<}5`<t*0gr~IXk-h4dyK-~4f(NHl
z>wn@1`Ov9-%ssrq+{1Bn>iy_cXFtOOLzB!CQBS4{C-zi8V7zgmEM3y@j9)4P^V$8=
z7~tC{uz?cd5z&6~<Mxi~IE-XK=V5H$qT>_sO_f*Ri^)&gZH|Y;OX3~z&GJ#V*2u!s
zIkTs7>$7$RoWgplW7xD<T-aw5Z-W@?uywK1_aS2^-s@yu0(xC3I_>L6Uh`uNDy>V;
z6D8}>o%f8NrH+#I#_z51dtdxc%<E`_v;DVvgFOfQTc+<okHN3lU^gj`jYi`e4oDK~
zt8_2fn|N+uEV{aW7@nJ~zA>Njw1y42+Son2gzQ~(u`Ul;yulWC=N`S)F7nGy<yx|p
ze-Lb)WAuFkeUIgb@C$Cc!d;9X<g2w}@7HxFBuB&x{&H_Fv6zL|>VHD=SM4l(-inXj
zYZvi+oxk{0RhFbDprJpayqElo^b9zw=<XMzH25In>`s~if`2FsTcw4?O!;Q>9^GoK
zj}9_scTQQY&m|fWuU(wDo~E^KM}7&kveX9RX;zuo%KD5!`yzbqbN@@p2fHJ41$Fwu
ziw*2{^Fu9d_Dj6`#DhLf^Y-YCw1q4XZmeN=(YsM~7ekNnhtK5Z=O%8qG&pJELI&jf
zB?stJP`Ja%<2Mx^G><wmDibm;J4><=(7W3*?GDcBeH0nb8n4drV`cSWYAgLOv({uA
zayz8%5&D=yW|NOr@_pXXM7hoWH{Vh=f^A(7N65aGTvwhgmh@Qj;ABH=OISIRD{nzQ
zY{B+NzqI)1MD?HY5&kdzb&bQqt(8iZr;#<xt2ACWBOX7KFUvR$NMBN3?tdWoTEl3a
zSrtyD18b802kO7{2x<QvJ0tPvUGOe^kzYmo4RB<PTPqIdg!3O4$MpJwvv5osX175n
z@GubDVeuXN%*`>D8Ar_{_EzN-j?B-7@Kj(sq0vAri$|>A;SbtL?*Auf*ZqHsb{Zd|
zAF=8t(L^+i##BT<<VMEP5Lu-@!VeJ*d5`nO^jmecKBsNfh3BW=stZLwXNxk%BKobm
zO!O1JD7Qs8a^q<<gT2@Io5U$LwOHj!!NmKAG{&m(8JYcjzW>TwC8s6t(CK;Pa27ef
z5xFdRoRR!M2KGz-SvZxWd{B6sn`;RepMQ=hP=A|w{vX_1xFf6(Nh5aT$pI_M&tk1$
zx9lF`Tw2>$v9U0Z1wR0<I6eDt|B7thr?UIU_S~a;VU(W28=C{l1kERq-Mf?y64zn+
z<TkaT*O{Ncs@>Ky7yq}|6@JTBdmnJrT|SCLDw=#n*-2i@sJ%sFY6Tw0m$b3N$+MK|
z!#?UlFZN*{y^>gt)*$SYJuzT;>Zn(FGZ!mM#rp9Z*b%KyYW&mB3Hs^aMn<x%;G3$G
z@^zF~jHpiK<p&erNS;%^>pbPZ9G6c~zMJxixV*1e$vNe_&r|+$art`67bx$?<r9jp
zoKwC~Ee{X<SLuM-exI+;<eOH%!RrNrjVrx=v~pN&P`3Wze%h=fU2V-eTjCqEi7nyE
z70BcI^;&(3^L1D87w3Bw?&5r1tZDcKbPGJbYNu#0Iex78WYK!2cUo(cU5o}lm#->!
zDNW_f<VURfExoH9?4DosvzilFb&v2uUt-&!@@D0kEFBxteX1YZTR%T@1$p1|<bd^&
zH?}J(KMhV=$P4G6H*YU_d-RQ1y6DqP-lE>mQ*Term|c$Ss;kqo0U4`quJD?)XN+05
z7Uq!zm9Va!vD(;uAo3Gz%Wmf*Xf2-e6Pk-fKU>U=6F0rO*(zQZ-ab2S>f&7E_{j1@
zf@Mqj?IFIX8z*P2t*!bfescz#HEpxeFelmKWQf-2ROk0J-v_+%&&H9JiW##$I}836
zoxO{lAYCJUIq~z=c<t3s%`dTr=P2V*aRlPCQ}+;a2zCu17d)+*@~x1w^5Z$ttjU`C
zC8vD)BRdAzp+7zpcJ{6T+HAnKOCN1Gr>}u*D|AhYSgUNmhOSX`@-|CYDYFW@U<^K>
zOeQ3z>0fi17l7~9o|nCB&jBxwooy{6*6hz7&OJP1O%Kl^!u?ikqK$5y;E^`qpM}-*
zBkch6akA#sYk&%rPb!-$Ge<rA4v_MjGj_k8DG$H3`ohEf3)D+{E}b-R|Eakd7k6Gp
zj#t-3xph#&x9}oA4E?$&U&!#G9KO+~6E{cr?r}ca>wB<M((=)4%*o8e)Gn*1@Ah!J
zrHP$b_tOzy<pajRmavf+y7N;M<HZJoO@g9$MeBs2K~^-7?YIm7Sh@<@H^@e;wGWBe
zq>LCWa|nKZrzN_^Xn&SH4$178V4Yi{>v>{Oyonyb6U+}_+wWq{fAroucRlYrvHwbL
zA3y_kafC0{y;5&>{%O9$^P;h6Cwk1yI-fx?hz4R1T3^RJ0k%E!np%J0U?#2v%{E#x
zSR|h0{5<gtF%W+;_Nn7KH_y#MrbvHi-T5-GF~1&0^ZEVodpX2M>sbW00XH5Px9SJ>
zWu4ZY*Z3-*5^bgbT1>tNc4TBH&R*_gr4{WV-iydRza?qEL7H^lU8F@i&$nMvdD=$@
zgAZVs$r78Uty12a_jTfXXx@e2zD?{SLS6;e6USZBnu=rKjjyrKp*+)Lkq>^bUGWj&
zpV>O<(hnayG1HD#AF(UM1Lv!w)NU<`^|=Cmv*LJOH10PUJd>e(i`B139$GW7c#qOf
z=Qws?ja(A$!!7Vhg0&U?QFDHUWWqM&=BOp<-#Yd(eL>}+*Ew>k>CYq=)bF%iK)h=`
zgQDp@O4}8+#gZlHOP^ie2eY}Uor?JY18FlIwwAe$ddhwTo68r@cz&n)`f!`&)vti~
zCNL<bRzK5bjr-cH^U16+k9on(yc18oV1aL`^?v2QiY|;N>2|FHtDnica*4RyPf(6I
zNLMb!{WH|tNIPBFIi7SKzEeFoQ(JX$nJXwme9)Dt<NiPSmTZBp@J8gL`liJnS=#@g
z+UL1NWx0q$UvM+!`}lTm{4F@=TMzl0&q?cjIPdHW&2xJJ_)%Tt^OcYOzn(e^F-*eU
zY5Ljd^mF!%eio1OtzS5->biXY8~#<gPBv)BJ{Dw#qGgRe&-k~FjqUk@@-l~#pFl3S
zpTEKJl*ZnCiS@N5>sFbbXOhF{m;uFsD4!%Y=25Q8<=bibskl7+SSdhP@#V_*61Lr$
zbvj>)bZ_stV2bVJtnB2egVyNAOnEncVLWbzf%^dCEWx-cN4zO~2TS%hg16KLzw-m8
zJ9US?Ei+~piWl`>%Zu<}Ry<fPGFB7O7@|L4nc=xaoyyL*$?Cojp3t4KxP|sS>P_xr
z;hWNkEncFuef7}Xw+;JzV(%|#zSUkNW}hH!eGmQDy_u+j$|#TSr29(eeS_YC+qLs3
z{H*tbKI?(lJ5ysnckzu(tMAq~wW)l>*%G>wejEMW@F<WyT4$-wT~oHA6Y3a;iX)(N
zi48>K5r2B(4*YxKe3E5$f;H|T)y%U02fE4^;oTP>+CkZ5)Sn=7qWxCU`-IwMtZ7}l
z&t3elb(c>mo&2|eD|po18FTJl2b}_a2fuf9k2;^^M#e|Oz7C4;D;#9c#S)sKXg|e0
zh~@+R%a9fF>pkW^<g;}m>+)sNMBhg@LE{x!qqS++J+rKl+ZM+$N)f%Fi}s&nWJj}C
zA@Yl$53n?1U*|1_ek1lH8<%076Rp5$3*}x0{u@QF(@%>&T`lN(m`pa3cVl1DLcu_u
zKT#c$aeU8cZKL3jj-R^S>h_mH`d*++?spevEQrgTi11PQv)aD0E^rO~4XN`J)KkBU
z`khYg_uh+My^l4+MtsH?AB&2OP`2U84%WDjd-uEkqi-~4>U0kA9KK}_c3MU>myB+*
zH3Vw9a=SV#^YA9y_;9CXqx6m21zX(T7Gw^xjJ~&71N3YTOExTc!6WPK+}z6Z?AH*z
zZ!Cv4JpEy7f@ks;?r^@d<_q%uecQf;J;=On7QSk+@^-g(PPPkpT7zEyu8oc`cR_5!
z7IV#I`<&T*Ip(Jrw;K~@XbVTe$B#USEMUGfQKrnR@(elpvo_zn_J{{MSes!(#Z?p7
zI#<>)XU!O6yr&t{*VvX~<9_mrUS1oq{uk_Y?^YWwyo8@zm%V~9a|L!)e(Fa0Ji_>X
z(a|Lt%-HV<55W3H=ER%8ho5J!uI68fF>8NOv2%>MaM?G=nknd|ANw+z1RHhv`BU)a
za*&&a$sU20kCfn!S;~&O`SjI{56x>NY=k;z;`tDb40Nfhdko%U45?mH>saS*PeAki
z)R$OxK6l#f?Un7JJ-)gF53=>Jg9*OWuX~JkM&RoZSTof0R_@g~lz!>iHNW`;uublL
z;2p~E9ggB9dS-ph=fy{sy0=s~#n|nSVWwZaugUXX7_^G|2;Q5B>s%l>SKvuzitbsl
z&DcgFPIy>wR&geLy_(K7>rn>daSnY26SS4>^m=9?`p;?$9JqPRxE;o25}T_|Wo+AG
zUVNZmH*kZ6HCO*R^5#|iMZ4pSec;2NbF#W?YwAt3msJ0eEo%gC4K7lm@mY9f9RYYr
z3MW=%pGu6+{G54(o$%_cTPtxyb%6Uj1rzt@3b&c}z>*E=9Xb5IIQ{2!KOdYLD~yx6
zN2r1F*Cfif<*NEO(!Ir`_(b}bF}TRQLJ#v%1?CmHnS;{4k0^%qS>~la<JQ$|lztvB
zVN33xN=E+A8GqAQV>0p1THmL*QGU<l^YG$Fu>0N*jo}sfnE0Ix7GzL(G-t)B92Dy>
z+)Avkh%Xhimb8YU<z~YQ{_N7O6Y$V5v{;ex@bS;1zi&bQ^Ud|Y_S@SExrt}BRvtPr
z_9kAi<Tx=B=7js5@AN+ED(=pyEw!_L*#g0|YbmblY#-YB$#eHu@`ImYzUNcS_Z(xs
z=j_;4QE-5-fY@>Cxp0OzM0}EenXy{GVM+6OR^Q92&)%Zug%Z#9;_C-Pe%tO9`pD;x
zX!NEz#Sxv2q&T8zqL?Cdko-k2HsZS_r?-Fw^t;v;$PXwS<ctJx9PUJa{RuK9wb`HB
zWrK4M+4bn)7WuE(Q5Tm(%$TQx%i;G{;Sm{s;W+Z(T%3Z-6`P4N(hKXA2i^D;bi;b*
zgP)C)LX!oa^3b=(bnn9EVfD`k!~@e0#%*Y9_%zL0H6$}O3)-WK|76#q*3clEv+A4k
zZ|czRid~>vS%YQ7u2a0T8|ihv^l|UF8~>h{FRTjxz>?v|tWL5PY3~=Vw>9gs)}^@a
zI{c!-3(N&z{|L6iVFJ6pq_%fG_gC2+#O#TsWIAMXJbFU}yUJH-?R=|PzOMLG$)k}^
zwax9-u+jjw4}C>eq>RWh<6C=e-CRb`skGMU#W8zO%U*i)y6AGh;45Lf=+66U-FFRG
zQ^(-hV*(mE->QsU!){$K{zex52l)RezRh}9CjXjc>UM3hCg!fbAv=I}oWHw*pEGvZ
zO+SuZwo>i@`;5!>dSt&hLto*Wq~NFDO)iaf*Q9Mw8g067kG2{1V({3(Hs-|IBL2}c
z`68QFI+0)6nm56(8y?L=la3$L=GC0mU~Kcw7V^O&)r{5Hyo<5TyHhqV^|!}1Z}g58
z0Gu<i%{vp@yfc;m8N-vCVVwfybf*vQUPnywGv~MMnq?!_GfwJ7tLive!QC00|IU8`
z=kiTG;7E$@lGl!JSL9?@XsmU74I6nIBLW$99{cNUj63W}+0T?Et^+?MbN$fsXA4t2
z*LR<>q2VKJ+*AwXE<DXz{t@JS)fdrNxrI6Bn5NKvmH2LAYplyhBVND`L1tfkhvdKN
zVlLpHR96ijDQ4~=gKGK6>GXqyLddrsygmw?Cn8>I{`70`(o<DlQvFtkUaQ8Zm~VAD
zKOWzbMe>^zZvzL!%R&TaZ$4NityIHH%V+V@Q|Iu~myMtNj?*tmKb-ATn1MUw3_SF^
z!l}l#Y}E7l6!K?Qe2S>dUeWG6eCp!z)cM=+h4@r=@u}|O(|cZnPv0*-WgXOs^M4PX
z*Z0@Z8_}9!_CC^GV;u|o8RUB);^2Ad0>^92!!%jsdvHz&GV%xShNdn12EZvlWM;9-
z&-=O}-oXF9P-(=V6mzMizmt`cBPtuyyXu=Sq7M`oihOhK&Gv&~<*V{a4|*!%m6q#V
zS?bsK*5#_)Y3Z%<%Ksg?L;YvTofc;U2Cw$D-CTa!S~kx(db&IGboV;Pm!(+7&9HxV
zM0n#270Ed8W^=(63GpmH?D+5Now8^lC{kh!#Cq82HtApZJ-kD@t3`1ob93_8n63`&
zEX8LFCA(kyW*3O>Vz)$RfG|gae0Y;3+uYi{zTjx$VJL(zuo*Zs*PGak!%f?V9V|uL
zfNi5az<Fei`xQ9XfbrFCwmUbub8^{=h1~QEviyV@`#3!8X<|)YMeE-D&g|vH?$fPd
z<va6yAD`72b-rpr@!HOP$Bg-$mWKybwo;iYt?1Uordur8WSQsHXew9v4(s~AqCH+(
zlh9;qH_jKNcOp0i2hX2TUh;iJwzcwNw-uCMc{%6mrTLLFWnwsnRfpEd_BDpq@#eQo
z_pLgbIPxy$j?<yXgtqlHaK9`u+}ses7Uw&DCg0K2HR%v6M!&rc(f#Vnpew(;XWqJ8
z<)8H&m;LTaS#VLsE3g)oM|jaM%6n7(Ox{qqh2Gq^CWaaRZY{R*&SP`RkI9e2R|DzG
zTeFpaSGw?|dtBF!v+JS`SJ!oU#SOTUTxqT*>cW0GQ%_v}=t}vGq1XA*51sD(y*<mS
zzw`GdpNsQ+p_-={Znt83M4veqtKt=RN6$^RZd7Uc@$VXIDiUa}qCJ~+dqKpv>{De=
zSvIFRg!!>xW&Y2ILFS2pX<vwb>{0o?JsY$`Yxc{c3x{2Qe@D8D{p)!f4pW$qxpU*?
zwDBd42c3hHud7ttJRb2qH)p~4u*Ju7EnBSJ!8a!O(1`dbHiC>~jYqY;`7OXvWSszW
z-xH%TOj{~$U$&p$-7X*E;X(|P<ZDZ&(@y}`+kzy#+3_Ub)Srjj;<D-wKNo8}=bRkI
zGH~FZk7nATd!xqx{2i1hUcS=yU{pSBYadiSiW_n+Q+3Uz)5CdU#l$kQ=oiNyPF{>e
z@`8TV)yfIU4f!UT*U|bd*5Y0@<tT?t!q%XUSMtepp1q)p@Y%00AC};~r}n+iUqrZU
zB*vO#JwEHiS&xz5y1v0DzSA?FWS%jZS1g;jwA=e5AC)+`))i!*yutcZe|ZW1rHz>z
ztT}Fnd4jXr(VWQ28c_8~>p!VO`w^PTp$*T6@OKD*hwyg@Uxmy~u@`eL#GeZ-&*k>v
zkhj2fHSaxKy*&3(N5FlM_n`!JbH9nc5JL+!=f->uGFbDE_$16T?$Q1+^+$Qj^oP6&
z;%!<3)kZ$AFSX^)zQ&^s<q~~8V9B0m9{Pi8-mJMTubr{e&{xmBiMw~yo6ov<!18>V
zF~nJHq&3WMqTI_{?l{m-+JtQPKl`V?3pD@Bef80XBWNh%2OAGiKQV+1F@#oP2myTF
z1bx%+c@m%1t~p|w?`^y0|I^;)hyGjN8tQ1^9&m5wYT;VT)ylPwYdzNn>OU;LtyB&y
zQO7@7=9<g?>>sZUY~!_8TlU&pEPw6$tn1oo>%R7rR=D<y)^qK5tT*p(x%0@^T`b+6
zY=_5b|KI?3V0m&Yci=h*&L)BJ$yx5ed+-EzV1M!j)_8u(Ug^smZFob*`VJ)`+=|AM
z^U|%6e}40jd~;~h)1x>e=hC$nJtD%aduJ{c{3n7X`;PIOm@$lFWC#&9@rih!y&%Ii
z{H=4b{tkYO=CPJ6vJrj!<|T7J#>64fjQ3NvsJf`r`R$Zb9G*p}Zr*jIwoW8T9d&|l
zb8CeiKb6@F6~}L@x*++hZjXodFKZ3_IpfY+l%Gp$kot+6xgU0!<}VY>DGe(DIGnC+
zUDO=6T}PX%C2wdy;>}qbR=Q&1N)NW#htwYBuU2_rJ?H$7)9`v|ios(4$bM*W@KYas
zFRDxxe(W30<ywKUTj|8+eU;VuB9zsh5Y~J8UJZUi+Fb4GnT`B<_N2M<+@|_{r%RDL
zYk<Frvw{?pzd*V@ZLOauxBDJ_*W7ui{<vTA5;}TG0$A3S=WLMtnvc{t)EtTC^)3+n
zu086cE#V<a{ekNjFsKdTOX)nP1W(-Orioej8u<&}v<}Uu9cN2Zcffm+ds1~Xc6(i!
zGB|zF#k@tMg1%wbtx~)3_ujOvQ~Sy%yHGf8a_v)J+-@)5R)f1#&sJ=*QCExPaRuC^
z$g4GbzRJ)pXPm5aJ{k9mBtulEdye|FihL1l!0>85tNhlhd8~4uS_~E|4^Y=?aDPbe
z)&8Ipeui}7)UBUT`uL1xbtgvpe$sVDiFo#^D$f!V@wh664x;Q8bF;ENTR)+^6Rh1<
zS<>&|J=)i_l{I%~^|^8}ePAz*D}$Y_^=c}`FP=B0{M%I@c}A4XbECs$$;s9)Aq#`f
zsa;yLy|SjK$u4`**#lFP%R|1?;ipv=d-PINlh)g5FUuRJ;cNY7$0lEF0)=`;N4b5f
zo#W$=H(BQ|DsBIG$hz~~b$ad`e<;J=+n4mroYhZ8Y2!u8{k3~8J#^DTX*{I9U(tIs
zPCWMMB7a%m!Mu?%x3ryg9>u)>TnKMA&e0ce=XA{k&yzdHiwnEPdx0^F{?eKP!F!v=
zVfUOh%Qm0qIS4D?(>K|H!~-}(kIu@L8dS^t!f1R%ecAM|l6VHz)?4(vf9!#8flrMq
zH;&ZqWNG|feZz+I=*PYA+wZB37$0u0GHIVuo+z#Bn|hutjo+iP3*mUNrtC-Mmv)Zt
zV&C<JzpQ-Xb!4042j%4&tk!p~45$6O$tzpHn;ah>Qh9tF=?$%kIZHN^_g3=iY#NVC
zXEf9+KlYu*q53koK>w<3(Wlqs<wIlRBk<j~T={BQU|lI2$@Q~%nfl*BnSWDT<on-(
zG3xh4pI1F&rSToQljoa)kMFP2Sy6v0FY3GctGeh%i{7~>Ri6GZKG*$&tK&!a;a^pT
z{I9tDuMM};t7%*RI^~Oae3hFInH&Re^sRRr@;{krT;QEP903l_PJHM#(Gc0CHT0Yb
zIzF_&^bi~lor;yab&v3je+j?#C9{$K8L8YJe-mGqqi>-tgbx*E<BGS@4R!OZJt3`+
zYmjS*>sGFts&oLSQ>w?c&%hR(@bEh#_%DcM^d;iW9l-exd~-JjeiZGgPiGeU>JM!>
zyPo?$(&v=MPv=g_fD0mfzcjv$y2Ym#%Ac4ljc*rBF)#YyFXCHtSD#-r;S(Hd%=wNt
zsZ)GOdx^NcPpLe3X>~Yg!wz)3xBgM(K~DwxE*PS*yqdU=t<*aky1ow8)Sp!S)UoYc
zyaA)*sR&=eU9KL+NnD4@43Q_HbnylFg%0D}tM#10MGV8M%KqT*Ys;P~C;Ub2!E?_j
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

diff --git a/WHENCE b/WHENCE
index c2365f39..db019cfa 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2585,17 +2585,6 @@ Licence: Redistributable.
 
 --------------------------------------------------------------------------
 
-Driver: rtl8192e - Realtek 8192 PCI wireless driver
-
-File: RTL8192E/boot.img
-File: RTL8192E/data.img
-File: RTL8192E/main.img
-
-Licence: Redistributable, provided by Realtek in their driver
-         source download.
-
---------------------------------------------------------------------------
-
 Driver: lgs8gxx - Legend Silicon GB20600 demodulator driver
 
 File: lgs8g75.fw
-- 
2.43.0

