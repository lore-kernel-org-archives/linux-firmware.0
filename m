Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EBDCA0EDC
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 16:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAAC0C116C6; Wed, 20 Aug 2025 16:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BC2C4CEE7
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755706538;
	bh=UvkYYnBUS1D6NyFmgdTW1apabOQ3ANibckS3QLWeepo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FODRU0NoZWQDOpbgU5oEG2lXsthpSQHYyXmhFGYaPL07LmdwuLgarVaCvmXaraQlw
	 vu+G5EUwXTXTpweNkYuted2RgmzMp2koeH9oHd2dr6xMGIbrRp+40SWX/xkElU7xKi
	 Eqhhxe8gzm8UPlKCy1fZjjvtBIqyUFP/Nfjx99hUPyaR4R0w9rqAO58vIyBfkWcYFB
	 USmAml6bGK6Ov1eIelu9wPeUKOKDUBQuBPVhh3AMPJ8Q4CLMDpU0RUsQxxvdLC4DR8
	 Und01Xxv/ipC2Q98Gbg1HaofM42vSfUdFxn1yur7z1Nw/eXdHtQuwXSW/HBTnBuCDU
	 5biMrajfyS1eQ==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e93cc7c64faso61816276.0
        for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 09:15:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YzFrowWllQNtiNT/sgkGBLeh/sHkbLgyOgj9E/31iER1wgS6haD
	0h6yhGN3wasVqTAWkmzNBc8jatT0hG6QTva3Uc5VlP75scY+OTCiRm2VAJ8GW6Ta7SHxx0lhlFW
	3OtrD5oHigjK1H6ANa5wjRM1GtVsTV4A=
X-Google-Smtp-Source: AGHT+IGq3w5yq/Defwiz2YVf6eCgQjGLvpDNqwYTVXYS2Oef29T1sT0kL7sysreQ5Pr+G6HeLisPruVMjyAatDEI4XA=
X-Received: by 2002:a05:6902:158f:b0:e93:47cc:f445 with SMTP id
 3f1490d57ef6-e94f6645c7dmr4234155276.22.1755706537986; Wed, 20 Aug 2025
 09:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
In-Reply-To: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 20 Aug 2025 12:15:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5ONzMVRhr_kO49ZG4djy4XgNn-xbSjiges5tRYMSX=Tg@mail.gmail.com>
X-Gm-Features: Ac12FXxVSqAWkipeN_43l6B4b8y8YCEIaUynm_HwNJcpZ6AF1Ho_CEdTuW63pRU
Message-ID: <CA+5PVA5ONzMVRhr_kO49ZG4djy4XgNn-xbSjiges5tRYMSX=Tg@mail.gmail.com>
Subject: Re: Add firmware binary for SM8650
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 7:55=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hi,
>
> The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243=
a5:
>
>   Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-SM8650

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/654

josh

>
> for you to fetch changes up to ece445af91bbee49bf0d8b23c2b99b596ae6eac7:
>
>   qcom: Add firmware binary for SM8650. (2025-08-20 17:23:16 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: Add firmware binary for SM8650.
>
>  WHENCE                |   4 ++++
>  qcom/vpu/vpu33_p4.mbn | Bin 0 -> 2343624 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu33_p4.mbn
>
>
>
> Thanks,
> Dikshita
