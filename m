Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB81D32D9A
	for <linux-firmware@archiver.kernel.org>; Tue, 12 Nov 2024 12:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8AC7C4CED6; Tue, 12 Nov 2024 12:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3074C4CED0
	for <linux-firmware@kernel.org>; Tue, 12 Nov 2024 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731415791;
	bh=dJ9M97T50lSd22qj+iVkBVqwUlNtioHRiNrgs3PDWqc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=H+LxlPj87beDzw3vZTDvo2A0Mf/qe931dgn1UDpLBb2ys4L7SXE0Lg7yJrGwHIWlf
	 wynpJuLuxxU81GeUiUFgLlE+cUTHwahWq8/lMmYl/5aH7IdZDdI5nGrWdHSxTS7WPb
	 KB1ghRUlgsIP+TYSzpT0e+b9dbZuKhCr4wYw+oziQQAaVT8wjpIx4J+3r1DMzihMDj
	 4kyKaP8mIReOgHTGMYx51NXWlQFbwb5fCe5YQ4tiYSpY43Ntd8npJU6Id4KVqTyXbN
	 JB0mWa5+I1kUq3AwtxIEoTBjjVpsWi6O0ZK6Np/ilk0EIsY26lvkcCczTfUV8Qvwxv
	 lY3pk51Seiu/A==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e29047bec8fso5108536276.0
        for <linux-firmware@kernel.org>; Tue, 12 Nov 2024 04:49:51 -0800 (PST)
X-Gm-Message-State: AOJu0YwoIo6NDlWftOIBypTT10cfJg5UNLLlatl/B5we1Aa4Hr9FW4uA
	PZZwpysdTGN48/0kPrmDm+t45PO5NtNmhKesfUR6F+b1CblyWbcHyYsWvoQDKYkd4p6SAlEY2nE
	fi60s4MtGV+7OKs2dfbTUA3AshMI=
X-Google-Smtp-Source: AGHT+IFrhmd/G/nYB1NtcybnJnRF8PwwmRAoTlgcSaS6G+DFLZfGCRDwUMijJz1w+WZeBfKI7RYDCTO8SxxJSEREm1o=
X-Received: by 2002:a05:690c:7444:b0:6db:e1e0:bf6a with SMTP id
 00721157ae682-6eade40bf58mr133494877b3.7.1731415791023; Tue, 12 Nov 2024
 04:49:51 -0800 (PST)
MIME-Version: 1.0
References: <a16c9d20-fddf-41ac-b04b-460b38db7d10@quicinc.com>
In-Reply-To: <a16c9d20-fddf-41ac-b04b-460b38db7d10@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 12 Nov 2024 07:49:39 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7B6ZHFW68mHZtZa0gp3Nbi2E1-MFs4OtHhyj-iqZUvJA@mail.gmail.com>
Message-ID: <CA+5PVA7B6ZHFW68mHZtZa0gp3Nbi2E1-MFs4OtHhyj-iqZUvJA@mail.gmail.com>
Subject: Re: [PULL]: Add firmware for Qualcomm QDU100
To: Kishore Batta <quic_batta@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 5:18=E2=80=AFAM Kishore Batta <quic_batta@quicinc.c=
om> wrote:
>
> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3=
fe:
>
>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic-batta/linux-firmware/tree/qdu100_xbl_s_melf

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/368

josh

>
> for you to fetch changes up to 01842da45df0a9f862098d1597f6ae5774b3e48a:
>
>   qcom: Add QDU100 firmware image files. (2024-11-12 15:23:11 +0530)
>
> ----------------------------------------------------------------
> Kishore Batta (1):
>       qcom: Add QDU100 firmware image files.
>
>  WHENCE                 |   7 +++++++
>  qcom/qdu100/xbl_s.melf | Bin 0 -> 1424292 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 qcom/qdu100/xbl_s.melf
>
