Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B33C3DA4A
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Aug 2024 11:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FE82C4AF0C; Thu,  8 Aug 2024 11:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A580C4AF0D
	for <linux-firmware@kernel.org>; Thu,  8 Aug 2024 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723118111;
	bh=xSKSefyu2JIZwNPbODT8Q+4ar5m3IfPGumVk0YnRGZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=cmAKh2dTDdHihsehI4oTOOYIrSj40HS+sTEad7o0zQfrdKWkjLfoXZuzeeVpgLVTK
	 P5h4lNAT7jgW9abIVinl+zOAlO+Lk3Lp5AZmZ5zvKohBCm3pW3hCYf61PGCrNdfecn
	 +rS5IwbYRGdS2GbY/hYwch7FibZzFskn7KBq0T+QKNGxtThmmOc/uBZdbkDgnH1qh5
	 QP2tS89xgQniIvLuLSIhIdJMk+0AdNqPYkvGC2E2PvwzPhSNtTHgueS93fJN7N7Zvk
	 xubhWX3dHgG5h/I9ys9QCwxMmmU+4mToGIuRgihcMXy5dE7tiH7BXIq0HpOLk2PzKw
	 ArhqwziaMu43g==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64b417e1511so7919997b3.3
        for <linux-firmware@kernel.org>; Thu, 08 Aug 2024 04:55:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YzQwdLnSk6h3dLkDY+b04XQBP9WnDOCJZvNDOkTRl8ICIQG0QJ0
	jusPHYbpm3vHnKg7CrBlAyr0h64Hnv4RAkhuSuF/IWIDJuERPuVlmId3oHdu+/nzZBp6bTIBRx3
	owlqamxyVD9lIP3QQLNtairhdwS4=
X-Google-Smtp-Source: AGHT+IFvxXJxn87rf5Vo+OU9A+/f4BWSdjFh+gxHFI/KzRbgzXNtsvQv36jYXRJuYC+NVChkzzHqmw0J0kVhm/kirwY=
X-Received: by 2002:a05:690c:e1f:b0:65f:e4f0:8347 with SMTP id
 00721157ae682-69bf7924043mr18248087b3.13.1723118110388; Thu, 08 Aug 2024
 04:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <f6b548ef4c1a2404dc1f7a497c24a82c9247a3bd.camel@realtek.com>
In-Reply-To: <f6b548ef4c1a2404dc1f7a497c24a82c9247a3bd.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 8 Aug 2024 07:54:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4OTOzD6fZdPdeTEzanSh2pFe7DgWb1M2hrqfA91-vfRw@mail.gmail.com>
Message-ID: <CA+5PVA4OTOzD6fZdPdeTEzanSh2pFe7DgWb1M2hrqfA91-vfRw@mail.gmail.com>
Subject: Re: pull request: rtw89: add firmware of 8852bt v0.29.91.0 and 8852c v0.27.97.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>, 
	Damon Chen <damon.chen@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 9:53=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Hi,
>
> Add RTL8852BT and RTL8852C-1 firmware of rtw89 driver.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit e131a437050360bf31b0ad7b69667432947acb=
ab:
>
>   Merge branch 'intel-20240805' into 'main' (2024-08-05 11:41:14 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2024-08-08

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/268


josh

>
> for you to fetch changes up to 1a0cbeb75372e047920bb17ba12a1d5f8ca59066:
>
>   rtw89: 8852c: add fw format-1 v0.27.97.0 (2024-08-08 09:40:40 +0800)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8852c: add fw format-1 v0.27.97.0
>
> Ping-Ke Shih (1):
>       rtw89: 8852bt: add firmware 0.29.91.0
>
>  WHENCE                  |   4 +++-
>  rtw89/rtw8852bt_fw.bin  | Bin 0 -> 897512 bytes
>  rtw89/rtw8852c_fw-1.bin | Bin 0 -> 2180616 bytes
>  3 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 rtw89/rtw8852bt_fw.bin
>  create mode 100644 rtw89/rtw8852c_fw-1.bin
>
