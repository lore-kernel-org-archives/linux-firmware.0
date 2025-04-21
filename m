Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51030C369AB
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Apr 2025 11:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 360C0C4CEEE; Mon, 21 Apr 2025 11:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD7CC4CEE4
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745236333;
	bh=4fDqiNYdZUd5M1jsfCEMeJYLW6lWWwyOkJ9qrrFtXGI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=qb+ukxJRLTBX0yMYNbRyPqk53mUwxD1/g9HYbYK6AttvHbqhiENFGPOtB+vPxhe2b
	 X4TZPrO5F21ll9FzzBsKoHc66FRPlartFi+J28aiTfIP5ISZh6PX/d6Hl1VGLgK+N9
	 UbpVrERdtaz3WGbhrUV14fqIy9DbO4B5rst4tE8J38W1lJJ0/Rxg0ZiGypiWfHxFfL
	 AIVRWCWxYslwg/piZOn/uD9Td+Xcfqsi+Ix2n44xkl3/QmJEgodGow5WUbP2Glq4Lz
	 s2Q9CiBV9SrC0CCHuoBPj8d5xOMEAVy+C3tQsE31Nn8t2TS6XG+iHin0At3idHlbEu
	 tz/oAeMMKPIVg==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e726895a6cdso3280402276.3
        for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 04:52:13 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxvq8/8YQwlOqPpdSrt69f6yOHT55hlJ8BkBoYjZJSSqb00MVxy
	MgnBdBZhs0JA1GDOseVp/XJNFxGFWS8EMAx/3TqVWW3nLxh6ejcwv90ktVKlWaE67apXqRpuIEd
	M6SyB693Mu0cAW1I7o8TziEI0vbI=
X-Google-Smtp-Source: AGHT+IHJDOXYXzcW36xRGtmZr4DWTUKFIaJaLwltzJgJZw+tO2S9I+LCPLcxlLtniSjWPKixGgYFufMy9OWOnTlCewY=
X-Received: by 2002:a05:6902:1ac5:b0:e69:371d:5c82 with SMTP id
 3f1490d57ef6-e7297da7a85mr13441348276.8.1745236332145; Mon, 21 Apr 2025
 04:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250416021354.498738-1-hildawu@realtek.com>
In-Reply-To: <20250416021354.498738-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Apr 2025 07:52:01 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4KRPt34-QqiiCt_M8Ue_RnwTKCki0P-2t=mPoLeMh3TA@mail.gmail.com>
X-Gm-Features: ATxdqUENh-GZNTWTVkrLcwLfKW_NvXEvOyJpW4nsiE_nwuvGJM3AL_PhX6yNiYk
Message-ID: <CA+5PVA4KRPt34-QqiiCt_M8Ue_RnwTKCki0P-2t=mPoLeMh3TA@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8852BT/RTL8852BE-VT BT USB FW to 0x1881_BA06
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, max.chou@realtek.com, alex_lu@realsil.com.cn, 
	mu_hua_chen@realtek.com, kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/519

josh

On Tue, Apr 15, 2025 at 10:14=E2=80=AFPM Hilda Wu <hildawu@realtek.com> wro=
te:
>
> This firmware is submitted for RTL8852BT/RTL8852BE-VT BT USB I/F.
>
> Release Version: 0x1881_BA06
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852btu_fw.bin | Bin 104080 -> 107328 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8852btu_fw.bin b/rtl_bt/rtl8852btu_fw.bin
> index 79396a6c4d7c739c4b37ba29f23d314362bd91e5..66e639b1d6f6de9f0ae6bbf3a=
77658e6ae0eef95 100644
> GIT binary patch
> delta 13453
> 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
> PuZ1Vz;>Js#y!HP8$7p+b
>
> delta 10036
> zcmZvC2Ut``*Z-Zn1(u=3D<(nRWA&;^M`0(Q(|ix4r^XlyJZBI^Q*VvX)#iCuwFHy}oA
> z(U_PhSF<sR1|>v|Ca*nF6E(5Ciuefzuz!5NSzPr0zJH!)?m2Vj%$d`sF6BR|^Y^IR
> z4ISQlc%ST?w9v*FGHt9Vh=3DL#xl#~s`4oOQv7_ouu>*OpJ7+g9%OVvzpKI3${v_V@I
> zUyQGevbT54!Weq8w82?6@Nb!+sxhOqL0N{vOk$kH2wHi~+;T&ekY;QU%1~tEWkW+i
> z8OncPexUi;X|FIZ(7f!lSC|$wt)2D?b1M_47>^pb2GE6%V8<+WR0*Q;KQIBbCRH3*
> z2$Vtr-|Lv49Ma%d#%WLrMuap#5j)g^o2wDh;0DaC2?MuV8Lb_DC8WW5e@KJHxr~BA
> z2?pi<{}&TL6YMkxCO`oc&|b&<K=3Da$b88pBBw1&5N0WJpA?ni-q!9L`GD*|jrfg;VA
> z1*j54Zax3<8pmKWY`9*JFmPCtR7$3l*A$gzRsk<Zz)H(&MwQYS<6BA9<uzkUjc;XE
> zm)Cotzae^cRc2N1x6ls0Ipsn_@8}7r%|&fYc`0~MFh*&;wyd<?!X4CvHeqfca#!Ko
> zj5!12TI1V{A%p6<()c!G0x%vjd|zS|2B3f@)D0@7^?owSe)=3D%JTre3<(t52$HdIgy
> z`0DE{(<>Ciq3q|F5*R{rC8Rc^RAF9Oz3LvYa$~*MeiZQXFRyV-3px0rMQd+?A@y$d
> zmRA@Iu}j7mn1v5w<d)b6c^!i#^@u-O9hd=3D@pn&!|<_8*V0__#%1sYcg-)0QTK{ZZm
> z!WIE@v+Q5X0h+j;2Iz$HAD9wW5t9LGyj#`3Vz_yv$xxA3v9Kb93$KW;=3DnV`RZV%fl
> z?0PLN4MA{F;Qm+G+gTw94+^NKsx1N{gd#^(8!wYgfs4GSJSRX?!yjD4+gVC>syeFL
> zaF4eNvf;}0x_~kibblT51I^D)dxd#{hTwqDOHRR8i#pG;*Dy<+8;FPwh;DW!XE_zP
> zGpJ3N5*W7t-)2kz#`VYdB~}ilP(X_{4Jcojm{9I!N-QtOa7eU@Qgb<^(Ubg(0{@mn
> zCdz)xE0kjbh&<-6uu=3D$hHq(kyScihP*D*|{I<NijmUAlB+d3ZK*D*KHcwq5u#+-q1
> z74VfyEiX|eh&;>jZN>y(Tp4^{Vid|?rodK?886d1KVaPLuVY@Iakt~!jA0qFyB^<W
> z4C`Q>g}a_22q<<8>ml^wv{#rCG#&ztmBQgDvU7n`zVWgVilCsy2t`nU2@h1MLR!y4
> z9qp{rQ#YcgT>%e<>*&~)diu*kiN-ccbX^-gjnGJRvL!%IW0^z;11`^$XlbCH#(gQ#
> zZvbC_;ZBgA9&wYX7vSmwiOxpHO)lUI)zb^!5*@A8)4^VPdZw>L1Dy5rmXAaigXh9%
> ziRJ^k`$^OdeeaIMU^<L}zI{>ew;p`pw<JJl=3DmLoj05RdDMDIU_AkF{*+dcKvBUGa2
> z-SjkElIW&LiN4uNPuGEdzoSGy#^5hv&=3D<;|fRd%*FeVlQIq7L$7m1nym!MA3=3DYBVd
> z4lzjdR=3Dh+%gR)f8(@y;)3mp!m+eZ=3D|yIfD-7$?yX)c=3D~Kqa)sv=3D;>fRtxu8Yg&0D=
y
> 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
rQG
> z%JXzIX1<PU=3Dh&WgB+<kk%Tdr|xUF+15-cK$@4rQQG)2szeU$Z+7_w2tja_E#6^mvM
> z>)cqf(&q&vb2HZELh3XfU50XVs<lmL(pkJU)i$g%xlAm10k}`W)kUo^EMNkDuTlbj
> zfc11T&H=3DTk2ZrcqrT||ka2iwU=3Ds}f^?o;E%9_>#g9qrUwM|p_rgFyo<Kp(DkIQk3+
> zRC(*@ABd4R+6SY)3G{)0BZ$sI2LQ>1V4iI55X_S;0k9|F5DeTE@C6{xwmb~_CZNg*
> zkL7@wfIM&FGzb#l2QDxMu-*qRTo~{JR|E<5BY<_Nt6Cx$sMi7tFf!cFf&idlU#N~g
> z2Al(HyueV|qG>m2?Wv<*fKK2YzO!_~22~E23rpO%fc83Cjd}*!?*JB{U5oy!Q1~6M
> z7M{_A?~o2z0&k_DozJL*vjWWxM|f<zyOE8=3DrxL#aG#>-ZO>0%9-kRJK>+<5M)>%Es
> zLQgK2Z;;NA$G40mlhw5+8KiEaH}OuKYMa-S6cbWn^XWxSip}SoFhMvd&@dWPX#2-N
> zE-IUE0r}YVw&1a2Hs5Se{D6DeZucV<q<M;#*vj4^$^5c!ZIwU{1KQ3dkQH`9^1Eb#
> zIIX|!+PmZ;-%D(^LFA&Mg%=3Dlt-#ND2)L_cmHV!3i?X4BV$xN}eBX$3X(9;qqFc7~&
> ztiaDdTdYGzl3{$Dog+yxm)2(#=3D|C(A9dvXT+Esm##o#{y$Q54?I#+r<!axB-qwuRB
> zU=3DrXiv@h?jql*Cp-^9cP^oYeg1B`nYPYr<e;F}Ei*<c-=3D2w2%4i3#`u{i^Y!%cVHv
> zOJRhCa&wB_My`NJ!SH8i{OkyLa2VnWcp_d$KL-3|1QHoA?HwdCV0>33Al`qs;3v*i
> zP^{Y<I$8pl3-~eMCcs_zjp_;bcoZD})uc>c6(fqRZg$^2d-t+vTlQ#@sFb+ZxTluE
> z6T)h2c?nJ0$0h3Q8|{un+m-QHHC##{i9cS!f4)Y7rwJgI6!JBZG=3DnfcTDb^E5I84)
> z?&2wu^qzHOD(OW6tQ%6v+W;3+Nd@n|aU%KK9&gJe5-mO%YLh1slY`*T2|Xs0o`m>V
> zXJ-)pPG|cngM^91-FkkCy>4|ilm8V*q+4AxNpEr7LhE~(L{g_smFRNhcP266rOtXI
> zlME(K)|f1k*?jaW7;F1Hi)aZ^TEEXG{Qb##FPj(@iypPH4w_0jsxOS=3D??$#oQ%NEr
> zuGU|tktaAg9M2&`6f6E|Z4H=3DCA{4v-@v{z?P6B!F^y#D*S77IKQY9XlU}ZDNRw7zE
> z=3Dh`i`KFcLR;+|A%o0%jrID8@!0XJGt{Er#Q2~2sK>N)}U{jF7x+GJNh(pVSIB=3DOCf
> z_Di$<YbNm%p~RipBwi6!6J(2;LyGKfIyRSlOT4WM=3DaJvwq|qOeYYKC1pta|Gk_&R#
> qeA1C<t$zb>-?dsmJj2_V-_jks?{nAJ8TSbO*C-Nj2}6`GX8j+YZUMsp
>
> --
> 2.34.1
>
