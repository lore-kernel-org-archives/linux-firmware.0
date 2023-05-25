Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86884C77B7A
	for <linux-firmware@archiver.kernel.org>; Thu, 25 May 2023 10:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41D13C4339C; Thu, 25 May 2023 10:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4A7C433D2
	for <linux-firmware@kernel.org>; Thu, 25 May 2023 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685012186;
	bh=COWGGEd2vo8Mv3S6iFK5Uby45LXaXdrIU9nMvnt072w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dtNgHm7bWluqraH0gb3/XxgGgJEww2YNii9F9uQYrBR485pX4Od/z4GlI6dW/26QA
	 fQz1HofKS2Xu2iAE7GISanZEZWrAWGTlfkTsKaPAxdSkQ+MGqp4SgZXOSkGNykULqT
	 9XD07Fb2nGFqo7QtA0Wgse1vwwyn1tOXD+DaTXfteIY4ktsNBBOnWoROYPGbT/5o22
	 4WUPtPZ0bBQG3Xc6VmUVibfSq0fans9/f/9rjDIfGx1hEWBV7zdil207442K/Yo8l9
	 68+xvSUL74wVUORkYfExtiOQ75lPmF6S+gr0TasctMPZcvwyhwT7Sz17hu7I26Sj6Q
	 YHeaOn3QnVwEA==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so786429276.2
        for <linux-firmware@kernel.org>; Thu, 25 May 2023 03:56:26 -0700 (PDT)
X-Gm-Message-State: AC+VfDz+74bpOCVdedx549ogayTt2wpgojaFqhcsh6m3LYuVL3wM8Ewy
	mQUwfNV6rU+6v/PggJ+25B0fzZYf7+4vxCifdq0=
X-Google-Smtp-Source: ACHHUZ5BfZtWtYsenUsKgEaZTmSHtralMVoG6yjOe07lQxPcXXe3HWv23CA8AztLYvpwyr/bro/XCHW6svHCbhbKtTw=
X-Received: by 2002:a25:77ce:0:b0:ba7:6d35:6b0f with SMTP id
 s197-20020a2577ce000000b00ba76d356b0fmr3219755ybc.22.1685012185200; Thu, 25
 May 2023 03:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <7c011b352b344cae8fa6b3a1beb71d8f@realtek.com>
In-Reply-To: <7c011b352b344cae8fa6b3a1beb71d8f@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 25 May 2023 06:56:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5rdoZO4QLTTWusu1G8OVKuGjD6m37fJCbeY-Q5PDxBoA@mail.gmail.com>
Message-ID: <CA+5PVA5rdoZO4QLTTWusu1G8OVKuGjD6m37fJCbeY-Q5PDxBoA@mail.gmail.com>
Subject: Re: pull reques [v3]t: rtw89: 8851b: add firmware v0.29.41.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 4:34=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Add initial firmware of rtw89 driver for newly supported chip 8851BE.
>
> Add the missing WHENCE by v2.
> Modify driver description to mention RTL8851B by v3.
>
> Thank you
> Ping-Ke
> ---
> The following changes since commit 1ba3519eab0fbc3cedf6b423ea0470461b902c=
1b:
>
>   Merge branch 'dev-queue' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/tnguy/firmware (2023-05-23 13:07:29 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.  Thank you.

josh

>
> for you to fetch changes up to c10facaf11266da21db27de9af1c51756ecd07bf:
>
>   rtw89: 8851b: add firmware v0.29.41.0 (2023-05-24 16:30:58 +0800)
>
> ----------------------------------------------------------------
> Ping-Ke Shih (1):
>       rtw89: 8851b: add firmware v0.29.41.0
>
>  WHENCE                |   3 ++-
>  rtw89/rtw8851b_fw.bin | Bin 0 -> 1090544 bytes
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 rtw89/rtw8851b_fw.bin
>
