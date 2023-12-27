Return-Path: <SRS0=6c34=IG=irl.hu=soyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5579C46CD2
	for <linux-firmware@archiver.kernel.org>; Wed, 27 Dec 2023 11:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0506C433C8; Wed, 27 Dec 2023 11:40:58 +0000 (UTC)
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38595C433C7
	for <linux-firmware@kernel.org>; Wed, 27 Dec 2023 11:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38595C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b681e3.dsl.pool.telekom.hu [::ffff:81.182.129.227])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071CB4.00000000658C0D40.001494F8; Wed, 27 Dec 2023 12:40:48 +0100
Message-ID: <313b19531261e5b94870043be7bdd4666176f562.camel@irl.hu>
Subject: Re: [PATCH v1] ASoC: tas2781: Add dsp firmware for different laptops
From: Gergo Koteles <soyer@irl.hu>
List-Id: <linux-firmware.lore.kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, linux-firmware@kernel.org
Cc: kevin-lu@ti.com, baojun.xu@ti.com, 13916275206@139.com,
  linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  peeyush@ti.com, navada@ti.com
Date: Wed, 27 Dec 2023 12:40:47 +0100
In-Reply-To: <20231223141242.676-1-shenghao-ding@ti.com>
References: <20231223141242.676-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Shenghao,

On Sat, 2023-12-23 at 22:12 +0800, Shenghao Ding wrote:
>=20
> +Licence: Allegedly GPLv2+, but no source visible. Marked:
> +	 Copyright (C) 2023 Texas Instruments
> +
> +Found in hex form in kernel source.

Is this true? Isn't this a new driver?

> \ No newline at end of file
> diff --git a/ti/tas2781/TAS2XXX387D.bin b/ti/tas2781/TAS2XXX387D.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..3ce40ae9d715727092bffe1e1=
8a6a7e50ea41eed
> GIT binary patch
> literal 64504

Regards,
Gergo

