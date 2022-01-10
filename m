Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5533C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Jan 2022 18:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 784AEC36AF6; Mon, 10 Jan 2022 18:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603EEC36AE3
	for <linux-firmware@kernel.org>; Mon, 10 Jan 2022 18:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641838879;
	bh=MYlJ5M+Mvt/a/BxBQCPsDMjzpOY+Jsnx3fqHAIE+21Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AM3A7DMil5xgWe/SwjtP7acTXlxyfJHIpGt8CR1vy0TwQwvaqN8GG65pBBsJvS2Zr
	 6FqPuVsK1OJ0s/K0GozyHK6zmuU+qfGby5b3FpuF3UmAnj8/6/ZnmLlZCwXwxeU+uh
	 tJ33MDvusQxMKmtmywtpo46vsRGWP/RpBPWLyhJwSLH3rjm4Qk3zEmtJBulV5c/LTw
	 gJ9POCqsDDs3Esd2lHbicPhod7VHmqGa/W9x9kQ98UtCa82igzzl4JrWh1xCa+jkpf
	 OL2MLxs9jcaWO//7t6JejnjrTpcAiI6pIS8sadp8bRqsEMphoWKms7mKjVIOSMb07T
	 3Q2DWSn8XXtuA==
Received: by mail-io1-f43.google.com with SMTP id s6so18818408ioj.0
        for <linux-firmware@kernel.org>; Mon, 10 Jan 2022 10:21:19 -0800 (PST)
X-Gm-Message-State: AOAM5334fxFVGXC11Z1UGI61vn7gugXSDs2+FOiIsG+Ec2VaTxc8SF4p
	VhG5jCft+1JkcxxtmQ8DSMahSHliSCgJ1wNpY5g=
X-Google-Smtp-Source: ABdhPJyek4EVcqljhd99vs9UfHkendXbIh0WchkCoQrP5ngj1ztoHI8xu+OWD3HRDQDIl7Bm3h5r4UW0RnI2uOM4kqI=
X-Received: by 2002:a6b:e508:: with SMTP id y8mr404490ioc.177.1641838878547;
 Mon, 10 Jan 2022 10:21:18 -0800 (PST)
MIME-Version: 1.0
References: <2aa6a2bb7efda2b9b322371211eff7a7d0aae706.camel@coelho.fi>
In-Reply-To: <2aa6a2bb7efda2b9b322371211eff7a7d0aae706.camel@coelho.fi>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Jan 2022 13:21:07 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7+uGhN+c2QBj41ieCPW1n6R8yd16ki9sB+Dx6ZVqUs9w@mail.gmail.com>
Message-ID: <CA+5PVA7+uGhN+c2QBj41ieCPW1n6R8yd16ki9sB+Dx6ZVqUs9w@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-01-10 v2
To: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com, 
	You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 12:36 PM Luca Coelho <luca@coelho.fi> wrote:
>
> Hi,
>
> This contains some new and updated firmwares for all our currently
> maintained FW binaries.
>
> In v2, I fixed the so/s0 issue in WHENCE.
>
> Please pull or let me know if there are any issues.
>
> --
> Cheers,
> Luca.
>
>
> The following changes since commit 182a186c570baab3968ca9116ee58b1875fb0168:
>
>   Merge branch 'for-upstream' of git://git.chelsio.net/pub/git/linux-firmware into main (2022-01-07 07:20:18 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-01-10-v2
>
> for you to fetch changes up to 23e0197e9e6fe9ca0d2ead3a3df3c41df97ad16b:
>
>   iwlwifi: add new FWs from core66-88 release (2022-01-10 19:30:31 +0200)
>
> ----------------------------------------------------------------
> Update and add iwlwifi firmware binaries for release Core66-88
>
> ----------------------------------------------------------------
> Luca Coelho (2):
>       iwlwifi: update 9000-family firmwares to core66-88
>       iwlwifi: add new FWs from core66-88 release

Thanks.  Pulled and pushed out.

josh

>
>  WHENCE                            |  44 ++++++++++++++++++++++++++++++++++++++++++--
>  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1519264 -> 1519544 bytes
>  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1490096 -> 1490376 bytes
>  iwlwifi-Qu-b0-hr-b0-68.ucode      | Bin 0 -> 1355836 bytes
>  iwlwifi-Qu-b0-jf-b0-68.ucode      | Bin 0 -> 1275268 bytes
>  iwlwifi-Qu-c0-hr-b0-68.ucode      | Bin 0 -> 1355852 bytes
>  iwlwifi-Qu-c0-jf-b0-68.ucode      | Bin 0 -> 1275284 bytes
>  iwlwifi-QuZ-a0-hr-b0-68.ucode     | Bin 0 -> 1355800 bytes
>  iwlwifi-QuZ-a0-jf-b0-68.ucode     | Bin 0 -> 1275264 bytes
>  iwlwifi-cc-a0-68.ucode            | Bin 0 -> 1314392 bytes
>  iwlwifi-so-a0-gf-a0-68.ucode      | Bin 0 -> 1533812 bytes
>  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41804 -> 41808 bytes
>  iwlwifi-so-a0-gf4-a0-68.ucode     | Bin 0 -> 1552216 bytes
>  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 21576 -> 21576 bytes
>  iwlwifi-so-a0-hr-b0-68.ucode      | Bin 0 -> 1429192 bytes
>  iwlwifi-so-a0-jf-b0-68.ucode      | Bin 0 -> 1378284 bytes
>  iwlwifi-ty-a0-gf-a0-68.ucode      | Bin 0 -> 1494304 bytes
>  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41612 -> 41588 bytes
>  18 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 iwlwifi-Qu-b0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-Qu-b0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-Qu-c0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-Qu-c0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-QuZ-a0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-QuZ-a0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-cc-a0-68.ucode
>  create mode 100644 iwlwifi-so-a0-gf-a0-68.ucode
>  create mode 100644 iwlwifi-so-a0-gf4-a0-68.ucode
>  create mode 100644 iwlwifi-so-a0-hr-b0-68.ucode
>  create mode 100644 iwlwifi-so-a0-jf-b0-68.ucode
>  create mode 100644 iwlwifi-ty-a0-gf-a0-68.ucode
>
