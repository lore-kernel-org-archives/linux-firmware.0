Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668D1C2BA1A
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Jun 2024 16:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DE5DC4AF07; Thu, 20 Jun 2024 16:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1693CC4AF09
	for <linux-firmware@kernel.org>; Thu, 20 Jun 2024 16:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718902512;
	bh=DEnJDlxI7ouq96kG4nCeuDwbggk9NVBb52c1U9fIEjU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=uI+t2g5l1BFfPdesTtSIFTPaMgfMR6HezZqGoxJ/ovjrLyDXBVjSTS0clU6o7eGit
	 5nLIMJVDtfvuZYwHNjC2LBlyvMo5oUiwrJ1SnAfnSX0n44eCynfcYOem8ycmEgFxQA
	 GWcc++mkLrhv4uXqfXtKbn9+ehgNMps642mw+Wzza7ebmO1tLKhIxoZD5B4gSwHv4N
	 dXtNetBP71s3d5Wodek/EAnTZT2jY6h+buy4pPr0z86iyXOigTs6AHmfMb4iyw9IFd
	 TsuqQG6DL0KCg/vhkAgp98Jj3MbZbuVDpVMVhrNNjyfrHun0qyN5jBk+fOTYafZawT
	 DDYEDqQuS3pHw==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6383f01d1deso10493987b3.0
        for <linux-firmware@kernel.org>; Thu, 20 Jun 2024 09:55:12 -0700 (PDT)
X-Gm-Message-State: AOJu0YzC4LZp/r7eef13FiaOah5YVjFrpk8BAGeSYlIfwU+R4dlZPcTh
	6phzKtGI9117FjRiSysTt5qy4RGGAGoeZX7F7uDOZX01F2i/TfF21fAbY1t7+jhWr1BlCXj+9Lc
	sfTIvGt5itnzoZnTEwpXzBYVRUAQ=
X-Google-Smtp-Source: AGHT+IEcr3aOuT1qTMt+LOxl8yiBethc9VJtr9f8RnE9QvExWNaQ0rHzl1p3jcDr9H7hGczigEfcRpCwz/UvJ5GjRhg=
X-Received: by 2002:a05:690c:988:b0:63b:c3ed:f171 with SMTP id
 00721157ae682-63bc3edf56fmr39145767b3.35.1718902511249; Thu, 20 Jun 2024
 09:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <1c0d33f8-6cd7-e7f1-b130-09b6279cd4bd@quicinc.com>
In-Reply-To: <1c0d33f8-6cd7-e7f1-b130-09b6279cd4bd@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 20 Jun 2024 12:54:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA72zBGVp7CFR1T6irDzKvzh1axmL=RCuLiGe-EQJy6exw@mail.gmail.com>
Message-ID: <CA+5PVA72zBGVp7CFR1T6irDzKvzh1axmL=RCuLiGe-EQJy6exw@mail.gmail.com>
Subject: Re: [PULL]: Add firmware for Qualcomm AIC100
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:06=E2=80=AFPM Jeffrey Hugo <quic_jhugo@quicinc.c=
om> wrote:
>
> The following changes since commit a34a7ad5014c2b833c6a2c0f89357f98a0bdda=
b0:
>
>    Merge branch 'upstream' into 'main' (2024-06-18 11:34:55 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/quic-jhugo/linux-firmware aic100_1_15_4_0

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/234

josh

>
> for you to fetch changes up to 335a6a3769201aca271c7265b43a092b4a616aa0:
>
>    qcom: Add AIC100 firmware files (2024-06-20 09:48:59 -0600)
>
> ----------------------------------------------------------------
> Jeffrey Hugo (1):
>        qcom: Add AIC100 firmware files
>
>   WHENCE               |  12 ++++++++++++
>   qcom/aic100/fw1.bin  | Bin 0 -> 1571360 bytes
>   qcom/aic100/fw10.bin | Bin 0 -> 249439 bytes
>   qcom/aic100/fw2.bin  | Bin 0 -> 771016 bytes
>   qcom/aic100/fw5.bin  | Bin 0 -> 24576 bytes
>   qcom/aic100/fw9.bin  | Bin 0 -> 750416 bytes
>   qcom/aic100/sbl.bin  | Bin 0 -> 805808 bytes
>   7 files changed, 12 insertions(+)
>   create mode 100644 qcom/aic100/fw1.bin
>   create mode 100644 qcom/aic100/fw10.bin
>   create mode 100644 qcom/aic100/fw2.bin
>   create mode 100644 qcom/aic100/fw5.bin
>   create mode 100644 qcom/aic100/fw9.bin
>   create mode 100644 qcom/aic100/sbl.bin
