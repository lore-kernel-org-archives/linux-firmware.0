Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAF6C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Oct 2021 11:21:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9A5B460FBF; Mon, 25 Oct 2021 11:21:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84F2A60F46
	for <linux-firmware@kernel.org>; Mon, 25 Oct 2021 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635160890;
	bh=Vclk7prH2MCudIewstFfKqfGkmnX18ToFr7zg2xPmN4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bTYHp+7vI5HsDtw8ejA8p33iyCgyTunSssso+yxuokhUGjc+qnjZWXvUBdEdzDlfP
	 030eu783bq5utuud2g2JLfNuVrQDDtgNkvpFbKUvZQpp6Ve0AG7LIviGqotZTbMt5z
	 1OFAtbACm9sQx3FeMhfinduxtUKx9M6Gk/dScYcUN+SgRRW3+Lmj5FjUJdtBXKCBy+
	 1ReF5pmxCmk1K2BdikdWMoR+mpY3ZZ2KbQjJeOF67WqcLIWpDQXSoxpwtwYhNhehhW
	 FG1FoAqRftamwAK4gD2JhzMDrGZ3ghKDv22aZlmOIRrqQIHXH/x3XAjF0xti65i4Tr
	 hGfFGfMb03H4w==
Received: by mail-io1-f50.google.com with SMTP id b188so14893015iof.8
        for <linux-firmware@kernel.org>; Mon, 25 Oct 2021 04:21:30 -0700 (PDT)
X-Gm-Message-State: AOAM530WTMvSmQ3uB0HpyGZLxlnugG0NW6E+Zfh2gai2GLWHSigRLUA9
	/1ImuSkuAu2vhOTtwdlMI/HiLtY8EeaPF340fTo=
X-Google-Smtp-Source: ABdhPJyYxvf+q0aVp7PqHLe0KhQLADPO9nirk0YjfvcHMVmqVenuIROt2mfmPhV5iNePY5zJXtueKxA93wuC4VDno98=
X-Received: by 2002:a05:6638:12d0:: with SMTP id v16mr463713jas.6.1635160889943;
 Mon, 25 Oct 2021 04:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <AM8PR04MB8036F9757CB52BC241CFAED6FB839@AM8PR04MB8036.eurprd04.prod.outlook.com>
In-Reply-To: <AM8PR04MB8036F9757CB52BC241CFAED6FB839@AM8PR04MB8036.eurprd04.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 25 Oct 2021 07:21:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6K4imrbK4ZDD6zu_-COKWNqqeAh4mCA6kNRDnyJVzhXg@mail.gmail.com>
Message-ID: <CA+5PVA6K4imrbK4ZDD6zu_-COKWNqqeAh4mCA6kNRDnyJVzhXg@mail.gmail.com>
Subject: Re: pull request: updated MC firmware for NXP DPAA2 SoCs to version 10.28.1
To: Florinel Iordache <florinel.iordache@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 4:51 AM Florinel Iordache
<florinel.iordache@nxp.com> wrote:
>
> Updated Management Complex firmware for NXP DPAA2 SoCs to version 10.28.1.
>
> Please pull or let me know of any issues.
>
>
>
> Thanks!
>
>
>
> The following changes since commit d34196f55db16f2344483f94718c2b2263a5489e:
>
>
>
>   linux-firmware: update firmware for MT7921 WiFi device (2021-10-18 09:23:18 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/NXP/linux-firmware.git nxp_mc
>
>
>
> for you to fetch changes up to dd298a8cfb2fb8503289e16321815e5a02883555:
>
>
>
>   linux-firmware: Update NXP Management Complex firmware to version 10.28.1 (2021-10-22 16:23:42 +0300)

Pulled and pushed out.

josh

>
>
>
> ----------------------------------------------------------------
>
> Florinel Iordache (1):
>
>       linux-firmware: Update NXP Management Complex firmware to version 10.28.1
>
>
>
> WHENCE                          |   3 +++
>
> dpaa2/mc/mc_10.28.1_ls1088a.itb | Bin 0 -> 1029568 bytes
>
> dpaa2/mc/mc_10.28.1_ls2088a.itb | Bin 0 -> 1166192 bytes
>
> dpaa2/mc/mc_10.28.1_lx2160a.itb | Bin 0 -> 1169584 bytes
>
> 4 files changed, 3 insertions(+)
>
> create mode 100644 dpaa2/mc/mc_10.28.1_ls1088a.itb
>
> create mode 100644 dpaa2/mc/mc_10.28.1_ls2088a.itb
>
> create mode 100644 dpaa2/mc/mc_10.28.1_lx2160a.itb
