Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E58FD12D44
	for <linux-firmware@archiver.kernel.org>; Sun, 10 Nov 2024 15:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CB53C4CED8; Sun, 10 Nov 2024 15:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57287C4CECD
	for <linux-firmware@kernel.org>; Sun, 10 Nov 2024 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731252360;
	bh=lCY9Dk9j/RnYTEJ0QzN73BMuTGFNxPCLRKXEMC0vnZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VSy5mIj4PH703q/7TySF1Ueo5Y498hP+1w+g5XD7nQXdf7KNOFOLTcRhVrqoOiLJJ
	 4N3LEgTLIlV+h/4MpeAqCBQdLIfqtkTly6dCw25f+2Xq1k1KqCbLEpuewX21QvDJQe
	 pkENrrQESafWuI+40f7jc11Q2WlDVf+xq4H+S9a3VICy3WuaJ6E6+MWFdp8qYdHKJJ
	 ZtJ9weL1SRvMVxhDg7X1IXMT4OlYDT5J1lyODmty4iJi5yHM09uwLCzagI8cA3Fsew
	 7/3tQdMUGf9ZSjyhBOFdC7i5R4FvjUD+UmqE3J5ForhHxrdrTu5AXKlJ3h5xDo87uo
	 mduqEu8rKyvuA==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e29047bec8fso3625529276.0
        for <linux-firmware@kernel.org>; Sun, 10 Nov 2024 07:26:00 -0800 (PST)
X-Gm-Message-State: AOJu0YzW7EQWP8V1//wbL65QkIgQUkUOGly+LJO+JThVM76DJCjb61Bj
	cI4O66fiTnlUgo8S/6/MAGStw0wHuded3Xa0Emqksl6bVE1YPiKGkJVqRJa3DzsEhYQaCYXl0h4
	tzqTTgQyhOZagnfsrloUnG9HhCMs=
X-Google-Smtp-Source: AGHT+IG0Vy7ECc59ERZ3pJT5mWmHLbRRB3Tloo6IhYXDtlTlxTRtjl86D6gJELf4iWNR3yEQEfQEXxFIMAi1sYkZPU4=
X-Received: by 2002:a05:690c:6ac6:b0:6ea:7fa3:ab22 with SMTP id
 00721157ae682-6eade41955cmr69448657b3.8.1731252359583; Sun, 10 Nov 2024
 07:25:59 -0800 (PST)
MIME-Version: 1.0
References: <1082df9a-5d1f-4044-b679-b2308971fc47@RTEXMBS04.realtek.com.tw>
In-Reply-To: <1082df9a-5d1f-4044-b679-b2308971fc47@RTEXMBS04.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sun, 10 Nov 2024 10:25:48 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5iko5JVP_XqAtHWKD7GkuDxFz=QAV=OqsmXNmr3yjwbA@mail.gmail.com>
Message-ID: <CA+5PVA5iko5JVP_XqAtHWKD7GkuDxFz=QAV=OqsmXNmr3yjwbA@mail.gmail.com>
Subject: Re: [RESEND v2] pull-request: rtw89: 8852a: update fw to v0.13.36.2
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	gary.chang@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 1:52=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Hi,
>
> Update firmware of 8852a to v0.13.36.2
>
> Sorry that I messed my script to send improper first pull-request.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit e817e483c4b5bd0cd73a3d7e26c0a59c86b8c9=
95:
>
>   Merge branch 'rtw88' into 'main' (2024-11-07 13:29:19 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2024-11-08

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/361

josh

>
> for you to fetch changes up to b6bfff1a5b0fad254a693b9d4275271d4dda7f03:
>
>   rtw89: 8852a: update fw to v0.13.36.2 (2024-11-08 13:35:28 +0800)
>
> ----------------------------------------------------------------
> Chih-Kang Chang (1):
>       rtw89: 8852a: update fw to v0.13.36.2
>
>  rtw89/rtw8852a_fw.bin | Bin 1423232 -> 1428272 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
