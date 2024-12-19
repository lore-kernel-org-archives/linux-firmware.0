Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED026E7718B
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Dec 2024 13:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8448C4CEDE; Thu, 19 Dec 2024 13:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A9EC4CED7
	for <linux-firmware@kernel.org>; Thu, 19 Dec 2024 13:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734613626;
	bh=XCND71V7nirIAGKnQi1jUveAp5m/oyMdWFhU5Ew80Do=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=L/BGX7NU/CMmi21N4sUJCFQGG6EebEOoK6wBcNYjMgXf7KzneRa/aLqJJwgE/X8Bi
	 p7PbyrdUwXCHvhp9FvCwEX9hGNR3gl03DHJ9l9uBbFby8FazzBIqTD3WCFp6Y7YV23
	 eaBlyYxlXoQKEWW1h3INAFX8e6671+MSN91bzww7rz3ZbCp0GqqmS4NFbn48z+Ouxr
	 NCNBLVObDSBbiRalocR0o4QARAZ7mlIBERc8DsFVg03e0fnwEjpcvWfZeLwZoLxZG6
	 mhbd08Gspm/lB7eZpY/WtX7w4hcoqm9wcfNIr/z2QEFCD0o0S2zNmfel4vxNsaYYAo
	 xV0bsfoMgsUTA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef66a7ac14so18788957b3.0
        for <linux-firmware@kernel.org>; Thu, 19 Dec 2024 05:07:06 -0800 (PST)
X-Gm-Message-State: AOJu0YyaokhC7lhErWxvO/UqnPCz4jHns5gdQEM3wIEoGLdXhXoHZ6ms
	T7Zi/neal08BDjEXeYWuckomz+FonFrcPp+pHvnFoggkp2IRDeHawa0hZg3YmFpXCXzpwC3RgZv
	0G9EOytR75pHKfW0TYySxgcvoA0Q=
X-Google-Smtp-Source: AGHT+IFPYVXcxaBcizJ5n69B/IkHqbltXb2qoncahOVrrGYdozmpsfEcHc3U58DAFE1EOHQqKDneY6VqZzDwcRBkzxk=
X-Received: by 2002:a05:690c:4b93:b0:6f0:5fc:7d with SMTP id
 00721157ae682-6f3e2acb88dmr22089287b3.11.1734613625874; Thu, 19 Dec 2024
 05:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20241219084852.8737-1-hayeswang@realtek.com>
In-Reply-To: <20241219084852.8737-1-hayeswang@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 19 Dec 2024 08:06:54 -0500
X-Gmail-Original-Message-ID: <CA+5PVA68tj1wkU6zV1G222Wf+XYq6R6+md-xDB=G9C008AGGxg@mail.gmail.com>
Message-ID: <CA+5PVA68tj1wkU6zV1G222Wf+XYq6R6+md-xDB=G9C008AGGxg@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware rtl8125bp-2
To: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hkallweit1@gmail.com, nic_swsd@realtek.com, 
	ChunHao Lin <hau@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 3:49=E2=80=AFAM Hayes Wang <hayeswang@realtek.com> =
wrote:
>
> From: ChunHao Lin <hau@realtek.com>
>
> This adds firmware rtl8125bp-2 for rtl8125bp rev.b.
>
> Signed-off-by: ChunHao Lin <hau@realtek.com>
> ---
>  WHENCE                 |   3 +++
>  rtl_nic/rtl8125bp-2.fw | Bin 0 -> 752 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100755 rtl_nic/rtl8125bp-2.fw
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
> new file mode 100755

This fails pre-check because it has the executable bit set.  Can you
please resubmit with the file mode being 664?

josh

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
