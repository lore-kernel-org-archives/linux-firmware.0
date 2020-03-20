Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AB8C4332B
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Mar 2020 11:49:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CCB932076E; Fri, 20 Mar 2020 11:49:48 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AA14A20754
	for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584704988;
	bh=ZCpx341ultfyr9wGIQJiu+UJM6/2CzLmV3QvPv+1aTk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kne65LPO1M7yFn3K70x3FEyA2KLH1zetV5Ss2sYv+f7IW+W1o792aE1aRSAidzQmf
	 xAHnKJm6L3RFsKqyCGwJToj4iYNN4QywjtyjmqhdpycNWPVJmuoeS70wO4t2pO9yXR
	 ZQon+8DPzKt+BQiLOtCK6SCS+VI1lU0jXCP5yXXI=
Received: by mail-il1-f181.google.com with SMTP id e8so5222519ilc.13
        for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 04:49:48 -0700 (PDT)
X-Gm-Message-State: ANhLgQ11kLxcI4CVEs20EfrepQ698zvmM3jiGm1JkbhGIP0Qr8he9BJc
	wcSBEVtSUZCJfN9BAulLBsPsT6homDCOAJNdoHo=
X-Google-Smtp-Source: ADFU+vsB1zYEe395XFZwlodASfBZyspKsxHvhj7bUXRgGlQPsHEQFBy6GNGjHuwlPE9jCxX5kZdo9GTYpkBv5xqVWMY=
X-Received: by 2002:a92:5a88:: with SMTP id b8mr7852426ilg.206.1584704988090;
 Fri, 20 Mar 2020 04:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <CALeDE9OeBx6v6nGVjeydgF1vpfX1Bus319h3M1=49PMETdaCtw@mail.gmail.com>
In-Reply-To: <CALeDE9OeBx6v6nGVjeydgF1vpfX1Bus319h3M1=49PMETdaCtw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Mar 2020 07:49:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5tt43=cg+M-=msXjLbuV1fNpa9JhvG4VqeBmjvZgc+xw@mail.gmail.com>
Message-ID: <CA+5PVA5tt43=cg+M-=msXjLbuV1fNpa9JhvG4VqeBmjvZgc+xw@mail.gmail.com>
Subject: Re:
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 20, 2020 at 7:47 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> subscribe

linux-firmware isn't a mailing list.  It's an alias for the
maintainers.  You can find a lore instance for it though!

https://lore.kernel.org/linux-firmware/

josh
