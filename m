Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A81BC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Sep 2021 13:27:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E96F5611F0; Tue, 28 Sep 2021 13:27:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4160611CC
	for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632835656;
	bh=HDQPON+X28arnxvkaDzyjYm21pOLj3XVCCY1d7K1f2A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=b17MGZ0Sc3Mbdui/zL9v7zkLPRpE0F2zEUs1Leqy74uWOFK+c8GsIbi75P7d2V7wO
	 uS8vQITgg1QWOZ3mcpDMP3szSxDcdHK+JnBsHWNVvd3dbSYR7ySu9RtRkMbXcj3ILd
	 OPk5f7EagAfPXsRVV+pqZ+pbFq3UqeLfZ3rJR0VmyC4wJdUYp/IQu9W+1ju+bCUmoo
	 k7eT0LicF/zjpgez45SVA5xLzIOouU+HEIFzLMjd7h/6M16YsNHga3+u59VgIzl8we
	 FjETggafj/DpoyTIBLNyUbtm6U4QSXAOy+3SuOX/y907oErHiQ3E7WNHezSMApKmvG
	 uvqzrIxGs17LQ==
Received: by mail-il1-f180.google.com with SMTP id h20so23245542ilj.13
        for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 06:27:36 -0700 (PDT)
X-Gm-Message-State: AOAM531Z6u9y5eNY4tCLJgvs9VMUGK2RL/41OCHugs0vbbHN/Nf7F/BF
	+GZf2YjkJIPTIMJ0WTfzuFi7qAYiK+ZBdK7FPWs=
X-Google-Smtp-Source: ABdhPJwT2LkGP1ZUgus8xklTuE1Zczdl6QmhGJdzblLmbPk/79I8QdX8n4ewZIW29zEq7Kbl4RfUMErUi4bbQ84b2EU=
X-Received: by 2002:a05:6e02:20c2:: with SMTP id 2mr4833955ilq.97.1632835656315;
 Tue, 28 Sep 2021 06:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210927103647.GA15266@chelsio.com>
In-Reply-To: <20210927103647.GA15266@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 28 Sep 2021 09:27:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5NGzvFgwaU4=j+R9E7D7y6vz1_0V6=gLO7kN_om_PFUg@mail.gmail.com>
Message-ID: <CA+5PVA5NGzvFgwaU4=j+R9E7D7y6vz1_0V6=gLO7kN_om_PFUg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.26.2.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 6:39 AM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL.
>
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
>
> The following changes since commit 0268c1b8a06798f5167cbef8fb16241298b3eba9:
>
>   Merge branch 'adlp_dmc_2_12' of git://anongit.freedesktop.org/drm/drm-firmware into main (2021-09-23 12:39:42 -0400)
>
> are available in the git repository at:
>
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 70ff1f807c1440efff073b618f82202ba1ecb8be:
>
>   cxgb4: Update firmware to revision 1.26.2.0 (2021-09-27 02:29:50 -0700)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.26.2.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.26.0.0.bin => t4fw-1.26.2.0.bin} | Bin 570368 -> 570368 bytes
>  cxgb4/{t5fw-1.26.0.0.bin => t5fw-1.26.2.0.bin} | Bin 675840 -> 676352 bytes
>  cxgb4/{t6fw-1.26.0.0.bin => t6fw-1.26.2.0.bin} | Bin 729088 -> 729088 bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.26.0.0.bin => t4fw-1.26.2.0.bin} (57%)
>  rename cxgb4/{t5fw-1.26.0.0.bin => t5fw-1.26.2.0.bin} (55%)
>  rename cxgb4/{t6fw-1.26.0.0.bin => t6fw-1.26.2.0.bin} (61%)

Pulled and pushed out.

josh
