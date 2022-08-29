Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF937ECAAD5
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Aug 2022 11:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86081C43470; Mon, 29 Aug 2022 11:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BF7C433D7
	for <linux-firmware@kernel.org>; Mon, 29 Aug 2022 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661773620;
	bh=qPR6kY8P1Myf4tVUWJRbQSNSevgMZAHBc2yHAWZJoq8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=g1Ww+wp7/IFs84CtqmpvQDmG41O2BPiahkelCnoSBvT0FiiHXTCHjuNsoUuNe6UV3
	 QLCdN8cHRDcnUCNCBGJEHefjn9dDMrmyRDZYhiJTDpi0bvjw0VkkUadDxDWweyYxJ6
	 TstMKViGGQlSskav5fLhZVfPGs+KkhjQ2dO0i4HjweNar56MaVL3WTW31oEVLHCUt6
	 7PCBHSOCx7FHZikqbVdYyN32Ex38lqAer1oWjNTNwkd8bM2hAQ/OcBJ37SoIACq5AY
	 KZFO7SbWN+hiTA6agWra5nQ/NavUeC1O64AAkLlEKnxQLjrodPPD/EW/jx1/rEVST1
	 GWhzrmkhN0ubA==
Received: by mail-io1-f41.google.com with SMTP id q81so6279161iod.9
        for <linux-firmware@kernel.org>; Mon, 29 Aug 2022 04:47:00 -0700 (PDT)
X-Gm-Message-State: ACgBeo2LzJV3IEtDHk9LVjLWNxJXns66g2uZEwOiyiXHvRPqtwzC872v
	pgJwoDSKLnOtZL7KYFFSPwz0YYmojmjvTg3VOHI=
X-Google-Smtp-Source: AA6agR7ioo8S8kED0FExjat9wjWmmW52Zp1fettg/C47Vks8/xF+JiUUqJ4c4YkCLCDrio0Q6rCKXX3L1ih3kYYtQtc=
X-Received: by 2002:a05:6602:13c8:b0:68a:db5d:269d with SMTP id
 o8-20020a05660213c800b0068adb5d269dmr7903708iov.209.1661773619567; Mon, 29
 Aug 2022 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com> <573792ba92de237d23a9a1c99cb45d5ccdff5067.camel@mediatek.com>
In-Reply-To: <573792ba92de237d23a9a1c99cb45d5ccdff5067.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 29 Aug 2022 07:46:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4rdvoAqaC2GpmR=bv7KmNXvP+58UW1hzN2KJDsNiRiPA@mail.gmail.com>
Message-ID: <CA+5PVA4rdvoAqaC2GpmR=bv7KmNXvP+58UW1hzN2KJDsNiRiPA@mail.gmail.com>
Subject: Re: [PULL linux-firmware] Clean up mediatek WHENCE licence terms
To: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	allen-kh.cheng@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 10:22 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request cleans up the WHENCE for MediaTek firmwares.
>
> Please let me know if there are any problems.
>
> Best regards,
> TingHan
>
> ---
>
> The following changes since commit 8413c63c7a539a912be8851ce941eea32dcd1786:
>
>   Merge branch 'lenovo-thinkpad-x13s' of https://github.com/mrhpearson/linux-firmware (2022-08-15
> 09:02:17 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20220816

Pulled and pushed out.  Thanks!

josh

>
> for you to fetch changes up to a1c4b15986c07cdad873a72b1e130ea1fb02c5fa:
>
>   mediatek: reference the LICENCE file for MediaTek firmwares (2022-08-16 10:13:16 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: reference the LICENCE file for MediaTek firmwares
>
>  WHENCE | 42 ++++++------------------------------------
>  1 file changed, 6 insertions(+), 36 deletions(-)
>
