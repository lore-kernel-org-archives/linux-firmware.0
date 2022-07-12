Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD01C43334
	for <linux-firmware@archiver.kernel.org>; Tue, 12 Jul 2022 11:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7672C341CD; Tue, 12 Jul 2022 11:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C224FC341CB
	for <linux-firmware@kernel.org>; Tue, 12 Jul 2022 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657625571;
	bh=RkbBOghJL1TsOiYx+iK7b2TbeY2PR1PfOLd6qhz3t5s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fkgLpBXHZ/PEM4MBGhpS1AWDn7xF/cgZmZ1gL19x+GkgMKkG9kW7I+3Oqk10qMf1C
	 k7xCyFLDzPboSo1kdJd1I3nwVfXHIQDd7OmgnFzFATkPLY39OmN0M3mGL/ihSehyLF
	 jomw1iWzb/PP4kIYY9GoEm4+QHUsppgS0nGzzVYpiJW2Trk2XFp4WYShbaxY8poL/V
	 1RFODb6bcKEzAhLqW/EulGQlj8uetjXd0fPkM/gkYoZ/UnaThvqUGfzE1a03B1BET7
	 mTqGgzINXHaQ+c9ve0yGD+7kkJT9X8F3eIqOFfO1YyEPdnoDMR/QOmsPx+8sTOPmPq
	 KsSFpxeMjzLVg==
Received: by mail-io1-f53.google.com with SMTP id z81so7573002iof.0
        for <linux-firmware@kernel.org>; Tue, 12 Jul 2022 04:32:51 -0700 (PDT)
X-Gm-Message-State: AJIora/TG/hl7ENer6iucfaiz0s6ouHXkJ+12AWEby7Tk8ObgRAHlOnD
	ptfLDbNqN3t0KIKnxLju2hJH9lj2bZRfVvR8Vf4=
X-Google-Smtp-Source: AGRyM1vZ8dpiaJlbldTQdj4Wo1azvtZXjv/IIqyDsNCuA1qXhgqAMr9LzJlgyGIs1XJmEuwlgB38gxxkwVy8fKytFkU=
X-Received: by 2002:a05:6638:218d:b0:33f:5821:f84 with SMTP id
 s13-20020a056638218d00b0033f58210f84mr5688903jaj.303.1657625570915; Tue, 12
 Jul 2022 04:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220709043338.GA316680@0c7a33013940>
In-Reply-To: <20220709043338.GA316680@0c7a33013940>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 12 Jul 2022 07:32:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6qHdBvq8nX1TN8mfO0kgb0EbzR2ABwAUWfG2Y1BvHJBQ@mail.gmail.com>
Message-ID: <CA+5PVA6qHdBvq8nX1TN8mfO0kgb0EbzR2ABwAUWfG2Y1BvHJBQ@mail.gmail.com>
Subject: Re: [PATCH] Correct WHENCE entry for AW-CM256SM firmware
To: Rudi Heitbaum <rudi@heitbaum.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 9, 2022 at 12:33 AM Rudi Heitbaum <rudi@heitbaum.com> wrote:
>
> The check_whence script doesn't fail, but installation of the firmware
> is not successful because the link is reversed.
>
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>

Thanks, but this is already fixed via:

commit dfa29317dd78f3a18f37ef8063efe9d2659e6387 (HEAD -> main, origin/main)
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Fri Jul 8 11:09:51 2022 -0500

    WHENCE: Correct dangling symlinks

    The symlink direction was wrong for some brcm firmware.

    Fixes: f8a2651a ("Link some devices that ship with the AW-CM256SM")
    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
    Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
    Signed-off-by: Josh Boyer <jwboyer@kernel.org>

josh

> ---
>  WHENCE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 14f3472..545fcd7 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2820,10 +2820,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
>  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
> -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
> -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
> -Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
> +Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> --
> 2.25.1
>
