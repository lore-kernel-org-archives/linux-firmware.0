Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7EBC2BA19
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Apr 2020 11:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A8002075E; Mon, 13 Apr 2020 11:50:39 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EC6482063A
	for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586778639;
	bh=TVcjJhn/D288kHqIjLipsOOh6So+J9K9FsxYdTp98+o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=O9ilp7j8b9HOmD0SfKh/vRJQ6ToueNDydjp6Nn0EeQ9DqkHv+966epEB6LNGHlB5y
	 i3LyGvl93cv3Lt1frVGfV5Tb0p3sxR6sKs34gQC1tDDDqPDu+14p18LTOpo9bLpfLI
	 G0iHielMz442bGGx4FiSBO1ALevJoi9hOtzwtW6U=
Received: by mail-io1-f51.google.com with SMTP id f19so9025986iog.5
        for <linux-firmware@kernel.org>; Mon, 13 Apr 2020 04:50:38 -0700 (PDT)
X-Gm-Message-State: AGi0Pua79xZd3AspLDc1xUzsenj5NSsAUZ8J1yDImsJbgCXlFfx2pRnc
	vAGTam8cAUqPxLA5QgVYcgjnr4Ot8ckCiYIqg1o=
X-Google-Smtp-Source: APiQypIMrrEhVWCqCyNHP29gqsPEYlvKj/GOGeipfvn9FoH4qyXdmqpi94IvjhIqAy6KJIL4ZCzdFOfF1RJlj9zGZ7Y=
X-Received: by 2002:a5d:9494:: with SMTP id v20mr15903241ioj.101.1586778638414;
 Mon, 13 Apr 2020 04:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200327093335.20150-1-amit.k.bag@intel.com> <20200327093335.20150-2-amit.k.bag@intel.com>
In-Reply-To: <20200327093335.20150-2-amit.k.bag@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 13 Apr 2020 07:50:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4ex=ex1z03X67Nn5sv0T0BBQesJJhaV0Lkxdhn=U1H8w@mail.gmail.com>
Message-ID: <CA+5PVA4ex=ex1z03X67Nn5sv0T0BBQesJJhaV0Lkxdhn=U1H8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-firmware: Update firmware file for Intel
 Bluetooth AX200
To: Amit K Bag <amit.k.bag@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	BlueZ development <linux-bluetooth@vger.kernel.org>, 
	"Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>, chethan.tumkur.narayan@intel.com
Content-Type: text/plain; charset="UTF-8"

Both patches applied and pushed out.

josh

On Fri, Mar 27, 2020 at 5:33 AM Amit K Bag <amit.k.bag@intel.com> wrote:
>
> This patch updates new firmware file for Intel Bluetooth AX200
> Also it is known as Intel CyclonePeak (CcP).
>
> FW Build: REL0384
>
> Release Version: 21.70.3.2
>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
>  intel/ibt-20-0-3.ddc | Bin 27 -> 14 bytes
>  intel/ibt-20-1-3.ddc | Bin 27 -> 14 bytes
>  intel/ibt-20-1-4.ddc | Bin 27 -> 14 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/intel/ibt-20-0-3.ddc b/intel/ibt-20-0-3.ddc
> index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
> GIT binary patch
> literal 14
> VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk
>
> literal 27
> icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<
>
> diff --git a/intel/ibt-20-1-3.ddc b/intel/ibt-20-1-3.ddc
> index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
> GIT binary patch
> literal 14
> VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk
>
> literal 27
> icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<
>
> diff --git a/intel/ibt-20-1-4.ddc b/intel/ibt-20-1-4.ddc
> index 3cd54fe2c149616ff68aee097a466c534832f805..f24bb176758e6fce478820f1c2b7f7930bf88ce3 100644
> GIT binary patch
> literal 14
> VcmZS9V3c5SVsvd_(PU(1000Ym0fGPk
>
> literal 27
> icmZSV{=>(t!6?Dv#OT_<qRGh2z{JPK*!_orfdK$Wjs&&<
>
> --
> 2.17.1
>
