Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A65C021A9
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Feb 2025 18:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E9EFC4CEEB; Mon, 17 Feb 2025 18:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49363C4CEE8
	for <linux-firmware@kernel.org>; Mon, 17 Feb 2025 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739816853;
	bh=5nllMnpbF0mQo271pa0DHLdDBlFyyV8Mz+RbLKQI6Xg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZX7sMBDe3PQLNFtu/lzWhK9XUyrbq2m7LAH27sPkJSSl4gyUZ/zOCa3Wih4NcBtGy
	 q93EDq1glAfKB7G/u0zASNMsT4YyBseydYDV8rT4Qn3QFJjrXqd9Y214uZj790GQSL
	 IDphoxL4ggdf+3XQfzPJxGCXp9XaW89Zs1XV9aYwr+ToE1LaZOYzQSYwap88oehKDM
	 eFIkzpd+FnvYEt19rpq1QNvibscGYXtT8sl0eKUkmOUEr0y57xVL8YuOknMVp5dtRS
	 lvqABy/CZep4gkuhr2ubpUDH9t9meRORQqPcU88cO9tGlSmZO2RzT7od+zo+rZNK6f
	 qg+lfw6TDc9LA==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e479e529ebcso3448666276.3
        for <linux-firmware@kernel.org>; Mon, 17 Feb 2025 10:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTtgQxtm4Sopboyp0YCENZ6cD0Tuw7WwYY6cOmldCpJsuB1DhBN6DnQpZedYVygsZS4Q9MXBlYuZbSCgNVOw==@kernel.org
X-Gm-Message-State: AOJu0YyRAO8oUHrENslhtu3njwO+zrAmsk1qevi6Ikmc0Wp0OyMBmUzy
	ldeVPt/hbYTZNFA9CTOnMDKaWpB/21PsRIJSBokhVvLLbDLzwsun0KfQZ60f+VEjzeGPZfBtxFm
	yRBWMQbGwwhVxsp5XVgEX+SXkU/k=
X-Google-Smtp-Source: AGHT+IFFJqAJIbIvqHWJTahUl+d6hf5EvEgeJZJwnbo0ChjHzK2AB4Spl24pW/IgkQAaIuFFOBh6iE/3/P7QNYRMIwM=
X-Received: by 2002:a05:6902:11ca:b0:e5b:3de2:ce95 with SMTP id
 3f1490d57ef6-e5dc9039417mr7039887276.9.1739816852431; Mon, 17 Feb 2025
 10:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20250214063030.6396-1-baojun.xu@ti.com>
In-Reply-To: <20250214063030.6396-1-baojun.xu@ti.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Feb 2025 13:27:21 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7SWRhTMTMU6MRYWp7yK7fY7SKDjYo7FyGYERLQUwYcpg@mail.gmail.com>
X-Gm-Features: AWEUYZnuTGSn2OE7zqddaeoOxk_Yd-vCVkfthZqKstwX99OKsMYN1U6G3MV0ARI
Message-ID: <CA+5PVA7SWRhTMTMU6MRYWp7yK7fY7SKDjYo7FyGYERLQUwYcpg@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Change regbin firmwares for single device
To: Baojun Xu <baojun.xu@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: shenghao-ding@ti.com, linux-firmware@kernel.org, 13916275206@139.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/450

josh

On Fri, Feb 14, 2025 at 1:31=E2=80=AFAM Baojun Xu <baojun.xu@ti.com> wrote:
>
> Change regbin firmware for single device.
>
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  ti/tas2781/TXNW2781RCA0.bin | Bin 868 -> 812 bytes
>  ti/tas2781/TXNW2781RCA1.bin | Bin 868 -> 812 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/ti/tas2781/TXNW2781RCA0.bin b/ti/tas2781/TXNW2781RCA0.bin
> index 9718640b529e324bc5975d7d66bcfbdef8d4ad6e..49d64fb0912acc339f2b57399=
7898c31a89e28c5 100644
> GIT binary patch
> literal 812
> zcmZQzVAiQr6Ubs<U}Obi#`JXugcv~#1~^~_vT}g<3=3Dm&{i;f_Mfq|~4QLwI|SyE<+
> zZfbHyeo<;#YEf!la;k1|PJW325kbMkzyc0Y4xm~_Fl1n2U|?o+1M-o@qznwfb|oj~
> zWF{3QmSpDV5n(#25|CXtfI=3DByvl$uK7#R4DFfi~tFfi}}9U;KNz#!(tz$ktK=3DmZu9
> z7O?Xf!E6o*h)Ez9a>y`1#55Ry8X;^h4~RTSA6EoK9HbVPUyQ(hNvbSJEG~xVB$WjD
> W#So|ol>Rt?HnC&(3zGsp`~v_rY$nG5
>
> literal 868
> zcmZQzU`{#U%krFofsqx68Pj~{%w_~J7~p^z$m#*&J3xE`E;@o3Da8f4hGt2bCA!5q
> z`6UMA_?(H6g>eB;qXrN&GcW=3DnL(EJD76y9;1}-Te4;c2mKrt}~1_nN$5`G|NVqj!u
> z1aUZk7^DLz&&1?u6byAsYH~(?QEFOhQEFatDk&}lxn&8^%nBgp0-6epU%n$iI~~y6
> z!~$`X0FVZ{i&6Xp&`B%|EMWgLg4rArKqG(v<Tef&kds*$I5Zd>Kw=3D;^mj{RiWk*27
> zA^yPXx1`E~#NuLz7BWeot&EjGy(K`*33eAKDKmrp2@FTLKW{QHBnSY#uLlozeEuWB
> JUkq5{3;=3Du;DgFQe
>
> diff --git a/ti/tas2781/TXNW2781RCA1.bin b/ti/tas2781/TXNW2781RCA1.bin
> index f92631f8477b78cd8714e9941fa57d8346323df8..49d64fb0912acc339f2b57399=
7898c31a89e28c5 100644
> GIT binary patch
> literal 812
> zcmZQzVAiQr6Ubs<U}Obi#`JXugcv~#1~^~_vT}g<3=3Dm&{i;f_Mfq|~4QLwI|SyE<+
> zZfbHyeo<;#YEf!la;k1|PJW325kbMkzyc0Y4xm~_Fl1n2U|?o+1M-o@qznwfb|oj~
> zWF{3QmSpDV5n(#25|CXtfI=3DByvl$uK7#R4DFfi~tFfi}}9U;KNz#!(tz$ktK=3DmZu9
> z7O?Xf!E6o*h)Ez9a>y`1#55Ry8X;^h4~RTSA6EoK9HbVPUyQ(hNvbSJEG~xVB$WjD
> W#So|ol>Rt?HnC&(3zGsp`~v_rY$nG5
>
> literal 868
> zcmZQzU`}~`QE(3f10yRCGp6~@`OgSqFu(ybkaY)$dw}=3D`Tyz96JdJ{N4b74=3DOLS9{
> zGxCd4(^894^O93_i*xcz42TN{CI%M9B|xPWK+MI!$N&sez9S3_{0<BZF*6xh80>+<
> zT0n6Y1_oYW&<g-*F$V@l@e>R{oeV5sTNuG?4he{jj6l^KG7Jzg4F;e=3D5H^<wL>{D%
> zD*_@8QVUebz|6=3D8l;i+nkO)YODW$jo>NgU61F-=3D{g8T+@pau{#L(B#H2`C2k6EIzY
> z`~>t51IT)QAja;Nq{@QC;$omQ`2ge=3DPym$xF(<?=3Dz@*F!4s)Qtk;0rIK>+AJE4bV6
> Mg*7NFImi!V0F@^x`v3p{
>
> --
> 2.34.1
>
