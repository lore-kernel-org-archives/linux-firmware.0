Return-Path: <SRS0=YVHv=5R=irl.hu=soyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82A0CD1297
	for <linux-firmware@archiver.kernel.org>; Sun,  9 Nov 2025 10:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D03EC19424; Sun,  9 Nov 2025 10:28:30 +0000 (UTC)
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2FA2C113D0;
	Sun,  9 Nov 2025 10:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2FA2C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (softdnserr [::ffff:81.182.156.58])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000008013A.0000000069106B8D.0031B2DF; Sun, 09 Nov 2025 11:23:09 +0100
Message-ID: <4a65d51ab0ad4171a21a746cc787c7596c022d88.camel@irl.hu>
Subject: Re: [PATCH v1] ASoC: tas2781: Update dsp firmware for HP and ASUS
 projects
From: Gergo Koteles <soyer@irl.hu>
To: Baojun Xu <baojun.xu@ti.com>, jwboyer@kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: shenghao-ding@ti.com, linux-firmware@kernel.org,
  13916275206@139.com, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org
Date: Sun, 09 Nov 2025 11:23:08 +0100
In-Reply-To: <20251109070106.5993-1-baojun.xu@ti.com>
References: <20251109070106.5993-1-baojun.xu@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0

Hi Baojun,

On Sun, 2025-11-09 at 15:01 +0800, Baojun Xu wrote:
>  ti/audio/tas2781/TAS2XXX8F62.bin  | Bin 0 -> 49824 bytes
>  ti/audio/tas2781/TAS2xxx8C70.bin  | Bin 0 -> 1756 bytes
>  ti/audio/tas2781/TAS2xxx8C71.bin  | Bin 0 -> 1756 bytes
>  ti/audio/tas2781/TAS2xxx8C72.bin  | Bin 0 -> 1756 bytes

Are these typos? Would these work with TAS2xxx prefix?

Thanks,
Gergo
