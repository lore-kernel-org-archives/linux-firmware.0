Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128BC433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Feb 2022 20:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D09A5C340EF; Thu, 24 Feb 2022 20:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91FAC340F1
	for <linux-firmware@kernel.org>; Thu, 24 Feb 2022 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645733745;
	bh=mq7FKjXrtFl/jILLUjZerLChfWH01PXebn6EbPg3/rM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZF9XEz0BtLsasgA+wraCByBV7LFR4GmzwlCHtp+EMPsQowjzw8BV0n4fepZNRG19+
	 JimwadDyb/ftzBzH3gLcxw1G/PKkXUyJ/LCx+zFqPLv3gQeUFMkGDT/OIXn2krdkJR
	 8XQKlql7sZFWGeZlNzIuPtn08j84JYNvTeTtoWwmfBwLpa2xYRiQed2pzd4Q0s+6Mu
	 zKsjWmI7AppxCwFWozBismCKWaXU79RIArarFpMF3OnqbZ+QmNdrMnOkYX3oVq/t3o
	 CMbCtJ2yWlfQMUjz/ImXQDHpbBUsEempQkxaz+hCHxHYMwCBdFnq1FejRIyIV2Lu6C
	 dJUViE4/+qoqw==
Received: by mail-io1-f42.google.com with SMTP id 195so4213945iou.0
        for <linux-firmware@kernel.org>; Thu, 24 Feb 2022 12:15:45 -0800 (PST)
X-Gm-Message-State: AOAM533+OdJbig6lrWF3iZc6klVBq8ecy6PBykf34K74kXDYvxHYf2qn
	JKCWBv1MlP/c8W/LK2XjOo1dU5162NPjbVrYUFE=
X-Google-Smtp-Source: ABdhPJylAVbh1HiLvFkXiXskoadaHTUEWRH+gVLxJ+Vu5fRfPdqvex0r5UTDSQQQf1WDlvHwSYOJnGdLvpshfKE8RV4=
X-Received: by 2002:a02:c850:0:b0:30e:54b4:d8de with SMTP id
 r16-20020a02c850000000b0030e54b4d8demr3343026jao.146.1645733744804; Thu, 24
 Feb 2022 12:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20220224100520.4785-1-kiran.k@intel.com>
In-Reply-To: <20220224100520.4785-1-kiran.k@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 24 Feb 2022 15:15:33 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6uWMP3w0mAZL2C2ct8dzz4sWTqkFSaTVTn52sd_0v-Rg@mail.gmail.com>
Message-ID: <CA+5PVA6uWMP3w0mAZL2C2ct8dzz4sWTqkFSaTVTn52sd_0v-Rg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] linux-firmware: Intel BT 7265: Fix Security Issues
To: Kiran K <kiran.k@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"

All 3 patches applied and pushed out.

josh

On Thu, Feb 24, 2022 at 4:58 AM Kiran K <kiran.k@intel.com> wrote:
>
> This is firmware patch for Intel Bluetooth 7265 (StP D1)
> StP D1 FW Patch Version: 0x43(67)
>
> This patch contains the following fixes on previous 0x42(66)
> - Security Issues
>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
>  WHENCE                                     |   2 +-
>  intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq | Bin 46817 -> 46893 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/WHENCE b/WHENCE
> index ae333729fb70..c07c50f226a0 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3818,7 +3818,7 @@ Version: BT_StonePeak_C0_REL_59_0001
>  File: intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
>  Version: BT_StonePeak_D0_REL_50_0002
>  File: intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
> -Version: BT_StonePeak_D1_REL_66_1167
> +Version: BT_StonePeak_D1_REL_67_1278
>  File: intel/ibt-11-5.ddc
>  Version: LnP/SfP_REL0522
>  File: intel/ibt-11-5.sfi
> diff --git a/intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq b/intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
> index 263296cdfefe84c803765ed399d0ded0bff46827..3b1831ef6eb365b1a238466659abd4b900881ad7 100644
> GIT binary patch
> delta 3999
> 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
> O+W#H>Gqdg;+y4O%vXYws
>
> delta 3926
> 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
> Wouo0!f;Aszk@h_DAEfIe>;D0jyo0&`
>
> --
> 2.17.1
>
