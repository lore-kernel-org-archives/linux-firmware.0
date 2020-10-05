Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6385DC4363D
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Oct 2020 12:06:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2B2372075A; Mon,  5 Oct 2020 12:06:31 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 02BC3208A9
	for <linux-firmware@kernel.org>; Mon,  5 Oct 2020 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601899591;
	bh=ONWeCqN2sym8dOaS0DnO3HXu/uzf2BXYOa82IgcgaKk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=I8OZz/ToxKHrl4qm/hTXjBSpDDVZm3hgIU3R5T5BcZ7zh//xysDgC/hRRgbJiM6jO
	 y9e21k8k66mcKf/QsBGhDc4j7uw/OWYhqjh6T1Gnt1x/YAaZI+wVODCAePIOea+RHW
	 YyACQWDhFB8eqtLLBWFnfoO1tsyyHthJ2yswwMrU=
Received: by mail-io1-f46.google.com with SMTP id u6so8809449iow.9
        for <linux-firmware@kernel.org>; Mon, 05 Oct 2020 05:06:30 -0700 (PDT)
X-Gm-Message-State: AOAM532EGJ4bGmlM+JBj1WOyzNyUF8/6GvKMcRroYjsh7wgRnis6dPDB
	Tr+f28X1Ukz5CggNCNMUHKRxh84jNjsF050jtHc=
X-Google-Smtp-Source: ABdhPJw5oGE5OiameYPdMSn/CYhGUbl7SPEL2fMVo0qMYQtVwMi5EBVUyq0xl/cCHVQS+qPtFyOxuc0waZm3pNdRcVU=
X-Received: by 2002:a5e:8d18:: with SMTP id m24mr10524667ioj.158.1601899590352;
 Mon, 05 Oct 2020 05:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200929002539.42024-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20200929002539.42024-1-anthony.l.nguyen@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 5 Oct 2020 08:06:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7fO4yX_Jmk5bi1+Q00g6ni11m9ni-3267BzX8iZupzJA@mail.gmail.com>
Message-ID: <CA+5PVA7fO4yX_Jmk5bi1+Q00g6ni11m9ni-3267BzX8iZupzJA@mail.gmail.com>
Subject: Re: [PATCH] copy-firmware: Always write Link: entries
To: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Mon, Sep 28, 2020 at 8:31 PM Tony Nguyen <anthony.l.nguyen@intel.com> wrote:
>
> File: entries in the WHENCE file overwrite existing files in the target
> directory, however, Link: entries are skipped if the file exists in the
> target directory. This can cause issues if the Link: entry is updated, but
> the target directory contains an old symlink. Do not skip writing Link:
> entries if the file exists, always create the symlink. This matches the
> behavior of File: entries and ensures symlinks will contain values from
> the WHENCE file.
>
> Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
> ---
>  copy-firmware.sh | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index eda16c357779..9b46b63913ab 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -62,7 +62,6 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
>              $verbose "WARNING: missing target for symlink $f"
>          fi
>      else
> -        test -f "$destdir/$f" && continue
>          $verbose "creating link $f -> $d"
>          mkdir -p $destdir/$(dirname "$f")
>          ln -sf "$d" "$destdir/$f"
> --
> 2.20.1
>
