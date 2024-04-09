Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F73C67861
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Apr 2024 12:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27634C433A6; Tue,  9 Apr 2024 12:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112FDC43390
	for <linux-firmware@kernel.org>; Tue,  9 Apr 2024 12:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712665883;
	bh=Smf8CqsXg9haM1YfQmcDVxHR/BjPzeFlKSG9GLUaZc4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SP4KjDcFJ2bCEYqa0OlTYSGyYm1+MGf3qTmWEgLDGYhvBurCkkVYo15Iq3paVftq/
	 WE6Iw0crN6YTofAoElRw2TzZvqpmSDTQkyrLZ9elNII5Lp0Ri8YFAP3RPPg1rT/c+2
	 JmXoSOC1/lPll8GZQ2+YpdouZIOu/y4pferiqrKmWjQW9zwGTA8kRGAyS1EDElHY7+
	 vBPP8WpCkC2sV5fJX6W9TyV8hUEDB3m3VfFvdvbKh2/5lzopc/fdFCJRYP84+plMUG
	 IfQ6Y+vtoahGB7mnk1R3ZHbpS1JrS5WoCSzSxiAHaFIpFDVaXBF2UkWZP1qWpZClvG
	 q51ccIsRdaUXA==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so5205571276.2
        for <linux-firmware@kernel.org>; Tue, 09 Apr 2024 05:31:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxL4f2BMlhHYmslFb95bqT9hlHr9g+nfI7yWWPUG/+sc6RAwGk8
	SRR2AhuOtJUaYYrDOTLAIOja44R5R9cBLgVkdTbZVBw9mkU2mUkzRRKswcPyaiyyIxIxw1FNJx1
	JCgJgI+QGEodieWLkDlHNT9/dX34=
X-Google-Smtp-Source: AGHT+IE99X1JBsIJgtH7+iJVAR6Bk+3/OL9aBba9eT9vOnm5TO7JumZsOpnQnVxXUOhdxZX7RC4CQFfWOA+kNjIU8D8=
X-Received: by 2002:a25:9947:0:b0:de1:1ac2:98e1 with SMTP id
 n7-20020a259947000000b00de11ac298e1mr620160ybo.37.1712665882252; Tue, 09 Apr
 2024 05:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <063c9937acb36ccf352056d212a9a2733abb9dd5.camel@realtek.com>
In-Reply-To: <063c9937acb36ccf352056d212a9a2733abb9dd5.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 9 Apr 2024 08:31:10 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5T4imRCyiww4gzry0Qi+gVY2EQ9jznxvhCn3RL9Q-Wnw@mail.gmail.com>
Message-ID: <CA+5PVA5T4imRCyiww4gzry0Qi+gVY2EQ9jznxvhCn3RL9Q-Wnw@mail.gmail.com>
Subject: Re: pull request: rtw: update/add firmware of Realtek WiFi 8703B,
 8852C and 8922A
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>, 
	"fiona.klute@gmx.de" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 11:23=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> =
wrote:
>
> Hi,
>
> Add/update three firmware including
>
>  - add initial firmware v11.0.0 for 8703
>  - update 8852C to v0.27.56.14
>  - add initial firmware v0.35.18.0 for 8922A
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 22ee1d8ca6663ca7c28477581993d6ed5cc543=
23:
>
>   Merge branch 'robot/pr-0-1710861164' into 'main' (2024-03-19 19:07:14 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/189

josh

>
> for you to fetch changes up to 08259e7f17f553d5f985a530f825ac8ad6f48450:
>
>   rtw89: 8852c: update fw to v0.27.56.14 (2024-03-21 11:02:32 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8852c: update fw to v0.27.56.14
>
> Fiona Klute (1):
>       rtw88: Add RTL8703B firmware v11.0.0
>
> Ping-Ke Shih (1):
>       rtw89: 8922a: add firmware v0.35.18.0
>
>  WHENCE                    |  12 +++++++++---
>  rtw88/README              |   3 +++
>  rtw88/rtw8703b_fw.bin     | Bin 0 -> 20290 bytes
>  rtw88/rtw8703b_wow_fw.bin | Bin 0 -> 23074 bytes
>  rtw89/rtw8852c_fw.bin     | Bin 1532736 -> 1532656 bytes
>  rtw89/rtw8922a_fw.bin     | Bin 0 -> 1537690 bytes
>  6 files changed, 12 insertions(+), 3 deletions(-)
>  create mode 100644 rtw88/rtw8703b_fw.bin
>  create mode 100644 rtw88/rtw8703b_wow_fw.bin
>  create mode 100644 rtw89/rtw8922a_fw.bin
>
