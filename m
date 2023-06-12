Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BADAC7EE2E
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jun 2023 16:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30E2FC433A8; Mon, 12 Jun 2023 16:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14144C433A1;
	Mon, 12 Jun 2023 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686589073;
	bh=V+8ly5CUs3OlryvsuoHGmHUuPOfVXmkkAYL1e0Ns4Hk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=guGlH9MvbNV/m15drOiXlSXm0Pf3GcAVLY4bFRHPJ4JF62G0Xmn8P8tn2Oo73Px3n
	 J/TRy4s6ENnpuW/n0BOUuO8wFzSFbossXW2qJV6dQNEe9Q4MLXodDJCN8L586sP7Zg
	 R5W7Z1kl3obJ0PVLyWa5a1tIGgfvwM2XPOaKEL6aX+EH1OIYBK1/4LQs/iYs/ayAku
	 zkw7pRk7qd6QsYA8Hxr2sdKAz4vOvvXs4B8ZNSOqZBeR22Y8oYYMsLnu10wHxMWrqk
	 AMQEQXBrt2ErSrWpCr66a7d+ulu6ZX6qjrOubut6Z7v2rxWLjASW+rUAzG+elilsYV
	 Qha8MqymxQMCQ==
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33b0bfb76cfso26790565ab.2;
        Mon, 12 Jun 2023 09:57:53 -0700 (PDT)
X-Gm-Message-State: AC+VfDyFoKyREwCF3DvE+fVLzCakwoNj9K/OlZrLpLd6lWvxx4HgdME/
	wsBphR6urJfbYhzM79IrcNrIZdfv02uMun0+4zk=
X-Google-Smtp-Source: ACHHUZ6Obn3VhFzUoI11jXa1eOFuEPWYATUFPk1nAAd144l1J5A1OLZEIcTRpBjNKdTVvOIj9f6AOh++CuPZExxsb5s=
X-Received: by 2002:a92:db01:0:b0:33d:5cb4:f3d1 with SMTP id
 b1-20020a92db01000000b0033d5cb4f3d1mr8055126iln.2.1686589071854; Mon, 12 Jun
 2023 09:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601173046.3185925-1-riproute@gmail.com> <CA+5PVA46VWBL7ZVskFiSEUYvWoH7W75gRMw3smFysVRX90YFZg@mail.gmail.com>
 <CALZrXOk+2gy3useDj8cpzyzyDMHcXq_wpHkdSnE3C7RVQbvLkg@mail.gmail.com>
In-Reply-To: <CALZrXOk+2gy3useDj8cpzyzyDMHcXq_wpHkdSnE3C7RVQbvLkg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 12 Jun 2023 12:57:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6CRyMioY5XV0QbzMsOrmqv5NqSTyfHZoTuWtpW6igY=g@mail.gmail.com>
Message-ID: <CA+5PVA6CRyMioY5XV0QbzMsOrmqv5NqSTyfHZoTuWtpW6igY=g@mail.gmail.com>
Subject: Re: [PATCH] brcm: add CLM BLOB files for Luxul devices
To: Rip Route <riproute@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Kalle Valo <kvalo@kernel.org>, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	SHA-cyfmac-dev-list@infineon.com, openwrt-devel@lists.openwrt.org, 
	Dan Haab <dan.haab@legrand.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:05=E2=80=AFAM Rip Route <riproute@gmail.com> wro=
te:
>
> The files were compiled from source obtained through Luxul's contract man=
ufacturer of these devices.

OK, it's not clear to me whether we can accept these.  We have no idea
what your contract specified, what sources were used, what the license
on them is, or if you had authority to release them at all.  I'm not
questioning your integrity by any means, but we have very little way
to know Broadcom is agreeable to these being included in the
linux-firmware repo.  If Broadcom wants to submit them or provide a
Signed-off-by statement, we might be able to take them then.

josh

> On Mon, Jun 12, 2023 at 6:29=E2=80=AFAM Josh Boyer <jwboyer@kernel.org> w=
rote:
>>
>> On Thu, Jun 1, 2023 at 1:31=E2=80=AFPM Dan Haab <riproute@gmail.com> wro=
te:
>> >
>> > From: Dan Haab <dan.haab@legrand.com>
>> >
>> > Add per-device regulatory configuration files for complete channel sup=
port and
>> > maximum transmission power per regulatory domain.
>>
>> Where did you get these files from?  Given that they're likely from
>> Broadcom, we'd expect a Broadcom Signed-off-by or review at least.
>>
>> josh
>>
>> > Signed-off-by: Dan Haab <dan.haab@legrand.com>
>> > ---
>> >  WHENCE                                          |  15 +++++++++++++++
>> >  ...rcmfmac4366c-pcie.luxul,xap-1610-v1.clm_blob | Bin 0 -> 28224 byte=
s
>> >  ...rcmfmac4366c-pcie.luxul,xwr-3100-v1.clm_blob | Bin 0 -> 34368 byte=
s
>> >  3 files changed, 15 insertions(+)
>> >  create mode 100644 brcm/brcmfmac4366c-pcie.luxul,xap-1610-v1.clm_blob
>> >  create mode 100644 brcm/brcmfmac4366c-pcie.luxul,xwr-3100-v1.clm_blob
>> >
>> > diff --git a/WHENCE b/WHENCE
>> > index 32d71481..d3fc870d 100644
>> > --- a/WHENCE
>> > +++ b/WHENCE
>> > @@ -2630,6 +2630,21 @@ File: brcm/brcmfmac4371-pcie.bin
>> >
>> >  Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
>> >
>> > +File: brcm/brcmfmac4366c-pcie.luxul,xap-1610-v1.clm_blob
>> > +File: brcm/brcmfmac4366c-pcie.luxul,xwr-3100-v1.clm_blob
>> > +Link: brcm/brcmfmac4366c-pcie.luxul,xwr-3150-v1.clm_blob -> brcmfmac4=
366c-pcie.luxul,xwr-3100-v1.clm_blob
>> > +
>> > +Licence: Redistributable.
>> > +
>> > +CLM (Country Locale Matrix) BLOB files contain regulatory configurati=
on data.
>> > +It's to be parsed and used by a wireless driver.
>> > +
>> > +Permission is hereby granted to use and redistribute those files as r=
equired.
>> > +
>> > +These firmware files are distributed in the hope that they will be us=
eful, but
>> > +WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTAB=
ILITY or
>> > +FITNESS FOR A PARTICULAR PURPOSE.
>> > +
>> >  File: brcm/brcmfmac4373.bin
>> >  File: cypress/cyfmac43012-sdio.bin
>> >  Link: brcm/brcmfmac43012-sdio.bin -> ../cypress/cyfmac43012-sdio.bin
>> > diff --git a/brcm/brcmfmac4366c-pcie.luxul,xap-1610-v1.clm_blob b/brcm=
/brcmfmac4366c-pcie.luxul,xap-1610-v1.clm_blob
>> > new file mode 100644
>> > index 0000000000000000000000000000000000000000..32ca36d7df48ecc5e899e8=
9da347e16a8bcfdcb4
>> > GIT binary patch
>> > literal 28224
>> > zcmeHwYkV8ob>E#kcODoF9y6E=3D5CBOKAP7PfNr7C51i>LRgg_FcKnNlr3Zkf$mf`Xz
>> > zY3((uDz3Usw(EE;uQ!|Rw#{bkI_cU;wsq??w$t>Twt2X1+UC(m(mL-)`=3DKBEvES5l
>> > zXD}c|Qd&wYIZkZ+eh}{5x%WK(=3DiGDeKw!CczHB0dw9PO65(l3c-t5Kt(8~zDW=3D&mW
>> > zP4+V3n!x8q<+oSa_1W6$KxMu)kB|=3DYX2vIT<2ly9_nH`gZfbney|z9Mb3XR*<&W=3Dv
>> > z;`W{5z{Gg|^nnTG+n;!0`};oe@v#ReaefXl*>1p__d4x6&`yn$v_-bxA@6>JFu7iX
>> > zccvuoye+@?H5uAGynhtlBgNpYH-lgNYOvGy75H>t9LFh~ms2?(=3Df@Z;*o#%(qbOdl
>> > zs;WNK@ALWnsqu6=3Dol9HkJL$L5@1(z+{viF0Y&M(AnxnaVK5yo&{9E~V@*fn;f(5T_
>> > zc-`54Yx|w;4{p46<Bc0{-FWB52d}^N`a7?G@YY-Jyz|Zn@4ox)m*4&1-EVy13t#y1
>> > zPki}<4|tyU@LocQL}a26uOP{?$K&yOy_rmAJX6ZNoVk~IJM(_#YvbcnQ&Xj>d!^FO
>> > z&d$p__jcaidH>~CU%vP9+xPC>d;jgX-+S-9_uu>4`|pF!BO}F;TO+TGygBm4k*^ku
>> > zw{G2f<<^_GzWB;3ue|xnSKoZ|%`d|1s|ayAcb}UF3kUern28PB?;Pd`CvZB}4XjhF
>> > zM>vBwQYLQ<!aF^OjUgDwQJ$X6V>*iIIHu5;#ni;%DK3H|Chjr0C>P`6d}`FhDH9Ky
>> > z+$cB8nTqQ32ZEX&GN_6;%o9PBWRC*Y?)HZxdUbi_Ty3>}zHwo#*}AxXseRcv+_iC~
>> > zH#af)T>kXbbYaGvE1j|C%V#SKn^&K|cKwB|?;Ggt>rV_MQ-kTD%y9O^$VqpwJ2ZW8
>> > z!06avCYi&7Tsr%i5?hy^Xe^#}6*)N3o#wL79vpBK`|(p7S4J4w!-HLV`^6Y_nH%(|
>> > z+pcNCk>c#)Qf_bX@u=3DsHFUa^Q#$odK6I{^>k3YrXWx3iM)WtP~Yxjdbb~#rMP8=3DO`
>> > zr|viL!RhVGE&(RT#+Ah-*_A|g!QFCu4Ej--gd;AS_8!sW+w9@e?-54(V|0(nkzuJH
>> > z*5}AbHI6c6{~qz9ZhvS14;(ei^#;S=3DF@yK%hwNj;;pkx-9;KKA^YP;icCGN(F`j=3Ds
>> > z`Uhg~xcGL(b3nJa^weT+We-xvQ{>?R@ofrYC`8oMAS_R?jIk6IbmX=3DdEgJ?wH;cHc
>> > z9kDv<2gexn=3DrBAyE*voqcCvN!Lxb;_u|*iMXNvHH(jWA@8%u8fe<Fkz4stmz(yb?*
>> > z=3D!VD>6L{*eRsE=3D{xDstXDWQi4>%P?sp=3DTa3Pb)aSi{s*{W&Edx%C)DD%4ZDpr@a=
sy
>> > zGo@z_8|rXih9etSo+Z4$y;=3DNwXmz&GkGmz>OUugMR$lq$zx((9;aC6TfBMhA_Up=3Dj
>> > z`LF-&zyH>6|BwIqt>01i25ekW_lEq&Z>oEPe)soucR4T2xGSXYuI!Zss3h%^1O4mY
>> > z__=3D@l^Z(?Z{<DAnFaG7f`h|b}Z~pBs{?fi3h&!=3D3YaE_hKW`kK{L8;${PYKZ@9%%*
>> > zAN<3w{{A2Q;UE3+pZw|n`k8<9vtRqx;Yirqin+%QN88MmbWdwns&FJVSU=3DA;{>9mk
>> > zef;H5?Ea<Of7zAj&i8-vuiX8sul%*wKJ`PNe*H7|KI^LY13&ocUw`9sZ~pKv{?af1
>> > z%3DA3_TPBtZ~m>n?V9jM-~F-oe(l$P<2OJ5g}?K~AODHJ`@U<<FMatZf9hMm^Si%y
>> > zlwyDUz|l<iWajBAcjM-*m;S62>|qKX<$U`fCwmxV#o43mbSM?N7IK~M5*mG!virTr
>> > zJeYqX>p#gP7jx#5OlCl3`@iz>qTsN#_po1i68^66t{jW|ZG13Ne&7e+_?#OVKl-j4
>> > z3t#&3VXxMXr;h8{!pxo;4@$%WSZ0bbxf+ia&I#W=3D0e|ehJrRHMrw$AGvtMhtIe^8z
>> > zJMp8$eB-d*hg}wq)XzUGW)H&n`eA}@cnl=3Dn0Qo4{@%mBZ_PoK+xpC#Am<jggAG&UB
>> > zKg=3D91<NaoN(j47oav0VRBIlz3;Lfx5*HJJ&=3DCXhHFckNI_$-Zb_uJv#qYM*tBg6&t
>> > z*B{qC?!>(lY9~|fFD#y=3D>5eJzVbAUfzE=3Dx<JKS)*Lh_rB>xV}vxPQesSoA$h-+Zqc
>> > zevE4P_~qbXSJ%(GwY$3xunI5xFgUw|SV3<OJPfwOJlLX~-CGOyFR6R6@2rN!+1z1@
>> > zdsE$<v!BEfN1u<L;9~l*C%T24=3D`Nj5Qreh@^*h>PM<v}O4qK0>t1Eihb?o8bJ$C*1
>> > za1sx$^=3DxDJVO8Q&EoP5N?6A3yO6X6$+-x0o{G)yMC^=3DmWe|OZd$1K9$dRz;;R&=3D=
A|
>> > zX(Ic0i}mpjc>cnk<sAQv;;5C%-B7R-B=3D_Wqof`c)SVq1hlKG>OO#S@EmB+Dp?P<o(
>> > zF_Zc6jyaxrntY6X_~DiJ!DZ7$^pl*69y3w?nQa<h|1h{67eODzNZ(P*#OIG|5jPMI
>> > z!e@U){-nn@N0pkv(XqX<h#ge@%;T=3DEkJ4=3Da%KNzc%H!0P$K2Z=3DFME7DKzY1!;j#=
Dj
>> > zdoJ8>@ju&#H{YvyzSiUBuY+aFz@vhOt;Yj<9zA+-PVXP^FgDr4Y#wqDa5(4>Pd%`|
>> > zcQ@&K!R2BvHCUV-brYGJxY#km!{q#471w!K`XP^m4*O&e1%Gj>xM#A1er%#HnB7g|
>> > zQF#7tsW+ebBblR&`<-6oerMH}hZFcmKXqcz|EN{l@d}>f*9zZVUx4}0I^pS-0nc{P
>> > z&OgcWRXA=3D{esH_+*vI~E!hh_E?h0WYmBk)b@*K4n``$?r`(haTLfBE(dF&PZQE+pe
>> > zef?2`9=3DD`AO6q4{BEbJiz0dVy#MiiR4SULJxYHq3k*A2l6*0UbdsdWi#T(wci7o6Y
>> > zV0WkhL)mo6Q&sm-AR8$BBKB-c;pe+lg-zsHN8wi`Zd3KF?{zPtaD($Sq;O3IB4JGK
>> > za|Xd&jc^#`GvEtton{)EYlQ0v$*p0IM}#v3EHDX(XHgB;{NX9h<8&j@1Rb!)lEXQ_
>> > zXVf3Ix_5Ys4_ks~JQxP;84KRRoHNLsTSDP7@sy=3D-Ne!3%;Sn|$q!BP~k#Jq`xU!8C
>> > zkOIsoAnvXJ|H=3D10eCLMUi+~E7jtXgLZbOqWR<>eH1p`A9cXT9t0fjA3xBwD?x*qs{
>> > z$|P$@mSJQ~$ubQNXZ@aR#zW+SfwG3Dm_m~&k2!`)W1dA5RZNdS@&P;&5UoCMHRF{@
>> > zp5sP1Vkw@g<{@N~N+vbTQN=3DVBjxYE<W{=3D0rctpNMIg^qq4c^02k%~DgO;dTC>S-F9
>> > zrvoNUNxT{0TLDrHD4&HP0g?*{(*bcjprr%)d>~;4Qhwg#aEs%soctyX;e;F~PIJ;Y
>> > z=3DSy?`c`j~p{RBG_a9kl^b44b_RqDTo`5B7FsNbT!5^n{#b^zA`@@FwW7eEsMe<jf8
>> > z=3DPeGkIj+V@Z$dYRCOB_}>k&zdqAK;YOjI>J5@`i+H6XS!xSA0a(&D%(M_L+J)!;u?
>> > z6Ea1mGBu`VrSdG;aw_1N0$VbxK<{M7!XQ}zdNJ6&U>F?31Bh)%Cc6NW5w2i_U&rt-
>> > z72rDX8EE=3DLDpx?hH=3DqgsYvX~@bR)#IL!=3Dc7ZuNz?lH5j8ZYI6$EZ55Fmq)nTh`y=
EM
>> > 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
SN
>> > zj|u0Akc!1t7@1*Q4f|VD$ehB}DF)-2Fd7T{t#I$m6dIfITT=3DjIE6BBjxE7SHL9RWB
>> > zYl8qDaW04^g8oXdZ*CAx4EigBeIPSNZFbfvSwYkea<w49Nu0xI0(&dC$DZM>1bYbI
>> > zkqnAN26m7J@~kZ^l*p!O0M28m8nba80~oYIxEf+Ow?csPmcUg7hI30`IFBJShO03f
>> > z=3DP@)E^II{%xf$Z@Sq$ehAv6~9TOq)?DIj|~!}*MW#sse=3D^tkMfNE$J&8ncr|?2$?1
>> > zp<-C<Xb=3D*S9d02s5%O1<7?yzSykv))fF=3DZQ1;p5^4tB>;dmL|%Gmk)Z0CfQr1?%Hz
>> > zW!!&toO#5p0yg`(JN@`ZKl2Dw0kHnV;=3Dj?4>izx~`k6=3DE)qc~9?s&NyUgnV*4oz`h
>> > zSmZansP6T?;O!x}ZaBp^G-%zV0<QZ5^$b*m&<NEtAr;q=3D54JgPKnDueH8=3Dwucc+YZ
>> > zrcAn1COcC~?vzqz3Y@FjB|e6uRhtW(t~y-cfYs&#XRHnvIA&#BIv|FKht%ktY1=3D{1
>> > z)-#;9(ZX?gfHQ8`r{fZCWN-yehH=3DB*qKG{77ff7Xl@@>6L?=3DwYX#zkB8O|QbJaamO
>> > zPGtOM20T;HkUf!k=3DCp=3DRXkJqTfINgau9?V!LuufM3yf(+gFH<{zGiZHlUOE8oD-%9
>> > zXZxp2dC1gz%}~J{$iqIB&$F!@vDo%hn#hoBMmUubhca4kMlWO%c~~0wJj?HpVOipw
>> > z(1ffep3<Zt&DX2>3tBu6drgj+gk#~%@2e=3DK8Mk;Gvx`T|DIWQKHKR0_>6C{Pc6nHF
>> > z%0pn*tqLKXcM8A>y8x^>1t3>9L$Il+n;C(tXZ*0KsAtkDSJzb7RMfQu6dx(6kTQy+
>> > zN(qD`<92;q=3D(W$>i8U-$hP#DHIcf(#^5FZtX7r@`O+)}1i%D9{(nXW{(0v>+;72-f
>> > z%b=3D~jYlO=3DNEt@pLaU^1BsmN$Q8xvt;dN=3D_`dODPfDQb=3D}N`Cn9&<Mp`i|%h4+=
<i<b
>> > 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
INn9
>> > zy@`Gw{Q>$z^hfBA(Vw6{h4D}w!m5eTS3U+Sa07n-6WU*gHXsVI4D(HBv%f3$Tkr|K
>> > z>%PD%-4}SH`(k4e{N1z3+(cn4H$67-+(52S%uf_2ClQc9Z^8SU><u!1i@n*VYZjp|
>> > zL471|AoSz#2f02E1OFeq(?I8b<4@B6r=3DwdH#{W3H+3WKvLazm!b{-&Bh5rLF3ghoW
>> > r*O%b^^YH!!)&@GGI_L+<?|=3D6o^sy{LzYhp_oL2$(@4|cMEJFVuDFnGt
>> >
>> > literal 0
>> > HcmV?d00001
>> >
>> > diff --git a/brcm/brcmfmac4366c-pcie.luxul,xwr-3100-v1.clm_blob b/brcm=
/brcmfmac4366c-pcie.luxul,xwr-3100-v1.clm_blob
>> > new file mode 100644
>> > index 0000000000000000000000000000000000000000..3b964509000bb69609afe1=
30fdbe50363a3f767f
>> > GIT binary patch
>> > literal 34368
>> > zcmeHw`*$1HdElM*;5C>5Fqk0#k{~bu2tL3UM1mj)3_*~DNDzWZh=3DM3eqG_5(mJ^3n
>> > z+!Rr}ZrsR<qq<qAjq7CH)N!)jZK^bGx^2_$_K_yt-Ly@U>~7koNgqkOe?ouQvuDro
>> > zes=3D}~QY0mlw&c1w#W~>IxpVJ#zxVyV@6I8Ll{3X0Lg@ce=3D_d)elJLbJ+=3Dp%<^#1=
c5
>> > zKfq1=3D$-zAh*Y(n0EaUsx%5u0gQ=3DdV|1M?<RBk9yQ?%(^2q{hZmqt?CtEX;Y&dr!Z2
>> > z_kGu&%7)<~%&{IC*W&f}J+l4i``$Y^oEqMHKnMiFxLt)W<uKb%K|7M7HJ#pmfqwBz
>> > zG{);g@QvsBosaP^z0O0Mg6}8b+m{uu-4<WIBewc}1+Jr`;p^AKpZi?6)%SaFB?y8f
>> > z?1Y1G5-vg@NzzU_NGD~Z?C^0o98Rax<rG{lL5QR@O&iv9?J4bf?FH>s?KSO7y}iA|
>> > zy}5zmbUK|&>*?pyFQi|~<T5&Zw&C;C_Ve2>Y`=3DE(Lsy@>`ux=3DwuD*8j`I|4?eC_$?
>> > zUwGk#*Is<_#aCZ^?Zq#B>QkS3^;55X`qkH7qbOL{LDMux^R%6IFdWa@Y&Hi*Bp#2a
>> > z;`#WK@muka#b1fPo=3DT06kLSm4<?}l`J5TQ1+WFYdD^EWC<gF(^cI(!yS3dT!mtK15
>> > zm6u+B<(0m^zHHyMz8ihF`(Ez5lg(bccJ0Qs+t*&capT7A8+UHszWp+M?(|)|)(4NW
>> > zeK&6OWpCWb_T9eSm%V*Ed+qk^Yke=3Dj+?Rd%<?OYWU%qzZ<(F^3jN5&8?(}8v+{s?M
>> > zbLZNPJ9lo}zH{d`=3DI`kB(a&AKe*JU6SDAQ&m?I>@L&b&*q*4H0BZ49rf+b{9R!CVT
>> > z<p7~jN~}OBarh>5Qt2g?Jd7n&N=3D;3W>JX`pkSa9tq*@?5CW!zUD3HMd5h6N?E-E%u
>> > zAY%oxuRshDd7^-@9PNl8DVkw9-ez~Y1h*)8ygu2vuNOqx?)NL6^6AB;%5wEg?d-~G
>> > z{oLC5#szPy%k0^>bot8WBfi7K)-U>e^1xtbvNYGY;8#*Z*{Su5^9!NFBTW!nkFH+~
>> > z4UdeDrB97dWF~Xd`GP)EoGr~+kGl-K)Q&(f)Y;V??$KiLM6WTy7#lWwBT=3DJ2+1GEu
>> > zvLJ=3D6j-!BQr{)*5gAfJ=3D4<j2tJm@I6w82q~Y_G-6gA=3DW37Jj`42OPD0YH0mp-yR=
S4
>> > zs2v!z;O!@Gz*^iVANAN`tzW_P5AO}eE1YP;Vcd_JK74%4vA)bNFj6FWYG(BK(=3D3WI
>> > zC!b=3Dj$a?!HX3syGyPFrsBhS?G`32pYd~lk@6HDX=3D)yu-Zd~o8?(mgo6alry$SzG1!
>> > zY<P2EyhRr8iS~^b&#Z0nEl=3DX8TaSG5+eLlPRT%ruU2bY`l_Nb<%USJrOrFE&9N$;@
>> > zEP3rWsSX1P1MC40bYItIdN0G<9tHL7d#__UrU&niPUK?-4$I>xc9^!9I^JMQ>G%1s
>> > z<4t6w9`G)Vp~UGu-8ww^ux(&1UB8$<JoG4PECfxeGWT2Qe$!7p@sK|{u60@nw*efF
>> > z&ckf706j2=3Dws=3DzJ-5aNU?kocCtP1YT8wKZo=3DKP}%*RR?4;v#1x3Xuu~Ja|VCO)l=
?w
>> > z714697SU3R8pFdGyged5^BkPzlaF?JhsXI9-@#5CgWcD$h0GZk#XbD78e@{))U6%U
>> > zYta~uhw3{H(tS|lEyJ|7ZpNR=3DuFo^d(A33+x8?>8u6SJIWbI<4H?6ZCP};SvR=3DlFW
>> > zRcMxlzGVQGk9c4vUVgizSQyzHQWX6AnRAb9yj76*_8#UUIHN(%{rSxyn?1@xO|W;x
>> > zDTgsUzR}*-KD!Lah6gcpde6NWs{EiV^j&3~@32AIj5y*)(1Lhtr&>9zo(CP|NmCS?
>> > z-P783Z4PVSeYkdN-?Q0$TktzzpMkaswk^=3DwAn$9s$J`uy4-4n8-|{Q#7ayjLzQZQx
>> > zFj7#~CicKq__i&N!%08Heeb?K?4cN*QB;9=3D_u-lwIuuL#WWVyjSp0C2x0{<Yu6Nr1
>> > z_`m+Q|Niwq`O`o9#-H22{XhQa|N72f{N-PL_pi6_Dw(z`rhD}ks|<OxUz}gq9|PcJ
>> > ztU%1KM55I*IJ?YFIqXtr^3?SYKKt=3Dcf8M!=3D(fUQ_9!}r<mU9oQ?|r}dp7%cazTF?Y
>> > z{{CP8(r^5y-~6rL{_;~l{(+xpe(=3DUme(0H>`S8tWZ++x<e)m8Bm*4ySKlsC+`ZrJi
>> > z^m8A*{j*>BqpyDL`JemPzkT83KmQ9B)K9$li!XiS&%gPtPk!p(z5Gj`{^eJ!1wQlY
>> > zXFvDdzy99$|NU$K;XnS$=3DYRFi-~8?0{rwMq_z(a1g<t#P>pyk%@oP`~b1i=3DJtw;lN
>> > z8mHv@5kJT+i%S-VFlQ{TU~X8Pz#I_0-Tf0w=3DO6vakNn{;{Mjpib>|;{{jg&`N<XZW
>> > zqBM6{EB3VEonWoU%5pN3mO6S4W9P9{%TlGU{L#KjnKdyx<vTpJdd7En@>jp+v)H&_
>> > zp?nTcSKs*T;@Z~xzkK7?AN>5E{_<b`>OXw<cr4wc<1h|;c4VQt$K>qPJHh6osQtlP
>> > z(cqI3w_npOIULk@OQ@FSKPdm8T4r<5nW&iZ!<1CdXqL;uZpt#igDy%t%A)o}j4gcq
>> > zB8>?*j%3UOBjbe0l74pTD0%eWOA+?-2lM8L=3D<6^sex-Wm&_D}wYp1Z3cED=3DvSz&hS
>> > zUfdhFpG*(pI*eI;6m$&aC@!SmidJS?^qc<7l!eLcmd=3D@InUXZM!L<9#aRh!8ni-!Q
>> > z?!jk`m1UfZ?`@#_mDt+UtW6BN?A&pseAKGBx56At>)z62YsWew;5}OB?xi&|d#D?g
>> > z0Yeq{Dg%2uWq1ceEQSFZ@C;rQkLQRFqqS$7r9C9<4y(lJlP$Aoo$x|^bbknC@y}w#
>> > z{2s2?-+$1T{nWpC?xU9D_{57AGd}a`VQE&5N6wz@?2&OdMmTKaF<}_5+WnC;1F$^=3D
>> > zj}9&N?}@eJScpaEK}UO->My>&aX$fBlvU5HU$nLh%cWq~XZd0rDq4%-@X*3|^Q25Y
>> > z4l?`A8=3D*Ii)9p4KLjM?q(4XJFm$6$+wP@S#H7w~^v|3)|UQBK;a#$Dd7WZ)h9woJ>
>> > z9yVi-TJ*RH$YCK?&sdy)m`wTS%Y05M4a;{Omn-*8I;`lya!AKaI*#Ybj*H>jQRZVJ
>> > zd|0h4iuZ5%7Q&XhI;e0D!o-i45_#-6eJL)kUH@$(dx7M|<G>l>?9%!7f7!?pAw~S-
>> > zlj_d>*kJkV{VvjC$U#O}KJKLc?I_RiFtWcN*+lR78OUK#SI<~_ZRxR*fmkxO9$K=3Dt
>> > z24PvBELGWy!S=3D^qdqpZUt;$Xfn>g-|^i3qprA@c6Kg1tCslJaI6OIZ}4XO=3DN_u^AS
>> > zJ2NL;!?K$bPqZ9)&Wa%Jm#N+>V#pmv_psz~0(q3_9gzv_$<Epu_RG+s)k3{!DUYQz
>> > z7AeP%oy+^Pul?|?GN$Egunr!KpY~^Cm3!lIckFbp4bcibaccKKBl=3D?kJ1n=3DO_Ne+{
>> > zf!|+d_XBJ3`(Jh-zj+h`_IPKy8%s0aijlo(p5U;Hq2BcM=3DFJy=3D=3D~s>$>00V~(C=
=3DD^
>> > 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
2N
>> > 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
2%
>> > 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
h#
>> > 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
=3D^
>> > zO9p>WGiaI-YD^MpCnS?2JAk>TNi<CgHDE5e&A@1xA{wO3QgBmY*v8%Sure@>yXVpD
>> > zCc~{Uwr$3_#RS%w&dUtc*w`(GUS}Ma8Q&%oTVoR2%m8CsA<-sDZ<CHH=3D~*PbTcm%T
>> > zRMtrKGTHeIY1<;HDrs9J?dzm-jdWcmJu9Sdn^ZT+4#-|8myR8C8XPlL;0)-#-KE<j
>> > zX|F2-T2H1x>p4()5&{u|Ft5-ifPv3{0Ke;q&<m~WCtBA}!j*>pUxKR)V}WJnwKeaL
>> > zTjRdox_+Z|{We_jyzjsjUhjjSizV7uXfSZkku>}zdD?gkzaiTi#K6P5pSjFu9vBJF
>> > z3_Sl|YaRM0%ypb_WnjJD)_n!8$VuCQRvU&(5ET4CEZmWld5ei{JvRp&@f?Qi|B!I=3D
>> > z6u`yTPqfzgO}IuMK_0ooj~pm^6?yy}3T{1#y!;#Z6~^dw<WV|Q-1p;%Q`rt^4bLE(
>> > z`E<C5kPG>ch=3Dym8jrB691I^5ub44^$LbhJtAeuxob1;MFP#De3xBC_lobyiLzSD>o
>> > zI2i@eOa-3u!?<r5*%%LnY-py6Y%bo1`_7o_0_3ypHCB+Vi|+zVXI9%#>TM`>I5##i
>> > zIEUo12ow>~%(>t7$D<n6hi1+rTOS_>iOe+G@Yb!>ia@1_OR<P-L2n3XD*{Cm5R4#H
>> > z1d3Wu=3Dd3k~E!tol(AIidMz#PS#4}DqAK(H{7tPirDpss@i^~@FMWEN@ZV~7ed@|}s
>> > z#TLB)1?Wxl1>i<;70H2a12WLddpXpLife6nK-;)CkCLc(0ai0)Sp?cJydavLK_~!M
>> > z_?70F-(WQ+LOIcFOK#BDmfLKbqFGFl!O2;m$fRwyMbRXhT|y9?OapDRAVH3YmtfH>
>> > zNYJErwu(9?V>-NYHwzRwc{^Y~TeC2o1&Um}2lt%=3DI(%<{zRa$*=3Dbksm0agu=3DV0a=
v_
>> > zfhjVyWELngTcx%<N^@Kb(-QC*b5cYlz^^q9urhg2YH>G+N&to7X~19(-av5hPNPNG
>> > zhJ9nG5BjS1q%;cpG6y<tYT{gbwK=3DTC!3=3DP64)|hPz#LFyt~<ACtvlD!NrdJx*9`3E
>> > z0lzUXrf44HXXwU!TMy;|Ka=3DD00MDGUfOXOsw*WfX>H}$EjX-DtV`a!_0m}{6fWDU8
>> > zI?w`^oB6b@i3=3D_LgK=3D$XEr9;D#?{(T&YFDyWe=3DBCOM(kPo6C*8z`{Ax9{@bizZR=
w-
>> > ztqE@ts4OobIo*RXEiYSAEyHRVZyCHwxed7t@bC;9DuYItRGtPZu?Ioubes35LDx*V
>> > zoo-`)x{7?Go!G0KZt<@Joo-`)8cW8|u+weHoNh@bj21!qDP;)OSR6r;!?2mfQ6w>D
>> > zYYa&#vz10tr`bA%q_Ek7lc657HG!mv*~%bk#B5C>TaOaPkXth9K#PF$guDQJSp-Z8
>> > z_!)D+poXL&H3inQG=3Do&1=3D7n8oX%?vy+6-<153+m-w=3Dfj@0O~<YZTT*Nd`&%AI&E=
3X
>> > z(h^d64RdX&&7mdWxM=3D}PZ5v!#LEh;=3D8jl0HnVx#7fqk8^?gdM#OJFGj-X!8t1vJt0
>> > zofQxi_K9Is0sAl^S6Vs_?@lfuU%C^^yaK#W2d99xN{jc<*XDhtE$IrjeZxK~pgFuB
>> > z??TJ4nj`3dHI`uwQ?r+`mommJw>4rJ^d5UX8(MDrt7XUzOlw?jdx2%V&lq;J+~&(N
>> > z@C9oztO4@K8eV?6W_jghtV4!HEw}U(u)=3Dg07PZ`_W4TSoGSFe?Z5ST#)a1}I@Dyt-
>> > z%)MahDYSs6UatfePz5S+D~PI?N&~-YTVJX`+nD<l%&h`#-M(({lU3le>5;1KowJJd
>> > z-r!5MhJ3b8P%Ko%IGgYQKbN7CRan>DNzPy%7&B@!u$gyu0?sv9*MwYa?*TPfm&D*u
>> > zt)*))4tSb%&w?h_+8ET@JgrqNJFl%+I#g@<4S>?-S`9d4YEBJ%3xoG(M-au6Sa;8k
>> > zeAMd+iO319pY^&!E~E9lR}2Y8>*u^u$ZfQ~4b0^z9-SS9$OUkMxuc(DV@wqGx3i<a
>> > zMe+oPTfpb6Zw~mk($XA+R@z)!X?unh;1$*!c-r!2lV}y|y)6N-S3&Phy;=3DonVXf;x
>> > ztJq5!GgjL=3Dxw?RSr@C@@Mq3kC+k3$3qNSayZS7obYv*d4ldIS(8!}o2Ok3-=3DrMika
>> > zX~=3DgKw9eGx)mBV{(CUTu8X$9XTz$sstG9KnjxEZ7Qg6$=3D-u5r`w#@6T_@x8Ymn`|#
>> > zTR2amdK>3D;B5NmdK>3D;N0p1oK5|!1I{Kz_45c#p+(?$y^ZNP;JC@tbASu>IX&py
>> > zvZYPuRuPwAV_-e!F2L^6jXlk|_S`j?Yg+9ZP-$w|8b}7mod~UA+6<dsJ8i*RYvBw}
>> > zLHcQL7NmL}bHh7=3DTc8_haT0u3V;IpL5JMr<7_s0rMv($4i~Ghf<UX*Y24FxL8qt7Q
>> > zIb^n4yZt0;tRNys!Q!Z~irln70Bwyr5_lJml^f@fW6;r$TWiS0JB_~cNbT2pLAx6b
>> > z<m?4_@Dyyu)Q!eE5;3pB=3D)wq41T7I=3D09$Ca#@a1#^{qZ|D6Q6by9LZ?^#QL;&A!mG
>> > zRfI0Iv<ad05le^GN87Ejb}QX(ooctn+pURqE7NXGwp%T^h0*%5<tNwMHVCm6fzaPT
>> > z?qYqa=3DnTBHA0?8|{|x#W^kH-pJ&SIkkD%w!N6~HcH|THC-=3DV)pKR`c3|A77x{co5E
>> > z5u=3DfFedZ?Y%J7!I9s0fiZO|y#KM?u~v?;iL2d*H+_6OwC{(xNCA3PQoMWe$b6N4ke
>> > zgCpbNk#u$>lO3K!?}10p!}r_p?F9wN!M6gg?RP+rcb`D$>+gf-XCQxtwf+x$HGuO*
>> > z?T6ZXfX45@cLV79b@+y0-aok^pM|P{Q-LeoYfgj)V0;r`e+It43E!{7_mcqU>oDe%
>> > f5YX&KA?BKZHD`fu6?k~e&+kE=3D`cLrPfqDNQsjV?F
>> >
>> > literal 0
>> > HcmV?d00001
>> >
>> > --
>> > 2.34.1
>> >
