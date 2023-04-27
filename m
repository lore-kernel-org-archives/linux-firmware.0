Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DB8C77B73
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Apr 2023 13:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 828CAC4339B; Thu, 27 Apr 2023 13:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1E0C433EF
	for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682601516;
	bh=psa1a+dUi2OJCzz5EoouYm8yP/c24WRKcCKZIP/1cgg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gWM4JCzrJl+wzQpT2/eiSr/E8KLFRAl/jvT/100YrK7zxcFT2UszI5kRa+EBVBnEF
	 mGQKz311BuYWqovw+KrvV/x/+ikKBVE65InL1BJnrXDGg/5vpQHBrrQnMeOhTdHOUY
	 sj+S1U7zlsW8J83tKgSy71I3OYJM8DsQQMY0wjNXzKe516cGYCYCjOgJ1qKtInLvtR
	 1lcCW/vPpjPF2nPmFUNQyy6/KieFFgr10+15ozKKh92ji4i/ff5dAPklKrulpIiluW
	 mCmKbQnNSVmfobWy2RI1a9fNOKUKeFCm7nkSYsua7jfTCuEz7YqmjnkhA+FnfLPAp6
	 ZFVT2gjzispTg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-54f8d59a8a9so103073787b3.0
        for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 06:18:36 -0700 (PDT)
X-Gm-Message-State: AC+VfDxzZzNg5Mvf3N27e5v4bVfWKgViAeh9WYqU9tZ9Ps13WiBaM1PA
	53COFC6M9+qj1O2BUlDl/HcXTLhxK0tRseyM22M=
X-Google-Smtp-Source: ACHHUZ7vtS5K9KgVD4kTGmZxwPmxRKZrzf2+zzCGWyrnyFjFEoa1X2qE3CKr1Wzk6czyqbVDBR6QAmLK3XQuV0kKN78=
X-Received: by 2002:a0d:cbd0:0:b0:533:7e8a:a333 with SMTP id
 n199-20020a0dcbd0000000b005337e8aa333mr1327313ywd.12.1682601515379; Thu, 27
 Apr 2023 06:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230419105800.1250191-1-pbrobinson@gmail.com>
In-Reply-To: <20230419105800.1250191-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 27 Apr 2023 09:18:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4xa6Ag+83Qk-n5TboVrreAmRczgQqMf=X6UQcXHTrvJg@mail.gmail.com>
Message-ID: <CA+5PVA4xa6Ag+83Qk-n5TboVrreAmRczgQqMf=X6UQcXHTrvJg@mail.gmail.com>
Subject: Re: [PATCH] drop matrox and r128 firmware
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 6:58=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> The matrox and r128 drivers were marked legacy 7 years ago, and put
> behind an appropriate Kconfig option at that time. They've been
> dropped from the upstream kernel as part of the 6.3 kernel release.
>
> The firmwares are no longer referenced in the upstream kernel so can be
> removed. The upstream commits were:
> 96ed7db55bef ("drm: Remove the obsolete driver-mga")
> 28483b8666bf ("drm: Remove the obsolete driver-r128")
>
> They of course still live on in git and older linux-firmware releases.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

The drivers are still available in older LTS kernels, right?  If so, I
think we need to keep them active.  Otherwise new linux-firmware
distributions won't work on any existing LTS kernel installation that
has those drivers enabled.

josh

> ---
>  WHENCE              |  63 --------------------------------------------
>  matrox/g200_warp.fw | Bin 11214 -> 0 bytes
>  matrox/g400_warp.fw | Bin 16790 -> 0 bytes
>  r128/r128_cce.bin   | Bin 2048 -> 0 bytes
>  4 files changed, 63 deletions(-)
>  delete mode 100644 matrox/g200_warp.fw
>  delete mode 100644 matrox/g400_warp.fw
>  delete mode 100644 r128/r128_cce.bin
>
> diff --git a/WHENCE b/WHENCE
> index 033cbc93..d48646ec 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1563,69 +1563,6 @@ Licence: Redistributable. See LICENCE.atheros_firm=
ware for details
>
>  ------------------------------------------------------------------------=
--
>
> -Driver: mga - Matrox G200/G400/G550
> -
> -File: matrox/g200_warp.fw
> -File: matrox/g400_warp.fw
> -
> -Licence:
> -
> -Copyright 1999 Matrox Graphics Inc.
> -All Rights Reserved.
> -
> -Permission is hereby granted, free of charge, to any person obtaining a
> -copy of this software and associated documentation files (the "Software"=
),
> -to deal in the Software without restriction, including without limitatio=
n
> -the rights to use, copy, modify, merge, publish, distribute, sublicense,
> -and/or sell copies of the Software, and to permit persons to whom the
> -Software is furnished to do so, subject to the following conditions:
> -
> -The above copyright notice and this permission notice shall be included
> -in all copies or substantial portions of the Software.
> -
> -THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
> -OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> -FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> -MATROX GRAPHICS INC., OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
> -DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> -OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
> -OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> -
> -Found in hex form in kernel source.
> -
> -------------------------------------------------------------------------=
--
> -
> -Driver: r128 - ATI Rage 128
> -
> -File: r128/r128_cce.bin
> -
> -Licence:
> -
> -Copyright 2000 Advanced Micro Devices, Inc.
> -
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the =
next
> - * paragraph) shall be included in all copies or substantial portions of=
 the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR=
 OTHER
> - * DEALINGS IN THE SOFTWARE.
> -
> -Found in decimal form in kernel source.
> -
> -------------------------------------------------------------------------=
--
> -
>  Driver: radeon - ATI Radeon
>
>  File: radeon/R100_cp.bin
> diff --git a/matrox/g200_warp.fw b/matrox/g200_warp.fw
> deleted file mode 100644
> index 2c7f7fec396622ba946146721295e804fcceec65..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 11214
> zcmeI2-*3}K9Kbyhw*@I`_Rxm@NPHbhF!|BANlL@orb$=3DYW@ChGtSQ<Mh_TTD8d}T5
> zerUq{+F+a1J!}GrAMJht4~txtQguR6T!f|~HPU!uZ+6Q|uIfYo1NJ>PF2P&b)|ITC
> z9Le(ea(6!4cb|Oj8&ecT8OA7{%KokG!XOTZf17>Ci<p#W?ypa^+<z{0!f?*;jA5<e
> zZbY1Y)<DUT$w($T8O_{-<M?De!y8P763C|}#mv2^IQuz+@E0uzN17tZXj3$4nlxof
> zCQC9uN20fwxkx776i-qYc-+eu&)A@BStOdWMB=3DI1h;uCP>R`5vvvA!HDEVf%Gu0g4
> zk+Quon03Dd`Mql)*V0?h-Q-eSGk58HVu1AX@cxO}3sX1g6kW^t#KEi|wxf_2ZVD%T
> z2b~=3D1^B<&Swy(PP)bw7yY-X&PmAHB&g*i%|oZjDSZ+#{0X?-!x)pAm>HYlyPY{k~H
> zt=3DJWfrzn}}3kJgi$AtwOW0NdCgx!o=3Ds`Mi~WGZ<OHjSAab6mzd7tFYLgq^TmMQ5ie
> zSwO7QAt0wH1ek!-ZfloVj!&Z?pYE`ANZZ}prI<S=3Dbp^U4wv3gK1xblOLW1j~4ZLaQ
> z+_Z~p8MmbJpW9$h+D?v<hy<2Cf0UA)rg9NsQvS>7Z)kR$O)}$U3w5p^7&t`Avm%?c
> z*b&Y8_+;1_PE|u6ksl>dA0>}Q<F_2%p=3D<?0xE|F@&8S%_LuHZ$StQ4=3Dj?AX0bIcLu
> zQ;nTFQlXu2zvYutR$-TN-yPg0uCu8#>FT{b<rdp+)3!j`Xmh7M?c3A#_O3Lt9O?Ik
> z_TbQtE~wYYS^MJye(N4gx9uD@wrv}(5Qnk>vF(l@`Vrcf7*N`kjp%f!8?#WCMwEQU
> z+Kn$Z`Xz)~1+KMgfDa{b3$(-Wdoat|gcH^TraKa8V@E7~mhZ+@o2n!Z>ORlKa5d+U
> z);?&Y$@v>wVwjwtl7B*;wrwNsYEiJa?Hr-x365*$gsQ4efs*Yg=3D#Jq}`2-F^8!X&m
> z=3D;sjhcgTY-noh#GeREYAYiifPDL8MiBPaxr6Go8{`4EjhgL(|yBQx|9uJ<76XM;6{
> z8+=3DY^+eeXSu~BRjH#0HJFb=3D7qsv&K5n5B?8hFhS2Fir#)eGU0t4bnz4j2k|t%)>SO
> zx*7AhYvH-x=3DsB;91Hb4Onl{F8Vhh4-#ok#Lj7>`;!Z&D2E@u(m(CANET?muso!E?^
> ztw;0wD;S|?9-^6wiSdj&&j(;0l0MpD?}7Pfg!xI1>vQu^`Hu5&3-j;V>&iGF`A^zT
> zKU}A@b2l<E+d2g!2+o^dej+T+lH=3Do=3De1I2x=3D+6AI%aSfI=3DZ@z%SF@GRR=3D&(<>t=
5rP
> z`&CHp9n!g{b8nS#&sbAAO4rnluHl^u|BS#`uUPYomVajQ`vUxED18IC>qR6@ct|)%
> z(u9L#Pgq+ItR-o6+tLujUawhDkIB9+$6b;pY$YruTqP_ejIG}A=3DREzOKs-IB;pzJt
> zZmK-()#T6f)R3hL%)d|m1JBcWr+eON^E~M9C^+c??>xwkip91+@QwjjCTwbH-VMAf
> zUX*u?gOM(SYv!}<3V3F5G4mMjE-jIF9~FpqA8L4aOv5#mcSkk(^Sq;b@~?kc(go({
> zsTJUlM|6MG{c)B0qn4|Sc_dl?6W%I5DSMFWlL~KvvkGr>?x^}DaZ2Ks#4A<a62|6x
> zrOI2?E0@Y!!nZ=3DK*ZVZQeNV$xmACI|@^icumxZyp`~1YV3e4dzRse^O=3D^WNMyvjK2
> zsi_>Y*VGNcdVUzz^TX<Tp7<?|j3|FS59@oe9O9=3DWu4&DAF4P@?Hbz>!;Jd&DKdkEs
> ze^ov!aZZO-x(2aUv!h({K-~B`Fxcz03U)~UP#(jjV$JQV;JJk5N;`5t`VrRtrRGwh
> zNUXV|a^`y|Qv`Jg%fAJ8{tntvzbh(w+?xlN=3D*@=3D<#PLHKj=3D!VfwaW3gHTgM?E3p&x
> z+Mnvaz#Q*i0UZBW=3DeW*so#P6})j01`d9M2WJl9JR@pr;@!ga!TrCs>lfXJ|%&v!K*
> zta6_4J>T0^zN_9&82C@(!94}y`~eN;-_r10<@`QPzRvll|Gt6Fc|8uj>f+E($=3D8h#
> z--dT7M*j`x34{NV^AN+)a{e;JXYx5u-p{!LzY$)uS5P@m+E!yT|3l6%{vKF?{rl?`
> z;NQIN-@1S6{=3DKaJt;X3^KCAy<F6QHEd?%FqA5-!3(ns+Z;^&0fR*3CfhS&~?v6FaA
> pzNZ%#TNQp^3B@q+^ri6o%>sG)K8>gE)%dvT>AN-g^PWyozXRrbAR7Px
>
> diff --git a/matrox/g400_warp.fw b/matrox/g400_warp.fw
> deleted file mode 100644
> index 57f1088e06fbc6bc64bc74b97edc32999a42eff1..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 16790
> 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
=3D
> zI_H}c!k+LJ9CQje=3DyBknQ@}xwuRN^y#AkERDX6cH8*tD#aL`!;4$1%r%@}adN#LNz
> zZsVZUp#)bInv>RR`&YJbl4}glOY4z^V!n+m6zgncp_msS3q@Xv+!R^q<zX(*!rBY4
> z?rC7F&z=3DQ-3T*Y_Q;ft;FZI&o@(@it6R8~Y6`HtXGdcT&mZR34X^+ul3H4hibJQB(
> zs7=3D67?Xy|27C5RE7;0B0E7nj=3D5=3DX72tP)49NjFIxwKi>)IBHE(k)zgHiyXBEIBHV~
> zN38*l+9YvQhGqC!*Q~@*k*8(`Gki@5&QHMkb8vnb&QHSm^LKWB?|QGqaq;}2^&yGl
> zs^|Bzy}2QF2so~Meuxe6NjAyPx#sxrV3_}t;vWfDf}bCp=3Dg%AaN6IY!IKM;w@x(6m
> z57d_t2d=3D-xflK}5>v!NM&U)m)Q^0|b0|%al`aEsGsbv4acwWkZi+)qmN5}r0Qm4xt
> zxac!l4qT2t^OK6t@PE+x%vocfNtop`-`OFb`SvdL8I0#z4i5fMlBcL#pkCqQYJVU7
> zK|i<kn$}-{fkWQ1t^T6z8<eBJyjt-W{`We6dCJ&dShM`)!VdY%$zAF%s-H+cQ!)o2
> z*FkFkQ}q?BhtO;8)?fbj9Kba6HPTzm0m%7HHO!D=3D{e<UlJqMu4a}>Uaa{%S&LoZf*
> zh<{J#LyN{flr_tTp4lNEI{i8IA+`UapMwA|QRX1zyryIh0`e8Cv*bAl*^it`9R+pP
> zXU{<>`{g+ZxldCKGZ5f2|HmA}G|WMyVGd#%<{;9y<{+^5D$ges>#nWmAc}n-El;(<
> z?7Q0c(e`J{(Wib?@hN^q=3DTlD_`_y%_eCpB;`P8|JPZj6241B83WS=3DU|ft30c_M>i_
> z15ut=3Do&%BlOj16j%x&NtS8)!c=3Dx<uzQu8p(8%yUvihfq^{iWwCe#S5B{Om-<&puZi
> z>|W(v<>O}t++6EtN?&U`{H)yjSrtDE->IL8X60u;+@bvJyOsQG%lvGhZ1S_a^E0SN
> vrG8m)4#+r9E6xEG`)1lY6Z5yyIUr5`R_1-PA5`);{#UyEEn}F!QPh6{tY|q@
>
> diff --git a/r128/r128_cce.bin b/r128/r128_cce.bin
> deleted file mode 100644
> index 18b00b7b6555e063893b54326ae0e58be02a5c06..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>
> literal 2048
> zcmeH{%W4!+5Qgh?kDb<xv5AZ!Xu{wG3<kr1s2SmOnz(VLBDnCf2=3DNZy!DJ;4L1dyR
> z@d*?c;ss<DE<_{tM!bW#@Urs}glydD|JOMk27ClPQ2q5^r@Bs6_4J5{B+W5gK~V;{
> zy$K_4!6X|Us*#gZy}QZLk^QI1>6wcuIX8D@maHvYU#YCsG`@D@(UT5sq&-Y&B=3Djuh
> zUdLpxb+X<Ac1wwJX_-JO15id}fcs$MyJP=3DXunb%0^_LFK`ukwrriv?;kuBF0QAW8O
> zHV8BErwZ##`jZ5ZP^3y?74>R;IM@2~-*9t<NNXd=3DJS6K}1>)S{A!@`Q^*rYMGNO8M
> z6VEg2<=3DacuKU!pY_2#i{)In6?bL`7$sT`pn`HDQF&?TwH+tnZY`l9@|`ZKZW@6tMr
> zbP4_FOBeGVf^j~~L*0fk|Fp7rKe7`N{=3DnsriunhHzvcE9U;WZJ9iK!}mtCsG9tM+U
> z-Tnjv{JwUOm=3DF2)xngJF@0hdYJdNxb1~l(pu*k<ap36SyH?qvXpG2PvP{%&?i#_K!
> zIOp|w5c9AXz|MJ0x&3h-i2UOl9Mf4(HVl8t_dp)^baRvRgx4oMPk~q|zZb-7A4NaV
> z*2RZ0gCf`&jSF%>OjNh5hyAgB_H!1Ls*L4;5tEZWuuHHqzN^b1e}~VVj+-DJv<m>w
> zqaRCkD5WOu;V(4-%p=3DNqR`H!meNz7qjO4!Vw$^EcUztc(Z!@{7cST>)_yCP_8XrC1
> zdcJdUjrY_^_>|Jfyn2oQ-@*Ta&p&V1azCqDd}GRPjd$&I_I(?E^sO6aqH14wt#g=3Dg
> z{dVqi4(#zRjQJUFG8aef<`ideqrN+Y{_gI9N#f?g@BKb3lnhs;9nia_3r67H%VUuB
> zJ|OX4UV~*=3D8;0fQYVwB=3D-2Y7a_|V5AS=3D#dcXD+Uf4>FGL6VI(V0Ai&F9rb+NCX_~^
> UjPqmN><>%Nb+`Yo|MUd@0D=3DF4-v9sr
>
> --
> 2.40.0
>
