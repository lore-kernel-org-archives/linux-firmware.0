Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E6FC7EE22
	for <linux-firmware@archiver.kernel.org>; Wed,  3 May 2023 13:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3081DC433B0; Wed,  3 May 2023 13:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D27C433A8
	for <linux-firmware@kernel.org>; Wed,  3 May 2023 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683119442;
	bh=faUdAE5LO3MvT8h0wIx9b4xKqXY/CM3+qE0Z+Fq3+d8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=rJ28DsNi/bkAnMLyovKFUfgMYXOVZN3iV3OAILoLxayuOw8wmwAr9yUPnqUxNMp7c
	 orkodnjoDvPb3R3bnK4qnqMz7eprmz+hKiovNOlKy8lHYo/9V09Nw+E5DzWpYiQK+V
	 9i5TfxiJqMLEpT3rLHWKrWoybkzr3qYAAhnDY+aMlI3T7yYNYf/3F4imbR9+LAnoYk
	 bo/9V9LEZzFIoQUQbqE5upmCtlDFWJHecJ3qHeveC6Go2v9OhtQidHQ7oWjPt8320z
	 inZqFzF+ZrCHC8fHYGDAsgJl9sBloOUL+jboVAafHwBgA6QxasSqwwXQQ7IuDg3jS4
	 Q4QU4j/PSOrOw==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9ef06cb784so1516125276.0
        for <linux-firmware@kernel.org>; Wed, 03 May 2023 06:10:41 -0700 (PDT)
X-Gm-Message-State: AC+VfDyGjcRe1e06klRcoWWf7DNx2/NgPzCYOOf5qZHkMGn2o93Btde1
	2jQAL9Ufr6LnVgswJPOleMJxDCvNueoCPUTpioY=
X-Google-Smtp-Source: ACHHUZ4XmUXorl1OYLSzt4sAK92lmyCFDaJ/jBjkcVx4nIHyJKMb566CzNbKXPwAl/U9SGmKO/4SlB9kVPupXSFATNc=
X-Received: by 2002:a25:b38a:0:b0:b99:f435:3f09 with SMTP id
 m10-20020a25b38a000000b00b99f4353f09mr18665053ybj.29.1683119440642; Wed, 03
 May 2023 06:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230502095915.9421-1-hildawu@realtek.com>
In-Reply-To: <20230502095915.9421-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 3 May 2023 09:10:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA40OHOAZJEfd3AoVANeKECQ5ZQ3XJbq4kr9yCRbBQ5gKw@mail.gmail.com>
Message-ID: <CA+5PVA40OHOAZJEfd3AoVANeKECQ5ZQ3XJbq4kr9yCRbBQ5gKw@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8761B BT USB firmware to 0xDFC6_D922
To: hildawu@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry.Finger@lwfinger.net, max.chou@realtek.com, 
	alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, hsinyu_chang@realtek.com, 
	kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, May 2, 2023 at 5:59=E2=80=AFAM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8761B BT USB controller.
>
> Release Version: 0xDFC6_D922
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8761bu_fw.bin | Bin 42088 -> 44484 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8761bu_fw.bin b/rtl_bt/rtl8761bu_fw.bin
> index d042bb1971800ea1526dcbfc782ae350be3a53fd..1dc433ef281d4b76317b18c97=
07e087dbc170bc5 100644
> GIT binary patch
> delta 11436
> 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
> GV5A5bg1z$q
>
> delta 9039
> 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
l>WHW8z
> zK=3D5#je=3D`x&XFvo?WHW8zK=3D5#je=3D`!(XFvr@WHW8zK=3D5#je=3D`%)XFvu^WHW8z=
K=3D5#j
> ze=3D`)*XFvx_WHW8ze?ahXi+?i}(`P^kOJp-`;z00li+?i~(`P^lOJp-`;z00li+?j0
> z(`P^mOJp-`;z00li+?j1(`P^nOJp-`;z00li+?j2(`P^oOJp-?;z00FieEAs(x9?H
> z>J&&&P+#{KVK4xYXIKRQZlAJ1>P~NvXHRXNvOwwzZnl%ElNWs}Es3&Vq6lhi>K7um
> zmji2^XF#6>(}lAI)2NdN(nK;z<Ob8g@IZ<IYzWed^#GG^eSZV0^#GIceJum3^#YS2
> zejx!&lS6((89B2C(go84Y^wDgZiDj*Z#J?(>iTW9l{}N5ew#83vIWux&;o4A^&4)3
> z^A~RkvOwzkZ4$CT>a~=3D%lR(=3D6YO$BFk*|;d?^$C6E)swg2a|4pDh*)<5r6`-1F|6K
> zVA{EprGFzU0c&gP0B(w9MzUtg!NSSH%EIHM!op+9=3D)yy?b;@?ibjoaJY2-qp0Bcs0
> z>3>ImEVd)gDQ5w0Ebb>~0xl`GG_EMMG|dh+0ckAmCuadJHmxMKHqHt*0ckAm1tuOb
> z31z5fCuagBAF(y59<?>iglP=3DvgmDF70ci<ksAm|lslfs!9xwtZ7PjWD6}INi155vI
> z%<If&{!YT{5w@ja0c(P1Z0v)^N;D3)Z0sPDiGVL6Jh&2oWVaH4W26JJAn<X*Am{*U
> zWVaH40<#0MAn0J)Q3I3eiZTLBxU(LM!T|yl2eaagVgUja2eU?wasdJq2a~#w8UhvU
> zlh%(W0!+A*{*S@}Ot_Q6kirTS2N8f+RuX_rxRZ{N;sQ*#vvQI?0UAuW5`g@y2Y~59
> z27q1Y0Dufx5`eMl5P%d1lgg7O3sD0RfVd12fCc{$v-^|r0RoJ;lkSyb28_58fLZgi
> zR+f?h1FiNDv+I{30e_wO5P$#?5`by<5P<X$5`fYD5P<jv5`fA05P+}+5`eY!5P+Zs
> z5`by_5P+-&5`dNb5P&=3De5`fk95P(Dm5`by^5P&EK5`cyE5P&oW5`cO35P&2G5`ew=3D
> z5P%2<5`Y=3D^5P(Pq5`fSJ5`eA!5P&KC5P<Ra5P&iD5P-M^5)6Rt{1AZr1rmS}`Vf<s
> znJE!!YktZlv?jBF@L<}I+B|CxlhK)b67&lZfKUh#fFKJIfOrfMfB+1WUYcM51e3p-
> z9Rd^wv)-B-0t12i5R?0yH3QN65VJF#%>e-ylL4Pe0RWRrpG^W32a}qgMgpY(v*Mpp
> z0Rj{Uvo@iw0|Eg8v*x722b1JBAd}3joDc{AumA!AN14Rl_Ds=3DVsR@%2H$aoTtq6h+
> B{4xLl
>
> --
> 2.17.1
>
