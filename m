Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46900C369C2
	for <linux-firmware@archiver.kernel.org>; Sat,  3 May 2025 19:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02AE2C4CEEF; Sat,  3 May 2025 19:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D707EC4CEE3
	for <linux-firmware@kernel.org>; Sat,  3 May 2025 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746301030;
	bh=kUV6OlBhQJF+vIC4YDBq5BwJO58MdD3BmL7A6XuymxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UkQEVGEVg81dj94Sp1tS4AQDPf+MSespwFnjzUgJnQszyQCK/56tQk10DKMkFGmzK
	 dpYkl2Y/DmjmKK4WgU/QQq1c4MJ3DIEa4DldKCrcngD7cvqpHFiFgB6AA3TEZIzZFV
	 HWjo3JP+ql6wCHRxv2JnYaSYZwh1yQKQFeCVGUsT+ZQxa3Ahrsi9Ba5y+xjWuKZ2NH
	 PcDZwJGNQresPTiVjh25Y3JEM4m98ampeFIfK9CsrO8SCPX0or2xtnU8w+GNaLGLPS
	 M6wQJgqXt0AAhKXGQKWkPN4afD+WqNeFoW06rpC3s1YdSDOgO6jrzzzsLaYaivjsN5
	 UEDUDwaDP2D6w==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7081165a238so22954847b3.1
        for <linux-firmware@kernel.org>; Sat, 03 May 2025 12:37:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YxK6Yw4xSGFG5ye0G64kdViVXo9yytsBAU5ZGbUEMzD8AFSZF3k
	QOL3M1gWsa4qD6ODmIUQ3acir9n0d8Uag6gqyhVo05YQx7lfDTMfkKav/+v5PKMwCDUeB3ilRRv
	Hn4tRodBZL13MAII070Sv2bShbs8=
X-Google-Smtp-Source: AGHT+IGIbD22HQxPm317GOhqWxniem2GYjSyKXNmpPnoMpygbM0DO64DJNdoAancecECthbh8GmFEgUlgKhnqJ5cUO4=
X-Received: by 2002:a05:690c:4986:b0:708:1d15:e013 with SMTP id
 00721157ae682-708eaec4b5amr24968767b3.7.1746301030112; Sat, 03 May 2025
 12:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250502150913.1886723-1-quic_akhilpo@quicinc.com>
In-Reply-To: <20250502150913.1886723-1-quic_akhilpo@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 3 May 2025 15:36:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4=PGrsjPpCtAh=Sh2TUsEfAB7cBrWOkVaGYECUNy659A@mail.gmail.com>
X-Gm-Features: ATxdqUE0ROPeaz2r7vRMjoYWm82rndtys4eoQGt3yAmadEwPCJIJFAeTKZFQICA
Message-ID: <CA+5PVA4=PGrsjPpCtAh=Sh2TUsEfAB7cBrWOkVaGYECUNy659A@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add link for SM8350 GPU firmware
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:09=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> Create a symlink between qcom/qcm6490/a660_zap.mbn and
> qcom/sm8350/a660_zap.mbn.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/535

josh

> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index 6f715d8a905d..d17b2c41174d 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6468,6 +6468,7 @@ File: qcom/a660_gmu.bin
>  File: qcom/a660_sqe.fw
>  File: qcom/qcm6490/a660_zap.mbn
>  Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
> +Link: qcom/sm8350/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
>  File: qcom/a702_sqe.fw
>  File: qcom/leia_pfp_470.fw
>  File: qcom/leia_pm4_470.fw
> --
> 2.48.1
>
