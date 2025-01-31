Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF2C0218F
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Jan 2025 20:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89CF4C4CEE4; Fri, 31 Jan 2025 20:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C01C4CEE3
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738354732;
	bh=Wg8vZIi7TevRHncG9ZzSebtFrtuQNBIz2/LS+ykm0Wc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kIAU7RyUbKW9oqaNZ+UdQrwRLwhZ1k9lSsJMDjVMc+gVV84rLft7cczuYbHPHBHuL
	 sgoItYLqtasTczQsFH/xLHcZC71lOkkvngNXi7VGWxcdeqywCTixSvl0+PjLbcO7Cb
	 elZDxHjgXUUbbpqgF71+glXbAag2gVJ6Se9CF6bYWZBI+zxJTznVpFQH4z+Eej5vP1
	 dmju/xpPOEiFmBCMTl78h7ZMPH6o3NzzOLoc+d3VKGOxrqlck5BBkYSc0xJ+EzP19j
	 mPjucQkokcEgprAA4UN8Ox+EJ0PtxEobvdP1ykHdyXBU9pQr9HQNS3lMmBc7q1Dmz6
	 pmF4oDuj+mtJw==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e573136107bso3110862276.3
        for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 12:18:52 -0800 (PST)
X-Gm-Message-State: AOJu0YxH/eCqQZmpqselB58ZmVTH309YKDcSwiMEbhm2IWpXeoZL0YCI
	d2H50wncqDlCBefjO0rkZ3ruk3ZZZxXxZyyuPxmiM1mYTEPJBdMxx3UztettBKcagnZ7YAEfIE4
	UmdHoQ6M1xanS///62zCKBc2s/dg=
X-Google-Smtp-Source: AGHT+IE1Ufh/4z/SNmXbWOTPE3C8uXDMndKpbZqz3X74nE1LJzCjBO6hdXCozGD8VcPc4kcJlQ3euhbsy2PUS0t8r5o=
X-Received: by 2002:a05:6902:230e:b0:e5a:ca6b:452a with SMTP id
 3f1490d57ef6-e5aca6b4687mr7114141276.20.1738354731606; Fri, 31 Jan 2025
 12:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20250131183643.3321810-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20250131183643.3321810-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 31 Jan 2025 15:18:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA52Zch7pnvVYb-vP7_Are0h4vdf-q827EkWeQi2=jTVug@mail.gmail.com>
X-Gm-Features: AWEUYZkRdzXaObCCOrkNlpVoC7E_dxfzyEyCLOldTg2AV4-dm3UO6JZJvfFfhm0
Message-ID: <CA+5PVA52Zch7pnvVYb-vP7_Are0h4vdf-q827EkWeQi2=jTVug@mail.gmail.com>
Subject: Re: qca: add bluetooth firmware for the WCN3950 BT/WiFi chips
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
	linux-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 1:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add BT firmware for the WCN3950 chip, found on e.g. Qualcomm Robotics RB1
> platform.
>
> ----------------------------------------------------------------
>
> The following changes since commit 50ce0eea27cc73566f5c7d0060409d796ef40a=
16:
>
>   Merge branch 'main' into 'main' (2025-01-31 15:56:49 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/lumag/linux-firmware.git cmbt

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/432

josh

>
> for you to fetch changes up to 8e74b76b7b63860210cbae5bd55f98e2e94cf627:
>
>   qca: add firmware for WCN3950 chips (2025-01-31 20:13:42 +0200)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       qca: restore licence information for WCN399x firmware
>       qca: move QCA6390 firmware to separate section
>       qca: add firmware for WCN3950 chips
>
>  WHENCE           |  31 ++++++++++++++++++++++++++++---
>  qca/cmbtfw12.tlv | Bin 0 -> 47307 bytes
>  qca/cmbtfw13.tlv | Bin 0 -> 21555 bytes
>  qca/cmnv12.bin   | Bin 0 -> 2690 bytes
>  qca/cmnv13.bin   | Bin 0 -> 1641 bytes
>  5 files changed, 28 insertions(+), 3 deletions(-)
>  create mode 100644 qca/cmbtfw12.tlv
>  create mode 100644 qca/cmbtfw13.tlv
>  create mode 100644 qca/cmnv12.bin
>  create mode 100644 qca/cmnv13.bin
