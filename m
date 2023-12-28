Return-Path: <SRS0=hWT+=IH=irl.hu=soyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0483C3DA6E
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Dec 2023 13:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADC60C433C9; Thu, 28 Dec 2023 13:54:45 +0000 (UTC)
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8074AC433C7
	for <linux-firmware@kernel.org>; Thu, 28 Dec 2023 13:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8074AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.4] (51b6838a.dsl.pool.telekom.hu [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007203F.00000000658D7E1B.0014B1D4; Thu, 28 Dec 2023 14:54:35 +0100
Message-ID: <95023a6158e1359c18797d7ed10a6914cf781f84.camel@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: Add dsp firmware for
 different laptops
From: Gergo Koteles <soyer@irl.hu>
List-Id: <linux-firmware.lore.kernel.org>
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
  "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "Lu, Kevin" <kevin-lu@ti.com>, "Xu, Baojun" <baojun.xu@ti.com>,
  "13916275206@139.com" <13916275206@139.com>,
  "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "Gupta, Peeyush" <peeyush@ti.com>, "Navada
        	Kanyana, Mukund" <navada@ti.com>
Date: Thu, 28 Dec 2023 14:54:34 +0100
In-Reply-To: <4c924d6a31b54bdba36ce8f71f143fb5@ti.com>
References: <20231223141242.676-1-shenghao-ding@ti.com>
	 <313b19531261e5b94870043be7bdd4666176f562.camel@irl.hu>
	 <4c924d6a31b54bdba36ce8f71f143fb5@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Shenghao,

On Thu, 2023-12-28 at 07:29 +0000, Ding, Shenghao wrote:
> > On Sat, 2023-12-23 at 22:12 +0800, Shenghao Ding wrote:
> > >=20
> > > +Licence: Allegedly GPLv2+, but no source visible. Marked:
> > > +	 Copyright (C) 2023 Texas Instruments
> > > +
> > > +Found in hex form in kernel source.
> >=20
> > Is this true? Isn't this a new driver?
> Maybe following expression will be more clear
> Firmware will be found in hex form in the system.

And what about the Licence?

I would like to add TAS2XXX3870.bin that I found in my computer's
windows sound driver as Source/ThirdParty/TI/TAS2563Firmware.bin .

Could you please add it, or will TI give permission to redistribute
these files?

The windows driver (innoextract compatible):
https://download.lenovo.com/consumer/mobiles/h5yd037fbfyy7kd0.exe
The RCA file I created:
https://github.com/soyersoyer/tas2563rca/raw/main/INT8866RCA2.bin


> >=20
> > > \ No newline at end of file
> > > diff --git a/ti/tas2781/TAS2XXX387D.bin b/ti/tas2781/TAS2XXX387D.bin
> > > new file mode 100644 index
> > >=20

Regards,
Gergo

