Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C05C47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DA25C433B1; Fri,  2 Feb 2024 12:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686CFC43394
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877038;
	bh=n/8t2hkry3zhXtB7QBzdYb2sWAf/LHBGKqsFB6lD/2o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HfLV55OPyUQWEwYbMVfUUSt/4Wc/IYMpKtZyFPdPq54zLu+uoZVfZxLW+rd0uScSY
	 7sir7695iJEjEgbcXEiLhSPvwTAJvdR4N9eK04og6bOQdQ0mzJEcE9X3+8OriOqRm6
	 zkPsKmaURRZNVgZO8jr5G2CrNAmj0fJOBGS3p7TKj6R/F4wehSIareM0i3g9shpFsH
	 PmW1V4FgWQB2dnv1FXLs8m+0fMNZrK7mBNN6I9zJPLns2rbRcDxKRDHswKhRktrCs0
	 qKa5pGQfyXbVUBMuzOaU8D/PArGENRH/EDDoBnalR80zlkQeRzj6G0ZFIZADP5iBty
	 KwRSiKPobIlug==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1822778276.1
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:30:38 -0800 (PST)
X-Gm-Message-State: AOJu0YydWNXnj+sfnTPcnkY5zTfoPzW4uH0NW6tSkFC2WB0W2GPzy77d
	ZyFHjl/X3y0ABi2SCwBcyf9MZM8Nnm1nyEusD3dvCIuNlUZKfoNxPoBcW/4Fkq7+ECPDuBgzfK+
	MdTunxXzcNvavVOGake126DpjWyA=
X-Google-Smtp-Source: AGHT+IE/R/6fbfF/iZFpG1E19S9PMCx7mKmQvc7REgzVg8Py6ryrbabI9jRUisLrv2UjZe/Mr7NlpRZeoUFFYODNeO4=
X-Received: by 2002:a25:698b:0:b0:dc6:b974:68cb with SMTP id
 e133-20020a25698b000000b00dc6b97468cbmr5420828ybc.31.1706877037562; Fri, 02
 Feb 2024 04:30:37 -0800 (PST)
MIME-Version: 1.0
References: <efe74937-bd6e-43eb-a2e3-9e52deb92946@linaro.org>
In-Reply-To: <efe74937-bd6e-43eb-a2e3-9e52deb92946@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:30:26 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7zNt4hrpDe=HimSqyqnTMZO5_Mzh7hBuD9MBx14DHRTA@mail.gmail.com>
Message-ID: <CA+5PVA7zNt4hrpDe=HimSqyqnTMZO5_Mzh7hBuD9MBx14DHRTA@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8550 HDK platform
To: neil.armstrong@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 4:37=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> The following changes since commit 1a9518c73c4b54854c9cd8f416fd3b8f8e3456=
e7:
>
>    Merge branch 'mlimonci/amd-2024-01-30.2' into 'main' (2024-01-30 15:55=
:30 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8550-hd=
k-audio-fw

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/139

josh

>
> for you to fetch changes up to 3be2e165e5299f0162003d4c5eaa2832da4c30bc:
>
>    qcom: Add Audio firmware for SM8550 HDK (2024-01-30 17:36:03 +0100)
>
> ----------------------------------------------------------------
> Neil Armstrong (1):
>        qcom: Add Audio firmware for SM8550 HDK
>
>   WHENCE                          |   1 +
>   qcom/sm8550/SM8550-HDK-tplg.bin | Bin 0 -> 24296 bytes
>   2 files changed, 1 insertion(+)
>   create mode 100644 qcom/sm8550/SM8550-HDK-tplg.bin
