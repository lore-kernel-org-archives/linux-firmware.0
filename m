Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47759CF9C6E
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 12:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28E6EC4CECD; Mon, 23 Sep 2024 12:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C97C4CED0
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727094250;
	bh=X4A/8Wt3qIlioPsHrBAwxGR+3JN2ZtphAnSBVmOJH3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LL8nhK1xYudVmiEJvx53XIxYRAgPqCqIRsR17cEtkjKM1d4KgzqRV9RKvGQuYSh3w
	 ZSWN2T/UZy/LsFApf67BZToB1ZuKu3/OOAVYSQHVM/VKy2msFG7L83Z61rXzV9U5X5
	 g1ENOW3p65rdPVEUNLgm4vKzTWLKTGKDqEcMU11I8WGbTkIJ/S4UW9oraSRtPYwCkG
	 kYD9llogKWje71KFFwH52awrQTY9+s4yzFIQCFoeJoOtMONEDapHXbUdMj4oZRyWpe
	 wpyIU9CENjc8NrCraPMg3kqG2erqXcizio9za2plVG1L2Nk5WBHp3IGdIhCcc3b3pP
	 aJGffrRpoO3EA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ddca648c26so35068617b3.1
        for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 05:24:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YwdkDpbAlwF0t0OhTNE/eKXMK5rGyFBsiTPgkr1H2JQ1wTgeZpR
	3zJvQCtLrjQxqSq7vOctrJAgGJYgowhyM4KuYoYGs75xMVsIpn/qmnhWamiI2HyGDpAtWcF0xhg
	gJM7cya1kiPol1ojtFTAUAPmNETI=
X-Google-Smtp-Source: AGHT+IHizBb15dA0Cr7Cs9fSvuV6otrZ+Yrbex9VmC7h963DDu8ynN3KMoRw3s+wT6idSt0HacDZcqmSTszSLs5td6c=
X-Received: by 2002:a05:690c:6412:b0:6bf:1ca2:f6ce with SMTP id
 00721157ae682-6dfee69d2aamr89458097b3.11.1727094249282; Mon, 23 Sep 2024
 05:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240917210323.tkzmi53qbm7jse4n@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240917210323.tkzmi53qbm7jse4n@hu-akhilpo-hyd.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Sep 2024 08:23:58 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6s78H_H6SWpMKc6ev7KCB_6TK5P5A77bWHL63EdLtg9g@mail.gmail.com>
Message-ID: <CA+5PVA6s78H_H6SWpMKc6ev7KCB_6TK5P5A77bWHL63EdLtg9g@mail.gmail.com>
Subject: Re: qcom: add gpu firmwares for sa8775p chipset
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 5:03=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> Hi,
>
> The following changes since commit 6c88d9b8253b8ec6df701a551a56438ea2e5ba=
cf:
>
>   Merge branch 'amd-staging' into 'main' (2024-09-13 20:28:50 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-S=
A8775p

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/299

josh

>
> for you to fetch changes up to 43c971bcd74d9793140a8fbbcc805204cb797f96:
>
>   qcom: add gpu firmwares for sa8775p chipset (2024-09-17 11:57:51 +0530)
>
> ----------------------------------------------------------------
> Akhil P Oommen (1):
>       qcom: add gpu firmwares for sa8775p chipset
>
>  WHENCE                    |   2 ++
>  qcom/a663_gmu.bin         | Bin 0 -> 55892 bytes
>  qcom/sa8775p/a663_zap.mbn | Bin 0 -> 1054680 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 qcom/a663_gmu.bin
>  create mode 100644 qcom/sa8775p/a663_zap.mbn
>
>  regards,
>  Akhil
