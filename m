Return-Path: <SRS0=5WU+=GO=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF26EC433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Jan 2021 23:35:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7942A22D2B; Mon, 11 Jan 2021 23:35:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF062253A;
	Mon, 11 Jan 2021 23:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF062253A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-ej1-f51.google.com with SMTP id lt17so883051ejb.3;
        Mon, 11 Jan 2021 15:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDx46Dq8Q9ZQT7p23frdgszudKfjCtx3D6oNnayAHQg=;
        b=uapq48WFO+dKUOkGACFMqXiDz8xOX7PUC6WKiq3ZrCqwr9C1E3NK9vxn6vXN5uT5Iq
         wNLjI7nyYlJqrXADl8hbn65xRh++dCfYhwAt8+elyn14A21I8V1wlHs9bU2CFyNmvAYP
         58bOtZe3Cm4gSeBjfA7qHYWjVLjKKZ0VRaAFDAA/o1Ukgkb+ifhxsIOXr1eHaxnRorC7
         luQkwAB82GbF7ptkwQJTiVPAiLpGNO9xMB/KZTYABvV8bI36EdhS2WS2mRmDIft4qRS1
         TdezT8VUH7OFcYeEFzLb+xfYhAazz8FISe9pkG9IVyo5KLQzba2JiXvzYSeM0YbkISXG
         rVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDx46Dq8Q9ZQT7p23frdgszudKfjCtx3D6oNnayAHQg=;
        b=auZtCxvUrbw1DmbvQIDkV6EDYjVzEOgmoFmv4Bl+Aj9JzTz2y8C9/Q0QwA8TjWlyOh
         ZtxtxBI3d0WrbXjIyd95Bac2UyLB+r1bM/Nc661rMX7qSpb3kgomo0RDRh6UnNusjbx+
         T9mk98Zt1f0BPVMXNgNQStr/pAWpTF6/Hl5PNNG9NVqol25ibDkgp7EP6+8etZSYDvFr
         fstdy1oKkMXdQAbgYwo34v7NnGvjmPnHVP10QK2W6B/jWhFkOE9UOZMTcZty4ZN/ziHQ
         3GoZcivIGzDj+Y3xGglWLmUpze+KxoWastl02ZqF3oxqJnf4nghXmpgYq4ESNNevqbAE
         pw7A==
X-Gm-Message-State: AOAM532TJ/KfbxrR7AudCSNg8FcPqFa6B65fBhnbLFwLHhfBSU8i3Bxz
	9rJqWM/gwObNmK/nnxdygKzImN79gziK+i+5s6c=
X-Google-Smtp-Source: ABdhPJwlAVNiZBxq0HuUjAZ2eJiJFUPeFsvjXZda1xaIWrrYbVNR6rrtI/hXUlht93e0x1rJo9tbWolcQHMlCeftwVs=
X-Received: by 2002:a17:907:1629:: with SMTP id hb41mr1153335ejc.197.1610408153275;
 Mon, 11 Jan 2021 15:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20210111231850.1745213-1-jeremy.linton@arm.com>
In-Reply-To: <20210111231850.1745213-1-jeremy.linton@arm.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 11 Jan 2021 23:35:41 +0000
Message-ID: <CALeDE9MXqGeoPcwEdCqwXxst_CW3dE0K7zLFvL2fHk+_wr03Lw@mail.gmail.com>
Subject: Re: [PATCH v3] brcm: Link RPi4's WiFi firmware with DMI machine name.
To: Jeremy Linton <jeremy.linton@arm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Hans de Goede <hdegoede@redhat.com>, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 11, 2021 at 11:18 PM Jeremy Linton <jeremy.linton@arm.com> wrote:
>
> The kernel when booted in ACPI mode with SMBIOS/DMI
> data uses that data to set the machine manufacture/model.
>
> The RPi's WiFi driver uses the machine string to
> select the correct firmware image. Because of
> this, an additional link to select the correct
> firmware is needed.
>
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/WHENCE b/WHENCE
> index cbde48d..abda387 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
>  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> +Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
>
> --
> 2.26.2
>
