Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818ABC3F2D2
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2020 13:07:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 710C6217F4; Mon,  2 Mar 2020 13:07:41 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4F6BE21739
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2020 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583154461;
	bh=ktK0m5tAoOjGySHTk4sr3JE0vbJujhThSwO7AAPSmMk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Fat7pQCDxzV86NkiGYoMqKVi5+jgMz7p1bmiZl9Gv/iIvJ5s9D2WuHi78CYw8UtAg
	 45pBFo4GES4o+UZoMN4p/6uZHrTHw7ODsEtCjKL0dCClIAudCXvCMdAaxApHHySc1l
	 OvQa76D4sRZYXRPYjQ30tKeG0gWqg+rdudb58iAM=
Received: by mail-io1-f42.google.com with SMTP id w9so11364169iob.12
        for <linux-firmware@kernel.org>; Mon, 02 Mar 2020 05:07:41 -0800 (PST)
X-Gm-Message-State: ANhLgQ0lnLq99ZLzPCfiuFDsRwPhhjcB1WEIURv+eyyi+ChWXlZQ2udA
	dWHwoydrPS0qc79idRXAsiRpyw4MZb8iS9xUOdE=
X-Google-Smtp-Source: ADFU+vv53xddTY/kZb18NSDVPIdH+kn9fh3VB/5hHDDd6EdTPzhAdwgYw6/4NE0ArVYUy8aGY/T9u5thFHaLTUk0ACg=
X-Received: by 2002:a5d:9ccc:: with SMTP id w12mr1890435iow.206.1583154460766;
 Mon, 02 Mar 2020 05:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20200229021505.143663-1-briannorris@chromium.org>
In-Reply-To: <20200229021505.143663-1-briannorris@chromium.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Mar 2020 08:07:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6XFW3fVW3Swh4ZNt821Kk3sKWkXaWzy608amEG5n67sQ@mail.gmail.com>
Message-ID: <CA+5PVA6XFW3fVW3Swh4ZNt821Kk3sKWkXaWzy608amEG5n67sQ@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] check_whence: python3/utf-8 support
To: Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 28, 2020 at 9:15 PM Brian Norris <briannorris@chromium.org> wrote:
>
> WHENCE contains non-ASCII characters, so we should specify an encoding.
> To get the encoding= arg in python2, we pull open from 'io' directly.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Both of your patches applied and pushed out.  Thanks!

josh

> ---
>  check_whence.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/check_whence.py b/check_whence.py
> index 04f41dfc5f9e..2d31f3839106 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -1,9 +1,10 @@
>  #!/usr/bin/python
>
>  import os, re, sys
> +from io import open
>
>  def list_whence():
> -    with open('WHENCE') as whence:
> +    with open('WHENCE', encoding='utf-8') as whence:
>          for line in whence:
>              match = re.match(r'(?:File|Source):\s*"(.*)"', line)
>              if match:
> --
> 2.25.0.265.gbab2e86ba0-goog
>
