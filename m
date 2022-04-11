Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3279C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 13:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0EE3C385AC; Mon, 11 Apr 2022 13:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9BFC385A4
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649682692;
	bh=4xJp5ayEkL1rkv0YZry6+V39FNge8pyIHEgWuMnKLJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ANVnl0hciFsRpT3+Pz5GS64JbvWezL8CowZ2fwne8m15ksqeHAioojqtlOkQvDdZp
	 AGwh4MDOlJeO0iMWXHkZgVcM3Q+TxsyfbinHyUzXjGzpeR7W36g9bm1ulh1RHqAuqT
	 bLztypr2y/FQwgSTsy3qJ7d1GsAN5TvB/lnMcSl8fKERWrTXd7KDJNnCCMaRD4q90C
	 8fzwQt0pjQ6HMMpFmwg5gbZHjIR2bqDQpP2T85rrENj65z0rhj2/ppPjeFLDH5jKR8
	 z2uh5uQ0Vxuzvx7Nlef8YNjJs0/lwKiJqXqWti2WQBwZs9WjgnuKxLydAY/rnGdW2V
	 6Ef9trTz7wXYg==
Received: by mail-io1-f50.google.com with SMTP id k25so18548714iok.8
        for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 06:11:32 -0700 (PDT)
X-Gm-Message-State: AOAM531jL2uh2MVR2cY4GOfPdYPRVq8GX8WhcOkTkIdKF523oXXzD1eW
	Wte1KRLpVyuR7C9F/qcGMrwSVOmxXx+Evi2AJnQ=
X-Google-Smtp-Source: ABdhPJyzV3x2bWZaTufPAzv2zecyCld8iJbjMJtigE1TjFRKkXu2FSTJr0G8zMUaqKGMFPagHk5W7weYtn1S4UoPpp4=
X-Received: by 2002:a6b:b704:0:b0:649:eccd:d46a with SMTP id
 h4-20020a6bb704000000b00649eccdd46amr12602597iof.55.1649682691704; Mon, 11
 Apr 2022 06:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220411120545.20066-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220411120545.20066-1-yunfei.dong@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 09:11:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6KtJpppj2hj9CmSyG6cf4KkttF3acox0j+U8VLcZzopQ@mail.gmail.com>
Message-ID: <CA+5PVA6KtJpppj2hj9CmSyG6cf4KkttF3acox0j+U8VLcZzopQ@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware
To: Yunfei Dong <yunfei.dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, tinghan.shen@mediatek.com, 
	Irui Wang <irui.wang@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 8:05 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:
>
>   amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1
>
> for you to fetch changes up to ae8dfb4a5d4c6028ee1fca04b374b0e03ec35360:
>
>   mediatek: Add mt8192 SCP firmware (2022-04-11 20:00:24 +0800)
>
> ----------------------------------------------------------------
> Yunfei Dong (1):
>       mediatek: Add mt8192 SCP firmware
>
>  WHENCE                  |   3 +++
>  mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 mediatek/mt8192/scp.img

Pulled and pushed out.  Thanks.

josh
