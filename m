Return-Path: <SRS0=z+nv=XN=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB4C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jul 2022 16:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 179F5C341C6; Fri,  8 Jul 2022 16:31:56 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BD4DC341C0;
	Fri,  8 Jul 2022 16:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BD4DC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 15so10535788vko.13;
        Fri, 08 Jul 2022 09:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gV6H9M58K9RqY0l36s2eAhn1XhtXZJ55vnWW//2QxGQ=;
        b=G1sxVyym4XPU3SMztOAMO7/KfGpykswxqXL9IKqbQyQ42nC1WHjgOFMfKy5lvjzY4L
         xiSuN+TZVpDiqZCbioTSLEBt4zUSjcfOPnMDeFH9lEVwty/REZBtwzGY0B27B6Wp2tCS
         n5y7LbLVTi4bhsvjXxxwPh1jZnZwuSgjlxAbRh26BjLHIuwQNfC/ijWIpz55+jRhuA+m
         dG6h4FP8mMFhUkfsz147ToWXvQhFkfPaMLZLQ7PhBS9mkSzihkXHcPO+AZ/P7wReNOvD
         QUnuPaTFxBi2xIwTE2Wmm6jVppS1LaypHhmEzje2NczpJ3I/esE+9qf7EwAVHZT9okrr
         DpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gV6H9M58K9RqY0l36s2eAhn1XhtXZJ55vnWW//2QxGQ=;
        b=dUgxwVakG7d+7NoOdnPq8f2OL3TjZE01Swevg5poccyTHrBgNv7HTLUuUP17s7cFe4
         9gfI2KwKXGPpTt1L/AZiPRKdfTYCFqPwTu+UHD2koQPfzuJBLEjqBmM9O6N0IGGhR+0r
         +PflRu+3AYWSyCh9nhgkXASHdzpWxrmkL6xjevDIJhJQv1EZF72MoG7nWah1WOa4PAE9
         tEiEjyaYueKDwhK+jZgxZYbaZpJrrfKiV1OIafo6godfz1K4CArfm7A+hAgumCQ4CFqB
         03T3RkrrgCbPtpYpwyfsidt4gj5PRsMuNdZaZ1OTzh4VjnNQ3q9n3HxkOFnZMCph0ONy
         kNvw==
X-Gm-Message-State: AJIora8ASZOPlHq8Nx6tKQeNPvC2jndvPu+VQHuOrer2QPP/OgisiCDv
	jq1D/X0EzAVRNQyk990fpEd74gaf3FRcdce96O4=
X-Google-Smtp-Source: AGRyM1ua7C8gyoO/g/a6p4msQmR3cGzlpUOiIWBqag3KoLLMBDAYZVEY3OUKp7FCC7L1QL7cJtmuM0tje1OwJnXKZ8I=
X-Received: by 2002:a1f:5a0b:0:b0:374:6c10:56c3 with SMTP id
 o11-20020a1f5a0b000000b003746c1056c3mr1969971vkb.32.1657297914270; Fri, 08
 Jul 2022 09:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220708160951.132-1-mario.limonciello@amd.com>
In-Reply-To: <20220708160951.132-1-mario.limonciello@amd.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 8 Jul 2022 17:31:43 +0100
Message-ID: <CALeDE9Nfi9zhbS9ZnAAg5o9EU6OS0FNchBfLUpiMgV33cCUGRg@mail.gmail.com>
Subject: Re: [PATCH] WHENCE: Correct dangling symlinks
To: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 5:10 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> The symlink direction was wrong for some brcm firmware.
>
> Fixes: f8a2651a ("Link some devices that ship with the AW-CM256SM")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

Face palm, good catch, thanks!
> ---
>  WHENCE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 14f3472e..14d0a877 100644
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
> +Link: brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
> +Link: brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
>
>  Licence: GPLv2. See GPL-2 for details.
>
> --
> 2.34.1
>
