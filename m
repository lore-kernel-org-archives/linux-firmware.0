Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82153E7717D
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Dec 2024 12:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52DC8C4CEDE; Wed, 11 Dec 2024 12:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C671C4CEDD
	for <linux-firmware@kernel.org>; Wed, 11 Dec 2024 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733921530;
	bh=XVAF6MWKZUBUUWcC7BtHCO3K1CFIQkWsN3MhkcSzt+A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fxeQBimZSr8WKFNwjw49mfTXS+KeS3BJfftpEA5bL3yW0j42/e/hLbj+LI754fuws
	 6EByZr8dFnLMyl3lVTU2LOZRsZyMzQP4jEYF9oSxLuU6FitCKX+m2aP9K+02rpypdM
	 MldLCZEnP233X5LI6lz0D/Xq7Hql/iK2c2oLdBU3d7vhphigS9M6k/7J/fEWAIcje4
	 OSq8ctSSybIK+vMg2GIY3TaeZwxfntmNkQB0f9oCKsr34hV0GQkAXZQNbHbhYU6igQ
	 Rj9q0/VyH6KqhDHRTwdC7ySFzZQFnXJcwnQqXoJPnn6cGLmo8ovWiWAmLR5pLwH13j
	 JDMDlpTgKpNjw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ef7f8acc33so59684357b3.1
        for <linux-firmware@kernel.org>; Wed, 11 Dec 2024 04:52:10 -0800 (PST)
X-Gm-Message-State: AOJu0YyrB1S7fTgdX2riltLQ4mZ9LXv8BdXp+5HdZERHrjfsKZek4AJP
	+acwlcJSHqzYVv0CyioGa/j2+ES5PZgZYcFb2yiWROW48APowfoPgFIa6UaQgpGf9Db5NbVvEJe
	SWQo+jn+3Y43+C0KspjfYTdl6U7U=
X-Google-Smtp-Source: AGHT+IEPm51GX0ttBECHzXuDnvRefgZUTnZxe4D4UaneE2wTrpr4N8WgrBhlBNFe5db3H9Rz+itaqr/HFSo/eWi5lRU=
X-Received: by 2002:a05:690c:f16:b0:6f0:21d6:4494 with SMTP id
 00721157ae682-6f147fd02f7mr23431687b3.7.1733921529358; Wed, 11 Dec 2024
 04:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20241211024729.3029-1-hau@realtek.com>
In-Reply-To: <20241211024729.3029-1-hau@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 11 Dec 2024 07:51:58 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6ffUCgjqUZqDFrt05AMmQaSUjGj-SXsdRxZMt71LOB+g@mail.gmail.com>
Message-ID: <CA+5PVA6ffUCgjqUZqDFrt05AMmQaSUjGj-SXsdRxZMt71LOB+g@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware rtl8125d-2
To: ChunHao Lin <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hkallweit1@gmail.com, nic_swsd@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/387

josh

On Tue, Dec 10, 2024 at 9:47=E2=80=AFPM ChunHao Lin <hau@realtek.com> wrote=
:
>
> This adds firmware rtl8125d-2 for rtl8125d rev.b.
>
> Signed-off-by: ChunHao Lin <hau@realtek.com>
> ---
>  WHENCE                |   3 +++
>  rtl_nic/rtl8125d-2.fw | Bin 0 -> 6800 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100755 rtl_nic/rtl8125d-2.fw
>
> diff --git a/WHENCE b/WHENCE
> index ca566e56..bd35ae6b 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3556,6 +3556,9 @@ Version: 0.0.2
>  File: rtl_nic/rtl8125d-1.fw
>  Version: 0.0.7
>
> +File: rtl_nic/rtl8125d-2.fw
> +Version: 0.0.4
> +
>  File: rtl_nic/rtl8126a-2.fw
>  Version: 0.0.2
>
> diff --git a/rtl_nic/rtl8125d-2.fw b/rtl_nic/rtl8125d-2.fw
> new file mode 100755
> index 0000000000000000000000000000000000000000..00232e7d52145721415dad41c=
393fdfe55a09600
> GIT binary patch
> literal 6800
> zcmbVQe{5A(9Y62&(Y}?+yTFll9nw2MTBg!R!L`F_FO02qi=3Dml|)NZ4Fw5$+83bM5b
> zfinhe$AC62rrq{Oi*qYFM!SUBPLh=3D@Mv2Y^Oq4~V&X~nS;~+66EX>r;_nptZz1);h
> zU_1Go&-wm1-yi4RdtQ}NYUi%4Rm&^B-14Q0#`LoEvX$=3Dgit^>@@`{y^$-g#?L%B+I
> z2Ab~9O;0V`=3Dx)n2yP5B{xNVzvyW5(dbf4I=3Db6b06=3DO(u;v#WWt+q}JHlUuQ3RmI(_
> zR;*M<UlLz2rM!1iB}S<-j3h=3DrMghhw3<qNlhQ^qOQG`*9F&|?AhKsQfV=3D=3D}OlcUrJ
> zO63}p^{2c8GsUli|FZv|HCe9OuqX5!<-vic;)5+p^(r+ZeP4cwS!Cv#Sd})*#(+v2
> z@zIMoL^f}5F8paTho}XMv~djL1MVZfO+5FsUH?@4y*5XGp-lpqb5xtyMQ!f)w28lN
> z*K)y^eqNh9;j;+yJx$vD5%N1OYg7CHbb+#dbt7!gXtM$H9hhG(KwKCx_>H}%O##-s
> zGIqT!VKGf~fC@S@pqqkCGKu}+_wtXmSp$qm{JPWh>qh)0LVmvpzln%n?*@MB7_S%c
> z8xQ%N2fxXPUvnM5BlOoxG!ehCkYA~fLVcvq4fAZB-)OZxT7cS~*@V6{Yx6N{EVU2U
> z^O`=3DOhuQvMKdFP%`7S}&NNs&Psn=3D9?Qr88vn@>Bboo^@gn95G-=3DFn~y?W8uoo#Z=3D=
}
> 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
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
