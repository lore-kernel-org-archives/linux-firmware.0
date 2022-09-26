Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A166C07E9D
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Sep 2022 14:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6AA9C4347C; Mon, 26 Sep 2022 14:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1446C433B5
	for <linux-firmware@kernel.org>; Mon, 26 Sep 2022 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664202543;
	bh=LOaaVPAgZoKb2FP1j1rR6l0FvVElPsNxd0aZCAS7ycE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RMk8NEN9sZbGBgCIEvTxWH+IR2bm9J35Mr2I+OIjcj/buYYl2KUcuRFY3jutW6Zbt
	 8hQEe4INF66ihiV9HexB2By6Ng6XiVR1ilF3XLIVUb3vW8bE3jJMi/moo9gyHWW5KD
	 otwtNI1zX/ZTqP2Gm2o+ln9OWrDT6yabMfLNWhPefbsvs9bs+yloVTR4ZnRr2Wowd0
	 oTYZ9TAFbeqFnksjQBSVbeMPpCuZsoF76nnUftnDN2sIi4pO3J8M36i2xihJwh0/vs
	 6iJFXzrUV2XhHePRioQ7qJ6ig5Ec5exx1xHlEzu4toLvZ3U/QPboSo5cvfkXH6qPrN
	 jrVkHaAS1r1+Q==
Received: by mail-oi1-f182.google.com with SMTP id v130so8460374oie.2
        for <linux-firmware@kernel.org>; Mon, 26 Sep 2022 07:29:03 -0700 (PDT)
X-Gm-Message-State: ACrzQf3MihrJL9DZlfuFLjv/doLTvF9hofZZwnmw3taQrezMtxaaOLVh
	wJFbFuYevF6vVH/EtbO7etgmIHLQUmD8OEnraNg=
X-Google-Smtp-Source: AMsMyM6Q1Jq+tljSNc/MemCAH0Wbm6mYu/DAbSWvJhnI7PKNBxSnHjGE1HLlpTdUG67gv7LE4J22pCtfZnWFojhgwfg=
X-Received: by 2002:a05:6808:f05:b0:350:c7fc:3a71 with SMTP id
 m5-20020a0568080f0500b00350c7fc3a71mr10601604oiw.267.1664202542937; Mon, 26
 Sep 2022 07:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <YyjjdfpfEG89h8cw@chelsio.com>
In-Reply-To: <YyjjdfpfEG89h8cw@chelsio.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 26 Sep 2022 10:28:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6QNx0ooNhZrGbPsEHiRM=91UV44pO3UWJ=LjwWmfjmHg@mail.gmail.com>
Message-ID: <CA+5PVA6QNx0ooNhZrGbPsEHiRM=91UV44pO3UWJ=LjwWmfjmHg@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.27.0.0
To: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Mon, Sep 19, 2022 at 5:47 PM Rahul Lakkireddy
<rahul.lakkireddy@chelsio.com> wrote:
>
> Please pull the new Chelsio firmware from the following URL
>
> http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Rahul
>
> The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
>
>   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
>
> are available in the Git repository at:
>
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to e6e48db2f8509578902d767b2d05a536b117256e:
>
>   cxgb4: Update firmware to revision 1.27.0.0 (2022-09-19 20:35:56 +0000)
>
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.27.0.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.26.6.0.bin => t4fw-1.27.0.0.bin} | Bin 570880 -> 570880 bytes
>  cxgb4/{t5fw-1.26.6.0.bin => t5fw-1.27.0.0.bin} | Bin 676352 -> 677376 bytes
>  cxgb4/{t6fw-1.26.6.0.bin => t6fw-1.27.0.0.bin} | Bin 729600 -> 729600 bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.26.6.0.bin => t4fw-1.27.0.0.bin} (79%)
>  rename cxgb4/{t5fw-1.26.6.0.bin => t5fw-1.27.0.0.bin} (77%)
>  rename cxgb4/{t6fw-1.26.6.0.bin => t6fw-1.27.0.0.bin} (71%)
