Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C4AC2D0A8
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Sep 2020 12:17:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D87E7221EB; Wed, 23 Sep 2020 12:17:48 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9523D221E7
	for <linux-firmware@kernel.org>; Wed, 23 Sep 2020 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600863468;
	bh=CakUE+X8qfxZ0onCOQYB9ZP9GpZp6Yn9V/hUL6oEshU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=gbNypK7swRejKitH2riq/kS5OA188Q/V1Sh33nA2QGYf4chtyAZw5Kcmnv9TA9m71
	 eGM05C0byFgLmu7tsQ/C90IadOS0OImNnroVEHCySB6qF0nC9RClflbpnazpvKa/o2
	 cQZyIGiYmwsZr+Pnb12iYjEkxjuIJ6nL9o+30aYM=
Received: by mail-io1-f49.google.com with SMTP id y13so23407951iow.4
        for <linux-firmware@kernel.org>; Wed, 23 Sep 2020 05:17:48 -0700 (PDT)
X-Gm-Message-State: AOAM531fLlpHyPr8SzBgmKPgllQJSoLuHs3uXdI7AUzqQ/AVhut6V1ud
	PeCY43bru9ZIMbuXH3xfBQOl4xrmqbqJJ8YIRQI=
X-Google-Smtp-Source: ABdhPJzLZpIfH676+5KNP0D0ZNH4llXFs5KVpbyTajwoEfPtp0XP8mUw35WcD+3Rc5OkyRGRgsJQzcTQ+e/ucFD14yc=
X-Received: by 2002:a05:6638:d4e:: with SMTP id d14mr7913707jak.107.1600863467557;
 Wed, 23 Sep 2020 05:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200919192109.805218-1-pbrobinson@gmail.com>
In-Reply-To: <20200919192109.805218-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 23 Sep 2020 08:17:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4m8x7m8wBJyUoX4UFs-FV5fBqSjx9ZvQsiwe6pKmR41A@mail.gmail.com>
Message-ID: <CA+5PVA4m8x7m8wBJyUoX4UFs-FV5fBqSjx9ZvQsiwe6pKmR41A@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: nvidia: move firmware symlinks to WHENCE
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Gourav Samaiya <gsamaiya@nvidia.com>, 
	Ben Skeggs <bskeggs@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>, Ajay Gupta <ajayg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

All 3 patches pushed.  Fixed one reference in this patch in the commit itself.

josh

On Sat, Sep 19, 2020 at 3:21 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> There's a number of firmware symlinks in the nvidia firmware
> directory, move the creation of these to the WHENCE file.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> CC: Gourav Samaiya <gsamaiya@nvidia.com>
> CC: Ben Skeggs <bskeggs@redhat.com>
> CC: Alexandre Courbot <acourbot@nvidia.com>
> CC: Ajay Gupta <ajayg@nvidia.com>
> ---
>  WHENCE                             | 230 ++++++++++++++---------------
>  nvidia/gm204/acr/bl.bin            |   1 -
>  nvidia/gm204/acr/ucode_load.bin    |   1 -
>  nvidia/gm204/acr/ucode_unload.bin  |   1 -
>  nvidia/gm204/gr/fecs_bl.bin        |   1 -
>  nvidia/gm204/gr/fecs_inst.bin      |   1 -
>  nvidia/gm204/gr/gpccs_bl.bin       |   1 -
>  nvidia/gm204/gr/gpccs_inst.bin     |   1 -
>  nvidia/gm204/gr/sw_bundle_init.bin |   1 -
>  nvidia/gm204/gr/sw_ctx.bin         |   1 -
>  nvidia/gm204/gr/sw_method_init.bin |   1 -
>  nvidia/gm204/gr/sw_nonctx.bin      |   1 -
>  nvidia/gm206/acr/bl.bin            |   1 -
>  nvidia/gm206/gr/fecs_bl.bin        |   1 -
>  nvidia/gm206/gr/fecs_inst.bin      |   1 -
>  nvidia/gm206/gr/gpccs_bl.bin       |   1 -
>  nvidia/gm206/gr/gpccs_inst.bin     |   1 -
>  nvidia/gm206/gr/sw_bundle_init.bin |   1 -
>  nvidia/gm206/gr/sw_ctx.bin         |   1 -
>  nvidia/gm206/gr/sw_method_init.bin |   1 -
>  nvidia/gm206/gr/sw_nonctx.bin      |   1 -
>  nvidia/gm20b/gr/sw_method_init.bin |   1 -
>  nvidia/gp100/gr/fecs_bl.bin        |   1 -
>  nvidia/gp100/gr/gpccs_bl.bin       |   1 -
>  nvidia/gp102/gr/fecs_bl.bin        |   1 -
>  nvidia/gp102/gr/gpccs_bl.bin       |   1 -
>  nvidia/gp104/acr/bl.bin            |   1 -
>  nvidia/gp104/acr/ucode_load.bin    |   1 -
>  nvidia/gp104/acr/ucode_unload.bin  |   1 -
>  nvidia/gp104/acr/unload_bl.bin     |   1 -
>  nvidia/gp104/gr/fecs_bl.bin        |   1 -
>  nvidia/gp104/gr/gpccs_bl.bin       |   1 -
>  nvidia/gp104/gr/sw_bundle_init.bin |   1 -
>  nvidia/gp104/gr/sw_ctx.bin         |   1 -
>  nvidia/gp104/gr/sw_method_init.bin |   1 -
>  nvidia/gp104/gr/sw_nonctx.bin      |   1 -
>  nvidia/gp104/nvdec/scrubber.bin    |   1 -
>  nvidia/gp104/sec2/desc-1.bin       |   1 -
>  nvidia/gp104/sec2/desc.bin         |   1 -
>  nvidia/gp104/sec2/image-1.bin      |   1 -
>  nvidia/gp104/sec2/image.bin        |   1 -
>  nvidia/gp104/sec2/sig-1.bin        |   1 -
>  nvidia/gp104/sec2/sig.bin          |   1 -
>  nvidia/gp106/acr/bl.bin            |   1 -
>  nvidia/gp106/acr/ucode_load.bin    |   1 -
>  nvidia/gp106/acr/ucode_unload.bin  |   1 -
>  nvidia/gp106/acr/unload_bl.bin     |   1 -
>  nvidia/gp106/gr/fecs_bl.bin        |   1 -
>  nvidia/gp106/gr/fecs_inst.bin      |   1 -
>  nvidia/gp106/gr/gpccs_bl.bin       |   1 -
>  nvidia/gp106/gr/gpccs_inst.bin     |   1 -
>  nvidia/gp106/gr/sw_bundle_init.bin |   1 -
>  nvidia/gp106/gr/sw_ctx.bin         |   1 -
>  nvidia/gp106/gr/sw_method_init.bin |   1 -
>  nvidia/gp106/gr/sw_nonctx.bin      |   1 -
>  nvidia/gp106/nvdec/scrubber.bin    |   1 -
>  nvidia/gp106/sec2/desc-1.bin       |   1 -
>  nvidia/gp106/sec2/desc.bin         |   1 -
>  nvidia/gp106/sec2/image-1.bin      |   1 -
>  nvidia/gp106/sec2/image.bin        |   1 -
>  nvidia/gp106/sec2/sig-1.bin        |   1 -
>  nvidia/gp106/sec2/sig.bin          |   1 -
>  nvidia/gp107/acr/bl.bin            |   1 -
>  nvidia/gp107/acr/ucode_load.bin    |   1 -
>  nvidia/gp107/acr/ucode_unload.bin  |   1 -
>  nvidia/gp107/acr/unload_bl.bin     |   1 -
>  nvidia/gp107/gr/sw_bundle_init.bin |   1 -
>  nvidia/gp107/gr/sw_method_init.bin |   1 -
>  nvidia/gp107/nvdec/scrubber.bin    |   1 -
>  nvidia/gp107/sec2/desc-1.bin       |   1 -
>  nvidia/gp107/sec2/desc.bin         |   1 -
>  nvidia/gp107/sec2/image-1.bin      |   1 -
>  nvidia/gp107/sec2/image.bin        |   1 -
>  nvidia/gp107/sec2/sig-1.bin        |   1 -
>  nvidia/gp107/sec2/sig.bin          |   1 -
>  nvidia/gp108/acr/bl.bin            |   1 -
>  nvidia/gp108/acr/ucode_load.bin    |   1 -
>  nvidia/gp108/acr/ucode_unload.bin  |   1 -
>  nvidia/gp108/acr/unload_bl.bin     |   1 -
>  nvidia/gp108/nvdec/scrubber.bin    |   1 -
>  nvidia/gp108/sec2/desc.bin         |   1 -
>  nvidia/gp108/sec2/image.bin        |   1 -
>  nvidia/gp108/sec2/sig.bin          |   1 -
>  nvidia/tu104/acr/bl.bin            |   1 -
>  nvidia/tu104/acr/ucode_ahesasc.bin |   1 -
>  nvidia/tu104/acr/ucode_asb.bin     |   1 -
>  nvidia/tu104/acr/ucode_unload.bin  |   1 -
>  nvidia/tu104/acr/unload_bl.bin     |   1 -
>  nvidia/tu104/gr/fecs_bl.bin        |   1 -
>  nvidia/tu104/gr/gpccs_bl.bin       |   1 -
>  nvidia/tu104/nvdec/scrubber.bin    |   1 -
>  nvidia/tu104/sec2/desc.bin         |   1 -
>  nvidia/tu104/sec2/image.bin        |   1 -
>  nvidia/tu104/sec2/sig.bin          |   1 -
>  nvidia/tu106/acr/bl.bin            |   1 -
>  nvidia/tu106/acr/ucode_ahesasc.bin |   1 -
>  nvidia/tu106/acr/ucode_asb.bin     |   1 -
>  nvidia/tu106/acr/ucode_unload.bin  |   1 -
>  nvidia/tu106/acr/unload_bl.bin     |   1 -
>  nvidia/tu106/gr/fecs_bl.bin        |   1 -
>  nvidia/tu106/gr/gpccs_bl.bin       |   1 -
>  nvidia/tu106/nvdec/scrubber.bin    |   1 -
>  nvidia/tu106/sec2/desc.bin         |   1 -
>  nvidia/tu106/sec2/image.bin        |   1 -
>  nvidia/tu106/sec2/sig.bin          |   1 -
>  nvidia/tu117/acr/bl.bin            |   1 -
>  nvidia/tu117/acr/ucode_ahesasc.bin |   1 -
>  nvidia/tu117/acr/ucode_asb.bin     |   1 -
>  nvidia/tu117/acr/ucode_unload.bin  |   1 -
>  nvidia/tu117/acr/unload_bl.bin     |   1 -
>  nvidia/tu117/gr/fecs_bl.bin        |   1 -
>  nvidia/tu117/gr/gpccs_bl.bin       |   1 -
>  nvidia/tu117/nvdec/scrubber.bin    |   1 -
>  nvidia/tu117/sec2/desc.bin         |   1 -
>  nvidia/tu117/sec2/image.bin        |   1 -
>  nvidia/tu117/sec2/sig.bin          |   1 -
>  116 files changed, 115 insertions(+), 230 deletions(-)
>  delete mode 120000 nvidia/gm204/acr/bl.bin
>  delete mode 120000 nvidia/gm204/acr/ucode_load.bin
>  delete mode 120000 nvidia/gm204/acr/ucode_unload.bin
>  delete mode 120000 nvidia/gm204/gr/fecs_bl.bin
>  delete mode 120000 nvidia/gm204/gr/fecs_inst.bin
>  delete mode 120000 nvidia/gm204/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/gm204/gr/gpccs_inst.bin
>  delete mode 120000 nvidia/gm204/gr/sw_bundle_init.bin
>  delete mode 120000 nvidia/gm204/gr/sw_ctx.bin
>  delete mode 120000 nvidia/gm204/gr/sw_method_init.bin
>  delete mode 120000 nvidia/gm204/gr/sw_nonctx.bin
>  delete mode 120000 nvidia/gm206/acr/bl.bin
>  delete mode 120000 nvidia/gm206/gr/fecs_bl.bin
>  delete mode 120000 nvidia/gm206/gr/fecs_inst.bin
>  delete mode 120000 nvidia/gm206/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/gm206/gr/gpccs_inst.bin
>  delete mode 120000 nvidia/gm206/gr/sw_bundle_init.bin
>  delete mode 120000 nvidia/gm206/gr/sw_ctx.bin
>  delete mode 120000 nvidia/gm206/gr/sw_method_init.bin
>  delete mode 120000 nvidia/gm206/gr/sw_nonctx.bin
>  delete mode 120000 nvidia/gm20b/gr/sw_method_init.bin
>  delete mode 120000 nvidia/gp100/gr/fecs_bl.bin
>  delete mode 120000 nvidia/gp100/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/gp102/gr/fecs_bl.bin
>  delete mode 120000 nvidia/gp102/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/gp104/acr/bl.bin
>  delete mode 120000 nvidia/gp104/acr/ucode_load.bin
>  delete mode 120000 nvidia/gp104/acr/ucode_unload.bin
>  delete mode 120000 nvidia/gp104/acr/unload_bl.bin
>  delete mode 120000 nvidia/gp104/gr/fecs_bl.bin
>  delete mode 120000 nvidia/gp104/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/gp104/gr/sw_bundle_init.bin
>  delete mode 120000 nvidia/gp104/gr/sw_ctx.bin
>  delete mode 120000 nvidia/gp104/gr/sw_method_init.bin
>  delete mode 120000 nvidia/gp104/gr/sw_nonctx.bin
>  delete mode 120000 nvidia/gp104/nvdec/scrubber.bin
>  delete mode 120000 nvidia/gp104/sec2/desc-1.bin
>  delete mode 120000 nvidia/gp104/sec2/desc.bin
>  delete mode 120000 nvidia/gp104/sec2/image-1.bin
>  delete mode 120000 nvidia/gp104/sec2/image.bin
>  delete mode 120000 nvidia/gp104/sec2/sig-1.bin
>  delete mode 120000 nvidia/gp104/sec2/sig.bin
>  delete mode 120000 nvidia/gp106/acr/bl.bin
>  delete mode 120000 nvidia/gp106/acr/ucode_load.bin
>  delete mode 120000 nvidia/gp106/acr/ucode_unload.bin
>  delete mode 120000 nvidia/gp106/acr/unload_bl.bin
>  delete mode 120000 nvidia/gp106/gr/fecs_bl.bin
>  delete mode 120000 nvidia/gp106/gr/fecs_inst.bin
>  delete mode 120000 nvidia/gp106/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/gp106/gr/gpccs_inst.bin
>  delete mode 120000 nvidia/gp106/gr/sw_bundle_init.bin
>  delete mode 120000 nvidia/gp106/gr/sw_ctx.bin
>  delete mode 120000 nvidia/gp106/gr/sw_method_init.bin
>  delete mode 120000 nvidia/gp106/gr/sw_nonctx.bin
>  delete mode 120000 nvidia/gp106/nvdec/scrubber.bin
>  delete mode 120000 nvidia/gp106/sec2/desc-1.bin
>  delete mode 120000 nvidia/gp106/sec2/desc.bin
>  delete mode 120000 nvidia/gp106/sec2/image-1.bin
>  delete mode 120000 nvidia/gp106/sec2/image.bin
>  delete mode 120000 nvidia/gp106/sec2/sig-1.bin
>  delete mode 120000 nvidia/gp106/sec2/sig.bin
>  delete mode 120000 nvidia/gp107/acr/bl.bin
>  delete mode 120000 nvidia/gp107/acr/ucode_load.bin
>  delete mode 120000 nvidia/gp107/acr/ucode_unload.bin
>  delete mode 120000 nvidia/gp107/acr/unload_bl.bin
>  delete mode 120000 nvidia/gp107/gr/sw_bundle_init.bin
>  delete mode 120000 nvidia/gp107/gr/sw_method_init.bin
>  delete mode 120000 nvidia/gp107/nvdec/scrubber.bin
>  delete mode 120000 nvidia/gp107/sec2/desc-1.bin
>  delete mode 120000 nvidia/gp107/sec2/desc.bin
>  delete mode 120000 nvidia/gp107/sec2/image-1.bin
>  delete mode 120000 nvidia/gp107/sec2/image.bin
>  delete mode 120000 nvidia/gp107/sec2/sig-1.bin
>  delete mode 120000 nvidia/gp107/sec2/sig.bin
>  delete mode 120000 nvidia/gp108/acr/bl.bin
>  delete mode 120000 nvidia/gp108/acr/ucode_load.bin
>  delete mode 120000 nvidia/gp108/acr/ucode_unload.bin
>  delete mode 120000 nvidia/gp108/acr/unload_bl.bin
>  delete mode 120000 nvidia/gp108/nvdec/scrubber.bin
>  delete mode 120000 nvidia/gp108/sec2/desc.bin
>  delete mode 120000 nvidia/gp108/sec2/image.bin
>  delete mode 120000 nvidia/gp108/sec2/sig.bin
>  delete mode 120000 nvidia/tu104/acr/bl.bin
>  delete mode 120000 nvidia/tu104/acr/ucode_ahesasc.bin
>  delete mode 120000 nvidia/tu104/acr/ucode_asb.bin
>  delete mode 120000 nvidia/tu104/acr/ucode_unload.bin
>  delete mode 120000 nvidia/tu104/acr/unload_bl.bin
>  delete mode 120000 nvidia/tu104/gr/fecs_bl.bin
>  delete mode 120000 nvidia/tu104/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/tu104/nvdec/scrubber.bin
>  delete mode 120000 nvidia/tu104/sec2/desc.bin
>  delete mode 120000 nvidia/tu104/sec2/image.bin
>  delete mode 120000 nvidia/tu104/sec2/sig.bin
>  delete mode 120000 nvidia/tu106/acr/bl.bin
>  delete mode 120000 nvidia/tu106/acr/ucode_ahesasc.bin
>  delete mode 120000 nvidia/tu106/acr/ucode_asb.bin
>  delete mode 120000 nvidia/tu106/acr/ucode_unload.bin
>  delete mode 120000 nvidia/tu106/acr/unload_bl.bin
>  delete mode 120000 nvidia/tu106/gr/fecs_bl.bin
>  delete mode 120000 nvidia/tu106/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/tu106/nvdec/scrubber.bin
>  delete mode 120000 nvidia/tu106/sec2/desc.bin
>  delete mode 120000 nvidia/tu106/sec2/image.bin
>  delete mode 120000 nvidia/tu106/sec2/sig.bin
>  delete mode 120000 nvidia/tu117/acr/bl.bin
>  delete mode 120000 nvidia/tu117/acr/ucode_ahesasc.bin
>  delete mode 120000 nvidia/tu117/acr/ucode_asb.bin
>  delete mode 120000 nvidia/tu117/acr/ucode_unload.bin
>  delete mode 120000 nvidia/tu117/acr/unload_bl.bin
>  delete mode 120000 nvidia/tu117/gr/fecs_bl.bin
>  delete mode 120000 nvidia/tu117/gr/gpccs_bl.bin
>  delete mode 120000 nvidia/tu117/nvdec/scrubber.bin
>  delete mode 120000 nvidia/tu117/sec2/desc.bin
>  delete mode 120000 nvidia/tu117/sec2/image.bin
>  delete mode 120000 nvidia/tu117/sec2/sig.bin
>
> diff --git a/WHENCE b/WHENCE
> index 4faf0d0..6ceac11 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -4195,36 +4195,36 @@ File: nvidia/gm200/gr/sw_bundle_init.bin
>  File: nvidia/gm200/gr/sw_ctx.bin
>  File: nvidia/gm200/gr/sw_method_init.bin
>  File: nvidia/gm200/gr/sw_nonctx.bin
> -File: nvidia/gm204/acr/bl.bin
> -File: nvidia/gm204/acr/ucode_load.bin
> -File: nvidia/gm204/acr/ucode_unload.bin
> -File: nvidia/gm204/gr/fecs_bl.bin
> +Link: nvidia/gm204/acr/bl.bin -> ../../gm200/acr/bl.bin
> +Link: nvidia/gm204/acr/ucode_load.bin -> ../../gm200/acr/ucode_load.bin
> +Link: nvidia/gm204/acr/ucode_unload.bin -> ../../gm200/acr/ucode_unload.bin
> +Link: nvidia/gm204/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
>  File: nvidia/gm204/gr/fecs_data.bin
> -File: nvidia/gm204/gr/fecs_inst.bin
> +Link: nvidia/gm204/gr/fecs_inst.bin -> ../../gm200/gr/fecs_inst.bin
>  File: nvidia/gm204/gr/fecs_sig.bin
> -File: nvidia/gm204/gr/gpccs_bl.bin
> +Link: nvidia/gm204/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
>  File: nvidia/gm204/gr/gpccs_data.bin
> -File: nvidia/gm204/gr/gpccs_inst.bin
> +Link: nvidia/gm204/gr/gpccs_inst.bin -> ../../gm200/gr/gpccs_inst.bin
>  File: nvidia/gm204/gr/gpccs_sig.bin
> -File: nvidia/gm204/gr/sw_bundle_init.bin
> -File: nvidia/gm204/gr/sw_ctx.bin
> -File: nvidia/gm204/gr/sw_method_init.bin
> -File: nvidia/gm204/gr/sw_nonctx.bin
> -File: nvidia/gm206/acr/bl.bin
> +Link: nvidia/gm204/gr/sw_bundle_init.bin -> ../../gm200/gr/sw_bundle_init.bin
> +Link: nvidia/gm204/gr/sw_ctx.bin -> ../../gm200/gr/sw_ctx.bin
> +Link: nvidia/gm204/gr/sw_method_init.bin -> ../../gm200/gr/sw_method_init.bin
> +Link: nvidia/gm204/gr/sw_nonctx.bin -> ../../gm200/gr/sw_nonctx.bin
> +Link: nvidia/gm206/acr/bl.bin  -> ../../gm200/acr/bl.bin
>  File: nvidia/gm206/acr/ucode_load.bin
>  File: nvidia/gm206/acr/ucode_unload.bin
> -File: nvidia/gm206/gr/fecs_bl.bin
> +Link: nvidia/gm206/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
>  File: nvidia/gm206/gr/fecs_data.bin
> -File: nvidia/gm206/gr/fecs_inst.bin
> +Link: nvidia/gm206/gr/fecs_inst.bin -> ../../gm200/gr/fecs_inst.bin
>  File: nvidia/gm206/gr/fecs_sig.bin
> -File: nvidia/gm206/gr/gpccs_bl.bin
> +Link: nvidia/gm206/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
>  File: nvidia/gm206/gr/gpccs_data.bin
> -File: nvidia/gm206/gr/gpccs_inst.bin
> +Link: nvidia/gm206/gr/gpccs_inst.bin -> ../../gm200/gr/gpccs_inst.bin
>  File: nvidia/gm206/gr/gpccs_sig.bin
> -File: nvidia/gm206/gr/sw_bundle_init.bin
> -File: nvidia/gm206/gr/sw_ctx.bin
> -File: nvidia/gm206/gr/sw_method_init.bin
> -File: nvidia/gm206/gr/sw_nonctx.bin
> +Link: nvidia/gm206/gr/sw_bundle_init.bin -> ../../gm200/gr/sw_bundle_init.bin
> +File: nvidia/gm206/gr/sw_ctx.bin -> ../../gm200/gr/sw_ctx.bin
> +Link: nvidia/gm206/gr/sw_method_init.bin -> ../../gm200/gr/sw_method_init.bin
> +Link: nvidia/gm206/gr/sw_nonctx.bin -> ../../gm200/gr/sw_nonctx.bin
>  File: nvidia/gm20b/acr/bl.bin
>  File: nvidia/gm20b/acr/ucode_load.bin
>  File: nvidia/gm20b/gr/fecs_bl.bin
> @@ -4235,7 +4235,7 @@ File: nvidia/gm20b/gr/gpccs_data.bin
>  File: nvidia/gm20b/gr/gpccs_inst.bin
>  File: nvidia/gm20b/gr/sw_bundle_init.bin
>  File: nvidia/gm20b/gr/sw_ctx.bin
> -File: nvidia/gm20b/gr/sw_method_init.bin
> +Link: nvidia/gm20b/gr/sw_method_init.bin -> ../../gm200/gr/sw_method_init.bin
>  File: nvidia/gm20b/gr/sw_nonctx.bin
>  File: nvidia/gm20b/pmu/desc.bin
>  File: nvidia/gm20b/pmu/image.bin
> @@ -4243,11 +4243,11 @@ File: nvidia/gm20b/pmu/sig.bin
>  File: nvidia/gp100/acr/bl.bin
>  File: nvidia/gp100/acr/ucode_load.bin
>  File: nvidia/gp100/acr/ucode_unload.bin
> -File: nvidia/gp100/gr/fecs_bl.bin
> +Link: nvidia/gp100/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
>  File: nvidia/gp100/gr/fecs_data.bin
>  File: nvidia/gp100/gr/fecs_inst.bin
>  File: nvidia/gp100/gr/fecs_sig.bin
> -File: nvidia/gp100/gr/gpccs_bl.bin
> +Link: nvidia/gp100/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
>  File: nvidia/gp100/gr/gpccs_data.bin
>  File: nvidia/gp100/gr/gpccs_inst.bin
>  File: nvidia/gp100/gr/gpccs_sig.bin
> @@ -4259,11 +4259,11 @@ File: nvidia/gp102/acr/bl.bin
>  File: nvidia/gp102/acr/ucode_load.bin
>  File: nvidia/gp102/acr/ucode_unload.bin
>  File: nvidia/gp102/acr/unload_bl.bin
> -File: nvidia/gp102/gr/fecs_bl.bin
> +Link: nvidia/gp102/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
>  File: nvidia/gp102/gr/fecs_data.bin
>  File: nvidia/gp102/gr/fecs_inst.bin
>  File: nvidia/gp102/gr/fecs_sig.bin
> -File: nvidia/gp102/gr/gpccs_bl.bin
> +Link: nvidia/gp102/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
>  File: nvidia/gp102/gr/gpccs_data.bin
>  File: nvidia/gp102/gr/gpccs_inst.bin
>  File: nvidia/gp102/gr/gpccs_sig.bin
> @@ -4278,56 +4278,56 @@ File: nvidia/gp102/sec2/sig.bin
>  File: nvidia/gp102/sec2/desc-1.bin
>  File: nvidia/gp102/sec2/image-1.bin
>  File: nvidia/gp102/sec2/sig-1.bin
> -File: nvidia/gp104/acr/bl.bin
> -File: nvidia/gp104/acr/ucode_load.bin
> -File: nvidia/gp104/acr/ucode_unload.bin
> -File: nvidia/gp104/acr/unload_bl.bin
> -File: nvidia/gp104/gr/fecs_bl.bin
> +Link: nvidia/gp104/acr/bl.bin -> ../../gp102/acr/bl.bin
> +Link: nvidia/gp104/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
> +Link: nvidia/gp104/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
> +Link: nvidia/gp104/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
> +Link: nvidia/gp104/gr/fecs_bl.bin -> ../../gp102/gr/fecs_bl.bin
>  File: nvidia/gp104/gr/fecs_data.bin
>  File: nvidia/gp104/gr/fecs_inst.bin
>  File: nvidia/gp104/gr/fecs_sig.bin
> -File: nvidia/gp104/gr/gpccs_bl.bin
> +Link: nvidia/gp104/gr/gpccs_bl.bin -> ../../gp102/gr/gpccs_bl.bin
>  File: nvidia/gp104/gr/gpccs_data.bin
>  File: nvidia/gp104/gr/gpccs_inst.bin
>  File: nvidia/gp104/gr/gpccs_sig.bin
> -File: nvidia/gp104/gr/sw_bundle_init.bin
> -File: nvidia/gp104/gr/sw_ctx.bin
> -File: nvidia/gp104/gr/sw_method_init.bin
> -File: nvidia/gp104/gr/sw_nonctx.bin
> -File: nvidia/gp104/nvdec/scrubber.bin
> -File: nvidia/gp104/sec2/desc.bin
> -File: nvidia/gp104/sec2/image.bin
> -File: nvidia/gp104/sec2/sig.bin
> -File: nvidia/gp104/sec2/desc-1.bin
> -File: nvidia/gp104/sec2/image-1.bin
> -File: nvidia/gp104/sec2/sig-1.bin
> -File: nvidia/gp106/acr/bl.bin
> -File: nvidia/gp106/acr/ucode_load.bin
> -File: nvidia/gp106/acr/ucode_unload.bin
> -File: nvidia/gp106/acr/unload_bl.bin
> -File: nvidia/gp106/gr/fecs_bl.bin
> +Link: nvidia/gp104/gr/sw_bundle_init.bin -> ../../gp102/gr/sw_bundle_init.bin
> +Link: nvidia/gp104/gr/sw_ctx.bin -> ../../gp102/gr/sw_ctx.bin
> +Link: nvidia/gp104/gr/sw_method_init.bin -> ../../gp102/gr/sw_method_init.bin
> +Link: nvidia/gp104/gr/sw_nonctx.bin -> ../../gp102/gr/sw_nonctx.bin
> +Link: nvidia/gp104/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
> +Link: nvidia/gp104/sec2/desc.bin -> ../../gp102/sec2/desc.bin
> +Link: nvidia/gp104/sec2/image.bin -> ../../gp102/sec2/image.bin
> +Link: nvidia/gp104/sec2/sig.bin -> ../../gp102/sec2/sig.bin
> +Link: nvidia/gp104/sec2/desc-1.bin -> ../../gp102/sec2/desc-1.bin
> +Link: nvidia/gp104/sec2/image-1.bin -> ../../gp102/sec2/image-1.bin
> +Link: nvidia/gp104/sec2/sig-1.bin -> ../../gp102/sec2/sig-1.bin
> +Link: nvidia/gp106/acr/bl.bin -> ../../gp102/acr/bl.bin
> +Link: nvidia/gp106/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
> +Link: nvidia/gp106/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
> +Link: nvidia/gp106/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
> +Link: nvidia/gp106/gr/fecs_bl.bin -> ../../gp102/gr/fecs_bl.bin
>  File: nvidia/gp106/gr/fecs_data.bin
> -File: nvidia/gp106/gr/fecs_inst.bin
> +Link: nvidia/gp106/gr/fecs_inst.bin -> ../../gp102/gr/fecs_inst.bin
>  File: nvidia/gp106/gr/fecs_sig.bin
> -File: nvidia/gp106/gr/gpccs_bl.bin
> +Link: nvidia/gp106/gr/gpccs_bl.bin -> ../../gp102/gr/gpccs_bl.bin
>  File: nvidia/gp106/gr/gpccs_data.bin
> -File: nvidia/gp106/gr/gpccs_inst.bin
> +Link: nvidia/gp106/gr/gpccs_inst.bin -> ../../gp102/gr/gpccs_inst.bin
>  File: nvidia/gp106/gr/gpccs_sig.bin
> -File: nvidia/gp106/gr/sw_bundle_init.bin
> -File: nvidia/gp106/gr/sw_ctx.bin
> -File: nvidia/gp106/gr/sw_method_init.bin
> -File: nvidia/gp106/gr/sw_nonctx.bin
> -File: nvidia/gp106/nvdec/scrubber.bin
> -File: nvidia/gp106/sec2/desc.bin
> -File: nvidia/gp106/sec2/image.bin
> -File: nvidia/gp106/sec2/sig.bin
> -File: nvidia/gp106/sec2/desc-1.bin
> -File: nvidia/gp106/sec2/image-1.bin
> -File: nvidia/gp106/sec2/sig-1.bin
> -File: nvidia/gp107/acr/bl.bin
> -File: nvidia/gp107/acr/ucode_load.bin
> -File: nvidia/gp107/acr/ucode_unload.bin
> -File: nvidia/gp107/acr/unload_bl.bin
> +Link: nvidia/gp106/gr/sw_bundle_init.bin -> ../../gp102/gr/sw_bundle_init.bin
> +Link: nvidia/gp106/gr/sw_ctx.bin -> ../../gp102/gr/sw_ctx.bin
> +Link: nvidia/gp106/gr/sw_method_init.bin -> ../../gp102/gr/sw_method_init.bin
> +Link: nvidia/gp106/gr/sw_nonctx.bin -> ../../gp102/gr/sw_nonctx.bin
> +Link: nvidia/gp106/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
> +Link: nvidia/gp106/sec2/desc.bin -> ../../gp102/sec2/desc.bin
> +Link: nvidia/gp106/sec2/image.bin -> ../../gp102/sec2/image.bin
> +Link: nvidia/gp106/sec2/sig.bin -> ../../gp102/sec2/sig.bin
> +Link: nvidia/gp106/sec2/desc-1.bin -> ../../gp102/sec2/desc-1.bin
> +Link: nvidia/gp106/sec2/image-1.bin -> ../../gp102/sec2/image-1.bin
> +Link: nvidia/gp106/sec2/sig-1.bin -> ../../gp102/sec2/sig-1.bin
> +Link: nvidia/gp107/acr/bl.bin -> ../../gp102/acr/bl.bin
> +Link: nvidia/gp107/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
> +Link: nvidia/gp107/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
> +Link: nvidia/gp107/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
>  File: nvidia/gp107/gr/fecs_bl.bin
>  File: nvidia/gp107/gr/fecs_data.bin
>  File: nvidia/gp107/gr/fecs_inst.bin
> @@ -4336,17 +4336,17 @@ File: nvidia/gp107/gr/gpccs_bl.bin
>  File: nvidia/gp107/gr/gpccs_data.bin
>  File: nvidia/gp107/gr/gpccs_inst.bin
>  File: nvidia/gp107/gr/gpccs_sig.bin
> -File: nvidia/gp107/gr/sw_bundle_init.bin
> +Link: nvidia/gp107/gr/sw_bundle_init.bin -> ../../gp102/gr/sw_bundle_init.bin
>  File: nvidia/gp107/gr/sw_ctx.bin
> -File: nvidia/gp107/gr/sw_method_init.bin
> +Link: nvidia/gp107/gr/sw_method_init.bin -> ../../gp102/gr/sw_method_init.bin
>  File: nvidia/gp107/gr/sw_nonctx.bin
> -File: nvidia/gp107/nvdec/scrubber.bin
> -File: nvidia/gp107/sec2/desc.bin
> -File: nvidia/gp107/sec2/image.bin
> -File: nvidia/gp107/sec2/sig.bin
> -File: nvidia/gp107/sec2/desc-1.bin
> -File: nvidia/gp107/sec2/image-1.bin
> -File: nvidia/gp107/sec2/sig-1.bin
> +Link: nvidia/gp107/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
> +Link: nvidia/gp107/sec2/desc.bin -> ../../gp102/sec2/desc.bin
> +Link: nvidia/gp107/sec2/image.bin -> ../../gp102/sec2/image.bin
> +Link: nvidia/gp107/sec2/sig.bin -> ../../gp102/sec2/sig.bin
> +Link: nvidia/gp107/sec2/desc-1.bin -> ../../gp102/sec2/desc-1.bin
> +Link: nvidia/gp107/sec2/image-1.bin -> ../../gp102/sec2/image-1.bin
> +Link: nvidia/gp107/sec2/sig-1.bin -> ../../gp102/sec2/sig-1.bin
>  File: nvidia/gp10b/acr/bl.bin
>  File: nvidia/gp10b/acr/ucode_load.bin
>  File: nvidia/gp10b/gr/fecs_bl.bin
> @@ -4364,10 +4364,10 @@ File: nvidia/gp10b/gr/sw_nonctx.bin
>  File: nvidia/gp10b/pmu/desc.bin
>  File: nvidia/gp10b/pmu/image.bin
>  File: nvidia/gp10b/pmu/sig.bin
> -File: nvidia/gp108/acr/bl.bin
> -File: nvidia/gp108/acr/ucode_load.bin
> -File: nvidia/gp108/acr/ucode_unload.bin
> -File: nvidia/gp108/acr/unload_bl.bin
> +Link: nvidia/gp108/acr/bl.bin -> ../../gp102/acr/bl.bin
> +Link: nvidia/gp108/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
> +Link: nvidia/gp108/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
> +Link: nvidia/gp108/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
>  File: nvidia/gp108/gr/fecs_bl.bin
>  File: nvidia/gp108/gr/fecs_data.bin
>  File: nvidia/gp108/gr/fecs_inst.bin
> @@ -4380,10 +4380,10 @@ File: nvidia/gp108/gr/sw_bundle_init.bin
>  File: nvidia/gp108/gr/sw_ctx.bin
>  File: nvidia/gp108/gr/sw_method_init.bin
>  File: nvidia/gp108/gr/sw_nonctx.bin
> -File: nvidia/gp108/nvdec/scrubber.bin
> -File: nvidia/gp108/sec2/desc.bin
> -File: nvidia/gp108/sec2/image.bin
> -File: nvidia/gp108/sec2/sig.bin
> +Link: nvidia/gp108/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
> +Link: nvidia/gp108/sec2/desc.bin -> ../../gp102/sec2/desc-1.bin
> +Link: nvidia/gp108/sec2/image.bin -> ../../gp102/sec2/image-1.bin
> +Link: nvidia/gp108/sec2/sig.bin -> ../../gp102/sec2/sig-1.bin
>  File: nvidia/gv100/acr/bl.bin
>  File: nvidia/gv100/acr/ucode_load.bin
>  File: nvidia/gv100/acr/ucode_unload.bin
> @@ -4426,16 +4426,16 @@ File: nvidia/tu102/nvdec/scrubber.bin
>  File: nvidia/tu102/sec2/desc.bin
>  File: nvidia/tu102/sec2/image.bin
>  File: nvidia/tu102/sec2/sig.bin
> -File: nvidia/tu104/acr/bl.bin
> -File: nvidia/tu104/acr/ucode_ahesasc.bin
> -File: nvidia/tu104/acr/ucode_asb.bin
> -File: nvidia/tu104/acr/unload_bl.bin
> -File: nvidia/tu104/acr/ucode_unload.bin
> -File: nvidia/tu104/gr/fecs_bl.bin
> +Link: nvidia/tu104/acr/bl.bin -> ../../tu102/acr/bl.bin
> +Link: nvidia/tu104/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
> +Link: nvidia/tu104/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
> +Link: nvidia/tu104/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
> +Link: nvidia/tu104/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
> +Link: nvidia/tu104/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
>  File: nvidia/tu104/gr/fecs_data.bin
>  File: nvidia/tu104/gr/fecs_inst.bin
>  File: nvidia/tu104/gr/fecs_sig.bin
> -File: nvidia/tu104/gr/gpccs_bl.bin
> +Link: nvidia/tu104/gr/gpccs_bl.bin -> ../../tu102/gr/gpccs_bl.bin
>  File: nvidia/tu104/gr/gpccs_data.bin
>  File: nvidia/tu104/gr/gpccs_inst.bin
>  File: nvidia/tu104/gr/gpccs_sig.bin
> @@ -4444,20 +4444,20 @@ File: nvidia/tu104/gr/sw_ctx.bin
>  File: nvidia/tu104/gr/sw_method_init.bin
>  File: nvidia/tu104/gr/sw_nonctx.bin
>  File: nvidia/tu104/gr/sw_veid_bundle_init.bin
> -File: nvidia/tu104/nvdec/scrubber.bin
> -File: nvidia/tu104/sec2/desc.bin
> -File: nvidia/tu104/sec2/image.bin
> -File: nvidia/tu104/sec2/sig.bin
> -File: nvidia/tu106/acr/bl.bin
> -File: nvidia/tu106/acr/ucode_ahesasc.bin
> -File: nvidia/tu106/acr/ucode_asb.bin
> -File: nvidia/tu106/acr/unload_bl.bin
> -File: nvidia/tu106/acr/ucode_unload.bin
> -File: nvidia/tu106/gr/fecs_bl.bin
> +Link: nvidia/tu104/nvdec/scrubber.bin -> ../../tu102/nvdec/scrubber.bin
> +Link: nvidia/tu104/sec2/desc.bin -> ../../tu102/sec2/desc.bin
> +Link: nvidia/tu104/sec2/image.bin -> ../../tu102/sec2/image.bin
> +Link: nvidia/tu104/sec2/sig.bin -> ../../tu102/sec2/sig.bin
> +Link: nvidia/tu106/acr/bl.bin -> ../../tu102/acr/bl.bin
> +Link: nvidia/tu106/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
> +Link: nvidia/tu106/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
> +Link: nvidia/tu106/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
> +Link: nvidia/tu106/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
> +Link: nvidia/tu106/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
>  File: nvidia/tu106/gr/fecs_data.bin
>  File: nvidia/tu106/gr/fecs_inst.bin
>  File: nvidia/tu106/gr/fecs_sig.bin
> -File: nvidia/tu106/gr/gpccs_bl.bin
> +Link: nvidia/tu106/gr/gpccs_bl.bin -> ../../tu102/gr/gpccs_bl.bin
>  File: nvidia/tu106/gr/gpccs_data.bin
>  File: nvidia/tu106/gr/gpccs_inst.bin
>  File: nvidia/tu106/gr/gpccs_sig.bin
> @@ -4466,10 +4466,10 @@ File: nvidia/tu106/gr/sw_ctx.bin
>  File: nvidia/tu106/gr/sw_method_init.bin
>  File: nvidia/tu106/gr/sw_nonctx.bin
>  File: nvidia/tu106/gr/sw_veid_bundle_init.bin
> -File: nvidia/tu106/nvdec/scrubber.bin
> -File: nvidia/tu106/sec2/desc.bin
> -File: nvidia/tu106/sec2/image.bin
> -File: nvidia/tu106/sec2/sig.bin
> +Link: nvidia/tu106/nvdec/scrubber.bin -> ../../tu102/nvdec/scrubber.bin
> +Link: nvidia/tu106/sec2/desc.bin -> ../../tu102/sec2/desc.bin
> +Link: nvidia/tu106/sec2/image.bin -> ../../tu102/sec2/image.bin
> +Link: nvidia/tu106/sec2/sig.bin -> ../../tu102/sec2/sig.bin
>  File: nvidia/tu116/acr/bl.bin
>  File: nvidia/tu116/acr/ucode_ahesasc.bin
>  File: nvidia/tu116/acr/ucode_asb.bin
> @@ -4492,16 +4492,16 @@ File: nvidia/tu116/nvdec/scrubber.bin
>  File: nvidia/tu116/sec2/desc.bin
>  File: nvidia/tu116/sec2/image.bin
>  File: nvidia/tu116/sec2/sig.bin
> -File: nvidia/tu117/acr/bl.bin
> -File: nvidia/tu117/acr/ucode_ahesasc.bin
> -File: nvidia/tu117/acr/ucode_asb.bin
> -File: nvidia/tu117/acr/ucode_unload.bin
> -File: nvidia/tu117/acr/unload_bl.bin
> -File: nvidia/tu117/gr/fecs_bl.bin
> +Link: nvidia/tu117/acr/bl.bin -> ../../tu116/acr/bl.bin
> +Link: nvidia/tu117/acr/ucode_ahesasc.bin -> ../../tu116/acr/ucode_ahesasc.bin
> +Link: nvidia/tu117/acr/ucode_asb.bin -> ../../tu116/acr/ucode_asb.bin
> +Link: nvidia/tu117/acr/ucode_unload.bin -> ../../tu116/acr/ucode_unload.bin
> +Link: nvidia/tu117/acr/unload_bl.bin -> ../../tu116/acr/unload_bl.bin
> +Link: nvidia/tu117/gr/fecs_bl.bin -> ../../tu116/gr/fecs_bl.bin
>  File: nvidia/tu117/gr/fecs_data.bin
>  File: nvidia/tu117/gr/fecs_inst.bin
>  File: nvidia/tu117/gr/fecs_sig.bin
> -File: nvidia/tu117/gr/gpccs_bl.bin
> +Link: nvidia/tu117/gr/gpccs_bl.bin -> ../../tu116/gr/gpccs_bl.bin
>  File: nvidia/tu117/gr/gpccs_data.bin
>  File: nvidia/tu117/gr/gpccs_inst.bin
>  File: nvidia/tu117/gr/gpccs_sig.bin
> @@ -4510,10 +4510,10 @@ File: nvidia/tu117/gr/sw_ctx.bin
>  File: nvidia/tu117/gr/sw_method_init.bin
>  File: nvidia/tu117/gr/sw_nonctx.bin
>  File: nvidia/tu117/gr/sw_veid_bundle_init.bin
> -File: nvidia/tu117/nvdec/scrubber.bin
> -File: nvidia/tu117/sec2/desc.bin
> -File: nvidia/tu117/sec2/image.bin
> -File: nvidia/tu117/sec2/sig.bin
> +Link: nvidia/tu117/nvdec/scrubber.bin -> ../../tu116/nvdec/scrubber.bin
> +Link: nvidia/tu117/sec2/desc.bin -> ../../tu116/sec2/desc.bin
> +Link: nvidia/tu117/sec2/image.bin -> ../../tu116/sec2/image.bin
> +Link: nvidia/tu117/sec2/sig.bin -> ../../tu116/sec2/sig.bin
>
>  File: nvidia/tu10x/typec/ccg_primary.cyacd
>  File: nvidia/tu10x/typec/ccg_secondary.cyacd
> diff --git a/nvidia/gm204/acr/bl.bin b/nvidia/gm204/acr/bl.bin
> deleted file mode 120000
> index af6b991..0000000
> --- a/nvidia/gm204/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/acr/ucode_load.bin b/nvidia/gm204/acr/ucode_load.bin
> deleted file mode 120000
> index 015da47..0000000
> --- a/nvidia/gm204/acr/ucode_load.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/acr/ucode_load.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/acr/ucode_unload.bin b/nvidia/gm204/acr/ucode_unload.bin
> deleted file mode 120000
> index 2f4e7b1..0000000
> --- a/nvidia/gm204/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/fecs_bl.bin b/nvidia/gm204/gr/fecs_bl.bin
> deleted file mode 120000
> index 2cadb52..0000000
> --- a/nvidia/gm204/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/fecs_inst.bin b/nvidia/gm204/gr/fecs_inst.bin
> deleted file mode 120000
> index ad40ed4..0000000
> --- a/nvidia/gm204/gr/fecs_inst.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/fecs_inst.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/gpccs_bl.bin b/nvidia/gm204/gr/gpccs_bl.bin
> deleted file mode 120000
> index c99d4a3..0000000
> --- a/nvidia/gm204/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/gpccs_inst.bin b/nvidia/gm204/gr/gpccs_inst.bin
> deleted file mode 120000
> index 8bf4ebc..0000000
> --- a/nvidia/gm204/gr/gpccs_inst.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/gpccs_inst.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/sw_bundle_init.bin b/nvidia/gm204/gr/sw_bundle_init.bin
> deleted file mode 120000
> index a003fd7..0000000
> --- a/nvidia/gm204/gr/sw_bundle_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_bundle_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/sw_ctx.bin b/nvidia/gm204/gr/sw_ctx.bin
> deleted file mode 120000
> index 7b3e012..0000000
> --- a/nvidia/gm204/gr/sw_ctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_ctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/sw_method_init.bin b/nvidia/gm204/gr/sw_method_init.bin
> deleted file mode 120000
> index 13114cb..0000000
> --- a/nvidia/gm204/gr/sw_method_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_method_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gm204/gr/sw_nonctx.bin b/nvidia/gm204/gr/sw_nonctx.bin
> deleted file mode 120000
> index 9743f23..0000000
> --- a/nvidia/gm204/gr/sw_nonctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_nonctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/acr/bl.bin b/nvidia/gm206/acr/bl.bin
> deleted file mode 120000
> index af6b991..0000000
> --- a/nvidia/gm206/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/fecs_bl.bin b/nvidia/gm206/gr/fecs_bl.bin
> deleted file mode 120000
> index 2cadb52..0000000
> --- a/nvidia/gm206/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/fecs_inst.bin b/nvidia/gm206/gr/fecs_inst.bin
> deleted file mode 120000
> index ad40ed4..0000000
> --- a/nvidia/gm206/gr/fecs_inst.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/fecs_inst.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/gpccs_bl.bin b/nvidia/gm206/gr/gpccs_bl.bin
> deleted file mode 120000
> index c99d4a3..0000000
> --- a/nvidia/gm206/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/gpccs_inst.bin b/nvidia/gm206/gr/gpccs_inst.bin
> deleted file mode 120000
> index 8bf4ebc..0000000
> --- a/nvidia/gm206/gr/gpccs_inst.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/gpccs_inst.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/sw_bundle_init.bin b/nvidia/gm206/gr/sw_bundle_init.bin
> deleted file mode 120000
> index a003fd7..0000000
> --- a/nvidia/gm206/gr/sw_bundle_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_bundle_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/sw_ctx.bin b/nvidia/gm206/gr/sw_ctx.bin
> deleted file mode 120000
> index 7b3e012..0000000
> --- a/nvidia/gm206/gr/sw_ctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_ctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/sw_method_init.bin b/nvidia/gm206/gr/sw_method_init.bin
> deleted file mode 120000
> index 13114cb..0000000
> --- a/nvidia/gm206/gr/sw_method_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_method_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gm206/gr/sw_nonctx.bin b/nvidia/gm206/gr/sw_nonctx.bin
> deleted file mode 120000
> index 9743f23..0000000
> --- a/nvidia/gm206/gr/sw_nonctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_nonctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gm20b/gr/sw_method_init.bin b/nvidia/gm20b/gr/sw_method_init.bin
> deleted file mode 120000
> index 13114cb..0000000
> --- a/nvidia/gm20b/gr/sw_method_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/sw_method_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp100/gr/fecs_bl.bin b/nvidia/gp100/gr/fecs_bl.bin
> deleted file mode 120000
> index 2cadb52..0000000
> --- a/nvidia/gp100/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp100/gr/gpccs_bl.bin b/nvidia/gp100/gr/gpccs_bl.bin
> deleted file mode 120000
> index c99d4a3..0000000
> --- a/nvidia/gp100/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp102/gr/fecs_bl.bin b/nvidia/gp102/gr/fecs_bl.bin
> deleted file mode 120000
> index 2cadb52..0000000
> --- a/nvidia/gp102/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp102/gr/gpccs_bl.bin b/nvidia/gp102/gr/gpccs_bl.bin
> deleted file mode 120000
> index c99d4a3..0000000
> --- a/nvidia/gp102/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gm200/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/acr/bl.bin b/nvidia/gp104/acr/bl.bin
> deleted file mode 120000
> index 1aee06b..0000000
> --- a/nvidia/gp104/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/acr/ucode_load.bin b/nvidia/gp104/acr/ucode_load.bin
> deleted file mode 120000
> index cf78a87..0000000
> --- a/nvidia/gp104/acr/ucode_load.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_load.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/acr/ucode_unload.bin b/nvidia/gp104/acr/ucode_unload.bin
> deleted file mode 120000
> index 3d7bf76..0000000
> --- a/nvidia/gp104/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/acr/unload_bl.bin b/nvidia/gp104/acr/unload_bl.bin
> deleted file mode 120000
> index 67bc4ab..0000000
> --- a/nvidia/gp104/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/gr/fecs_bl.bin b/nvidia/gp104/gr/fecs_bl.bin
> deleted file mode 120000
> index c36d749..0000000
> --- a/nvidia/gp104/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/gr/gpccs_bl.bin b/nvidia/gp104/gr/gpccs_bl.bin
> deleted file mode 120000
> index 82f8824..0000000
> --- a/nvidia/gp104/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/gr/sw_bundle_init.bin b/nvidia/gp104/gr/sw_bundle_init.bin
> deleted file mode 120000
> index f9647d5..0000000
> --- a/nvidia/gp104/gr/sw_bundle_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_bundle_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/gr/sw_ctx.bin b/nvidia/gp104/gr/sw_ctx.bin
> deleted file mode 120000
> index 4381a88..0000000
> --- a/nvidia/gp104/gr/sw_ctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_ctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/gr/sw_method_init.bin b/nvidia/gp104/gr/sw_method_init.bin
> deleted file mode 120000
> index 9e03f7c..0000000
> --- a/nvidia/gp104/gr/sw_method_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_method_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/gr/sw_nonctx.bin b/nvidia/gp104/gr/sw_nonctx.bin
> deleted file mode 120000
> index f480468..0000000
> --- a/nvidia/gp104/gr/sw_nonctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_nonctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/nvdec/scrubber.bin b/nvidia/gp104/nvdec/scrubber.bin
> deleted file mode 120000
> index 06a089c..0000000
> --- a/nvidia/gp104/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/sec2/desc-1.bin b/nvidia/gp104/sec2/desc-1.bin
> deleted file mode 120000
> index 81f7815..0000000
> --- a/nvidia/gp104/sec2/desc-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/sec2/desc.bin b/nvidia/gp104/sec2/desc.bin
> deleted file mode 120000
> index e098655..0000000
> --- a/nvidia/gp104/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/sec2/image-1.bin b/nvidia/gp104/sec2/image-1.bin
> deleted file mode 120000
> index e2dc9d4..0000000
> --- a/nvidia/gp104/sec2/image-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/sec2/image.bin b/nvidia/gp104/sec2/image.bin
> deleted file mode 120000
> index fb46bf6..0000000
> --- a/nvidia/gp104/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/sec2/sig-1.bin b/nvidia/gp104/sec2/sig-1.bin
> deleted file mode 120000
> index 0de0448..0000000
> --- a/nvidia/gp104/sec2/sig-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp104/sec2/sig.bin b/nvidia/gp104/sec2/sig.bin
> deleted file mode 120000
> index c7acc34..0000000
> --- a/nvidia/gp104/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/acr/bl.bin b/nvidia/gp106/acr/bl.bin
> deleted file mode 120000
> index 1aee06b..0000000
> --- a/nvidia/gp106/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/acr/ucode_load.bin b/nvidia/gp106/acr/ucode_load.bin
> deleted file mode 120000
> index cf78a87..0000000
> --- a/nvidia/gp106/acr/ucode_load.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_load.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/acr/ucode_unload.bin b/nvidia/gp106/acr/ucode_unload.bin
> deleted file mode 120000
> index 3d7bf76..0000000
> --- a/nvidia/gp106/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/acr/unload_bl.bin b/nvidia/gp106/acr/unload_bl.bin
> deleted file mode 120000
> index 67bc4ab..0000000
> --- a/nvidia/gp106/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/fecs_bl.bin b/nvidia/gp106/gr/fecs_bl.bin
> deleted file mode 120000
> index c36d749..0000000
> --- a/nvidia/gp106/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/fecs_inst.bin b/nvidia/gp106/gr/fecs_inst.bin
> deleted file mode 120000
> index be8749f..0000000
> --- a/nvidia/gp106/gr/fecs_inst.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/fecs_inst.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/gpccs_bl.bin b/nvidia/gp106/gr/gpccs_bl.bin
> deleted file mode 120000
> index 82f8824..0000000
> --- a/nvidia/gp106/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/gpccs_inst.bin b/nvidia/gp106/gr/gpccs_inst.bin
> deleted file mode 120000
> index 17af2f4..0000000
> --- a/nvidia/gp106/gr/gpccs_inst.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/gpccs_inst.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/sw_bundle_init.bin b/nvidia/gp106/gr/sw_bundle_init.bin
> deleted file mode 120000
> index f9647d5..0000000
> --- a/nvidia/gp106/gr/sw_bundle_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_bundle_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/sw_ctx.bin b/nvidia/gp106/gr/sw_ctx.bin
> deleted file mode 120000
> index 4381a88..0000000
> --- a/nvidia/gp106/gr/sw_ctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_ctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/sw_method_init.bin b/nvidia/gp106/gr/sw_method_init.bin
> deleted file mode 120000
> index 9e03f7c..0000000
> --- a/nvidia/gp106/gr/sw_method_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_method_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/gr/sw_nonctx.bin b/nvidia/gp106/gr/sw_nonctx.bin
> deleted file mode 120000
> index f480468..0000000
> --- a/nvidia/gp106/gr/sw_nonctx.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_nonctx.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/nvdec/scrubber.bin b/nvidia/gp106/nvdec/scrubber.bin
> deleted file mode 120000
> index 06a089c..0000000
> --- a/nvidia/gp106/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/sec2/desc-1.bin b/nvidia/gp106/sec2/desc-1.bin
> deleted file mode 120000
> index 81f7815..0000000
> --- a/nvidia/gp106/sec2/desc-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/sec2/desc.bin b/nvidia/gp106/sec2/desc.bin
> deleted file mode 120000
> index e098655..0000000
> --- a/nvidia/gp106/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/sec2/image-1.bin b/nvidia/gp106/sec2/image-1.bin
> deleted file mode 120000
> index e2dc9d4..0000000
> --- a/nvidia/gp106/sec2/image-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/sec2/image.bin b/nvidia/gp106/sec2/image.bin
> deleted file mode 120000
> index fb46bf6..0000000
> --- a/nvidia/gp106/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/sec2/sig-1.bin b/nvidia/gp106/sec2/sig-1.bin
> deleted file mode 120000
> index 0de0448..0000000
> --- a/nvidia/gp106/sec2/sig-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp106/sec2/sig.bin b/nvidia/gp106/sec2/sig.bin
> deleted file mode 120000
> index c7acc34..0000000
> --- a/nvidia/gp106/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/acr/bl.bin b/nvidia/gp107/acr/bl.bin
> deleted file mode 120000
> index 1aee06b..0000000
> --- a/nvidia/gp107/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/acr/ucode_load.bin b/nvidia/gp107/acr/ucode_load.bin
> deleted file mode 120000
> index cf78a87..0000000
> --- a/nvidia/gp107/acr/ucode_load.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_load.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/acr/ucode_unload.bin b/nvidia/gp107/acr/ucode_unload.bin
> deleted file mode 120000
> index 3d7bf76..0000000
> --- a/nvidia/gp107/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/acr/unload_bl.bin b/nvidia/gp107/acr/unload_bl.bin
> deleted file mode 120000
> index 67bc4ab..0000000
> --- a/nvidia/gp107/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/gr/sw_bundle_init.bin b/nvidia/gp107/gr/sw_bundle_init.bin
> deleted file mode 120000
> index f9647d5..0000000
> --- a/nvidia/gp107/gr/sw_bundle_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_bundle_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/gr/sw_method_init.bin b/nvidia/gp107/gr/sw_method_init.bin
> deleted file mode 120000
> index 9e03f7c..0000000
> --- a/nvidia/gp107/gr/sw_method_init.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/gr/sw_method_init.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/nvdec/scrubber.bin b/nvidia/gp107/nvdec/scrubber.bin
> deleted file mode 120000
> index 06a089c..0000000
> --- a/nvidia/gp107/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/sec2/desc-1.bin b/nvidia/gp107/sec2/desc-1.bin
> deleted file mode 120000
> index 81f7815..0000000
> --- a/nvidia/gp107/sec2/desc-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/sec2/desc.bin b/nvidia/gp107/sec2/desc.bin
> deleted file mode 120000
> index e098655..0000000
> --- a/nvidia/gp107/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/sec2/image-1.bin b/nvidia/gp107/sec2/image-1.bin
> deleted file mode 120000
> index e2dc9d4..0000000
> --- a/nvidia/gp107/sec2/image-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/sec2/image.bin b/nvidia/gp107/sec2/image.bin
> deleted file mode 120000
> index fb46bf6..0000000
> --- a/nvidia/gp107/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/sec2/sig-1.bin b/nvidia/gp107/sec2/sig-1.bin
> deleted file mode 120000
> index 0de0448..0000000
> --- a/nvidia/gp107/sec2/sig-1.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp107/sec2/sig.bin b/nvidia/gp107/sec2/sig.bin
> deleted file mode 120000
> index c7acc34..0000000
> --- a/nvidia/gp107/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/acr/bl.bin b/nvidia/gp108/acr/bl.bin
> deleted file mode 120000
> index 1aee06b..0000000
> --- a/nvidia/gp108/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/acr/ucode_load.bin b/nvidia/gp108/acr/ucode_load.bin
> deleted file mode 120000
> index cf78a87..0000000
> --- a/nvidia/gp108/acr/ucode_load.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_load.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/acr/ucode_unload.bin b/nvidia/gp108/acr/ucode_unload.bin
> deleted file mode 120000
> index 3d7bf76..0000000
> --- a/nvidia/gp108/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/acr/unload_bl.bin b/nvidia/gp108/acr/unload_bl.bin
> deleted file mode 120000
> index 67bc4ab..0000000
> --- a/nvidia/gp108/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/nvdec/scrubber.bin b/nvidia/gp108/nvdec/scrubber.bin
> deleted file mode 120000
> index 06a089c..0000000
> --- a/nvidia/gp108/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/sec2/desc.bin b/nvidia/gp108/sec2/desc.bin
> deleted file mode 120000
> index 81f7815..0000000
> --- a/nvidia/gp108/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/desc-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/sec2/image.bin b/nvidia/gp108/sec2/image.bin
> deleted file mode 120000
> index e2dc9d4..0000000
> --- a/nvidia/gp108/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/image-1.bin
> \ No newline at end of file
> diff --git a/nvidia/gp108/sec2/sig.bin b/nvidia/gp108/sec2/sig.bin
> deleted file mode 120000
> index 0de0448..0000000
> --- a/nvidia/gp108/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../gp102/sec2/sig-1.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/acr/bl.bin b/nvidia/tu104/acr/bl.bin
> deleted file mode 120000
> index aa012a2..0000000
> --- a/nvidia/tu104/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/acr/ucode_ahesasc.bin b/nvidia/tu104/acr/ucode_ahesasc.bin
> deleted file mode 120000
> index 7c69051..0000000
> --- a/nvidia/tu104/acr/ucode_ahesasc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/ucode_ahesasc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/acr/ucode_asb.bin b/nvidia/tu104/acr/ucode_asb.bin
> deleted file mode 120000
> index 3ff7558..0000000
> --- a/nvidia/tu104/acr/ucode_asb.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/ucode_asb.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/acr/ucode_unload.bin b/nvidia/tu104/acr/ucode_unload.bin
> deleted file mode 120000
> index a96d703..0000000
> --- a/nvidia/tu104/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/acr/unload_bl.bin b/nvidia/tu104/acr/unload_bl.bin
> deleted file mode 120000
> index 15e0905..0000000
> --- a/nvidia/tu104/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/gr/fecs_bl.bin b/nvidia/tu104/gr/fecs_bl.bin
> deleted file mode 120000
> index dda1e65..0000000
> --- a/nvidia/tu104/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/gr/gpccs_bl.bin b/nvidia/tu104/gr/gpccs_bl.bin
> deleted file mode 120000
> index 4983072..0000000
> --- a/nvidia/tu104/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/nvdec/scrubber.bin b/nvidia/tu104/nvdec/scrubber.bin
> deleted file mode 120000
> index 892d6fd..0000000
> --- a/nvidia/tu104/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/sec2/desc.bin b/nvidia/tu104/sec2/desc.bin
> deleted file mode 120000
> index 67fc6d9..0000000
> --- a/nvidia/tu104/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/sec2/image.bin b/nvidia/tu104/sec2/image.bin
> deleted file mode 120000
> index 7bc2df1..0000000
> --- a/nvidia/tu104/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/tu104/sec2/sig.bin b/nvidia/tu104/sec2/sig.bin
> deleted file mode 120000
> index 24a48bb..0000000
> --- a/nvidia/tu104/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/sec2/sig.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/acr/bl.bin b/nvidia/tu106/acr/bl.bin
> deleted file mode 120000
> index aa012a2..0000000
> --- a/nvidia/tu106/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/acr/ucode_ahesasc.bin b/nvidia/tu106/acr/ucode_ahesasc.bin
> deleted file mode 120000
> index 7c69051..0000000
> --- a/nvidia/tu106/acr/ucode_ahesasc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/ucode_ahesasc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/acr/ucode_asb.bin b/nvidia/tu106/acr/ucode_asb.bin
> deleted file mode 120000
> index 3ff7558..0000000
> --- a/nvidia/tu106/acr/ucode_asb.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/ucode_asb.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/acr/ucode_unload.bin b/nvidia/tu106/acr/ucode_unload.bin
> deleted file mode 120000
> index a96d703..0000000
> --- a/nvidia/tu106/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/acr/unload_bl.bin b/nvidia/tu106/acr/unload_bl.bin
> deleted file mode 120000
> index 15e0905..0000000
> --- a/nvidia/tu106/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/gr/fecs_bl.bin b/nvidia/tu106/gr/fecs_bl.bin
> deleted file mode 120000
> index dda1e65..0000000
> --- a/nvidia/tu106/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/gr/gpccs_bl.bin b/nvidia/tu106/gr/gpccs_bl.bin
> deleted file mode 120000
> index 4983072..0000000
> --- a/nvidia/tu106/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/nvdec/scrubber.bin b/nvidia/tu106/nvdec/scrubber.bin
> deleted file mode 120000
> index 892d6fd..0000000
> --- a/nvidia/tu106/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/sec2/desc.bin b/nvidia/tu106/sec2/desc.bin
> deleted file mode 120000
> index 67fc6d9..0000000
> --- a/nvidia/tu106/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/sec2/image.bin b/nvidia/tu106/sec2/image.bin
> deleted file mode 120000
> index 7bc2df1..0000000
> --- a/nvidia/tu106/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/tu106/sec2/sig.bin b/nvidia/tu106/sec2/sig.bin
> deleted file mode 120000
> index 24a48bb..0000000
> --- a/nvidia/tu106/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu102/sec2/sig.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/bl.bin b/nvidia/tu117/acr/bl.bin
> deleted file mode 120000
> index 888d361..0000000
> --- a/nvidia/tu117/acr/bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/acr/bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/ucode_ahesasc.bin b/nvidia/tu117/acr/ucode_ahesasc.bin
> deleted file mode 120000
> index 346b514..0000000
> --- a/nvidia/tu117/acr/ucode_ahesasc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/acr/ucode_ahesasc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/ucode_asb.bin b/nvidia/tu117/acr/ucode_asb.bin
> deleted file mode 120000
> index f3c6b7d..0000000
> --- a/nvidia/tu117/acr/ucode_asb.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/acr/ucode_asb.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/ucode_unload.bin b/nvidia/tu117/acr/ucode_unload.bin
> deleted file mode 120000
> index 19db442..0000000
> --- a/nvidia/tu117/acr/ucode_unload.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/acr/ucode_unload.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/acr/unload_bl.bin b/nvidia/tu117/acr/unload_bl.bin
> deleted file mode 120000
> index 384d358..0000000
> --- a/nvidia/tu117/acr/unload_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/acr/unload_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/gr/fecs_bl.bin b/nvidia/tu117/gr/fecs_bl.bin
> deleted file mode 120000
> index bc2f0f5..0000000
> --- a/nvidia/tu117/gr/fecs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/gr/fecs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/gr/gpccs_bl.bin b/nvidia/tu117/gr/gpccs_bl.bin
> deleted file mode 120000
> index fb8c01a..0000000
> --- a/nvidia/tu117/gr/gpccs_bl.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/gr/gpccs_bl.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/nvdec/scrubber.bin b/nvidia/tu117/nvdec/scrubber.bin
> deleted file mode 120000
> index 6ce6040..0000000
> --- a/nvidia/tu117/nvdec/scrubber.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/nvdec/scrubber.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/sec2/desc.bin b/nvidia/tu117/sec2/desc.bin
> deleted file mode 120000
> index 61ffd78..0000000
> --- a/nvidia/tu117/sec2/desc.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/sec2/desc.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/sec2/image.bin b/nvidia/tu117/sec2/image.bin
> deleted file mode 120000
> index 2d523bf..0000000
> --- a/nvidia/tu117/sec2/image.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/sec2/image.bin
> \ No newline at end of file
> diff --git a/nvidia/tu117/sec2/sig.bin b/nvidia/tu117/sec2/sig.bin
> deleted file mode 120000
> index 5bb9cb7..0000000
> --- a/nvidia/tu117/sec2/sig.bin
> +++ /dev/null
> @@ -1 +0,0 @@
> -../../tu116/sec2/sig.bin
> \ No newline at end of file
> --
> 2.26.2
>
