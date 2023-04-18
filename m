Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8010CC6FD18
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Apr 2023 11:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69571C433A1; Tue, 18 Apr 2023 11:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540ACC4339E
	for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681819048;
	bh=0BtJ4sOgYTe+vCL8w/LVV5rac3fAL5HS7KaegKFXku4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nG3ka62E5PGBHuAvwblIw/jZb67UAY9n3S8reHmt0YBFOPMXxKH+PEx55l8TXhVOI
	 lQfZxM+zA8S2Y3Vhzy3MzOWy9Eca4iwqoK/fMSEGNpU2Xzp3uvTjO+AzwuSXCXsDVM
	 c0RwDX5vqhNLxXrRNz4NblfOuStVQfLzCeKG//rod8vI4OFYTSWW/REp4cKt5XIkNI
	 Px41QFqw6J8so2vcfdrHP1YeMcaKH72FYpd/JdRXyZDd53jhFHetWu9oeukP8CczmQ
	 JDQSPpclgJJ4rEJOuxBw3RMhKeZLu8xZ7eFz3k76G72P40aM8ugouHXSrsT/WkLETe
	 Cqb8Jrwn6ox0Q==
Received: by mail-yb1-f172.google.com with SMTP id n193so6290545ybf.12
        for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 04:57:28 -0700 (PDT)
X-Gm-Message-State: AAQBX9e+vygBZNdb07owxAgrUE59CneqK16WEV2lNFuyTiKIKc0j17p1
	/em+1gzXlSUvIiRDvjUIgCH+sQlrDGfj4ElXwBg=
X-Google-Smtp-Source: AKy350YqT6ZYhdRAMbI4Jqh+BqmVr6/S+p2n5sKIhIsibazlBnXw070j7Ox/yNT4v1H0EowSNjhDOP6AIXCYqTRqNx0=
X-Received: by 2002:a25:6708:0:b0:b92:2368:bdbe with SMTP id
 b8-20020a256708000000b00b922368bdbemr11631416ybc.32.1681819047380; Tue, 18
 Apr 2023 04:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR02MB75428BF5CB96C4533A0ECD79FA959@PH0PR02MB7542.namprd02.prod.outlook.com>
In-Reply-To: <PH0PR02MB75428BF5CB96C4533A0ECD79FA959@PH0PR02MB7542.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Apr 2023 07:57:16 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7mh3mFp28oxVxJa=DbKehhgX0Sxxtz8YBWSsU_7iWkiQ@mail.gmail.com>
Message-ID: <CA+5PVA7mh3mFp28oxVxJa=DbKehhgX0Sxxtz8YBWSsU_7iWkiQ@mail.gmail.com>
Subject: Re: QCA: Update firmware files for BT chip WCN6750
To: "Sampath Nimmala (Temp) (QUIC)" <quic_sampnimm@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>, 
	"Sai Teja Aluvala (Temp) (QUIC)" <quic_saluvala@quicinc.com>, 
	"Atul Dhudase (QUIC)" <quic_adhudase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 4:31=E2=80=AFAM Sampath Nimmala (Temp) (QUIC)
<quic_sampnimm@quicinc.com> wrote:
>
> Hi Team,
>
> Please include firmware bins for WCN6750.
>
> Major contributions : Bug Fixes.
>
> Snapshot of pull request is as below, let me know if anything is missing.
> -------------------------------------------------------------------------=
--------
> The following changes since commit 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00=
e1:
>
>   Merge https://github.com/pkshih/linux-firmware (2023-04-06 07:30:31 -04=
00)
>
> are available in the Git repository at:
>
>   git@github.com:sampathnimmmala/Bluetooth_FW.git main
>
> for you to fetch changes up to 167ab8853bc15f8ec58e6b76f98ee5007770d907:
>
>   qca: Update firmware files for BT chip WCN6750 (2023-04-10 13:55:38 +05=
30)
>
> ----------------------------------------------------------------
> sampnimm (1):
>       qca: Update firmware files for BT chip WCN6750
>
> qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes
> qca/msbtfw11.tlv | Bin 154624 -> 155340 bytes
> qca/msnv11.b09   | Bin 0 -> 5847 bytes
> qca/msnv11.b0a   | Bin 0 -> 5847 bytes

These file additions need to be added to WHENCE or check_whence.py fails:

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: qca/msnv11.b09 not listed in WHENCE
E: qca/msnv11.b0a not listed in WHENCE
[jwboyer@vader linux-firmware]$

Can you adjust please?

josh

> qca/msnv11.bin   | Bin 5847 -> 5847 bytes
> 5 files changed, 0 insertions(+), 0 deletions(-)
> mode change 100644 =3D> 100755 qca/msbtfw11.mbn
> mode change 100644 =3D> 100755 qca/msbtfw11.tlv
> create mode 100755 qca/msnv11.b09
> create mode 100755 qca/msnv11.b0a
> mode change 100644 =3D> 100755 qca/msnv11.bin
>
> -------------------------------------------------------------------------=
--------
>
>
>
> Thanks,
>
> Sampath
>
>
