Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A5E77188
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Dec 2024 12:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E36ECC4CED4; Fri, 20 Dec 2024 12:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD577C4CED6
	for <linux-firmware@kernel.org>; Fri, 20 Dec 2024 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734697285;
	bh=jiXkxV5bpivYoD7OrzfLFGxI4y9pyWC3aDWFLKH5Jwc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gd2PxCTdt7BZXFz+qNERCPjQZkG3srg6JnOK2GC2pBc/WTrJcCEAWLRVvkDzYIfhw
	 OC3cCWMZmXshNjCijeBnIsn72XdRZdz1O+XFEWNT6LwxnYFpFfu0K9BFTl1bam1AY8
	 prnkEdEpN9rRwuCaNvbxvNLiuhgrkjQNrUYXijxhycGcRiDfs16gSC3VL4HOtu8Z6v
	 8cUe68JOn7G7QA3P+BcLhb+RifAeVoiA8rPhF9kuN+LVM0uFzzEZWfhqVZfQ+hoZjZ
	 IbPMYq9+Raqx9hPOoesj4OrlQQ8PxKJoW/lEDHqekYGKkeAgHHj9Iip0KL4OKlHVNR
	 mViTTkMPSSxPg==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e39779a268bso1617732276.1
        for <linux-firmware@kernel.org>; Fri, 20 Dec 2024 04:21:25 -0800 (PST)
X-Gm-Message-State: AOJu0YzbeADlBZuG02EmbGN+SKBxeXfVoO9TK7GhvRX6ejMQkUS2wCxJ
	9hU36pjy/RGlNMKZLwNswoXB4qAdE34i+7AHFr7UAWZMRxGgkB7morAI+XNi9OD9C/A6dYr7dvr
	v9mE2CIRPDUrXsizNUbl71j+nnmU=
X-Google-Smtp-Source: AGHT+IFkB84+u6JnDAh5s4eZ9s44HaE2uVw2RW5zD5VTO8WP7/42AX9ZXZPCGnEDqgYvwc6eSHXFsUstSQYsU2SGPZM=
X-Received: by 2002:a05:6902:268a:b0:e3a:7b9:ba65 with SMTP id
 3f1490d57ef6-e538d0a0fcbmr2067232276.22.1734697284978; Fri, 20 Dec 2024
 04:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20241220012748.10723-437-nic_swsd@realtek.com>
In-Reply-To: <20241220012748.10723-437-nic_swsd@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Dec 2024 07:21:13 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7uLuttfG1Rx1uWtptSSbv_+X_fT0Sy690ynAdA5a=e6A@mail.gmail.com>
Message-ID: <CA+5PVA7uLuttfG1Rx1uWtptSSbv_+X_fT0Sy690ynAdA5a=e6A@mail.gmail.com>
Subject: Re: [PATCH v2] rtl_nic: add firmware rtl8125bp-2
To: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hkallweit1@gmail.com, nic_swsd@realtek.com, 
	ChunHao Lin <hau@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/393

josh

On Thu, Dec 19, 2024 at 8:28=E2=80=AFPM Hayes Wang <hayeswang@realtek.com> =
wrote:
>
> From: ChunHao Lin <hau@realtek.com>
>
> This adds firmware rtl8125bp-2 for rtl8125bp rev.b.
>
> Signed-off-by: ChunHao Lin <hau@realtek.com>
> ---
> v2:
> - update file mode from 100755 to 100644
> ---
>  WHENCE                 |   3 +++
>  rtl_nic/rtl8125bp-2.fw | Bin 0 -> 752 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 rtl_nic/rtl8125bp-2.fw
>
> diff --git a/WHENCE b/WHENCE
> index 075c276a..9410990f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3562,6 +3562,9 @@ Version: 0.0.4
>  File: rtl_nic/rtl8126a-2.fw
>  Version: 0.0.2
>
> +File: rtl_nic/rtl8125bp-2.fw
> +Version: 0.0.4
> +
>  File: rtl_nic/rtl8126a-3.fw
>  Version: 0.0.5
>
> diff --git a/rtl_nic/rtl8125bp-2.fw b/rtl_nic/rtl8125bp-2.fw
> new file mode 100644
> index 0000000000000000000000000000000000000000..26f892d0580480dac1099b565=
76e0099b5ccbc50
> GIT binary patch
> literal 752
> zcmYk)ZAg<*7{>A2$C|R%TsmZ!xYIC^s5z&}7?O_~Vp1U@A|mEqlo@JcGkYQ8A|paV
> zLL#DBNJvCPjF7Mw#FmVRh>D1ah=3DYVgM65paxvRd^1Aq7(o}2r8IU*v7iP1o<e|I>(
> z%YVq{^?B=3D6t-q!=3DP~)%XPkwQBjTQZyREeQUZ&;0mA}TZ<Rq@yfH5NIlhDQ=3D($3lrA
> z6%S2BVk&YZI;8ymU|k?s=3DaY?pcIAnfnIbnts#zhkG8?lq2P<YyR?1wgjFqzrrkICS
> zvMS_@Xb}s*eGV<C(+1k~26Si(4(LL3YAd?54c*#~9_>J{E=3DHerqF<L{K)W!g%MjM(
> zi0TSh7P;HuL20fM?rat8W;Kd)J210tCziK+AtgQ(<oqy`^>Aey_&)&SM-b`uMyRPh
> zkVO+lWea!gMSiXgEy;FxraB<${V31};YoI)CDjF$?1q`@f#mnHK3LNIFrE%T9t|Sa
> z9EM(xqI_i-TQV_N&BL(fMp2X*r{laofraD*Y?(=3D(kMsVMy#Ewb>NI34FrPXDBYPII
> zd=3D9g%=3DecVdYwH)dZwAB77x8Ou7RJgY$kJsrI<MgMzN?&{<NS53HqG;VgXaaFZ=3D%n<
> zMc=3D0HK;$l+rti^<FrM6pJXoS1a^GX_Tc%eyli|!Nou!}A&*>NROZpZ4hJH)Gqu<jX
> z=3D#TU#TGMOvXL_CfLVrcW$Tzq)eTQMo!L#`%{=3DOYp(AZpv=3D~gR(P8%{!cJ!JKxc|N>
> TF<Y%}RG<WTd`BiN|9!s!`Va;X
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
