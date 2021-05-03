Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F47C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 13:23:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AFE7461283; Mon,  3 May 2021 13:23:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9823D6127A
	for <linux-firmware@kernel.org>; Mon,  3 May 2021 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620048210;
	bh=umTUYPawnwtb/Y2KetSyREO/n4S++DZI9OamRKrpxGc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fYSX1w7nGKDEIgaFQ0Bbz589kwTd6GsrJF4FCHi4llwNJ4ZQ9YLWaAMo6HZuEMFeU
	 a5nvmpiBeWJ+p26BPWpICQ3VZsEuSw6HmqDg8CbB6JWd9rgGUtFoQSuGwyXt9ghB1L
	 F2RYHyCN60UFeHXNT1TaWr+iN3j+591e9d9UKg6G7R4l9wXg44ymdd0KFOdYJc7a26
	 CySEQgf5/Xul11lXgdwZrtFCtVc/w4E/5nBJR/dJGCFpL/UcVAahiGmnbwwI9GqAIF
	 q4wIccOrYumTvCPdbh70Nf5DW8ie7nwrOchBAli5VRvAajEU5AAl5uOt/HME05s4d5
	 D4jWPLeR5zqTw==
Received: by mail-il1-f176.google.com with SMTP id i22so3644781ila.11
        for <linux-firmware@kernel.org>; Mon, 03 May 2021 06:23:30 -0700 (PDT)
X-Gm-Message-State: AOAM533G7wBIZnE1WL/s4/fkuVA3YUj+C35Ug/D22QItETQQT3gHINpf
	9d0zHreKxfLdksnO2CkXB4+Pif0syEzGj8kIDK0=
X-Google-Smtp-Source: ABdhPJzrv/XlBaBOEAOURaeGd0D3cuCPOdaG6wMNJfY68dDWX23ON/VzI71JFPQs57miI/5l+BuakboNUUWPQMmKcIQ=
X-Received: by 2002:a05:6e02:ea9:: with SMTP id u9mr8740291ilj.303.1620048209860;
 Mon, 03 May 2021 06:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <1619677482-14857-1-git-send-email-akhilpo@codeaurora.org>
 <CAP71WjzphRWpcMvmUZQJwobXdmgqoUG2MzgQaLLg03P-Fm0Rvw@mail.gmail.com> <e76cc831-ed8e-9f29-0472-96cdf929ce14@codeaurora.org>
In-Reply-To: <e76cc831-ed8e-9f29-0472-96cdf929ce14@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 3 May 2021 09:23:18 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5cZ1gPYANnfSnp5ZDQ0p6SzOC_C59p5a85rPDYCYsL-Q@mail.gmail.com>
Message-ID: <CA+5PVA5cZ1gPYANnfSnp5ZDQ0p6SzOC_C59p5a85rPDYCYsL-Q@mail.gmail.com>
Subject: Re: [PATCH] qcom: add gpu firmwares for sc7280
To: Akhil P Oommen <akhilpo@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Linux Firmware <linux-firmware@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 29, 2021 at 5:26 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 4/29/2021 1:08 PM, Nicolas Dechesne wrote:
> > On Thu, Apr 29, 2021 at 8:25 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >>
> >> Adds a660_gmu.bin (v3.01.06) and a660_sqe.fw (v0.94) firmware blobs
> >> required for sc7280 SoC.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >>   WHENCE            |   2 ++
> >>   qcom/a660_gmu.bin | Bin 0 -> 55444 bytes
> >>   qcom/a660_sqe.fw  | Bin 0 -> 40496 bytes
> >>   3 files changed, 2 insertions(+)
> >>   create mode 100644 qcom/a660_gmu.bin
> >>   create mode 100644 qcom/a660_sqe.fw
> >>
> >> diff --git a/WHENCE b/WHENCE
> >> index 3a27e34..3371dc7 100644
> >> --- a/WHENCE
> >> +++ b/WHENCE
> >> @@ -5191,6 +5191,8 @@ File: qcom/sdm845/a630_zap.mbn
> >>   File: qcom/a650_gmu.bin
> >>   File: qcom/a650_sqe.fw
> >>   File: qcom/sm8250/a650_zap.mbn
> >> +File: qcom/a660_gmu.bin
> >> +File: qcom/a660_sqe.fw
> >>
> >>   Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
> >>
> >> diff --git a/qcom/a660_gmu.bin b/qcom/a660_gmu.bin
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..ee1b922b45bf17899f486cd1151f0fffe3fd8eb5
> >> GIT binary patch
> >
> > For linux-firmware PR, you most likely need to send a PR from a public
> > branch instead. Binary patch isn't really working well. Here are
> > example of previous QCOM firmware PRs:
> >
> > https://lore.kernel.org/linux-firmware/bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org/
> > https://lore.kernel.org/linux-firmware/20210401201115.stkX71kzODcOGviP6NCSqy_k3M3AN3G5oqHzAyBYMWs@z/
> >
>
> I thought that binary patches were acceptable. It is mentioned in the
> README and also, I see a lot of binary patches being posted to
> linux-firmware like this:
> https://lore.kernel.org/linux-firmware/CA+5PVA7Deq3P_cw+Ro8xDeQeS1CTeK8RTfXUB0b5L622npvX7w@mail.gmail.com/T/

Yes, they're fine.  Pull requests make things easier and don't clog
people's inboxes with binary blobs, but we still take patches as well.
In the future, if you can file a PR I'd prefer it.

I've applied and pushed out.

josh
