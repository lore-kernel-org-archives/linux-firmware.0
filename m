Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433B6C433B4
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:35:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3BAD61283; Mon,  3 May 2021 13:35:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE12461278
	for <linux-firmware@kernel.org>; Mon,  3 May 2021 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620048916;
	bh=cePqa/WFr9HsXd1s/HO7Jgh8H844BeoQmX9ascnZcWs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uWed32ZkYf+G4fLVzOQdNncyxN4GNhzLcE6FoNKDBIJisYtXff99Vt7fvvScpiqDj
	 Ii5rn8+3iJT70up5h7ollXli0JVJ6+aoXeYGao2glMT7kFKO0cr5CPTszVDpHtB+K3
	 +v0Ry9E443mGZ2cFOCV2wNLd5wdtwwVEikKz/C+yQlpJ7Oj3wsh8fainIJC/o9NE8A
	 bIFW9WIDgiAB2OCk/ZRoTtQlGyp7c8PJLiV6+Xla7T028cCx0IuPvw9NaGhcgo4Pp4
	 oP/SsDrKWVAnnW381Q8aLK7biu2FTSo1b92PgQO286FhpUZ8hqIvlk+A5udVOIaJwW
	 uNtH8KZsnTUfw==
Received: by mail-il1-f174.google.com with SMTP id p15so3691703iln.3
        for <linux-firmware@kernel.org>; Mon, 03 May 2021 06:35:16 -0700 (PDT)
X-Gm-Message-State: AOAM5339M/XWazqaiMgHKdCRF8PrHiwHGbtiMb8Rl0zx32pi598oipoe
	YfbyCiwml1N90GyEHVEO4p8viKzsBEZzUWytf1s=
X-Google-Smtp-Source: ABdhPJzThCRs0ZJm1R3XcF6UouAzeNP/MZm8lDhi8z2vs9FEBdCI5ydFWtCjT61palnbDnxeU7XMR2fuNd+UFnDY82E=
X-Received: by 2002:a92:dc90:: with SMTP id c16mr10759330iln.11.1620048916191;
 Mon, 03 May 2021 06:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
 <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org> <c38ab84b90feddb43b2782fa11ee5189@codeaurora.org>
 <52ac8a546ecdb6a11b10edf936ba714d@codeaurora.org> <194da82a3a5f2010fadca4fe6960b359@codeaurora.org>
 <f2d3176d5e78b50275ad81d37e908d4b@codeaurora.org>
In-Reply-To: <f2d3176d5e78b50275ad81d37e908d4b@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:35:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
Message-ID: <CA+5PVA7jSe_Hgtsw80rebBOATDGApQbss1txs__KfQh+o+e3Lg@mail.gmail.com>
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for VPU-2.0
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: vgarodia@codeaurora.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Linux Firmware <linux-firmware@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, 
	linux-media-owner@vger.kernel.org, dikshita@codeaurora.org, 
	adhudase@codeaurora.org, sampnimm@codeaurora.org, mansur@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

On Mon, May 3, 2021 at 3:30 AM <smagar@codeaurora.org> wrote:
> Hi Vikash,
>
> As you suggested I did this changes.
> Below is combined pull request for venus-5.4 and VPU-2.0.
> Please find snapshot of pull request, let me know if anything is
> missing.
>
>
>
> The following changes since commit
> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>
>    Merge branch 'for-upstream' of
> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> 11:34:11 -0400)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-venus.git master
>
> for you to fetch changes up to c7b11ed12b6391097e84babab62802076fd15902:
>
>    qcom: Add venus firmware files for VPU-2.0 (2021-05-03 12:18:45 +0530)
>
> ----------------------------------------------------------------
> smagar (2):
>        qcom: update venus firmware files for v5.4
>        qcom: Add venus firmware files for VPU-2.0

Vikash, does this one look good to you?

josh

>
>   WHENCE                   |  19 ++++++++++++++++++-
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873680 -> 873596 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>   qcom/venus-5.4/venus.mbn | Bin 919792 -> 919708 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>   qcom/vpu-2.0/venus.b00   | Bin 0 -> 692 bytes
>   qcom/vpu-2.0/venus.b01   | Bin 0 -> 7376 bytes
>   qcom/vpu-2.0/venus.b02   | Bin 0 -> 300 bytes
>   qcom/vpu-2.0/venus.b03   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b04   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b05   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b06   | Bin 0 -> 20 bytes
>   qcom/vpu-2.0/venus.b07   | Bin 0 -> 24 bytes
>   qcom/vpu-2.0/venus.b08   | Bin 0 -> 16 bytes
>   qcom/vpu-2.0/venus.b09   | Bin 0 -> 939184 bytes
>   qcom/vpu-2.0/venus.b10   | Bin 0 -> 42976 bytes
>   qcom/vpu-2.0/venus.b19   |   1 +
>   qcom/vpu-2.0/venus.mbn   | Bin 0 -> 2031188 bytes
>   qcom/vpu-2.0/venus.mdt   | Bin 0 -> 8068 bytes
>   21 files changed, 19 insertions(+), 1 deletion(-)
>   create mode 100644 qcom/vpu-2.0/venus.b00
>   create mode 100644 qcom/vpu-2.0/venus.b01
>   create mode 100644 qcom/vpu-2.0/venus.b02
>   create mode 100644 qcom/vpu-2.0/venus.b03
>   create mode 100644 qcom/vpu-2.0/venus.b04
>   create mode 100644 qcom/vpu-2.0/venus.b05
>   create mode 100644 qcom/vpu-2.0/venus.b06
>   create mode 100644 qcom/vpu-2.0/venus.b07
>   create mode 100644 qcom/vpu-2.0/venus.b08
>   create mode 100644 qcom/vpu-2.0/venus.b09
>   create mode 100644 qcom/vpu-2.0/venus.b10
>   create mode 100644 qcom/vpu-2.0/venus.b19
>   create mode 100644 qcom/vpu-2.0/venus.mbn
>   create mode 100644 qcom/vpu-2.0/venus.mdt
>
>
>
> Thanks,
> Suraj
>
>
>
>
