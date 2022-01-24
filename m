Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C887EC433FE
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Jan 2022 11:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91E70C340E7; Mon, 24 Jan 2022 11:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9DFC340E4
	for <linux-firmware@kernel.org>; Mon, 24 Jan 2022 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643025345;
	bh=CalkI3uPKp5wsa9TSeS2x38Jw5wkzQmEXHR4Av3y+z8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SyBN0Q5/R0EyED1VO3+dOGzRmh7HCvgwLt1KgirO9P6t0BwutSOaVN6NwAYcZhoDV
	 nUP7lV5NmT0GqW+Qbdav/edPiQjpEMMNFgzKRAkUbWwB7gp+Gw9Gkh848P0mFmha7A
	 l6pbwAyIN8sxhyrT8LYjmLl9/h4tlP1QMQEEM7ekfDFhAubIvgc51ejmJqFOjpr6z4
	 pMkcxXc/Kg/WRWzEfQ7En8XtaAtIB1wf7gcq5khpoQVHVkPkBcKZJh1sSEO9oEdE3w
	 dXy2cp/wTiwLeFQhmOKI5CZUikv6P6Fsz3QlidUrU0fwD9JsOlSnsl9t3/XgkY7wgw
	 u9pCMX7wPgTkw==
Received: by mail-il1-f176.google.com with SMTP id u6so4997485iln.3
        for <linux-firmware@kernel.org>; Mon, 24 Jan 2022 03:55:45 -0800 (PST)
X-Gm-Message-State: AOAM533qMXELgYqNukWxcDRQeKu1lirX0B1s9zfUgM/3Z9eNv8qVbSxX
	nAvyVKVXQ6J64Whb/c7joy5f/5+5qF27FbNvwls=
X-Google-Smtp-Source: ABdhPJz8wjzzvkP2jDIwv31lt43AsQjCkD5Y71QCxqT+BTfaAZPDu4Hux9OwvJ0XZPDp4euCIqvMSNmRGp9wpBlFIKQ=
X-Received: by 2002:a05:6e02:12e2:: with SMTP id l2mr8586718iln.243.1643025344686;
 Mon, 24 Jan 2022 03:55:44 -0800 (PST)
MIME-Version: 1.0
References: <CAHm2Bk47EqXkwrkue02p86+WtPpAgL0325FanGd5EoBVLrGPmg@mail.gmail.com>
In-Reply-To: <CAHm2Bk47EqXkwrkue02p86+WtPpAgL0325FanGd5EoBVLrGPmg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Jan 2022 06:55:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4X1OMeiw1gSa3Ji4-TqPob5roJzGW4xTfBMVz3qcLgSg@mail.gmail.com>
Message-ID: <CA+5PVA4X1OMeiw1gSa3Ji4-TqPob5roJzGW4xTfBMVz3qcLgSg@mail.gmail.com>
Subject: Re: Trivial WHENCE delisting
To: Kabir Kwatra <kabir@kwatra.me>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 19, 2022 at 2:06 AM Kabir Kwatra <kabir@kwatra.me> wrote:
>
> The following changes since commit 8d8c6e9d9eb5402295c434603007377487458fef:
>
>   iwlwifi: add new FWs from core66-88 release (2022-01-10 14:37:12 +0200)
>
> are available in the Git repository at:
>
>   git@github.com:Kab1r/linux-firmware.git
>
> for you to fetch changes up to a3c806d02be2aed1dde1064a24a0c204c60c95a3:
>
>   fix: remove nonexistent files from WHENCE (2022-01-18 22:59:46 -0800)
>
> ----------------------------------------------------------------
> Kabir Kwatra (1):
>       fix: remove nonexistent files from WHENCE
>
>  WHENCE | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index 3352a59..bf53aa9 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1273,10 +1273,6 @@ Version: 68.01d30b0c.0
>  File: iwlwifi-so-a0-jf-b0-68.ucode
>  Version: 68.01d30b0c.0
>
> -File: iwlwifi-s0-a0-gf-a0.pnvm
> -
> -File: iwlwifi-s0-a0-gf4-a0.pnvm
> -

These entries don't exist in the main branch.  They're named
appropriately for files that exist.

josh
