Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8168DC6FD1D
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Apr 2023 12:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 669EDC43326; Tue,  4 Apr 2023 12:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B07C43322
	for <linux-firmware@kernel.org>; Tue,  4 Apr 2023 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680609864;
	bh=T9cXG11M6IzkHeYfq7a33edcElq8m2tq4UaWoSelxPs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sRhHSHsr3fGs4vBWfW+BDhntdL9Lo/7YXFKSbcsz1jCEwbRtjT1tbm43GBgrOENpF
	 g84Zppe9jaTpvprctWEMffHcEMjAXnPeIWsT1uEc1v2rXSaLp3nxGMYA47Lw9uQMvw
	 eHHfT6bNWxXVctt2xdk5jjhAJtYU/EkRcbA5Nbg7WamgV5dmmTAL1SqSkBKuoiLdha
	 V/P77+5za8CkKPIabKjLN25bbtJe8A4mcio9EtWOyqZfHn/3rDDhn2JKbq0obtr40M
	 z1i5kHgYwyoSYpPsJLUL/hlzIl0tN3NOdQF8+jGlc66zXzyXmTI+I7gHyqICZ2d3XP
	 bLYnJWeOyyteQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54184571389so609186677b3.4
        for <linux-firmware@kernel.org>; Tue, 04 Apr 2023 05:04:24 -0700 (PDT)
X-Gm-Message-State: AAQBX9fQ7YNc7PkUyhbIX3mpiuM8n05YJ4fndz69hZnJ1Oa+4E4Hkgca
	NxSPQojz/O55z4tyn0VKlZ687BDcL4DWJRuBbGs=
X-Google-Smtp-Source: AKy350ZRjP1qF8T4eK5C0PQsnQhQgO6Lj+gWmVIyeogDRD7bssLKsjm5pVST1NZQr7xNEY4H2dXgnYkD0Ti0JsGh5FQ=
X-Received: by 2002:a81:a901:0:b0:541:9063:8e9e with SMTP id
 g1-20020a81a901000000b0054190638e9emr1353228ywh.2.1680609863247; Tue, 04 Apr
 2023 05:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <1680518599-12748-1-git-send-email-gsamaiya@nvidia.com>
In-Reply-To: <1680518599-12748-1-git-send-email-gsamaiya@nvidia.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 4 Apr 2023 08:04:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA64XZHoBPdAG3dmTHTbX-ESMyinMOGtfQff1idcPE053w@mail.gmail.com>
Message-ID: <CA+5PVA64XZHoBPdAG3dmTHTbX-ESMyinMOGtfQff1idcPE053w@mail.gmail.com>
Subject: Re: [PATCH] nvidia: update Tu10x and Tu11x signed firmware to support
 newer Turing HW
To: Gourav Samaiya <gsamaiya@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bskeggs@redhat.com, kherbst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Mon, Apr 3, 2023 at 7:21=E2=80=AFAM Gourav Samaiya <gsamaiya@nvidia.com>=
 wrote:
>
> Signed-off-by: Gourav Samaiya <gsamaiya@nvidia.com>
> Tested-by: Karol Herbst <kherbst@redhat.com>
> ---
>  nvidia/tu102/sec2/desc.bin  | Bin 656 -> 656 bytes
>  nvidia/tu102/sec2/image.bin | Bin 60928 -> 61184 bytes
>  nvidia/tu102/sec2/sig.bin   | Bin 192 -> 192 bytes
>  nvidia/tu116/sec2/desc.bin  | Bin 656 -> 656 bytes
>  nvidia/tu116/sec2/image.bin | Bin 60928 -> 61184 bytes
>  nvidia/tu116/sec2/sig.bin   | Bin 192 -> 192 bytes
>  6 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/nvidia/tu102/sec2/desc.bin b/nvidia/tu102/sec2/desc.bin
> index 283b233fc9e920f7b069b9223d92b38b8b07ae58..df0d4aa8b5986d98697adc824=
5b6886b70d4dba1 100644
> GIT binary patch
> delta 97
> zcmbQhI)PQAhlzoK;XMNbGmt8){=3DgWXnxf#FSfpTNsbFYkWocz>q+n!VWUMgppw7e)
> lLCLp3WoRHp9w^{5vCfE7Mwo%Y(2IfL#>Ru^87De$008?J6mS3l
>
> delta 96
> zcmbQhI)PQahlzoK;T;15Gmu)=3DxPmdHG*!VRHCe&fP{F{;(7?(-!N|bSQeomj-H9QB
> kl5c>j(13+JP{4a)oe`&?Fav{{7X!nMjR(&&PITY^0Mw=3Dv%>V!Z
>
> diff --git a/nvidia/tu102/sec2/image.bin b/nvidia/tu102/sec2/image.bin
> index e6e43ae4a637a6d0b1c976a82f039e3d091002c1..740b3e6b7b3adeaa8c5124077=
b9ef7b40f8d58e6 100644
> GIT binary patch
> delta 2248
> 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
> MQVFMY9XZ$cFH$5+YybcN
>
> delta 2287
> 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
>
> diff --git a/nvidia/tu102/sec2/sig.bin b/nvidia/tu102/sec2/sig.bin
> index 07af70eba529b3b74b4e346bba5cce396773c368..17e214673377b1035575ebbb4=
fc39f77aeb31f4d 100644
> GIT binary patch
> literal 192
> zcmdm_l@Ytv;_~Xt!H*6_1x$VaJ6PCi>*RHkU*2U^teY0O$cO!;@G_OswrGyoOP_Qb
> zub#YO<L;;OpYBfVI`L8FszM(l0|NsHvqNcSC>uyI{D+ExXeKBI$%EJ|KnxP+g3=3D)U
> ZAUQ%{;~~SB%$v%u^BFD3?DuO(0ste?E=3D2$U
>
> literal 192
> zcmZSJd9=3DxvgLBr!Im)M|iHjd_mwpzVwv9#ms=3DeTT*^8ei)W1A%YSL1rhBy0|A13E%
> zbbqK}jINm}%2#Fk?mA1zVRl9a1_lsjhtf<?HjrZAf{KA?kT?i4LunQu4HAc8kbaOn
> XA+Yg~;Y;RC<=3D6R)7G(DOH6#H5mg^-M
>
> diff --git a/nvidia/tu116/sec2/desc.bin b/nvidia/tu116/sec2/desc.bin
> index 9f2a6e4cae49bbf0c5344a256e6535a765bfc06b..61d7d4cdee7836b55df4bbdf0=
0a5064d86cde9eb 100644
> GIT binary patch
> delta 97
> zcmbQhI)PQAhlzoK;XMNbGmt8){=3DgWXnxf#FSfpTNsbFYkWocz%s$gVbWUMgppw7e)
> lLCLp3WoRHp9w^{5vCfE7Mwo%Y(2IfL#>Ru^87De$008_16m$Rp
>
> delta 97
> zcmbQhI)PQAhlzoK;T;15Gmx^GzKStCHATTKHA%r#!O+6W&;*DSj0}tn6eb?jnHVA{
> j`39&A4W!5e1-vKL8F2~<Gcc%mF)-ZNc<?;qL<bH4(w7s}
>
> diff --git a/nvidia/tu116/sec2/image.bin b/nvidia/tu116/sec2/image.bin
> index a13e762e2c6b1a9284694b0a1431e8cbea8d5ecb..5efca79e8f2276802f96d4a51=
6c8532c6eb6f21a 100644
> GIT binary patch
> delta 1060
> zcmZuxT}TvB6h3!$OJ`=3D)(o$;+Ewdl3s7MHFuUe_?x<Z9L1w8}>NfAOl6{FA(xi1yh
> zhq0n2Sgh3|opET#+_X>vU-rd^Qt7Q;T0w1sHLLC1S^I-vxpThro$ovM%)PU1Q?9o6
> zuHG#r<cv{P@|6(5C@nP$Ng12;(Y!K0=3Dvn||g$EA<;8DuhR=3DNS%BQ%dh*(v(DpxqBi
> zFf_<F`bn<Z?b0U)$24WyIA5g_Z`2Q|aEB@_9XX!!!f>bVn#!~v5Gzr(zNT*#^6vnE
> zq#|Z$>z!&&hKlhSWr><iWZGD<KTcL+(TAQKqDmQJ{JZ6zHLC?>nk5fBUW2_=3D$<231
> zU+(9j?oIo<(P8jl5!uM54jw*%t`pzntI!Y!PEXi>;v~!qx+bkL0IF0;#5q<d*iZbC
> ziu5CP+(csBf}#KjoKZ!-Sq{+2$+1xF?rmwt>IBsNP4W%?b{*}(A<)zKRNF$1@iuWR
> z4<)o^^kXedB;X1-&3V>AJRM5Fa-M~FO2b+N{3Xq#lRU*kp0Z`EV}12`t-q?#<7#^1
> z86IF7>nEHT1+nk~nHPK=3D6;@S+Mg2D*W}B95T9P&(5_1TDqB)dp4hg2^F|91U*NC_t
> zKyR1J_T+X&zQ|GNirAjZw5|@1KVzMtNxO`v?&m<akJUjt+$us{wDWBN(36O(7xBFU
> zFvTn}lg`#bh2^WT_Oa$eC9URArfG@o)wk2CXg<&cs)iR;JJ5w=3DSmf<rJmP_Dr%`b}
> z;4Z0+Rc(u^v*})LQ_NOH0S{4%g=3Dtnj=3D(3Vi4>++YN(+R)0ha0SAx*5`-$yR8(}7F-
> zmf*q3g1*`}5*t^__rOdzMKLD{x>s+EjnG0K&y1(!l>S87RS9Y(DcnnxQ4i2ZY;8kL
> z&ILcjpF!8WE$8Y#=3Drwk(p}ZCE>6`ALEoT`TnM(@vKL2$1{ZlZ~<q*6g3SQ~SS%9_>
> z3_HMiqL7z_;5Ffw9nURS*Yv)BWxChlxxw6j4Ol_&DA~!HgI-*(2TO464sLeVVmaUo
> a(~JfjYN3X;6eSJPcs>LF3|g9QcK!s?_nx=3D_
>
> delta 1054
> zcmZuxO-NKx6h3!mNawv7EiEml7|YV^2O<(8@;X*pZ=3D9flR)Nr>MG=3DIpqT(skqGpqF
> z3!WA9g2~bt%y+xxGiRp4h}z7iMQON@YLg4g3C1j^bKht`(CVG<`_B2!J@20PI>y}{
> z@7)h-t4J%~Q1zV<!q=3D@6%Sn)p)zi|T29_BHRhPl-F!=3DN!+eFu*dXScqI6FqC%XJO1
> zz)dLQ4@rs9=3DeEX%Uz_>_Kh<E6KwN`d?5d$G8aYz@gnM!~gg&7GVm;2*G!Cpl{T%?1
> zT(5|3x*n2Zv=3DX0jHrZH1Civ1_X|fEHKHe`ThEm{7|Fk_{M98I2u<Y)8E3vnsc;xA5
> za+eIPK;GYj4#RtbB*5P9Inau(qd(M((2@ozk7oYFS(tHIrm~U)G#H8(=3DUA#^Kkr<w
> z_aS1(%}aPE1jFExis6-ql>nU_jzyccZO$upH(=3Df0qCDVl*BAG32=3DwHio7%`>*(QzY
> z(MfYL{nP}blW+l?=3D8|=3Dgq@$CtM6!_1nV5?}zND!<DJdCBDx+c^8`xXgzL1R`7xNQO
> z$pC50A9Z3ZNW^AI{na|Vq0Xk-6-az2Cc;+CA?*@~BoRrkNEV5tOQd`v<rlWfd)>F-
> zL61A*E9vR~rVc_+f5vy7HZ|kz7p&%{vX#d@kAc3bX@<+t85Fi}u=3D{N}(4&Y$^Y~^t
> z2;1*1q*Kkn+V)ko*QM%(jjakVhq{7wshv*MU>VTQSoL(iY74qZ3|)EG%z}=3D1sK_a)
> zER)7`8nZg)t4`*7d4yeL*e<-o!bB_!x@Rvg?84xzT)Rs&meK~u3Dy=3DqxBB}&FjSXS
> zQ9qJ+qi@^}Q?VRHPH|ZQYky*d`kB9_g4|^5TN;axYmn}To|%kVV$IRB>`cqXcHG66
> zeUXgn=3DO+1@bx|fi54mGHMwS|dXGF)f9s2^%5rwA?aGqEwQ=3D;&k$c3IIGbNU34g6bX
> z1sq)(eEqKhTN637syYnUdY3=3DC;}I*!qnOXE;FYj`7|hN-qF1x7NENAO<B>}54jzJ9
> cMRMbjwFN)IIOS|3pWA=3DB0Dl8*hp%-10%*9O$^ZZW
>
> diff --git a/nvidia/tu116/sec2/sig.bin b/nvidia/tu116/sec2/sig.bin
> index 93816a065a59e945405d1fb9e33854d45a9701f0..ebe4dfcb1ae2802ff06ede82c=
8fd9ee341ac5460 100644
> GIT binary patch
> literal 192
> zcmYduy*N2|^|NOsZTEDO)<kTOtld3Jx_yh&Hnvh>e$&{*0(-UJABCe<uR8TBCfv$x
> zzrNDd7YyE3=3Dgzt<5_!q-iGh)U0gTz9G!u{pu|eQJ5QF4FG)Nr8W`@!%KpG^@1*JiH
> ZKxznqjfV_hGH)us&S$hBv)`{F2>^u9Darr<
>
> literal 192
> zcmbPyuAj-h=3DFT;#@4MH|YkV$s_2$3mFU41X+&lDBJ^1>QX^QW@noRedF5Xx-<K!^|
> zM#Bi<#sCJ7Ur7P-`XvGTR1Y&UFff2HJCug8fm{YIs2GT5g0h*RGz*XhiNi2VKTrrS
> V*m%hBCG)28>wHEFGW-1+k^l^tDarr<
>
> --
> 1.9.1
>
