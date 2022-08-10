Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACAAC00140
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Aug 2022 11:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92B94C4347C; Wed, 10 Aug 2022 11:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D939C433D7
	for <linux-firmware@kernel.org>; Wed, 10 Aug 2022 11:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660132766;
	bh=BS1BoX9+LNtkMDpoZKGQhyHyRd/R0fr+YjgW3IjF2Zs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nvKUq93ZXr3RTt1TWoW5+8uz4/SoNCY94qkOdk63PXjTP+fsLadXEGCblwbTZi9yt
	 byG2PJf6fkSbfcHB9x6sEAmtreQq7FSLRzM317s/BzcjxAlFP5i2i0mFdIr+O97f8v
	 p3qTVTlGJ8QdA5rwne2v3qAAj9eMDrI3ojHp4FF16ZsSNotTsVL5WT8kTnB+pWDRoH
	 tzz461eeVc6jSNLzX8LiF11XvNOtLOcoKoo2t7ua2UXF487Lj6HrpjMp+B+zTcPRGt
	 eTk+lsethc5f3+aPU6bv4pGie4iYUDql8i8Z7fLyEPZUDB7/FZekPJtl3Wu4BpdHl6
	 o1H3zG4E1jyPA==
Received: by mail-io1-f52.google.com with SMTP id y82so5084993iof.7
        for <linux-firmware@kernel.org>; Wed, 10 Aug 2022 04:59:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo1bLuTaxwdwntnBreCpBfdKyaq2wd0CVPA1Z1hzenyfvS6qXFyE
	dpEIsNs7jti+MonLhxrUl5M+374Qg+TWHbp3ybs=
X-Google-Smtp-Source: AA6agR6PrpyUSJk4ml1x3OWJJmtGDSJML8XSuIswHSuoed1afjC0AGtoegSPrt+R48stXu3ofp/XOU/x2yEJtZ1xqts=
X-Received: by 2002:a05:6638:1612:b0:342:7bee:3422 with SMTP id
 x18-20020a056638161200b003427bee3422mr13253927jas.144.1660132765624; Wed, 10
 Aug 2022 04:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629@BN0PR02MB7950.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB7950BE2F9D2FBFF3B1C5E499F9629@BN0PR02MB7950.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Aug 2022 07:59:14 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5fufLasAGheLv6GPf2qs-OWyLovgsyD1aZu66X+aV6bQ@mail.gmail.com>
Message-ID: <CA+5PVA5fufLasAGheLv6GPf2qs-OWyLovgsyD1aZu66X+aV6bQ@mail.gmail.com>
Subject: Re: qca: Update firmware files for BT chip WCN6750.
To: "SURAJ ASHOK MAGAR (Temp) (QUIC)" <quic_smagar@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Sai Teja Aluvala (Temp) (QUIC)" <quic_saluvala@quicinc.com>, 
	Balakrishna Godavarthi <bgodavar@qti.qualcomm.com>, 
	"Atul Dhudase (QUIC)" <quic_adhudase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 9, 2022 at 5:18 AM SURAJ ASHOK MAGAR (Temp) (QUIC)
<quic_smagar@quicinc.com> wrote:
>
> Hello Team,
>
>
>
> Please include firmware bins for WCN6750.
>
>
>
> Changes includes updated firmware files with:
>
>      Add on Features support for QHS and QCM
>
>      Bug Fix for RSSI calculation
>
>      IOT bug fixes related to power level during streaming
>
>      Braktooth issue fix
>
>
>
> Snapshot of pull request is as below, let me know if anything is missing.
>
>
>
>
>
>
>
>
>
>
>
>
>
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>
>
>
>   amdgpu partially revert "amdgpu: update beige goby to release 22.20" (2022-07-25 14:16:04 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/suraj714/BT-Upstream.git main

Pulled and pushed out.  Thanks.

josh

>
>
>
> for you to fetch changes up to 4f8f67efcdea8b875de75293f57825b32846739b:
>
>
>
>   qca: Update firmware files for BT chip WCN6750.      This commit will update required firmware files for WCN6750. (2022-08-09 14:31:29 +0530)
>
>
>
> ----------------------------------------------------------------
>
> Suraj Magar (1):
>
>       qca: Update firmware files for BT chip WCN6750.      This commit will update required firmware files for WCN6750.
>
>
>
> qca/msbtfw11.mbn | Bin 155568 -> 162224 bytes
>
> qca/msbtfw11.tlv | Bin 143356 -> 150012 bytes
>
> qca/msnv11.bin   | Bin 5827 -> 5827 bytes
>
> 3 files changed, 0 insertions(+), 0 deletions(-)
>
>
>
> Regards,
>
> Suraj Magar.
>
>
