Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9E6CCF9E3
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Nov 2025 21:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A59A8C16AAE; Mon, 10 Nov 2025 21:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90347C116B1
	for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762809623;
	bh=cbI+R2UrzHi9iiLwfw+zRgNvKidPSbnDopl+rdFpOAY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mTsnEhccxqG78FfQwDIPC3S7rMTBiWaXqH5dlny7ghz9Fn15fq8VKCpkxl1wexwr2
	 pgVUKSvvWw5bv1oCQAc9l94d6cJWYcemfYrtZgXSYZpL8FZwpRTnjq0GNoCE3qIy3P
	 l+VCnVEMrojLGy0WwjRPsPa8NtZECQmBtb+eXIMlOxOlyAKSMdF29epCBNU/RNrNyb
	 I7hxKWyU7Dtjau4fIl12WmUW6yW22PnLlbBBcbqE/YdDx8zi1hSG7aZXJ0ZuOufLbe
	 dDbaOncRk5OeT7pBv90eNX74EAWpS/voLjvhe3/51jb5RFxHuwFgWIXpTHDkzKS/la
	 2JdQGL64MW3uQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7815092cd0bso33392487b3.2
        for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 13:20:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdQ+H2M5J1p5sgS09I7GP4y0um5NB1DuQmJiqcth5YinUMy/5PxVNn7Eyl8049YVfTggQqxmMYL48l+UcF7A==@kernel.org
X-Gm-Message-State: AOJu0YzXqTxXihahhjzwlTuIYDui/YVosVw0uKJaPqyr6S1tbpopTncb
	rXJolOg7kbYidMu0lwz27JwKfsVLDCWHEh0COQahBRccZPv/5tmNlBy7BNGqNi0jviA9KdUNxNy
	WUS9OQVgwylL0J+wFfV+8tlQRHFpWqFw=
X-Google-Smtp-Source: AGHT+IGkHpQHAD8XsBNlILuBtbcrlVkw1p4EOt2HKUn8S/1Qq/XbCJ3b8WLL6XNcNquMo3x8febOu6fEc/St4eTL1A8=
X-Received: by 2002:a05:690c:d96:b0:787:e9bc:f9d8 with SMTP id
 00721157ae682-787e9bd082bmr94351307b3.52.1762809622730; Mon, 10 Nov 2025
 13:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20251110065104.3163-1-javen_xu@realsil.com.cn>
 <a98d4f67-cefb-4060-8474-2a816efbaaf7@gmail.com> <440bd25835074432924968048d96f6ce@realtek.com>
In-Reply-To: <440bd25835074432924968048d96f6ce@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Nov 2025 16:20:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7bpua8aRdR1q9aam8F7T3V9ikECJJ_=Wmng_V1t7K8Dw@mail.gmail.com>
X-Gm-Features: AWmQ_bkb98S1T0B1a1kQNls4Nf6ZGbVMl4cdSNtbDsLlyluS3z2EOCZ_x-c-nBg
Message-ID: <CA+5PVA7bpua8aRdR1q9aam8F7T3V9ikECJJ_=Wmng_V1t7K8Dw@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware rtl8125k-1
To: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, 
	"javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, nic_swsd <nic_swsd@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:53=E2=80=AFAM Hau <hau@realtek.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Heiner Kallweit [mailto:hkallweit1@gmail.com]
> > Sent: Monday, November 10, 2025 3:22 PM
> > To: javen_xu@realsil.com.cn; linux-firmware@kernel.org; nic_swsd
> > <nic_swsd@realtek.com>; Hau <hau@realtek.com>
> > Subject: Re: [PATCH] rtl_nic: add firmware rtl8125k-1
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > On 11/10/2025 7:51 AM, javen wrote:
> > > This adds firmware rtl8125k-1 for RTL8125K.
> > >
> > > Signed-off-by: javen <javen_xu@realsil.com.cn>
> >
> > Hi Javen,
> >
> > are you working for Realtek? There should be an approval from Realtek
> > before applying this new firmware version.
> >
> He is also working for Realtek.
>
> Reviewed-by: ChunHao Lin <hau@realtek.com>

Thank you for the confirmation.  In the future, it would be helpful to
have the Signed-off-by via a Realtek email address.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/777

josh

> > > ---
> > >  WHENCE                |   3 +++
> > >  rtl_nic/rtl8125k-1.fw | Bin 0 -> 8096 bytes
> > >  2 files changed, 3 insertions(+)
> > >  create mode 100644 rtl_nic/rtl8125k-1.fw
> > >
> > > diff --git a/WHENCE b/WHENCE
> > > index 9adbd42c..0bc967ba 100644
> > > --- a/WHENCE
> > > +++ b/WHENCE
> > > @@ -3612,6 +3612,9 @@ Version: 0.0.7
> > >  File: rtl_nic/rtl8125d-2.fw
> > >  Version: 0.0.4
> > >
> > > +File: rtl_nic/rtl8125k-1.fw
> > > +Version: 0.0.1
> > > +
> > >  File: rtl_nic/rtl8126a-2.fw
> > >  Version: 0.0.2
> > >
> > > diff --git a/rtl_nic/rtl8125k-1.fw b/rtl_nic/rtl8125k-1.fw new file
> > > mode 100644 index
> > >
> > 0000000000000000000000000000000000000000..8572cd689f55912d7a1f422af4
> > ea
> > > 9b51ad87eb15
> > > GIT binary patch
> > > literal 8096
> > >
> > zcmbW54Qy7`8OQJY_Ui>IeSte#Dx;SV0o}AMQz=3Df@7sZw697N4%aHB0P6emb
> > QSj#YS
> > > zs8T8lZ8WBpEu(C*GDX@YC{-
> > 4V#*fYqQa9(vmTYc`Su!(ivgp{<bie04&%IpkS}m%_
> > >
> > z|M{QiInQ}M&N=3Dt=3DbsWdpyk&h^>4M8{ySTKf<dTw0O1;w3;*!gY7hHx+{%N2
> > M<T%bd
> > > zfu^^irq-*uz0PY`x6Rv7yVYBJ>*fuOHJjIX4K-
> > V8*Lk%Y>(+RsmtRp*cEx3joV}0C
> > > z5i?oxznJ5sp35sTjx(Q@ppB>H(k9Z9w8=3DD=3DHkDRDE2K@Q&7gU-
> > S+qH{xhBJL-gTU8
> > >
> > zW777VRPzL}o8;g0e<w|vI}NOfUeZZnAmzln>KvyXcS^1qUu0&RDJE9tnoIgX$2
> > DT3
> > > z9X~`iwQCCYTr*kG6)bQ~(%>JsPw`E~zwNZ+S<M#bjf8)2&EDr-
> > lL=3D<*bxrIo*Ib)&
> > >
> > zP5f~?mJPq~0@uvMW&!=3D})voy?@@Ye^*?+BT%0U@Fv6{IjT(gRPDgB{b{G!F
> > M8$0Ei
> > >
> > zT*fPETx0HWO^W8xl8@jQvMhA+&`l&*7kfjDUkSz|_Po!t$DAZK!}c;m_U2<R
> > Gh#0_
> > >
> > znmuf#{fpR(hwQo7OGNCMk?dhBh&N&{7P2RPJLJJhx@J$I#S5wFx5(QTaxOW
> > (xXO+n
> > >
> > zm%5Imx5JK~8bL1eH^_W!R!_Bc`t>?n;~B`duXWAJI@c@;)h=3D9@a2;R5A44obT
> > *SD5
> > > zd`R6&1j&Qc%AYTF7<E2#q;9ixzNho0HvW9c`-
> > t<I>(^<r&QI!msf9mZ^8A1EnH%`e
> > > z`u@I?{M=3D7|q!#|(f7hJ7_w!hz@EXnpm_8Hi>u@~^&$r|I$dlCXQt~cw-9-
> > B$z1is0
> > >
> > zk3nxPI@`yfcOg1$su$ij;@7be_KU=3DG6o2Ksh_B}|XVI6KbKRGia|?5(;peo)cK^n
> > X
> > > zP~W4rX5w=3Db=3DV!d?6sXQ5(b2oezjwmtP2%n)ZrL+pds~V-
> > >9A{lfSu0kIqURSM%Imw
> > > zVcl7wbv^c6^qh~juH36{R}dfT%3T<aH**Z@E(xuhI)`=3DBdwL1yfpup@)=3Di9I-
> > PX{$
> > >
> > z<{Z||V694W9%EfOgO}&qvm^CrEpg3B?zG=3D?&NkB~(Rw*s=3DP{>qfoontCiRvY
> > B|ynp
> > >
> > zHYhP<f?`w7x70IT^MtMQD(XCm`%dn^pJ20)_Aqw+Z_zlJlZy@X#h&!#E)rj*FZ
> > YUX
> > >
> > zF9#co7u!2yGMELI?_}&ZoTWk6Jo~zhYiK89KjrK)_5x$cXRt?%iG$Xs4CL}Hj(5?1
> > > z;To}9gB{U{-DlU^^StHbUL|L*G2WwokhkwlvGH^;r-
> > ?NlWexGy?~A>I$mDL@42qwH
> > > z<UshEYS-M0P07`Lpq!<F307zDBG-
> > Ji+1irvQ;Z9~q4;0&al@c%Ueq}I@MA9Tli^|4
> > > z%u$@B=3Dz$L+&jw4uOz<)8+&EY(cQ2R#6QEP%p7riIo#PsL_r&n;V-
> > H<t<aXo1DQ0@y
> > > zH8+FKOxJu594;qciYpbrueeIFT5&m;fo*wnCBf0&TzHe-
> > uU9Evr}$mP8x<c=3D>;i|M
> > >
> > z<J+^}&b!(H$>V$Y>OF1y$LPyDEMqYoT+h8EI&+xo>AX8+9`(Kl6kXXPdCZsnUQ
> > J*0
> > > zFE;Eiu_^l$ofFlrnO>uNx6q!MPZ>+^Yq-D1GwJ(#JV9UPi%w=3D1HR4?;-
> > ;R%Ujg$B)
> > > zwvU8-
> > 6u%b5cpL8LEg*Xq{ulIwCm*)_Ex6c<?RCu#9k1?0_6lRN*Le>O?Sj*nwX;~;
> > > z>w}-9J<FMT5qt@~0rvZELB^-y(`m-
> > zjE`eH#duuDB_FS<uif~X6g#1@F2=3Dmb*g?i*
> > >
> > z?QGUgvG&W@j;U=3DYv}T|B;;^QSCq`KF5Vj2Q#EDn((MEp4>(8MslGm;1Nj|?W
> > h<|>~
> > >
> > zKN`04`W)+120lst2G&_UzYa^`H&nak6ZFMiGkvjhkl6F~oUJS0d6E5D@&fucdKj
> > 0w
> > >
> > z<Vo#9<CWY2FBsR{0=3D@>`^flMK1O8ilL+>KBBYQdZv>p45e!<Y_a(~T7)fdsvjp)l
> > *
> > > z*pJ6lH@uE-r<Hg=3D6@SRFCpiXZf%`bee{y)+fycl-;7Z0@!8ftr0!kk40T(jf3~oZt
> > >
> > zfQ!L)a2S;Pzyn9S52hKr=3DFb$LQhZf$`c5mKtyl~eQ72Q)_k+9hnn8Q^V)Rq=3D#s7iv
> > >
> > z$nT}z=3D*_L+9D=3Dne%d43u<Bg!aqvh_F_f1^>o=3DCdp$CF&M^ELc^!}1H@&G3m
> > Kem7in
> > > zS0WQ%j*(xn`R(;1uhnrIzVU6!=3D4`}c?3K`3sh>0UE9QZQR)=3D2vG5U9N-
> > *oY}W@s(>
> > > z<~+e#-
> > cynFcQ7XRM93%kHf_1n?(6hD5Rx4d{Z5UWJb4FMPu30jWturl>WlbMK;Fw+
> > >
> > zu(zANflm*T?~1`QYs%VH<U`Klc6^jre1CkI_}_#qDKh$Z<D=3D9~?8yCDP5=3D7Ou{n
> > ~x
> > >
> > zZP@eh&Es!Nsr`NAI79OM6?|x;|BxNOGBlp}r5%sz$v%0YhPmL>#ndE}4_`MG
> > vU$~n
> > > zGi#-IQ}}BwW&B)i-8y+>TU$co;<w!4vd+yR-
> > `dG%rq)XGx}3abvWLouIg#y}36I*C
> > >
> > z{21h}N*#60k`#H{XYKhi?|zK~J5AUTd;7t0)Mks;N%~tub&^<bTzw{QVc&eae%
> > @p+
> > > ziT>ZouP<vjWY?58sXylDbG$h-*1-2bVwd^<!Y4U<AAsWHGq>0}Z<=3DWFPQ|-
> > G-=3D@(T
> > >
> > zt(G&zUilq$68j}$SNBYk+@$M>P06E2?y@<HqW>g1S;U^cXOeuA&SM<C6YN2
> > Meu6WS
> > >
> > zp09H8^~oJ)<U^bvk++^=3DE;@4G1aoy?%6I4xYs*`6Q_8NrM%KcIjo?JyT9sff_yj(
> > U
> > > z2VW<a1h|lRv%z}yO(ytF#^c}|^c?U-?#3h-y_-
> > )L*>|GjpyxMY4f;A($K3a^wHCaC
> > > zwblv8mmh+)jIRgf-FUlVgW_hz)nFdB?&SBne)4`7xQn{<5bG!K7U`3hGV+-
> > 2S8zW>
> > >
> > z`n&px=3D``;k_FRqhITO;)J?a`?_M?zY`nx_LmaAQJKK8#co9`BPev8Z{A2K)HCl2Y0
> > > z&MdwSqH|;|ZzSUU@Du#o#+~x6YaZvVorewI=3D8_^i|E&^gKx}n!-
> > mIL*jt}j(byp^S
> > > z;%^Inwy@q`S?B#W?!Wiwd#?G1_IqZ!rkiuIikxKen@Ba-1g-|<U0DYnK;8n%-
> > wCaX
> > >
> > zdlc_iECVIS@>^(9e+zXS`&+2}jWs|0`>6bOD)pTKx~lJ>@Ba?_;jrVuzwmchUq6
> > ZR
> > >
> > zSoGz$*_V$@F_|&mn4n|$`v{bn1_kphulVe29>{a7d?Wc2{gc=3D^Yre`m{%Pd{q
> > saR|
> > > zvhqQd=3DTPJH`Z_;P`P(Yr-DTxQd7kowKmV|mJIdRXw<@34YvuCJ5`T-
> > 8&sSd2XXPp7
> > > z%akuwo*(hAD8lpApQP#+DKAjIQ2i-
> > UUaq`Md58MbuDnWlrScW(&vNAlly@qh7xAY!
> > > z!grfU{*(v#YmMYjd62*MNdA-
> > u`Rk12Pr0AJZp}xR`rD)NA68zk@*3qERer1Tg^_s5
> > > zBRpT@3G%Nz$iK!D<X?G^e~l-|zw#je8c&da<$nH;_uBY-
> > )!+U;%lni!s(h339V*|Z
> > >
> > zydo0MvIyT@ZS5J=3D&r_aIp0m!%9p!DxTb0jiuyRj%vGV!KE1Il4rF@z4rOLZCpIyp
> > (
> > > zG=3DGPc*Q-
> > 3JpUVCEt%$@^72)|BPg3m_DKAjIP~$04Uaq`Md56Z+uDnWlrScUT&vNAl
> > > zly@pW-frXXRo>red7tt|l?U}xxnIBfNIV-
> > Oe0R#)GionSc|v*4QY&|qw<&K`K5w~|
> > > zd&-NI&sSbiY2_*9%akuw-
> > mUrUQr@HaJFL83<w5;a?$@s|63>nZ&)0a8YOhFnf%1hK
> > > zPl@t!<z>n{G@f?lRmv-suh4jwD?gyTQ~B`*8-K6z{wB-&lsBq8sGrLH`t6Ry(-
> > z^~
> > >
> > z8c&cv^*_j;%7gr=3D+|OS}#NL4jKd$ix{%d@J|0)msSGn(hcf?*#gx7mEAAx`KE%
> > *I9
> > > z9?|cQ@Wv9WAFN+yxxfB@{P#n?{l12I`n}=3Dsdn?~vd7}-
> > 0&PheMzG2euB6$y8dS=3DWS
> > > N>pLjLyT*z9^FM{_!IuC4
> > >
> > > literal 0
> > > HcmV?d00001
> > >
>
