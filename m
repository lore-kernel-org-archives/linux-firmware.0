Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED31C02199
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Feb 2025 12:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA4F1C4CEE6; Fri,  7 Feb 2025 12:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E2DC4CEE2
	for <linux-firmware@kernel.org>; Fri,  7 Feb 2025 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738932036;
	bh=Ra3eFqLGF0PgXlxkAIXpH2S4BKRa4fZKxdfqRQS4+j8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uI1G6eL8goGnEOVn68Qp4m0LASQNwI0Bn34m2LfDECU1WEnwcJah4Yf0PyDxMCKce
	 E5WR1Lsn5N1NNaQMpmrpRAnvBPoiXugrigsMBPpGBTXTLNRSqX31crKAvJwfN0BeH2
	 9xx8A4b854fCfFQBwmiLb4hIZPAK67viRiGewa7jo3Ok8iBbU+4jJGfpz1UhbCqphi
	 Nuq5vFOT7484Svf3wNXmXomJdgcbal14U5hBXxEpKXwbDIdHL/ne5ehe0nATvs7PDE
	 a9Y6XkIOVS956BzkmFRVyErU62g3r8nHlqgOCqSzBf0LMqsJ5G8ZTqCPb7ubLKg+so
	 PDS2n30xjWc2w==
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e4419a47887so1554785276.0
        for <linux-firmware@kernel.org>; Fri, 07 Feb 2025 04:40:36 -0800 (PST)
X-Gm-Message-State: AOJu0Yxyt4BTa+W0D85zajwHJgvD30iaxcjolKry6jl/bll8oZPZjOSs
	0zdQIFCQgXDQrw+fqJ3XLaIg1Rphah8pIS9HtN6PLiLpTtTvo25TEBkonLuN7HvbfOyPXfYW7dN
	zSxMjehVY7wKkfuYka8l80vdFVRg=
X-Google-Smtp-Source: AGHT+IF9KOfANa8JxS4DhwkkBdevxT2cL+FymQlyhhWQZIVirClwv17vkgSe4MlMJgcYLhNiwTS2TKT5VLfMN4CpSqM=
X-Received: by 2002:a05:6902:98f:b0:e57:e500:16d with SMTP id
 3f1490d57ef6-e5b4629bdc6mr2660200276.39.1738932035789; Fri, 07 Feb 2025
 04:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20250207042916.362770-1-hildawu@realtek.com>
In-Reply-To: <20250207042916.362770-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Feb 2025 07:40:24 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6gz+6GOVcSRiiLP2kPdk+ZtuuTKuhMMzKSsMjzFGEH-g@mail.gmail.com>
X-Gm-Features: AWEUYZkxvQSyWxEIMUOPz-XPJsLP6VqM8xdN0khwC9fEccMAfUneUDnssC_HAoM
Message-ID: <CA+5PVA6gz+6GOVcSRiiLP2kPdk+ZtuuTKuhMMzKSsMjzFGEH-g@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8852B BT USB FW to 0x0474_842D
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, max.chou@realtek.com, alex_lu@realsil.com.cn, 
	mu_hua_chen@realtek.com, kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/443

josh

On Thu, Feb 6, 2025 at 11:29=E2=80=AFPM Hilda Wu <hildawu@realtek.com> wrot=
e:
>
> This firmware patch update for Realtek RTL8852B BT USB controller.
>
> Release Version: 0x0474_842D
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852bu_fw.bin | Bin 90213 -> 90621 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8852bu_fw.bin b/rtl_bt/rtl8852bu_fw.bin
> index e3b5106958860352abc66d34e2e10d33b00d60db..0842a2bf896b881ad2ddfa86f=
eee42a0b384ba45 100644
> GIT binary patch
> delta 6888
> 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
U
> z*BNH!tXBh3s`R17yeX{sJ$<?(u9GB|S}uc63MV*7!FO`lVA9ie9-X>6LgLldbI$J|
> z7Ml3AlOXg`%hzZT;!mN2+S=3D&EN5Sm`!CmPHk5_mwA^`(eI@Iw;1JqGny5mZRGLb7h
> zfO@H=3DL3arK4|K#P9(3N;v-ws9KCvEfGVftw_Zs(<Tl;Ou!J1oLR-?O5R=3DPvsP&L;w
> zvxz8?nK~zDr3dQ*bedy-;$+9?i7r+f8gEgRF-7BA)NR#FapAvEmRk1c(;Odl@QDh?
> zyN+E>ZfHphlQO#3+=3D#bquv7*lODz>lNA4osc!xg60f9VY^1`cXx2n0E2`seLY?H?%
> zk=3DeGD0lDQULpHvL6if@GV7bfWU9tn~7wH(=3DAtaVmFM|Z#jNEs`n(1c5gfF&wow2IP
> z-RAzMn@=3DQ@)i*ic%JMgKED?X!k*s-^thSlDY0iw@^BqO*xDGCHs&lx0zN5?EbCAN3
> z&YW7rDTa<~$&v3RkzTfWHT$mFtGeIPCY4knm2Ij`Rc-2oO2@mFe~+72AKGlZ9dh=3DS
> z8e<!m8(J13m85qSthuTA<7M+Q%S`?A$Y@03%P7<1U#>Q8CX>Pv70ukD8Fkf`8O&F!
> zGO?jkQ}|*aiaymw`vHGgywO355BNjOy|GSIw&tvT=3DJD#jlbLv~BHr%k8R)35`E|t>
> zD9&<=3Dbammi#sJ@F&m1}Px~hzBO-0>4Qd5TGr@_8e>ohf%Y!!9S)))_;&}+(4Ty!_d
> zAKymzyx?BrHl8Ss<Z|}~@$>_n1)Bi`=3DfD<x#puqC(3yj9XU8k?-gY@^2zh$KJAHBU
> z$LENh5L^pjM>o5kAH!q51#%ZB;6ni6>ey!s_V7QlLq(V4$Ye(-J385MjAM1f5TfhP
> zj@0P?XlVrC$&+9c)4NnfW56%FDh;TZBqyhn89L3ehbP171T7r^`ZeG!+vW0fk|h+j
> z>*Sm1Bu7}=3D9wJX4PgZC%cH{Yo?bS07PgOg|j;|Zz$tS|jJCX8^3^Ec#FZsI+@^SY^
> zoA;C$70uW!Z<s*(OOgG?OE2%#i1%{B=3DBv+iJ8i7ue9_pI;$+uo(wB6Xza33x_UP4@
> z_~Nn?OvD$1y;m=3DfNg>aN#F}_dcWhdEd36f8Z^Nc$#dr{F0ajt}Lb^NuiRG8aMlLrm
> z@U_+wpeH%G?a>DET3n~vya1e1%T-Ia#IB;CW?^bZ4VyaqEJ5<PKo8ERw6Y2Gv87YT
> z<Er7)1*TS>N0)}DNHF&Li4`(Gh9nHyr6<MO!VWW6=3D+h@U4cqyAE^q3O*hvPaxVRlx
> zI#h<PBEcd|?N`%Jo<4?z_j+I7r`F^Rtt9zbHx6`Y4ZZ6)tLkjXdE-yP-;9t;#*nzt
> z3C!Q3%{rli34PQNZWzcodFypK6=3DLBF>6&c8)X$l7kSoM}6jProD)A|-)AjPDF~rC#
> zcgwNQk(dGO1bj4M&g^~owTMlcT|IcZ_6I`u|APb`@AY*P$Sg8pwj|Q?c%Mfv#hbiL
> zq(|_PpyX}L!4i=3Ds;A2EApciNlF2J8sd?mrFCvq&l6@kCshEFGd#^uBy&&VY4y+2)t
> zIfU;3X3R~E$kolhCeYfe0_FglIrSSe$ua>q7JU}E`8@k5aX+Wq{LnKYr`67}7IwII
> z!_9%u4?YugTG3o`N402;Pm7B~Fp|JqyUC%YAvorPaDzK`kUbv)FJ@Ueh0GLgcJlJv
> tDP$nKN3WbhKIHkmpVbeTMi$`H{AykOKjxAOK6paX^4IZ~r<+K`{{sf|V;2Ab
>
> delta 6508
> zcmZ8m3w#q*x}P&MX{RM=3DGofz^O-rc|K%PZFkkALVKtWl!YL#_DsiAEGn)LzKWpj#;
> zmE~c}fCGqY0<8$NYe@=3D~dqG-+RbIQai1N@&Vc{yFXaY$Jy0!N|;exyNm+ySv`R03_
> z@0|0^In$m`HCJ0TX>;c0&COrpDCd73OI{AL49hSK0gRJ&r;S*}YR-5cU!`MZX;qZ`
> z+cmL+c~5kQd9&NkcmaF!#;zDkk5~KCn*rW;|JMvU#bfp{cDZxSNT+nZ+AnwjUdw$-
> z<?-P0-hZbU@R$hi9%b>TdjR0wqkx;#UJCdr;I{^5yGWJAuitI=3Dfo?6Xq&M?g>CHmG
> zv{oulS^ID@uZClrZ~e_yzqQx#vcy!>T8UpP*RCB!`pTcKeWI@_5%ZO>zPCH0iY?|f
> zQny|n{`QP9g2&h`zzf>@6yId*<~^N$^I2mz<0*`^o&JKeOn15$An$s6s?Zuv_X0d}
> zK}~5af(#2DfLC_aJe1>c;h}Wi6;1(_;uXG9=3D>*UT5$^v}a-b%|=3D?ZI+HWxG(MA|a6
> zymw)wEl0~hOHJ4>6opd&cuWO_2jj6wdx*k1z$2aiS4xjzM|DK4qwoW0Hv8xWidc=3D1
> z$1KmQGW)YYG9K%(MaLwV2Eeog!+>8=3DFdi8Ksj9jzh4pYHg|%wt%O#iucxRqfDfxEo
> z=3D%=3DOgW|#xOh#BSpzoHVrQ!|40K81M0`UvkA3N8@6ps11pXhF_hH*^H!H6m>3e6-BK
> zPgIB6midf<!JiGaFt7{o(0AARvQ1gLn6OrUd)<W81WRj3?;%yvq1KQZ_yg9~5aul;
> z$d}d)C5)_-2Ra!q4XJk37Jyi!5YiHgq~$)vR7#-~ulcwXN@xan=3D>@ele=3D3FacUx$v
> z<B;G70LmCBc1I&|HpE!mW`;cg{HU$kQz>NWX_#H0lHM}3NDR!XkM2?`Pmkq+7EdCH
> zf^iG_+K84A(GtARfx~;Pkye#vngL#U*7`JOqHWEmMwkaQ(+ftJ2mFfCgQt)1exbDB
> zX(POQRFci*U)$#LuWn<4Yu!vJeGgMbZ&tT4u;=3D<(Z2@~!N)JkZmvY`GwV<>SrnY(Q
> zStcax0Ynr9JP{&K_~tjxGa=3DsN^3R0?13or{e+iu0+vxeuV1ftG{O^<=3DJOqD!TqP5j
> z)mBwG!^Z?>w{-@YW`Jj+D$ID8K+)OOV0tsaL(jJcQ#=3D4D{VSCKo@yLzgp${9$aZ4s
> z1O=3D!Gh@%FN_-2=3D16=3D5L4M1=3D2AE|>;@_Y0L<S=3D6>-dU2b!a(Y`;Tf7oitE+JZF}=
|Q$
> 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
{
> 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
> NmXHL(JkIyL@_)NWxU>KO
>
> --
> 2.34.1
>
