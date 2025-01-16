Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F2DC02180
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Jan 2025 11:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96382C4CEE2; Thu, 16 Jan 2025 11:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8049FC4CEE3
	for <linux-firmware@kernel.org>; Thu, 16 Jan 2025 11:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737028758;
	bh=XxMfDiJW7EnW4WvRbo3d2krzQIkID6cBIBy3wfgJq14=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=B+Sc4o09RH02vVclWL1rRg8QL9e1y8JDdH1/B4PtZMs/1ZsUtDiqgaL0i/d0dAQ5p
	 0gfQZzNvl0KrxVklgCuxgOr5lGcNxk5B908DEJf5x66EkZmdn5KfRnsfrYOdels4gz
	 hhqItF9eCilPt7UxMs4HQz10mejmERAcZwC7Cqhi/zWA5KmX85X3xsmnfRDsAKdOk/
	 Q3Dpl10vEhsehGKuTR+jjwsuy/LCvBDgmz4ip8xmRQvQPCgQ9Q8QnxSjAT0MHmXB4o
	 fnTBF1+IVnP2egfOctPQr/RZ3Ed7xrwZrF52J8MXWm/+JbEpbnQwO0P103EBXgO4FS
	 3IXUKXnIPSZig==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so1671857a12.2
        for <linux-firmware@kernel.org>; Thu, 16 Jan 2025 03:59:18 -0800 (PST)
X-Gm-Message-State: AOJu0Yw+lXguz/BZ0zFR8esLj22oqOmZnRp2DaunNYEA+owLxnnmjfc6
	qBSs5KwH2KnLtJHL+V0ytpiuaBgvWnpqC7/fH9UQWopYUc1a0JvOj8Ar/de3GXS3ck4yyPHIR21
	F3S6FlwlnpEo54mWUtwAH5HrbkPs=
X-Google-Smtp-Source: AGHT+IGDyT4bZb4xIo2DjV3d7+rg3m9XzVpUJ3QYWXuhQ94hQJdd+NEdfASEiD1yBXpJLXe4SnCqlkEA78zwafjdJmo=
X-Received: by 2002:a05:6402:26d3:b0:5d9:a59:854a with SMTP id
 4fb4d7f45d1cf-5d972e07f98mr31517607a12.13.1737028757096; Thu, 16 Jan 2025
 03:59:17 -0800 (PST)
MIME-Version: 1.0
References: <82c98b21-326f-4694-86cb-5d6af04a9166@RTEXMBS04.realtek.com.tw>
In-Reply-To: <82c98b21-326f-4694-86cb-5d6af04a9166@RTEXMBS04.realtek.com.tw>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Jan 2025 06:58:59 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7+vovudJLEip6P6gcZwDzzFvL2CQfd9ij32aXUvgtp=A@mail.gmail.com>
X-Gm-Features: AbW1kvZzBZmKaqFTbcNZuMdBTb3k0xA_zkyQhpZ_zReGMvVIm39tO4lbEcKAEno
Message-ID: <CA+5PVA7+vovudJLEip6P6gcZwDzzFvL2CQfd9ij32aXUvgtp=A@mail.gmail.com>
Subject: Re: pull-request: update rtw89 firmware by rtw-fw-2025-01-12
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	damon.chen@realtek.com, phhuang@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 8:42=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Hi,
>
> Update rtw89 firmware including RTL8852B, RTL8852BT, RTL8852C and RTL8922=
A.
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit 7673dffd5e3324a726caf8bfc0f1a005862f5f=
16:
>
>   Merge branch 'robot/pr-0-1736442209' into 'main' (2025-01-09 17:11:19 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-01-12

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/406

josh

>
> for you to fetch changes up to f495ed8a143a4e1844cd18f875c82f2823843d02:
>
>   rtw89: 8852b: update fw to v0.29.29.8 (2025-01-12 09:33:44 +0800)
>
> ----------------------------------------------------------------
> Kuan-Chung Chen (1):
>       rtw89: 8922a: update fw to v0.35.52.1 and stuffs
>
> Ping-Ke Shih (3):
>       rtw89: 8922a: update fw to v0.35.54.0
>       rtw89: 8852c: update fw to v0.27.122.0
>       rtw89: 8852b: update fw to v0.29.29.8
>
> Po-Hao Huang (2):
>       rtw89: 8852b: update fw to v0.29.29.7
>       rtw89: 8852bt: update fw to v0.29.110.0
>
>  WHENCE                  |   1 +
>  rtw89/rtw8852b_fw-1.bin | Bin 1242808 -> 1244784 bytes
>  rtw89/rtw8852bt_fw.bin  | Bin 897512 -> 913992 bytes
>  rtw89/rtw8852c_fw-1.bin | Bin 2180616 -> 2375560 bytes
>  rtw89/rtw8922a_fw-3.bin | Bin 0 -> 1725278 bytes
>  5 files changed, 1 insertion(+)
>  create mode 100644 rtw89/rtw8922a_fw-3.bin
