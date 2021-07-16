Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2235FC07E95
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Jul 2021 12:00:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F1FAC613F7; Fri, 16 Jul 2021 12:00:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBF8A613E9
	for <linux-firmware@kernel.org>; Fri, 16 Jul 2021 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626436803;
	bh=G8ieZcAwTmjlDwqcuAIMgzBDJGZHRvROS4yx4y51+eU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZBRVxqvLpkn+Cgg0hKK7J4zCm4wyR3wWFosqo4VDdsSoQ0mDLFaomUKTribe/nN02
	 0lmF4uWKVgPyqFw3aE2HCgGb6cVrxV5tFHZ7VW5Jkl2nj886aDYZhbYp+Z9bt5ZZAh
	 hF4I5Uz/zYRXxmRSR65N36mVltxyhdG0ZyF2uvRzOsB4jPn3p/cNX0xZi9u7maIcf/
	 iVGKsuQY6XWQ5m2gLEdrEw+95XjZWtZivnBpMGgprqOzhN0+j8D37ZEMoAF/DqjMDZ
	 TFMF7RdMHfJEg5LiegV4iJlqxmx2b5zzguhaMXYAd6h5+ALlcFeQbCcWzosXkrD06H
	 XwKIpUNnkII9w==
Received: by mail-il1-f178.google.com with SMTP id w1so8000262ilg.10
        for <linux-firmware@kernel.org>; Fri, 16 Jul 2021 05:00:03 -0700 (PDT)
X-Gm-Message-State: AOAM530m1iblqx7Cod8oKTd+LLrNlUTcBhU+JC9zUJegkco5gRIGtJk0
	vJ5mb0bvsEH82QV6Z0DpnT25UzJDqRzS1wF/gQw=
X-Google-Smtp-Source: ABdhPJwjdXqcJVu1PpKhhxvAvxbDu2xCVzOUfGapK3YimhQ5pwFfiPDsiyxioF1t94ry9f/Dqrt+fvdFbTr8OZTaVEQ=
X-Received: by 2002:a92:cb0f:: with SMTP id s15mr6570550ilo.11.1626436803317;
 Fri, 16 Jul 2021 05:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR04MB453855B0D6C41923BCB0922EFC1C9@DB7PR04MB4538.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB453855B0D6C41923BCB0922EFC1C9@DB7PR04MB4538.eurprd04.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Jul 2021 07:59:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com>
Message-ID: <CA+5PVA5on7+CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg@mail.gmail.com>
Subject: Re: pull-request mwifiex-firmware 2021-07-05
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Rakesh Parmar <rakesh.parmar@nxp.com>, 
	Cathy Luo <xiaohua.luo@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 5, 2021 at 3:40 AM Sharvari Harisangam
<sharvari.harisangam@nxp.com> wrote:
>
> The following changes since commit 2a0a062e79b5fe9007e57c0fcd285e683e22373e:
>
>   linux-firmware: update NXP SDSD-8997 firmware image (2020-08-03 06:51:36 +0530)
>
> are available in the git repository at:
>
>   https://github.com/NXP/mwifiex-firmware.git
>
> for you to fetch changes up to 312ca028298317d2babb54080c056408cdb9448b:
>
>   linux-firmware: update NXP 8897/8997 firmware images (2021-07-05 05:42:09 -0700)
>
> ----------------------------------------------------------------
> Sharvari Harisangam (1):
>       linux-firmware: update NXP 8897/8997 firmware images

I cherry-picked that commit and pushed it out.

That NXP tree seems to have some divergent history from the main
linux-firmware repo, so PRs get conflicts in things like the WHENCE
file.  I have no idea what is going on there, but if you could base
your PRs on the main linux-firmware repo in the future that would be
helpful.

josh

>
>  mrvl/pcieusb8997_combo_v4.bin | Bin 634228 -> 638992 bytes
>  mrvl/sd8897_uapsta.bin        | Bin 701072 -> 717068 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
> ~
