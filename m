Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8FDC433ED
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Apr 2021 11:18:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 35C2461447; Wed, 21 Apr 2021 11:18:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FC8E61445
	for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619003938;
	bh=RcszqSY2tlZTXVDOySigDOvB3yWfQIlsYcm95tWSKxU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AW+tZ15lroVMdItxtrnK62fGjJFEfqbMX2tnSkm5W51u+GeWsSp/PvrtKngSP6r1r
	 ONyj84WC8nPpdAg3TTKdehpHsCPipX+JcCl12NlGy7w4CB7xZOQerbvy00TwmVqhD7
	 XCjE2DuxQtfy6C9XM7Rc97mYPN1KDkkQvW4i+KhFaHvVcNg/LDQ3BNwydcKLXq9alO
	 aGd655avdjP1cCm6r7fIxMeHAbfdETBNWfGlmaro612m7xgHj2vs8P6zc+4THj3t1B
	 vnSqm016ArW6Wo4EjeUD71XLfh+vGmIGn9Ry3yW0RCB9Rfk/YkecHN3ub1FvbzI7UV
	 1n4WdfHhOBCPQ==
Received: by mail-il1-f178.google.com with SMTP id p15so23698948iln.3
        for <linux-firmware@kernel.org>; Wed, 21 Apr 2021 04:18:58 -0700 (PDT)
X-Gm-Message-State: AOAM533Z8BjBUxbGNuxCRv3kd+QA/c7tWYkZcOutHV+OwJM8YwJnOzRM
	7LXovjBkVBeIwnnMeM1MGftDCrmglIipr4OtjCs=
X-Google-Smtp-Source: ABdhPJxSIaorbaY8Obvjcma3z/nV5e/e4p7itwWm8IiQ1Ik688W06y22OctyidUtgN+5O4L9kB4YAFuUOUrYTj6MHGY=
X-Received: by 2002:a92:cd43:: with SMTP id v3mr26154803ilq.11.1619003937329;
 Wed, 21 Apr 2021 04:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <8885c6fbfcc91043a5406cf6e528e0b9@codeaurora.org>
In-Reply-To: <8885c6fbfcc91043a5406cf6e528e0b9@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 21 Apr 2021 07:18:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7pbgVRpwkM71ToxRwBKfH=j51GrZcz+8Q5H2MpmmL-_w@mail.gmail.com>
Message-ID: <CA+5PVA7pbgVRpwkM71ToxRwBKfH=j51GrZcz+8Q5H2MpmmL-_w@mail.gmail.com>
Subject: Re: Request to update venus-5.10 FW files
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media-owner@vger.kernel.org, 
	vgarodia@codeaurora.org, dikshita@codeaurora.org, adhudase@codeaurora.org, 
	sampnimm@codeaurora.org, mansur@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 21, 2021 at 2:59 AM <smagar@codeaurora.org> wrote:
>
> Hello Team,
>
> Please include updated firmware bins for venus-5.10.
>
> Snapshot of pull request is as below, let me know if anything is
> missing.
>
>
>
> The following changes since commit
> 5c893c65b862906a627cea238ae8c2d099027dee:
>
>    Updated Venus firmware files for v5.10 (2021-04-20 11:48:28 +0530)
>
> are available in the git repository at:
>
>    https://github.com/suraj714/linux-firmware-venus.git master
>
> for you to fetch changes up to 2565c9d2576ce1275206483e106d6fb627ace042:
>
>    qcom :venus_v5.10: updated venus firmware files for v5.10 (2021-04-21
> 12:04:59 +0530)
>
> ----------------------------------------------------------------
> smagar (1):
>        qcom :venus_v5.10: updated venus firmware files for v5.10
>
>   qcom/sc7280/vpu20_1v.b00          | Bin 0 -> 692 bytes
>   qcom/sc7280/vpu20_1v.b01          | Bin 0 -> 7376 bytes
>   qcom/sc7280/vpu20_1v.b02          | Bin 0 -> 300 bytes
>   qcom/sc7280/vpu20_1v.b03          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b04          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b05          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b06          | Bin 0 -> 20 bytes
>   qcom/sc7280/vpu20_1v.b07          | Bin 0 -> 24 bytes
>   qcom/sc7280/vpu20_1v.b08          | Bin 0 -> 16 bytes
>   qcom/sc7280/vpu20_1v.b09          | Bin 0 -> 939184 bytes
>   qcom/sc7280/vpu20_1v.b10          | Bin 0 -> 42976 bytes
>   qcom/sc7280/vpu20_1v.b11          |   0
>   qcom/sc7280/vpu20_1v.b12          |   0
>   qcom/sc7280/vpu20_1v.b13          |   0
>   qcom/sc7280/vpu20_1v.b14          |   0
>   qcom/sc7280/vpu20_1v.b15          |   0
>   qcom/sc7280/vpu20_1v.b16          |   0
>   qcom/sc7280/vpu20_1v.b17          |   0
>   qcom/sc7280/vpu20_1v.b18          |   0
>   qcom/sc7280/vpu20_1v.b19          |   1 +
>   qcom/sc7280/vpu20_1v.mbn          | Bin 0 -> 2031188 bytes
>   qcom/sc7280/vpu20_1v.mdt          | Bin 0 -> 8068 bytes
>   qcom/sc7280/vpu20_1v_unsigned.mbn | Bin 0 -> 2031188 bytes

This looks weird.  You're adding 23 new files, none of which are
mentioned in WHENCE.  Also, why do you have a bunch of 0 byte files?

Is this correct?

josh

>   23 files changed, 1 insertion(+)
>   create mode 100644 qcom/sc7280/vpu20_1v.b00
>   create mode 100644 qcom/sc7280/vpu20_1v.b01
>   create mode 100644 qcom/sc7280/vpu20_1v.b02
>   create mode 100644 qcom/sc7280/vpu20_1v.b03
>   create mode 100644 qcom/sc7280/vpu20_1v.b04
>   create mode 100644 qcom/sc7280/vpu20_1v.b05
>   create mode 100644 qcom/sc7280/vpu20_1v.b06
>   create mode 100644 qcom/sc7280/vpu20_1v.b07
>   create mode 100644 qcom/sc7280/vpu20_1v.b08
>   create mode 100644 qcom/sc7280/vpu20_1v.b09
>   create mode 100644 qcom/sc7280/vpu20_1v.b10
>   create mode 100644 qcom/sc7280/vpu20_1v.b11
>   create mode 100644 qcom/sc7280/vpu20_1v.b12
>   create mode 100644 qcom/sc7280/vpu20_1v.b13
>   create mode 100644 qcom/sc7280/vpu20_1v.b14
>   create mode 100644 qcom/sc7280/vpu20_1v.b15
>   create mode 100644 qcom/sc7280/vpu20_1v.b16
>   create mode 100644 qcom/sc7280/vpu20_1v.b17
>   create mode 100644 qcom/sc7280/vpu20_1v.b18
>   create mode 100644 qcom/sc7280/vpu20_1v.b19
>   create mode 100644 qcom/sc7280/vpu20_1v.mbn
>   create mode 100644 qcom/sc7280/vpu20_1v.mdt
>   create mode 100644 qcom/sc7280/vpu20_1v_unsigned.mbn
>
> Regards,
> Suraj Magar
