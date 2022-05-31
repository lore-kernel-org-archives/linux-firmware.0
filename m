Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AE2C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 31 May 2022 16:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADEA9C3411F; Tue, 31 May 2022 16:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981A3C34114
	for <linux-firmware@kernel.org>; Tue, 31 May 2022 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654015964;
	bh=E9l+4wbI4asavBc5pnWPjVFqZBEExJu/9vGkep6QRec=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MKen71mIIUGkQyACeWrm/fh9oRH9Ghornbzmj53Nc0LgkqAusCBkSobtkFXM2NvI3
	 YxulTIKWwhgfZbNS3/LBMvKdzGofBRvlCUWg/4vSwmcZMwcszN0SrqMCSIUlnI6Nzv
	 937Fdhl9e/ZBAFwbwiPwOi+J7nPfEbO6rdgoZl2vLmBl81gBfEdqmaWI8PhC58zXLG
	 EUGhAAD9fiChcu6ddJU3CVwXxa/l+/bOCwZY3gRTLW7e3K8i9wM6OCUe9lrU6STTxf
	 reRHP3AzaYEDuTTNBrTRZj3ki6Ck4WP6HynYhlK1iUATvgxBjVTF+VXpKJ5ZExrZIr
	 dLxTtMjKcpRvw==
Received: by mail-il1-f170.google.com with SMTP id 3so10004205ily.2
        for <linux-firmware@kernel.org>; Tue, 31 May 2022 09:52:44 -0700 (PDT)
X-Gm-Message-State: AOAM532aqxQVmQ+p1jRr/6ySAIG007waEnFJy0Pj9pDcGyi6o0G7MgMg
	82L24d37fhjB2DEA8L0R7LOuRPsQrJ/KSOT4BdE=
X-Google-Smtp-Source: ABdhPJwPN3Fv4nlBfQbNLWJgiSicj0Ho1ri1wLgzU2tmAhKdSOatk5nuGFcPuRR4G8J6XNNuKfPUGte7HDaP6sLZ+4c=
X-Received: by 2002:a05:6e02:1c45:b0:2d3:bb0c:9559 with SMTP id
 d5-20020a056e021c4500b002d3bb0c9559mr2956251ilg.251.1654015963719; Tue, 31
 May 2022 09:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79@BN0PR02MB7950.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79@BN0PR02MB7950.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 31 May 2022 12:52:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7hdmFGEtOa672QVYgaX-Pmv3w+2vexo7-CXqmUabT40Q@mail.gmail.com>
Message-ID: <CA+5PVA7hdmFGEtOa672QVYgaX-Pmv3w+2vexo7-CXqmUabT40Q@mail.gmail.com>
Subject: Re: qca: Add firmware files for BT chip WCN6750
To: "SURAJ ASHOK MAGAR (Temp) (QUIC)" <quic_smagar@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Sai Teja Aluvala (Temp) (QUIC)" <quic_saluvala@quicinc.com>, 
	"Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>, 
	"Atul Dhudase (QUIC)" <quic_adhudase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 24, 2022 at 5:12 AM SURAJ ASHOK MAGAR (Temp) (QUIC)
<quic_smagar@quicinc.com> wrote:
>
> Hello Team,
>
>
>
> Please include firmware bins for WCN6750. Change includes updated TLV files to fix BT SSR.
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
>
> The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd2087:
>
>   amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38 -0400)
>
> are available in the git repository at:
>
>   https://github.com/suraj714/BT-firmware.git main
>
> for you to fetch changes up to dc13213e37cf49bc88e024b37a23e39d22b3d5fa:
>
>       qca: Add firmware files for BT chip WCN6750.     This commit will add required firmware files for WCN6750. (2022-05-17 15:46:00 +0530)

These already exist.  So they aren't being added, they're being
updated.  Is that correct?

> ----------------------------------------------------------------
>
> Suraj Magar (1):
>
>       qca: Add firmware files for BT chip WCN6750.
>
>       This commit will add required firmware files for WCN6750.

Can you add some information in the commit message about what is being updated?

josh
