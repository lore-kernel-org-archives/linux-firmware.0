Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F78C4332F
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Nov 2023 14:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28901C433C9; Mon,  6 Nov 2023 14:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13046C433C7
	for <linux-firmware@kernel.org>; Mon,  6 Nov 2023 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699279522;
	bh=M8vrZIHaEkMA18B8ToZfZOeZurdvC43xa12CCXw4pfE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=jLjzMbAfwtVHWlFDaP1k01MRNo+Y+nM4QnRBsFo4NaBoiSeak+EIWBjp89rxgi4xd
	 5JlCdOYkkU1xKgF3yl45ZSyA7j3Oh6Css0yYiA9/+q0rGQIFmsqXv6nApJbFiRQz1/
	 yHIiMlKxF87GxMHcGoHvCGSm0xSDjhx/yWG0Ts6lI6evL2a2AvYKU2WPGrdiA3TbrW
	 bBvFZfzyXsUbtry9OPA0v5tbj6LOEGO2s9tDDXsFmn+0d4Ay5QyP8MGXJS6ByddDm3
	 aRsAB0CwSVU0g2Xcb+KqebC3pZvFfoZAewtR5RhD48JQvg3cBwgnM6uSDgsxZwKvAu
	 Xsg48tfQg3Ebg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59e88a28b98so38502337b3.1
        for <linux-firmware@kernel.org>; Mon, 06 Nov 2023 06:05:22 -0800 (PST)
X-Gm-Message-State: AOJu0YzHHs0beL2KnaMz9ODA9RIqNAU9UDv+7HEkcRoKsEfxU54wctBj
	Wh13sHJrT01dn8Vim4+xelYG2SltQ6CaEnZr6OM=
X-Google-Smtp-Source: AGHT+IHvLYrACicViT5CH5Hx5K83UteV6WL4r18u3Bse3A7+UYHMcgDgxnHUavjujwwDYpT5N1JblS/l0po27AjiMOg=
X-Received: by 2002:a81:6c90:0:b0:5a7:af51:fa39 with SMTP id
 h138-20020a816c90000000b005a7af51fa39mr7013027ywc.8.1699279521212; Mon, 06
 Nov 2023 06:05:21 -0800 (PST)
MIME-Version: 1.0
References: <baed3fc347269c3dd34244f34946e09dff183825.camel@realtek.com>
In-Reply-To: <baed3fc347269c3dd34244f34946e09dff183825.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 6 Nov 2023 09:05:10 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4GOdObcpt5e-MuZQuTX9OQQBVi+YHD8FhaWxJ_mbdyMA@mail.gmail.com>
Message-ID: <CA+5PVA4GOdObcpt5e-MuZQuTX9OQQBVi+YHD8FhaWxJ_mbdyMA@mail.gmail.com>
Subject: Re: pull request: rtw89: update 8851b/8852b fw to v0.29.41.3/v0.29.29.5
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 11:34=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> =
wrote:
>
> Hi,
>
> Update 8851b/8852b firmware of rtw89 driver to v0.29.41.3/v0.29.29.5.
> This is mainly to fix BT-coexistence issue that causes BT works improperl=
y
> when WiFi enters power saving mode.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 2b304bfecb274d53f38b676d85b43bcb83db30=
dd:
>
>   Merge branch 'main' into 'main' (2023-10-30 11:20:13 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD
>
> for you to fetch changes up to 2afd1423e4765eb691711ea5e78a19853cb2f6eb:
>
>   rtw89: 8852b: update fw to v0.29.29.5 (2023-10-31 11:26:16 +0800)

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/48

josh

>
> ----------------------------------------------------------------
> Chin-Yen Lee (3):
>       rtw89: 8851b: update fw to v0.29.41.3
>       rtw89: 8852b: update fw to v0.29.29.4
>       rtw89: 8852b: update fw to v0.29.29.5
>
>  rtw89/rtw8851b_fw.bin   | Bin 1160984 -> 1162024 bytes
>  rtw89/rtw8852b_fw-1.bin | Bin 1237704 -> 1242808 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
