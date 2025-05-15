Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8ECC2D0CD
	for <linux-firmware@archiver.kernel.org>; Thu, 15 May 2025 12:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60CBDC4CEE7; Thu, 15 May 2025 12:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39332C4CEF4
	for <linux-firmware@kernel.org>; Thu, 15 May 2025 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747311778;
	bh=ksojJPaDtuEKeUXkle22KNIp+Z4gkvjVeNFSn7ZOcfw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WBuHIdrPAxtoJIzgvQ9mIUdi0q/IjKFeUtcuL8Gi8JFV3o5Sf5zmhcXydiVt8vRXB
	 BN6OnbyO3c4xdL/WxKH1dp4JctBcxlvcjsOrFxBcKq7FTN3UwirJck+oUWRiAz1NUa
	 4Aviq2LP4YBv6WAgjopVQN9auAI3dwId7k4G/9PW3U1Xq4Np2lW0FCqh2jDe/aSR7T
	 fzDilGiHLRAFiMKXg7PSdL5AVSCbZ9b9iMRI0TOr0WzipGKk6jXlRg687LSokXxJK6
	 wq2p+LSnNr6AjdyF7oMLJ18WprhaX5MliekWS/3fydfttGeXUhIqYx7OKE05MYgxa8
	 FYssvzR31r8rQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-708a853c362so8381127b3.2
        for <linux-firmware@kernel.org>; Thu, 15 May 2025 05:22:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YyLKQVK7d8KsKxymps1RseUnyXI2+b4+swTBzHP4ivfos/oXlk4
	YaoRWx92AOrqmIjNpBo1gYEQi5Lywop4zezhDfK0G/Q2/0035qghtfeAInBTpbHOI9Ia9HtmDpt
	S9Y9+puuiUVhFQoKo21qCYnaL3Nw=
X-Google-Smtp-Source: AGHT+IGz6f9nhU85gjtZLeCKcCUGpCBTOc6WmzYiErpgScc7gNCuBHmVnn+3y2jRiU9eRrg5Vkbzr89veRxqYzofbFs=
X-Received: by 2002:a05:690c:3391:b0:6fb:5498:70fa with SMTP id
 00721157ae682-70c7f13fbf3mr106716317b3.18.1747311777183; Thu, 15 May 2025
 05:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250515113354.3215814-1-hildawu@realtek.com>
In-Reply-To: <20250515113354.3215814-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 15 May 2025 08:22:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7SqxZLL1bErv2MkciCTY4DVOOAjVAGRQyXGSmcQKqrvw@mail.gmail.com>
X-Gm-Features: AX0GCFsO66vxW5kE3EKBrxNZoL7wwgMbR03UiUfsy7UiZHGA_iexdwQ8b-lfEbc
Message-ID: <CA+5PVA7SqxZLL1bErv2MkciCTY4DVOOAjVAGRQyXGSmcQKqrvw@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT USB and UART firmware to 0x7C20
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, max.chou@realtek.com, alex_lu@realsil.com.cn, 
	mu_hua_chen@realtek.com, kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/547

josh

On Thu, May 15, 2025 at 7:34=E2=80=AFAM Hilda Wu <hildawu@realtek.com> wrot=
e:
>
> This firmware patch update for Realtek RTL8822C BT USB and UART controlle=
r.
>
> USB Release Version: 0x28D7_7C20
> UART Release Version: 0x25D7_7C20
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cs_fw.bin | Bin 63936 -> 63340 bytes
>  rtl_bt/rtl8822cu_fw.bin | Bin 61220 -> 60628 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> index 2676a7cdcee9444073a42b328d55fc69b1f1c005..ce6b51d0eb809b369ee5ac21a=
535d45ff516ab2f 100644
> GIT binary patch
> delta 6272
> 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
A
> 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
>
> delta 6958
> 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
R
> z7nMLU?Vlm6hK^+dbxPqPJjhUOTP<_1Mm6w0Xj}O`NO_--56`Cg50Drj38aWu%eA5O
> zdtmH&n-n*M{z+nmf=3DF8DD}jNM1EAVuNo$bgrh=3D?$wU17KX&-bl19`5N=3D9Vw+0sbMk
> zECxuq`ffLaua2SQ$@FtSNn$+7f3+QxBzcJs+h(x=3D)G8<yib*L^{xO-?9_izAIS$U-
> z`%1drr_`HR+pE+up6-3NU<GE%TyI^I{`DcthLLL*Y9uOOapT2!_K&9_C19w0$(fE1
> zVTinW=3D}ijSFYWZDH(E-Hl7KGDSK9*VC*3~nqA!b-8yE__JlxCY61`#je(k%<hs?Zu
> zL^FUofJUb<d%=3Dp4d&?ZO>6T%-=3DE_dr7$113_E+JVPzpRr`;|b?NI2WG;I8h5ke{x^
> zvt=3Dam>jw}+R99o6{ruI_Q2&1QwCm}Se?yJSNXxZ5Y?)Yh-H(N#<2S---1(myQR+Vl
> zsW5`uMzMydzY$n7Y5wMAwoR1X441wU9I3)X;2nHlID|g%B9TJ?7rq~XR%$^zRp4Ey
> zrZz)A)z&P)PXK6!|0;|HI1lCx0(ceX$~3SKz^@uc-nsP}a3Qweif5<LgQNM{*@S0r
> zbwyJA{dhGV3(@u~D1+lwI4?nk_d_{bslc14x{g!fPAH4Z6}U~Da(kteJxdzy7Rt|p
> z{EH*SmwxykPTmG>*lJYQPBm>(M<@}c^dfe>TqCx2o#BSF@aM@4XHwuNftywfgoFi9
> swmRUZ_Z0pW0I(biY5RM$__Z@ht~8$fxt<m>Zn9R{@53_lxZmIYUwb4%i~s-t
>
> diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
> index f4e7618ef5e2e09ac42cec023b626d1fb6f1554f..872704fc115178b1caf986d26=
b4eaedd081cf435 100644
> GIT binary patch
> delta 6198
> zcmZ8F30M?IvopK12Y1hKDTtgZ;H?<-smX#D9wf%7Pf>ic0<P{Zs4E&U>b7UpU?ORc
> zh~mE>CW@HI44@`4K|G%Kff}#)dp#3eH0~;5Ok#Z1vy$Y!Z@=3D#9>8`4-uCA-M{NL(J
> z*VJKSvyIlg?93Ta3$Mhh8J1Bo9P@A>7g_j8RoE|6`mT};#jE7idsC8@CgD@7WWy<#
> zaWdH&%ZHL!?`>HLeVuEPqt2D@SYBo5mE){)EpRL&Z)J41=3Dgaw0_Vs+(;mW&~FXJ2e
> z)t<fp#s$@$egTXZ$UuFqpjsKf?mvL}4`f3V*RY^k8Ncoq!u-N&+H;>Slug$c$_phC
> z`bE$$dfhLE@nU(guLA7Q+hsd>kug|1OA(#erpEa&<|ub+-E4V|ltorg?a0Y_l1Oe%
> z4YrTFHea3(H1p;6p?_bYnE#J{o@Z4Wt>9T(@f7S2EkJYfpER6h9w_KF&Hv$h+co5x
> z*Cu_DZXNSjlgVVS>dxb7j9|yJ83BvX4(>%*zhA&vdI9g(3b=3DnQ!uP*Mcp!W~*oSbl
> zAmE+{5cUle@Sx8TJ`MAicOYCCB;XQ&qeBF|>nOtg0rxoIW&k|BQo#2SkN@x$@X$6q
> ze)kK6F{QtNa6Z5lXY2@1fkDP;geQ&%hKCS-c^BbIAUJvxVa{K`{1t?|1b{#w;6Q*G
> zl?W#xApR2J9ss>ABYf3Qz;}XpoCbnqX$0H{;6%XPbpiy2wW4ys1woepY=3D-?_HX>XN
> z0za@HM>q%w)*eJygoT4A5&jImGXSmvEv!9{@C;z&cMf3}Y-R-b5a1($#|$v^0(cwf
> z4h8Z!559x<gRlSx@jMQO*3KKW2E2NJw%h?cesK@sIT{|10KR|l0#3aQ0$lhG;n`jS
> zo^%$Zg_E}h^=3D1LnsILY5q6*<fzcaWW2=3D%N3j|al$1;-HX2P$q08fXW2OLikn&Uc+C
> z8;s}KsFZTnrZ)~QSEXx2PR8ybhoc(7{2B!_lifT?z%t52EIWuqXT^pdgq<Aaoa{K2
> zTyE&K#~IaVI0d`P!?T{T+6Oxk?y!rbOm9^Ax=3D9z)ud2p)(s4!uds%)l;}&awnW>q^
> zoeu(I<xK5k7CF@BQBJEfqYg>0o<~{?6{DL1q?BTRr#{i!Y;|f9eZjY>FYA#H(5y2J
> zvF<f_QB%*=3DY~t3jX6CUvbKVmU&*quht78QGE$D2+V-8;%uED=3D$`b_h_;B`K=3Dk~6)s
> zX&a29LvAvcu&R=3D;<TciltUXGOmIgQVHAYFeI7<GwsaNNyeX5G6nyzTt&`2rMnP{xr
> z9y=3D_yv7@o;{Y+=3D9amfzD4xE(s5JWYPe#kWQQ+$l7r%WC)9^MgDU3YrO4nwaqPQz(E
> zD*BnbsJVhbP<0vzN@8y-G>zL$4e@_@R8*$xEgn;+DugzEckGAMuRewGE10J$y^))&
> z^4cN6&4H8MAsyyy@f!*XW*7z^l@YFz&&;`~iXPF@CRc0`W+kI>pRpr-V;FOy%r$5(
> zY8$lH-*RTQFyv5P2ldPrJ$aBfD13EGc&>d`0M%i(-zMK8A4Q8gaBobK=3DY_(3$?5aX
> zs?;Nz5$T+Nhu)um!2~V6^|Wt@xgec&lcNRu)H-(vu`iet))>#@uETV=3DBiukdv_xoq
> zz%v%r%HALRq>6Y5>(qp3yhzY%@uS~0c+xEvN1tW!HR8AUKh^r@dSY4}3owAJU0kG&
> zf8IupwtvH_kHf?*JOE$_iCB{9-MUrRDtXNkfn`_7B})TU>P}C*h`fA!+ty`jV`}Am
> znoZO`UdYiaMzQkgl@nF!`%m<w)9TCgRDZ7iNp-@X{Iq5)`;7GeNcK+!*NKA$+GX5N
> z$ZsEgmyivge@`1=3D+H)6aFEzL%mcxc_6rHJEOYRg7@QQeVa8GDf(qZjxRS{1b)_$UL
> z^Ca_QBi-=3DW#~WcodFm%lYJy~B(Hq{$_Yvm7wI8YFHASDY>}nE0`l~aaMv_USZ&(qm
> zWbA^l2U5_(S@#Kwswe$UDoDC|nM*@->xcTao_q5T2%jL6*4x<&<l6d+cF$Q5Lk~a&
> zU)WPn42cS_3FGjKOuuQq7ktk9Um8+*+Z|-P?be8fW&xnq$ZRz@c$)!cgmffoY>Yct
> z)TZl2*5+_?qS}%RIaC|d!28>R#B+R*4ZDNH;B=3DiR*qE7CF%a+r?BZd*i|w|H6W_F9
> zmrneaAL7V#(DWPKthYsooJ(aJBQnh@VCioh>hQJs8gEL5GOxrRs|{P(k?NQm$|W-9
> zp><az#v;};)<1KuNUP9L2X+T1e&`tH_}d#B09UKQZm-0HChH!@lQtvO6PwPGWt%#8
> zIxGv$5%)w_ZiQpA=3D+=3Dr33ye=3Dr<G+){is^NRij-c%>n8Kxl5?99`bu=3Dm9CpMj^XLc=
O
> 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
> Q&=3Df@*i5_Gi?H=3Dp@7n@w~QUCw|
>
> delta 6860
> zcmaJ_d0bP+_P;l|S=3Dc8R0R_>3;=3D<yB*jlZxLBP6UZLNKP(s#qsXco{27Ogeo*4Bzv
> z9Nche3~0-u#d|?(TU(0DQ(T^6^;NB}ZnPM%27f5ew#x5JBG32v{qajaGiUBBXU?2C
> zbIy0>hb!`mf5}7N$km$*a<k{2wp`vXXIMtYa7_ElT>qa+4ut+T=3Dfw|1UD*fHhqV(D
> zRwUrlA4s~>P~&8B6{gjq(CBSi1$l!j-QM6TvadLxi?=3Du%TubcB$t#(|ZHuHuV(!&N
> zlHFBsWs!uhEvob6??U<AI!|5%<su12UwOCAU4E7?hWf>lu8nIhs&kj0<x8M`Ngd6(
> zjY}lM)g{srQGonC$lrUGFNN|_X(_ps89@Hb)V*MFOKg!WP;Zg)AkTZ2=3DR-MP^5pZO
> z%ow#DlN$1%Cg&=3Dd@b*Bm?Cm}_@y#m*QUSCUNQICWy15nnSH95GDo%6vGxzlK^adRW
> zR~NZ^dq#35;MMqy*E5bcT*+6wwx~-~8<_iw>>o#Ja2CVk`H%$0#$!z_!s;)1oTKLP
> zmr5QN)*~G86~ZsWchn(-J9!>kzC_qJ5c=3D*#_zcva+JkU$FCLcwofgdFmSYGP9z^&g
> z^xX#Z%m+Lk8K}X3`a+*j4UYN@VGQH1oJY6_XvA5B=3DKy_dJB@JKEMWXS!lQ2?Tmu8n
> z{)jN=3D&*OcU5snSu@wzWS7@*-b2qz$5vJc@AK=3D=3DHB@Q;2xjtkM?L=3DYrL!Q-Jo)1Yt=
5
> zNe~#?R#!k@5VR0zCrr4w72!G%I11W(L4Vt+Zx9xsA-xIVtx)m!6v7{Y7KVbPbAeIi
> zIfPv>*%P4cKwk>dU<Me@>ZQRqV4PpD1{c8h>!7Jvple{&dPse}VIjb41ZZnKufZd4
> zBYZ@q!7cwl_)iTi7zFV97LCR8y?Fc()Zq&&x4?iIFwhUwoCC~L4<P*h9}FG?f+Y^o
> z;Fm#w`r`<X0W~K|9YTyudN~`htcIlK43L-XMbd{k4_Rg9=3DLolaPFB3rD)Z?gX2ZW_
> z2{GiIxy|e*>7{u;v(hS4Ei3ETFTG%CVw1z9zG6~atUgS{Wnt3#w!txBhh$Y@^^qtm
> zB~;9I_SZL*512ThHB2AZlI`rRU%p4T2PdSqcX#zSPHSg6HFMMg$;b~KdVR=3DqBV%%1
> zuV^qewVxo(svhtmHMd((?tVoheVU&r^STLZ8v|xHn%rHm-A@4`GYo@S3E>4&iS?o^
> zqOwz-Cp_Zw6VaPn*(tt}j4@i`niUt7%}Vp{mdZ{avbr!zUfCH)_7#qo-|ghcy~2>t
> z(yw^@V<wMh{KVsVLzLK+&f^C7PKc5EEjlNYS3Xda`$adYMw%DDr39VfHD8foOETCv
> zvS!I4`H3z>lHOYonh>MGaT8T|kcK%p1X47l1z;<O>!ow=3D{UQq=3D1MQu_TYz;9RV(qm
> zKNL9qXBJ1CV{s6<u<Wn$j~*&XjBNl=3DKk~Y*ME?21AgRUnH7lR=3D$cL0K9|x2tH<xF7
> z_e{0CR+_$oXW0}<zcNrJ|J5ZY@2;LjB|Wz~m>n&(te(mWe`c$)l;^4PyXV%lPHX4k
> z@N)_|Xy<*yjHB-x*!eS7`b%m()3LIg>2Q?egnjLk@2C*du?oI(%Y{+v+9u!D#p~i#
> zTa+7;;*;W;`&>4YySoj!U4k^?!!()vct;RfyXF#|JL}_LWI-A-W$hd6NV0RS<ev;0
> z)<S~aV(xX4w~N2!7sKcCY8|Z}wk}wf`Wcy?IM!=3DhE5iFAVX|gjwd{Hzd13u0GFLG9
> z`+7Z{Ao`QdFoD$giIW;7*<bR4_u@MUXTo85Nh$qSvXNz@$a3<MeC30_<Oq2&^g6VJ
> zSAqkAS*h;KhrkEGRxN%){7W<BjxKLvDoye0QR`@MBjMyosg1Re@tZE{J+dQ)3Vg2<
> z;iV&aw;`rJQD8+Vho59CvUD{}XCLcCf$0p*P(jXGeIQp@M+?Ic(;03ZCq#7iw?+$t
> z(ZmWxMufhfq&wPAR9F;w_NH*+vwgUY?hBLa$r&S$SQ7%r{Ch}%yFNf<O+ur;=3DnC->
> ze+%(**Re*$7UsSj_97OJ#VW)c`~cF0I*=3DX~8wPcE%MqrkK4MehHQyopINLAF_kz!P
> z{~wZTZgljr-sq4Ex=3DtP_XVWt~bastZ2UUCq5)@XZBT!Igs0G$)?~n;{Qy#=3DpF7mv_
> z-`Yz!tLbIM9lQ_(i{-7%Jfjc@{r!aRHL=3DzkE}8HbD|RV_uQbW_Y&(s@5uIvlKY??}
> zOw-$D3}8BCz|%*cV)wQB>aU49hgbCEYjwIE>=3Db$ARrlH$V@ks%k%2Wc=3DBJj+;%by)
> zhY6!Uv`@4@cP1C0uTp_Kl+i~F=3D6&`Dy{DwLoh6zrF%gXt@0@&FaOG9mXA7_-y9vro
> zf765+CpH)wW^2AC*;|Ibc!17jVJCMRr``2VzpdX7qOewNM;|?7t`QS76YO$pxZrJ-
> zgAxLTVVa3{7S!+=3DIl5&OyPb4x89KhiBduuz?9~Q$d4fG4daB(odcFHA%TQuaUo3_)
> zYf+Q6Kvx<j06gg*U1Io%WNr<aZFBdFG;A;|bN4DSye}R{%fw{|bj}S1-R=3De#6S-7u
> z=3D;-CJyTXRN2LK3UHZ$MXqbxgP3`CO>*lFFCn)YosR_?vEx8UHV{W#%X`?+>5)=3DK`d
> zwNHRioK-c<DUY7#p2tACwvJ|JleleB>`XFq+icr-aU_a>btgm*N8{Xm6p>>^yQ4oX
> zo5Sk*y6c#^8w{ZbU54NTA@!r6hC6TH-3tN$^N=3Dy7-5UWl{JmI_X=3DJ`1CN3}Y-)Jw3
> zbC2^!{v=3D4m)zr3!LXCf^0x4l!V)CizOCf$+d`VncU{(Ymh}CeKs1LsMGK)uM%JEXL
> z+rozs=3DD>~*`)ly=3D{m*TAQVD}+L0t~e@Oua!_tW4>5dIRz@VElvCq3Y^{tfXN0y+&D
> z$9>4&vVP?J_R-wjX=3Dg?duN~RSWx#(EPpmuQZE^oX_^v|spW~5S!x@AJ2rSuG5FThU
> zl#mCw?VpX5gBNG43ITU|fsM1mA4t0c49{3`aBXGI?mfHH+TR)FH=3DB2!x}_3)W~&AH
> z!Wja$@GruzC~#qa;SPGMOsJA~`Y%-Kb*>o>nYF<cYSXKb@4^OGu)C_k#Yb<HR+qDu
> zkK=3D2cCH1=3DF3gc8~u`}i93AA3y*)Ch?qYt#OdDNyN@{2*2v~<8A(-f2~PqMoL2d=3D4O
> zE%sv{)d@ebCR1C%)hgsuXm_dfZ<W2XJJF%C+Fh((xe&Yh=3D`oB{T86ctz(VW_(HE5M
> zPEtoLu4nTajxVkku6u^V>P$uL7Kv{!x!vH(uOPqeOny;ckFT@lwe6+X+|ABe?(^2*
> zdd=3D}><Q(A2nrEQd;wne#z?{a6ddet6%xTIX^L9mzd|k>dmz(oO6}QP|#_8=3DHzNR8)
> zDvY0ZOY2(akeSxCX<e2^Ey5MhW=3Dw0JNWR-O+{<H|Q=3D`X{u3d5CM%39WSW`_~?*Wb-
> z!BKINs<gO`kAePEi=3D2bpyjD6mQ*oO*rlD#u$itZB=3D0TKNg2>-K4bi%-JJ$>BUJ<DT
> zZF9zTpkc7b5+4A)s%*0L(}5BDl4NcZ^aKFye*(aq=3D{z1XmWQx?^V1Lr5|2Oq;w7)2
> z0YZTt^#Ry-{htWyA??0`@Ob#X$7%4{3kVO10<#3<#)SZ`l;rr*0Xd#bZrTsqzHDMG
> z`lf=3D$!%dqS7d38a3>CGlLSrgKwU0O+>lGSY3m9~AH^QZW`u06Qcn8o^e*lC86Hj*m
> zYy?Un6U9UrOnWyRof;UUxDR~*1=3D8SE0%K@6SOSTzX%!?js6b8nI0lD@ib5G<T%M#J
> z*w>iW)?4J;EVn|$q-%^ZIU$&2Izkc|qY}0%ppKmaZFjoO#iywWtUJw^cO30DnVnq5
> zeZ5-3<!Vr-)(ojtcXW&o=3D&F{-DKZUCCMAwn6`s;{#{f2&u;nwARI*7iB%}OWR!jO+
> z!~{{%IBE6TWCI&Jsl3~yZ8bZ!B)#HSKibkK+JmEtN$Q@Gaf_Q&8FC5i*{E$zKTTQ5
> zKy~R=3DOfD^hUvCGI+ZAr(opy$WlazV}u2rpbjwMTv_l#p<%F&;#RZzyo<oIWuwhOBB
> z!BTd0u*l4{GzCkg)f<{NRg<Pg)r*>x^TxCyk-r;tYh5M9Q|rO2&iTIEs6sRzbBb<=3D
> z6Ym=3D)RZly`PJ)?RxwK#O|BY}d{Gd`%??k=3Db@7X?C-WR+mHk)_cP<)q}t2Dh<)XIyT
> zg6e)<H4;@9;ecN5wyKD7vs&0`m{c>&$wkj8*PUQs+Ma3d=3D<yUh#b=3D9miPr|Y56pdK
> zHk}A2A%m+P!x|&1yC`xBt$D=3DLhQ2Iwuow(W3lyp&_bu@+g6jIa2!CT|YM<OARr|zH
> z+Vcr`S1RxS8L?>pFv@T5ekUaxznEg98e9W*NEf*ZQVa0<Bik!WeZG6H(pcP@);dsP
> z9@$4TkIF~W(41NY%eKn(bW7q<KauIkb}$_)929N}ql8h}@VB&l*QK242hcPJ+EN@8
> zNl+k4LFnWbpEm+vG}nwoMKfbFDx05L5<7e6&3)82-xu~nW@ao(V_K_H<XhQW-!w2r
> z*o$ZCQ2=3DJ5tD^^|2lY`D*KI6zQX#nvDyEm9lu~aC<?KREzrw&#?~&_4T*&|;&vqdE
> zC_6BVzo0qK7;V1I6Dqn*oZ<2mv(r06BXB;+@c^4YPQA^vF}eNOp=3D=3DPdfE^C`RHhHJ
> zj`@sXj4h}eK=3D_-d3&c%T^ak&(@QvPSD5&uOnfcEk%=3DD_XGYb%f>uIMgXdd*Xq1;=3D+
> znC!0q^tS=3D>$$2(lX_eMB{}|JucW7M;fMx-;0!;!s^VocpRKZ2FrVMd$lLDzS(%h#f
> z{WN3x041&RZ_cSu8fVs}wZSIciKCmeppOu6vBWUVJ!!W!fM|qFLunNadj6Zz+Fz~X
> zoojB{RvKP~_mP0+fQ=3D2Vr4AN#o8+)JNw7Em8`T$Cv#L4ZqVmG>2i~wjVflXnW=3D|~v
> zWT%0OIv8a=3D3NrdO%S<U~jHs*nJtV0@1^}9~@&LRz(^!3ixU}lJVRlu~IfUXxd&k@=3D
> zd&k78ora<_>1WgkphmQ7Zk5h85jqu}OFze%BG6#*Ixw%@t96w+WJcCB)oE_8ajtVl
> zk}oO;n6$1LM_JPdBNbrUvE_CIW_aCD?9{qaPfW1SAEkBWpU}FdpFn`Od^Y)RruM`d
> z1Gn%c8i)_x**#~NA{J^%i@_!LSkig8wSEa_hN6*43{UQVu~_*gSPYz$yxM4Q3Tzlg
> zP47I8+GX_oL>`z(iSa-NB_|F{XO{tJ`q?`ZT;1x0EFJh%obDao<vEM>cgb7QlrVZ?
> zSpYen6Z;(8hf8VXYbllOO}y#`OrXM1xP;+}VihC`nR*1JCa<qSMwQv@ltn7UZB+``
> zmmVYc9FcwhCV6%5xIHhuz0%>B+^qW_wwPS1zve}cJzY>SIeaiel_SstnLutH44FI}
> zSaD{WGr7Yc-(c|MiJwoqD+j#&^3WJja3}|88>2<-)o6FWp<;o9HLq{$8&lBej@r3{
> zYX_6WLm}gWB_-VCS#!jrfILN4pZq}R|J33MNFo1kK<Y*MtHKBMEScVfQXaz<9>U_s
> z5DtqWh5rxZ-owH^L_D<1*3*@0hdZwowXO}0{*qQy4zyPz^FI2HVUZ(T-Q5)cuv_QE
> zr$fO=3Da0fEOQZ39}Z<MSHmgwnUQ56JYdc1Tmae^bM^?{xW-gC|4>*;lGuvrCXTH~$<
> zb9=3D?T0UTHvz1dMaqe#^<l*Mk34dt7EdfY5s%SgC|Gw@DI@1@lJ7IqNX;orc1Iu3`}
> zG9v&tz)KLdfu2?MTmf|zoMD7jt@peI(rXQyk!JWA4X|?h0cLBxRlJNsti$vRM4@B4
> zLzdCtLV|2nzKDjv7A*|c_iD7bB{qxNGPCDWlB>JB!r%oL*Mdg(Wy6-6>u%U!pjMF!
> zu0VNS2Ddrf)fe_KG=3DCLJu*T>oRKNw(CDXrMtNUCB!3(?kK0}bKapr-k&XiLbbRskU
> z{5$sp(qG{VpQJgHOZmPAd}r-ufv>XJ-lYNe5}f~6G{Ksp4|uKCi_>lOYM$=3DytRq2R
> zNBE?Gu4O1m++3AJ62A`2e8mkG8(hT>>XYCqElsM<F>iOWu`R8reL}3v%>58sr}#nH
> z{Ax7^lc<_+bcKQVVfhFpS$Vw-L>LGn=3Dyp7{ur4l7*_^l|s*BC%z~e=3DePre>((*j@4
> zyuvOYD4*jca46h84~NR_o~spWd=3D5MJ{Ytl!b8ja-Zgl4g`@rP}PVNjy=3D}@LSNljwp
> zQ-m##Ac1L|g$G0G2dG*9w`*F{pYe7-b<l7;nIwMmX)t9;hxHf)WpkF79(@zaM!TKG
> zvj>v9@Bl+kcM0p6j!vU!hxe=3D&0JNQC?6(<w4~rg_BcGDJ-(KxUKYN;9vdi%{cy8^n
> z;Wcuy>$^81Pk{iX`=3D6UOHRVv52b9pD{7_E#2FI{i;Iyrk=3D>fJn3MR*IXWU@21SnnV
> z%`yi6IGoN%ZZ-TS8?PkI-+v{`R7vX_r?5d3j!-VNC*?#}R7CC_jqvlk6bl>SdpXPC
> zx5<};9joNWD?Lv`r?3h$JE(@F%g1)H>}XPWqFOf8TZ;U9JnP@HGBxxV>P@mv?t&&F
> zJM|7F##5X9>BW??qAZ}wziE9i{iNe)6@7T3(m<2gG{nd6BE3BO|I>eqA8Bbi6y4Lc
> zryCu@?1Y2utHE^19F*yjVfcyDoBhXoX)uf61vx;2w<(G7%p&h28Vx=3DPZY?u}IM2kh
> zr6m09eQ*eV=3DLSQ0^tq#uKR$QVi^?Os#p6<P{2#a3QmOKM01HirFZ8ED=3D<0<?{y8HJ
> zMsU3-97Oz^-)4_VmgfHQx1RKcH*0v8UK0k<4xEglH}rz<D`28JFx7`zkJ(m2JvH6Q
> z;h+Pcufyy92%w{3TrZ$M!q~e}@OBE$YMqwcy7UIjFTHR%o=3Dv18QfoMw;CZjp7t8UT
> zQ9SNN11zLJ<1~2A2n{ZVbg}}}3jJq5-5FZHTZNBFmH%8QXB$ZPwUx>S*!jY6Y45dv
> zamr&*hDCmSV>3^S)KAJJIlXgTT|G#Ozj=3DZi#KO;;8N$qfzl>p+n-DZCkoNq7umbK~
> cM}QvwMGF1Js8lCzVfWKSBF5{;nRfO60`@rxB>(^b
>
> --
> 2.34.1
>
