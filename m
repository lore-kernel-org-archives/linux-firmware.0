Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D276CD484A
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Sep 2024 14:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CDC2C4CEC9; Wed,  4 Sep 2024 14:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8EFC4CEC6
	for <linux-firmware@kernel.org>; Wed,  4 Sep 2024 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461316;
	bh=Y8oylr09+rq/xJT7QwTX71R7R33dMLwzPsK1Y0Sttkg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NVjGVdThZedHcwtFsILGSS5MXnrlQ/vAbgqk+21tVuHBoADZkXaK54e2XBayj33N9
	 UGKIMspJ7t7Wh05cDuP6tyj9/qghT32HSbsSLvXkNRuCADD3KQgCJbm7oeRt2a+VxG
	 NNHc7IyjZ1mLk0Lzrtck08gTfoKTuX6laUmPaDDvao7OQ/5N6VgUG8o4DQKswVznZn
	 dJ29dh+iNSFb2x6/OktSl4WTr52YJKVTG/78fuHE+KGhCx2TigOt33Zd8LL/wk1RPT
	 P5X7cs0pO9egBgabmBCGpXk33yf4hX9tXVfuc5CqXFwfFlopiL18KKUfLsgDXqkpq6
	 Ag7wjuP+Q3RIw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6c49c9018ebso61877717b3.3
        for <linux-firmware@kernel.org>; Wed, 04 Sep 2024 07:48:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YzNz6vbdujdAJZM+XQHrizCcH2c89Sv8X0n9tm6AGq4A6atlcpu
	aPRbWRz3jheJhzhFsXSS7SGGfW0na94ggFtqrzjUBYOZdW+c6HYJ93DUmBqD8cfBeAVflOpbuqe
	2gEliOZUI6vcyfynF7+Tce+avx9Y=
X-Google-Smtp-Source: AGHT+IG0eUrGAVAaPDTCRU8N+vxWk/GMcStHGrSFdKuL+IXlEKORc7V4tekQXJhMii5sciNbBt8CCERecG17DY9jtZM=
X-Received: by 2002:a05:690c:13:b0:6af:eb0b:6544 with SMTP id
 00721157ae682-6d40f81e203mr218132747b3.35.1725461315293; Wed, 04 Sep 2024
 07:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240904132742.2861526-1-alexander@tsoy.me>
In-Reply-To: <20240904132742.2861526-1-alexander@tsoy.me>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 4 Sep 2024 10:48:23 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7a6SQo1Uvj=oG_2_2QgY6jZ18B09z+wiXQ6J3g+XK7Vw@mail.gmail.com>
Message-ID: <CA+5PVA7a6SQo1Uvj=oG_2_2QgY6jZ18B09z+wiXQ6J3g+XK7Vw@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8761B BT USB firmware to 0xDDD5_C761
To: alexander@tsoy.me
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Hilda Wu <hildawu@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 9:28=E2=80=AFAM Alexander Tsoy <alexander@tsoy.me> w=
rote:
>
> * Updates advertised BT version from 5.1 to 5.4
> * Fixes compatibility with Xbox wireless controllers
>
> Release Version: 0xDDD5_C761
>
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Apologies, but I don't recognize this address as a committer to this
firmware.  Hilda, can I get an Acked-by or Signed-off-by from you for
this update?

josh

> ---
>  rtl_bt/rtl8761bu_fw.bin | Bin 44484 -> 43340 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8761bu_fw.bin b/rtl_bt/rtl8761bu_fw.bin
> index 1dc433ef281d4b76317b18c9707e087dbc170bc5..f4a342d1314acdda2e4184079=
897b0e9e69417de 100644
> GIT binary patch
> delta 16262
> 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
!
> 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%0A4D?R1$$MAap*$t~NzF<(3R$T>NIk3iK<-A-
> zeC)xtgjpm<vWnhlui5R%dkea9HhqL0>)T<$`fgd6gdVoqFyBaW!>Rh0qCp@}j^BAU
> z?W|v!Nb9eooFaoakcordf+DNGLI{211)QTSBpnbXp>P9I+AwV>7#E?oL4a(CO=3DZRl
> zqSWBXI|Pf-?ycG64(1|{z&I?39|<T4x!sH#wfnmH@IU}Y7k965equgXvz3-|Q1Z2j
> z;erHQ?9>WiV6V3K^zoo;lV|~3P6(OsNd6zXlNUq$+Yo=3Djas{B+gn?oc){s&aR*&n1
> zZJ-I8BKkuNB6u<`HcjXc%@@PtLX)H|xyq*v>|Wr|6~}_1lnMq5WYqks0Oe}>U=3D0E*
> zY0q+_OH^R-!47$9um8`#>}km^@jy5o!o!GU5Pw2E2e|=3Dfi-g>QH`d`?TwB<R8#O3=3D
> zt*YbG#sOKubChvFuFY|Ys4)Yf1%cEn&^D2JjvO2aDDbD=3DyFa>sPklKcD2Slq$Z&3V
> zm?jCl2cyVs)-g85dCN4$*5S-Gg#o<YH_b7b5;J>7*-R~}V`v1><kerRkmZOk97%>i
> zTsy?J27xFTU1xRi1u~L3W~R};F$1m@fJ{=3DI#Wbp~FfC}UToi<#bA(=3DR#S3xm19cZT
> zRr`Q*RCSQdbFj-9kY+-99@5!Hl6kfdu2n$V+{YR=3D6c~qyX-_zxxzJ34E$Q`er^4P9
> z_k3V~ihI5*`H)Kh4jW0uJ->oiq2^yeQ3kl2k!r22%eBsl4=3DC`V(8U;j!6+)53<M}8
> zz!9w`;hG&B$O^SL2pZp5PopOiHWCNWSYjk6a&C-g03374z``^&#PrO`${6TWLQh0{
> z&YeZBu_~;5p@kN<BUQ1K7P5)atLfd`$wxM!lRtjL<gu9pHX;#-Fd$qFXjU`V4NiA3
> zvP!wwpM@Uvm%x7jsXA<Y$NY&o(kzEz`9k05v2mged^H+6&_<9YTx<`Fg+F}O2+uDA
> zULzbw>K|f9h%F&J9}NJPJV7O7s}9{H_#E!P3|T-3svyn_Vky;tykNRoWjsuo<%J~m
> ze4(83FN{~OF>iy*fk1p7Lbty=3Ddg4gkPABag%V7eRt0a@n$Sm|L7_AO!K;mM{JLrZb
> zZ&fh0<sBK+O$P%>rjE3mkYVj!1XhshoS$7)yB}g-gE|JhPpW35^_I|Hi^quA2U@uz
> zO3rMCi|zX$q1B^Zq22cQ5>JQ%Q3D3}Kas))MywP;ju(u9Tu`8-qRH@qF$E*2NY5ys
> z1#Dn6V1a`3MQyY4m7C2dC>f$;j$uIcPWlGz4@;2h{YXEf4e(hj1yqobUiKm&(fZ&%
> z(~w;TiU%L`@{2e4jO-_zqhQ4K)8Mwxb+`@sOHM$xKPb3XTG1y3<B~b7s)Gdr;$j0M
> z0ddg+gQ)4`?1AAxplVo}f|^3|GEi_*EHDnjS*)f@YEUp3(~l#84$YBD2_IM`VCiu1
> zTu93#6+Q=3DiEBS343BtmH$-qAX+2~e=3D4EWfodm}Z%HbSTD<AYu*<pL0o^q3}~(jPV;
> zh7H6?h0M2WcpOv_?&wB=3DgT)9Q78F(=3D661(t^IMVD&!@d!)e^Xp!G|GuIk~rC$Nt10
> zP7s7lR6kkZ@C1P^ECY*J)jz7B!{blEMWz9)KtM4Ak^+;*hw24P2QI1K+BmUhjrpwk
> zqb_+*#qG5TAw|YaD)ePB#V;zL0*gjayduWKr+y$4iu|ePi+I$eqM1}H`O=3DY`Luw0N
> z=3D<xWc3+!vIeoYo|M7zPJXgN)8Xxx67DB{Dlg+M)Skdjz`bM=3D8EyjSIFg=3DeQVAO<&}
> zH@aSa8x3xj@O*yRTDzHE3tME~Z8Vava6`QULoGkDC7JPrMyeaBGiope7LahyraGX2
> z@dO~Mh5##sV%4j_m$&>6Umm)^!FZORh+4TB%B&OOm9JCa)u{$wPW4iBq`6C;IGK=3Dt
> zL`w#~%A<zADyG(wAo9&QO5*~q(<?AlK{Z*pO1;yJ85-z0(0Yen4&9fkmmk5?7b$Tq
> z{BOrubOil-2M5hy`L#3vs@1&1tgSg3&ntLd9auC&jYLsa_XJKSFFLd(WlH3vMqF<?
> z6Wd7rgo7+Cx*84twBa-c_avL#y~KDc$BM4~j#0jHcy#pN4v&mxJo#1<T81gtS`pds
> zm0qXMoHG&JQhk&o$spL1>evuX!?lEF<TNUw!TD>JDpQZ4bLYY70}iNF2lv(>IfCW>
> zX+>hWNI=3Dhq|D7ZcNp7Ub3nE2~18&|S9xx;qkoyR^ju1~ke4^<x&KaQK;bjtsi9lws
> zWv^?DLt<l!Ex}%JHNn0S5(O#$YC>ZIT<uI~OoTiU@-2`j!E=3D%~x39gL1a~l#?3=3DD8
> zajV2MH)wv_RyyHiLQ^8w5)VYU^`2P&M1<561{EmIxPEej7W98yfAirOHth|WQP>W3
> zXxDMAVuO%Hac+Sovsc#(ZSV%yV+K{HN~f?Z;20Hu5b>W3zW4*U4txjhNJDA@o$})w
> zASu6r>v(Y8?$@t@+rS;J3MgL&HTwkU62)L-mwrVud{S;?W<qB_xT%;67YmQWEywF%
> z++YZ908ex;tKxGW)AuQlIa>qQsQq9dAp9Y~Vd%cvx?#3yox_^sU1`@_JzHiY1}`*V
> z+K_009!V%*1)2`eE2oj0w*+n?@Y@2o`(T6)hp=3Da&PrsaV=3D|9rrTJMg~4GAHz9(3C4
> z!QY22bL|t0m}?@@5XWKv^~N-!KY*3I*~dHAA7+32=3D6amChq3va8C3Lbo<!Uu*zkWC
> zh<l^i(tp^9dn4I2<2dASFc_ohYhoEg*m>yU_SG)X!*|0hPv0xd039BOdxqNXycR_#
> z-GcP4!5sV|)|zZZ1c4de%AI3d+j83Zt+T~>)9Q5Qv~)UCY#Uo%Z7FKe(d%v{n=3D$Q+
> zY?pDaG3I2%cN1vb5Ys!3CMHcdnef5*ri2UrN%%U{f=3D^015qUD{J0Gqt7#kKR$vs9x
> z&!{mCiO0j55-)6DC+*t4L7>Lhp*JB7$4?Vu!zL5shn>9hLGZ~t-|-d<8qRm0r+;7Q
> z?3SIZR^!^Ow9dWltMml_Q#!YT-NQU%9MT(etgvU#2JZGG(j$|tJfJwRYBYQ@&AP^_
> zir2extbWM8FXU4Kl5d}Tjv#sVdFQ<MEzvkb;YEN%fmprG>Z7G>`ysx?g1H5TxAtXQ
> zfpe98sRaif?yFvA5f+$?9ubv=3Du1>Cdsoqqh(3tv!x|p8K9@RmWD+Y3=3DkAw(Vh#ryq
> zVvcwg0ei*zN9as7s)J;EOpm??^;}?E(B%D-1ZI!`9?b_lQuYUd1e;s0@XRxj?3{*~
> zjmXsqS1L@u>Q(n8U;~NUj8y-;D(k(Vd<ndmbIb?wdB=3DR)sQ&aSDdh93{MwdT{oAI&
> z)bLLW_>^RIu7%*{omWK^q=3DUOSy=3DpGh=3D2xXEqZ*f41qA^hB<7hix_u)+<KsND;3_g9
> z(-K@bo>a#u+cLAXAXcrcNArDQTsdB?e5&K;8fgAzG~_!>u#|5MaXg4%GwF}hf!%x3
> z9HB5!26&~{IEI0X4b!Q*Nm%k46Im7$r*p+}Q#=3DX4LEOPN2OZ1NC)ZS;-6P`u6)+D_
> zcpQHaLn2y^>`UY!M0UeRV4F6I+1|G%5pcO6Z0}n3r?(a8@%Oh^+PCk085cc~>g-D;
> z>rlJ1#L0!cvR(w^1Fj>K-hftnLD}>8xHT~GZ*?N3D_O`XmQrBH=3D$gWiUV!FJOBLGx
> z%l6@f^&_^oB3o#MZ*qUNzj&Yw=3DY9Me$#z#ZNJH%-fU}L@^3v24qfG&9SYgkGv<6Z*
> z5NgiVeS^Tz;EM3Z$Dk(wW4la%(-Q6#fBZZAWev*H|AoJ+L8*uKIw*sooB<c6uS0t(
> zlwG)t84qPC)DxiG@f%!<hVlfAD~2)(#+?Ucs{n3KH^9fo;e*G}X(oK|k$^q)j!j<V
> zFJsPwv-GeZ%ni?sKl`^s{}_Upec8L!I063%dUQC6Sc0?hNA}xi{PRzU+JAm86GuEK
> zsVaGf0`4UHf<KK9_A3}F@FyJPQ4@0>HHcCF#iOR^%yx<aZU~-8<ds#wY#j2<4z7!F
> z?{zyKZcPwp;CXy^T^GdcIaW(-!1QqAp~<T`6Dx$&#2&{(bD|jD^2?u=3Dt4*I{;IkQn
> zU50Yz7Z_)OhuPr99t41LoS{@aH46TD@s8Qy*#sB=3D^=3D^mf4c0F~7J&SSVah<xyEvRA
> zk#BJUY7;6&oNp0ngkUs-wa?2z>wnsZhIB@-3vFwig2tz>M5BI4{6Of`zN$J{Y{Uw?
> z?&a)RTkz$s1HlW=3D`}}-=3Dly%3Rv<hkPm%seGXR>QS<eOi|tQ-5voJhatVug>tIM8s>
> z`r4-D_>0d6{GToRKFm|^U3|oM{p;HvV-+V3UP!9l^L5gvdp1?C!+z~O7eBe`?mH7+
> z6_vdC#<{!o{}?@aMNX2w{hJ>{*QXcl?Rqs$XwN)vY@ylQFZJ5<sf!Z^9)HpJ=3D6|tY
> zEb^P5o;&c~u6gn6;(Kd9t&3c?VNXjf{?)4ewucW}HZ0Q^B5JaJ@0njT@J?>)(J$Ya
> z_TI0BsmJHutNbx@WcR$+#hs^)z4}@KcJRg80~apTcJH*tA51!5`$f%;XOj+o7q4Gd
> zJSJi4scX%;Nhj|G8Xr|wzS3XrKJo>2;mUUr%S&#JnRfcv%WIFN?Kw4P5tiTZ35gZH
> zn3`1k*;}7|uybAS1q>D!S3B)*yFO{Ii0a7->}~ORzDB3JcPPZP*Shr1&7XEQ@0oC@
> za@EM=3Dzo{;sn!T@Y%5q{#aZ|y~sw_*{!8=3D<jet+%vxZN1u-xOG}-@3s#>f49d!8>)u
> zN3-k)#@8+TG|KY%isq}IkC?Rbz><j<J}AtSpO9x<t^aVqKYsb}*6ROyKF&&c!T#Nn
> z;j`jgcRn}E!}nD_yLYqb?>7j+;&+SgB(;BK$;!O>>7DG=3D!a(^TKdn08EVg=3D&^=3D?F3
> zZQ6*ov{BRlS(N#pHtlGlymn;#ZL5*K|A8Fud~L+cq~CncjOA?%VBf%ger0F*Pm_bc
> zT334b%hw(seRt=3D<>}T3u{5UWv?jOA$M@coKHs7^9+d$)gZ+@7(Xx6~)N1s(k+^tQQ
> zch@dYBDcPu_OCi#@?c<9T0~V^uYCI2P35aYzjy6x@hN}vi=3DZ#R9e011d+dZWzpN<h
> zFP$AHsXLT8t0Ajq`s05bi<tXbQ~vZK;RkW!d-pYvy|cqC@2p+e_8ChMbKlARSDznB
> N@aHBK``HQc{{^D}l79dI
>
> delta 17357
> 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
Ho9
> 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
c
> z_Oj@0nAmnmMLtO*5&2EIQt>sDwXi|H4`-^u$x>A~ncc4(B3zEL!|mwRTJ<;-*0D86
> z9B5Ir!)*z)FQP;<%4K&_&XJ3>yuX;at6mfRjCjwd57DbANbUisf9fgi!&-U2SqnL=3D
> zjFKG>MlHJx-xz<@r(^sAQYF$FBnj!+PsgZ$WcbIxt{H<ovsw6*so-ID(yk2U2RY5{
> zlxP<pU^^vP*|f`0!78V(7hl&pO0G-S(T0A!+JmYv`;#!skFMqFx6E?OKM)=3DPJ^$%X
> zIr-Kl#Acveil~RD5u4H7fw&F0`;Pn#(GNq+^3HcPa^GJxatUHP+Q7^ISk|(tSy{X(
> zhv`dHwruLtg!(A|bDN){nH!7}dR``lYs+Nj2CMAbQo-C9t;D_HV{VL8j=3DwOD_&kFz
> zWGz0DkSH^L4T-t>bQ09XKY(U`8jVm4#RvEO_DC6xi0AzJ+5VTI6z84DKS2!1g46f<
> zm!5v~^pew(xb|wk7d}Gew=3Dd2svL4O&XaZ;@`}#PMnQS?l`_||qxo6{N&}&HxJ$c6A
> zw4*aVic#y#*ilm$%h02@-WqcB)<>F!k%}{+GvdD%wTBXqzN1Y2!-H<3t`dGSAh~fj
> zbDeUS{d`zxq$|Z>PbeirmsvV3;ceH~s~X=3D5#ZT0YEu9vNT3O>qA^k+tn9^wm)P%-Y
> zL%NIsmdUO7hmCWPb&+}5y@N^_Zige~_=3D@vPAXBUk9X~w6r?G5yL+{XV2gJ=3DHRY9<l
> zTahUYZ7rSVy6SC=3DJTqFTLq0+{-e_>0>D6bJ<`@<%zM2P%JMZ&EjzwF1rstr2Wvp%B
> z4Y9@f&)M-C8)e{h-szv-1Lbu?I0Kjn6qF{o6BvQ5iUDtWt0s5$3WHBCZ2QvI#KB*t
> z=3DW23UAE^-&4Q5#&?+h783_;47;EPmXcTUBFZ^r|F=3D|ypaI-E(xX7FzaQIfj)lASS#
> z2#I?1qq{*EFT0OZ9SJdRJjDJRCmT?b4-g)NFp^JMb+Un>q%$#PRgd)f1Z-o{MQr5S
> zGlA;v{f8G>sEVZR&mS^fBq~wd$E!rs&bZeXT1}l3P~RqUD@=3D+}prvs~o)5l;t0nm`
> zOvW&OmJpw*)6G?xl<7j!4yw<vZhsSF%d*g1mL*a#^6k>xZC~5Y;CvT)&$zy(T$VE@
> z&Uikn{Y(c}=3D}<rJoX!bN-y#UwRH5&*HBIO@RT?^1H5oh0nquLTBwm=3D9P6PKI4!C(J
> zb<^N{PmH)O429QsTLPq;>i2y~@0Q8Akgb{XvR*x(sOJA!S<$Nb=3DjWY^RIn`NT7l^_
> zi<ZNS_&e1cCY$>hHkWd&620QmR;;Uuu6Qwcrf2P#M~(vYuiBd;zbX?pH$~Rd5@&mo
> zW2uc@S3Mff!j`U?ao?0qp)XSn@i67aX^KG=3DJ(`NY_nNP__w?A>drY?cw@YVS`nu~a
> zR`<qNSKj|}=3DGFJ<67=3De2ihmH__`37JeQy`rE9|7t@wd3jGv8>(O>4Gzn951tbhXiy
> zI<Y4ZW0{PW$*pL)X;^DH^V_xAcn8-9ddH3%*DQPF%Fs6^H=3D=3D!eyL&^CN=3DsW$=3Dm#-=
I
> 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
> b!_0f5KJ((oB;ogtyde@#Q;XRje*M1zmwds*
>
> --
> 2.44.2
>
