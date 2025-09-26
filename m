Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D4CAC5BB
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Sep 2025 19:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E435C4CEF8; Fri, 26 Sep 2025 19:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349B3C4CEF7
	for <linux-firmware@kernel.org>; Fri, 26 Sep 2025 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758914454;
	bh=7N5d3Dzn0BqHEAQopLp1FnVDhZ7Z9IfM3JDchDGwd7o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ZQSPF1xBgM96I2MWM0dcn8wjqduyQcKbFFS968j39f0uPa3raUpCmI6jgj2Lw/0fp
	 Z+QG+AORHoXiC2Tda84eXJomW3In78K3nHsa952sTosHu0Cn1lhZBIuRQMxu3YWuyG
	 5CcxooN+FidyexO6fvRoPQ8jqnyennIqWNQhAbp5v6gIL7rDQ3LQXt0bQ7lT2LGlGF
	 2uhGQhrk7QuL7+VdDhQy8YS8Y39kmhVqdAyvj7s6vpTGlADfAotIFSWNUDeM0fucOB
	 TyFMUzq3W3pg9/VjQSvKMFmWOeRAPzNSy4ktFGNby+lbCLu0NpqTb+H7xQ1bLoi/nV
	 KYYr3c54ORIxA==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-74625f748a0so28624847b3.2
        for <linux-firmware@kernel.org>; Fri, 26 Sep 2025 12:20:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YyFN3/Ui2HsFtNYpDSBKYoKKD/sAfi562PQY4XbrV+sasG9oIpi
	rEQdXtl1RxDfnk7paDdWkmevB9DhX4UJNEamguCubP7GaE3o3sXp31eQacuk0C1xdnmscYx7VVj
	iVHVQ3gjSNUrPyw/0j42PXEHlbRPJYu8=
X-Google-Smtp-Source: AGHT+IES1raCxxFINJQr+dmtQ9LgFVrs8IhuqhlDaCX3NyY/+k68dtZjbkgtpMQiAG5OyOqdO2Yyt7upU4mGvVz7Ic0=
X-Received: by 2002:a05:690e:144c:b0:635:4ecd:75a0 with SMTP id
 956f58d0204a3-6361a89a815mr7552466d50.46.1758914453395; Fri, 26 Sep 2025
 12:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <bc9e546e-d560-4088-a6ea-937009b8343e@oss.qualcomm.com>
In-Reply-To: <bc9e546e-d560-4088-a6ea-937009b8343e@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 26 Sep 2025 15:20:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4X7i2rQV=QHLC-K-_pjNUp=LaRJY0tspBYXSvpoV9STA@mail.gmail.com>
X-Gm-Features: AS18NWAoUXnaqRXQfeU4OiGKI_n-1x0a1TmuD0a4qrZj3f9RWUzb0lk6u9nGURM
Message-ID: <CA+5PVA4X7i2rQV=QHLC-K-_pjNUp=LaRJY0tspBYXSvpoV9STA@mail.gmail.com>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 1:49=E2=80=AFPM Jeff Hugo <jeff.hugo@oss.qualcomm.c=
om> wrote:
>
> The following changes since commit 1269106c61a34b8f65d045c8045df880083bd3=
b1:
>
>    Merge branch 'amd-staging' into 'main' (2025-09-24 13:46:33 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_4

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/704

josh

>
> for you to fetch changes up to 19c12c41c84187a9fa1df1b58bb6f72a181ba620:
>
>    qcom: Update aic100 firmware files (2025-09-25 11:38:38 -0600)
>
> ----------------------------------------------------------------
> Jeff Hugo (1):
>        qcom: Update aic100 firmware files
>
>   qcom/aic100/fw1.bin  | Bin 2135752 -> 2180920 bytes
>   qcom/aic100/fw10.bin | Bin 249439 -> 249439 bytes
>   qcom/aic100/fw2.bin  | Bin 783512 -> 812184 bytes
>   qcom/aic100/fw5.bin  | Bin 24576 -> 24576 bytes
>   qcom/aic100/fw9.bin  | Bin 762704 -> 787280 bytes
>   qcom/aic100/sbl.bin  | Bin 1048576 -> 1048576 bytes
>   6 files changed, 0 insertions(+), 0 deletions(-)
