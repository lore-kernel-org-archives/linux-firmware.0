Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00423CCD199
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Oct 2025 12:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE85AC116B1; Mon, 20 Oct 2025 12:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A914BC4AF09
	for <linux-firmware@kernel.org>; Mon, 20 Oct 2025 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963804;
	bh=xc0qJB8vK7Tvv/a0YC7GR4ZVmGKgpfC2+xqfFC9CSGA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Dj7nWNnpymjd3kgkKAT7Wgwwb5YR0NgCi/zrfjhKeORazx1jE6/lXw8c35BWQKTuX
	 Xwxkqlj/6QPRmDifyrsHoHW3LWNTIWXEfKJqsiQC6SaP06tVpnM2A4v4E6G6IjGoGr
	 IyV+4bJ4sFaaap957ZVIj2hiI++8ZfDyzVchEUiS4QM2kHlSKmE5BqEzOuEYEYwhcP
	 Wztn82MfTJACd0/OMV7OEo+QCgIDo9nf8CN3vo1b6ZcmxP6FMkpjHiddxakTIbNNqK
	 NKEsiNmu65eoBR/swnH8IE2ZgOwq6AABKlgGTXcWcAJOl/zM3hR5tjhNBGxFrdHH6H
	 MdisYbFPEOT4g==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-780fe76f457so49528357b3.0
        for <linux-firmware@kernel.org>; Mon, 20 Oct 2025 05:36:44 -0700 (PDT)
X-Gm-Message-State: AOJu0YwMy0MscIigar7Do5xzoxXSE3Cl21NTIB5Svho3Wotp7CQ2rPf6
	hDiTuT2gzvX21jZlbCwCvl9S7X3eBrliWArqGs9/gTcGy+RJMULDRZ88hg7sAicakDXa8oRgpaM
	2xYguFl36xJuP/4TKOZJtoY/TJo2eTss=
X-Google-Smtp-Source: AGHT+IEx4EtSf5f1Z4LMFGC+lhHjO4jW2cxUrGa6yHb85VLlQBYkh0T2zN97aVJZDtZsOdk1haK1sxCglLdYn8N1hZ8=
X-Received: by 2002:a05:690c:6f09:b0:717:ca51:d781 with SMTP id
 00721157ae682-7836d1c4bdcmr206427957b3.17.1760963803946; Mon, 20 Oct 2025
 05:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHiGmwSb3L1P=qWBdiRMfM2kSgbCKkirsiGugTsPsh3TwQ@mail.gmail.com>
In-Reply-To: <CAPiVHHiGmwSb3L1P=qWBdiRMfM2kSgbCKkirsiGugTsPsh3TwQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 20 Oct 2025 08:36:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5zi8LmyiK_at=1ZK-D5RjWEDBE9bLSRUR6HV9=qF0xXg@mail.gmail.com>
X-Gm-Features: AS18NWDDkHLlGtMMi0CxBbdJar-8FORTuhRz_D6Z6pjVk_pKKfRangvTJXl8UzA
Message-ID: <CA+5PVA5zi8LmyiK_at=1ZK-D5RjWEDBE9bLSRUR6HV9=qF0xXg@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, hbandi@qti.qualcomm.com, 
	mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/750

josh

On Tue, Oct 14, 2025 at 1:45=E2=80=AFPM Janaki Ramaiah Thota
<janaki.thota@oss.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for bluetooth firmware. Please let me know if
>  you have any problems.
>
>  The following changes since commit 849bf4412342998d58ef902f3905ebee36e99=
107:
>
>   Merge branch 'robot/patch-0-1760383836' into 'main' (2025-10-13
> 19:40:41 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quicjathot/bt_hsp_fw_2.1.0_00659.git HEAD
>
> for you to fetch changes up to 12f59f02d35d87a76a9f26085ee2f47e678b68cf:
>
>   QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
> (2025-10-14 23:03:42 +0530)
>
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       QCA: Update Bluetooth WCN6856 firmware 2.1.0-00653 to 2.1.0-00659
>
> Thanks,
> Janakiramaiah Thota
