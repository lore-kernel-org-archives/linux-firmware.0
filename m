Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B05BC43334
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 14:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62EC8C341C8; Tue, 21 Jun 2022 14:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D59CC3411D
	for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655820418;
	bh=COxBdS+Fz4+rGuFL/SLsnAgn4m1mDoAz0jqPON8NWWk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Yq7oRCEzBJrIZxe0UzGYgVXy1cG63o/Y4XjCyyc5FTlDFqTraaQORq6mhNR7ltOnr
	 0hW4ZBQ1/GFHSR70nw2g+yMCPalTlrqgGt62UpGq7oCaT0j/4N4nrvxo+d95kHbVN1
	 jggXhhp0+K91A+A3UTfyU462h8hEGU22LOQwnf44pe2+CBwwRwMbea2XDCVa5roJ8Y
	 TI7v2Hz64p52pr3LtX3UFRNoS0XzU4ZdODtQyKqTCSmuEJUbKuKMvOrT0Fo4JV28A6
	 3CoIlwZfYkYKznu91Nc4chuscgPGt0ZKWEoZ5iZNQFrUq8UeRJzUqoEez8CJ7ZYXAo
	 85BUTmWVscHeA==
Received: by mail-io1-f54.google.com with SMTP id 19so14324627iou.12
        for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 07:06:58 -0700 (PDT)
X-Gm-Message-State: AJIora9jKZX59CWIY+/1lfQVokf2UvbY7SqUBim2pgHYF21U3MDbjjXj
	PLEvlolB1/1bUjY30BhB7DG6/dAPq7H2nkahH04=
X-Google-Smtp-Source: AGRyM1v7isedam9QieQNTeeRPbM9wwqRwpBf3c3x7Fl8k6Zk16KZRM7bYiHlVw1Ux2LbFXKY8fGCAN7xxtVg+QU8+E4=
X-Received: by 2002:a05:6638:160d:b0:331:a523:aea3 with SMTP id
 x13-20020a056638160d00b00331a523aea3mr16111355jas.144.1655820417445; Tue, 21
 Jun 2022 07:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <BN0PR02MB7950BE0DF597C420F4FAC5ECF9D79@BN0PR02MB7950.namprd02.prod.outlook.com>
 <CA+5PVA7hdmFGEtOa672QVYgaX-Pmv3w+2vexo7-CXqmUabT40Q@mail.gmail.com> <BN0PR02MB79503A0F37DC142E914EB94CF9B39@BN0PR02MB7950.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB79503A0F37DC142E914EB94CF9B39@BN0PR02MB7950.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 21 Jun 2022 10:06:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6qJoME1Ka=vwxAMZT_HF-txzYHBhZ9Jx1AD_i4h6OSkg@mail.gmail.com>
Message-ID: <CA+5PVA6qJoME1Ka=vwxAMZT_HF-txzYHBhZ9Jx1AD_i4h6OSkg@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 2:35 AM SURAJ ASHOK MAGAR (Temp) (QUIC)
<quic_smagar@quicinc.com> wrote:
>
> Hi Josh,
>
> Yes, it is updated.
>
> Updated firmware files with:
>     BLE audio
>     ASD algorithm improvements
>     LPAPC related optimizations
>     LE power control changes
>     A2DP+LE concurrency improvements
>     ETSI related changes for QHS.
>
> Please find pull request snapshot and updated commit message available in=
 the git repository.

Thank you.  Pulled and pushed out.

josh

>
>
>
>
> The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd20=
87:
>
>   amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38 -0400=
)
>
> are available in the git repository at:
>
>   https://github.com/suraj714/BT-firmware.git main
>
> for you to fetch changes up to 92f1088454f408fa29f1eca9f8f92c208881c099:
>
>       qca: Update firmware files for BT chip WCN6750. (2022-06-21 11:56:4=
0 +0530)
>
> ----------------------------------------------------------------
> Suraj Magar (1):
>       qca: Update firmware files for BT chip WCN6750.
>
>  qca/msbtfw11.mbn | Bin 129348 -> 155568 bytes
>  qca/msbtfw11.tlv | Bin 117136 -> 143356 bytes
>  qca/msnv11.bin   | Bin 5633 -> 5827 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)
>
>
>
>
> Regards,
> Suraj Magar
>
> -----Original Message-----
> From: Josh Boyer <jwboyer@kernel.org>
> Sent: Tuesday, May 31, 2022 10:23 PM
> To: SURAJ ASHOK MAGAR (Temp) (QUIC) <quic_smagar@quicinc.com>
> Cc: linux-firmware@kernel.org; mka@chromium.org; linux-kernel@vger.kernel=
.org; linux-bluethooth@vger.kernel.org; linux-arm-msm@vger.kernel.org; Sai =
Teja Aluvala (Temp) (QUIC) <quic_saluvala@quicinc.com>; Balakrishna Godavar=
thi (QUIC) <quic_bgodavar@quicinc.com>; Atul Dhudase (QUIC) <quic_adhudase@=
quicinc.com>
> Subject: Re: qca: Add firmware files for BT chip WCN6750
>
> On Tue, May 24, 2022 at 5:12 AM SURAJ ASHOK MAGAR (Temp) (QUIC) <quic_sma=
gar@quicinc.com> wrote:
> >
> > Hello Team,
> >
> >
> >
> > Please include firmware bins for WCN6750. Change includes updated TLV f=
iles to fix BT SSR.
> >
> > Snapshot of pull request is as below, let me know if anything is missin=
g.
> >
> >
> > The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd=
2087:
> >
> >   amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38
> > -0400)
> >
> > are available in the git repository at:
> >
> >   https://github.com/suraj714/BT-firmware.git main
> >
> > for you to fetch changes up to dc13213e37cf49bc88e024b37a23e39d22b3d5fa=
:
> >
> >       qca: Add firmware files for BT chip WCN6750.     This commit will=
 add required firmware files for WCN6750. (2022-05-17 15:46:00 +0530)
>
> These already exist.  So they aren't being added, they're being updated. =
 Is that correct?
>
> > ----------------------------------------------------------------
> >
> > Suraj Magar (1):
> >
> >       qca: Add firmware files for BT chip WCN6750.
> >
> >       This commit will add required firmware files for WCN6750.
>
> Can you add some information in the commit message about what is being up=
dated?
>
> josh
