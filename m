Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F78C64ED6
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Feb 2023 13:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58F5DC4339E; Mon, 27 Feb 2023 13:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426B6C4339B
	for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505615;
	bh=mo1N7gOVFE0DpsaUQQk4VuzMDQE7j/QnR82H47/xShw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oYrgFaO4s0EdaOt/6/qCDdFV3DjvqnKu7vq+FnngUr9KUGY3ajE/QG5IfZHjaS9XU
	 ACAT9Qo3olQdnvek2IJ4nDm6My8NWh8hMiPNAfdjPzfud5tx6e0/gij633vvANpbFZ
	 LzZEVaYUtCHzXcDuFYhARmxwam6V04UTh+Fx9zalYM7OF0QJ+Oxwm0oa6DO/m/EGXY
	 LTf1OjTCgUvcKOIdiGhF6/+XVGhLbDNXTYw0iIAHshb3catcVRcpPX4RRxVZyWHaDs
	 cH+qZNqWMdWsDKEETe6X5RrcEeWkg8ris/RqZCWYQsTUFaZzbpCCuDnN5arxX5ilsc
	 cqtI1aZnRs5jw==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536af432ee5so178472427b3.0
        for <linux-firmware@kernel.org>; Mon, 27 Feb 2023 05:46:55 -0800 (PST)
X-Gm-Message-State: AO0yUKVFAjH5V4+s5eBOVc6K4iaSKUWEs6cpAPj9vwT4uJHdKQA+XN9J
	kbKEHyQaMZyVNb+zJCcxaSi0VQ9wq0JgG3WckmM=
X-Google-Smtp-Source: AK7set8fV2I0lZE/5ZCoaY9PcCUROq3QPa12KeaB/j7AADDyLBO+YVUSF338EhuNvpiS4U0DkPgJ1UV4NF7K43fys8s=
X-Received: by 2002:a81:ad1a:0:b0:536:4d58:54b8 with SMTP id
 l26-20020a81ad1a000000b005364d5854b8mr10196754ywh.6.1677505614315; Mon, 27
 Feb 2023 05:46:54 -0800 (PST)
MIME-Version: 1.0
References: <98579f05de72dae9d826268e731a0ca2bcfb5e88.camel@realtek.com>
In-Reply-To: <98579f05de72dae9d826268e731a0ca2bcfb5e88.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Feb 2023 08:46:43 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6ho61jewfbC5d_pZZcYjAt0k-hvjz-Yyv_iKCZ5KG3Mw@mail.gmail.com>
Message-ID: <CA+5PVA6ho61jewfbC5d_pZZcYjAt0k-hvjz-Yyv_iKCZ5KG3Mw@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852b: update fw to v0.29.29.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 3:28 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8852b firmware of rtw89 driver to 0.29.29.0
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 83f1d7781300b52785c062a8285da59042c0d1ff:
>
>   Merge branch 'ath10k-20230215' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-
> firmware (2023-02-15 14:27:03 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to 7375bcff3ffd9ba0c14c9bdff33f6d527607e26b:
>
>   rtw89: 8852b: update fw to v0.29.29.0 (2023-02-24 16:23:33 +0800)
>
> ----------------------------------------------------------------
> Ping-Ke Shih (2):
>       rtw89: 8852b: update fw to v0.29.26.0
>       rtw89: 8852b: update fw to v0.29.29.0
>
>  rtw89/rtw8852b_fw.bin | Bin 1035232 -> 1188488 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
>
