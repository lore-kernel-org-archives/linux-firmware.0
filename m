Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7BCCF9E3
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Nov 2025 21:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2B1BC19425; Mon, 10 Nov 2025 21:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC15FC2BC86
	for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 21:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762809834;
	bh=2uGReqIQ5kWbuGEQi0JCJuK28kv/W/bpv+JazgIidks=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JlBrNfYXHxv2TfRYRNq8JDiHsZHIMea4eMwmvvooULv5YYZ8z4viilx1M44JAyqWU
	 vWuYCf0TAelRE7HlUxG89ewmvuKXQIqGVfSm7aIm61wIHiJpRNSFgfUwCnhBdzjbSp
	 y6Lz0q9h+sF8npn3YbsEOD+7lcbSHnqOMA99DLymDq+CWMZNeAOK2D+FVCivmfWpup
	 QWmajvTABlu/hO9/5o7y28E6rLfl2zYQqn1qFxTRAH34zTOvrj06+vif9PSZVIZnj3
	 PZ534VZlziJKeN4/RaETMfAFcUMsYnWRZ7nPxl/iYEKy3Sot8wI+b+vbAw+4L9+mqV
	 zw3WHqVDQ/ywA==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63fc6115d65so3427392d50.0
        for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 13:23:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfOvLOCBcLI0+PxwRSqdK4oNKBLDl4sWH/GKsNIQSRCm9jYrCCzCD6/0vvKH+7741PS2LXplVUbvRwWuh/XA==@kernel.org
X-Gm-Message-State: AOJu0YzuowxPXhzdi2qV8s17qSvFzJc6geBwcIcl3EdcppPUyr1NUyWi
	/JKbWpQGCHn4n6NdC1ZT1lpMTc29XffN2Tx+YUr2ceL6kcH8BaYeUVQDblnu8pwP29gA6ajOwtw
	lqMKOfnOgX8hwiaLu1DlK2w5oUK7y5n0=
X-Google-Smtp-Source: AGHT+IGX+znZnacsFVbU0Zgb44+4h1xrCYgDbNysK5l1c/inArGTxD9LZvvXF6De3CrDL3s3ktbsMJ1bMcPX1k7rbgo=
X-Received: by 2002:a05:690e:42d2:b0:640:cfa4:e8c9 with SMTP id
 956f58d0204a3-640d45f6586mr7942013d50.69.1762809833945; Mon, 10 Nov 2025
 13:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20251109230315.6899-1-zenmchen@gmail.com> <aa1a0c67256f416584c9099496cc2aff@realtek.com>
In-Reply-To: <aa1a0c67256f416584c9099496cc2aff@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Nov 2025 16:23:42 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4AgS9xE0-TTYWg1R7XLJ2j3hJsbCH-BZ2JaJqz1++tCQ@mail.gmail.com>
X-Gm-Features: AWmQ_blQknKrVnUNNitrmQRxzmI8NTO6ZaZslRJXKhTNOBhXMnr6jB65mr9893k
Message-ID: <CA+5PVA4AgS9xE0-TTYWg1R7XLJ2j3hJsbCH-BZ2JaJqz1++tCQ@mail.gmail.com>
Subject: Re: [PATCH] rtw88: 8822b: Update firmware to v30.20.0
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zenm Chen <zenmchen@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 9, 2025 at 10:03=E2=80=AFPM Ping-Ke Shih <pkshih@realtek.com> w=
rote:
>
> Zenm Chen <zenmchen@gmail.com> wrote:
> > Sent: Monday, November 10, 2025 7:03 AM
> > This firmware was extracted from the vendor driver for RTL88x2BU
> > v5.13.1-30-g37e60b26a.20220819_COEX20220812-18317b7b from
> > https://github.com/RinCat/RTL88x2BU-Linux-Driver
> >
> > Signed-off-by: Zenm Chen <zenmchen@gmail.com>
>
> I confirmed the binary is identical as release version, so
>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Thank you.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/776


josh

>
> > ---
> > Some people said this firmware fixed certain problems [1][2], so upstre=
am it.
> > Only tested with RTL8822BU, NOT SURE IF RTL8822BE/RTL8822BS WORK FINE
> > WITH IT.
>
> I tested RTL8822BE and no obvious fault.
>
> Look back into vendor driver, all interfaces use the same firmware, so I
> think it will be fine.
>
>
