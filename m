Return-Path: <SRS0=RIeq=7H=gmail.com=christianshewitt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4ADC433DF
	for <linux-firmware@archiver.kernel.org>; Mon, 25 May 2020 05:09:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89D5820825; Mon, 25 May 2020 05:09:42 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2072075F;
	Mon, 25 May 2020 05:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDvMHnHW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2072075F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=christianshewitt@gmail.com
Received: by mail-wr1-f66.google.com with SMTP id i15so15837196wrx.10;
        Sun, 24 May 2020 22:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=B7WmPqSxKkGHLwOXcalhC8FQYCxg3ob4TqLkSNgE3ME=;
        b=MDvMHnHWHRB6j+QHZqtEPXcD9WLeCDcRxBf2nbzu3eDcInxRON5LbVL4t0vdRMxWtf
         CnmRbsX8kycSD/l6HbtXB1vTKX9hhEUHfoFMZvb1xiw2zol7DR/gpgVjbmaUfvruvZvT
         CUfISFF2rBD/yNfHc74aOYhUokJ5z1BZtnecDGAwqLt++pV6Z6NpRC4uMpUgCBZbgSfG
         7xNEEyJIYDCwrJFE/c1gQFXpyvWV3jdHyaMejM/Jop9z+8zLw95LeAnnBY9HSj6Da3zY
         q37t1x07J3vsvS+uM8j/zVUrQW6B6fUB3DzYt+ibDpZ+t1YW2+a9C1P4KmKPC0Lq7afb
         cdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=B7WmPqSxKkGHLwOXcalhC8FQYCxg3ob4TqLkSNgE3ME=;
        b=QHMgsbVkPMXuS1Uwxe0dwtX5tg5rFJvQ13R8gW2qcbugW8JyXdcY8Am8c2kRcEBImI
         Ti7Kd2EI3fuwELW4a3xr2bVYWQpvPh1mljVT3e/nr/dw1YUEWBydKJF9h45GJHgED/2j
         5LIuNtvDBYDXmtub3A8YbugReDdrGZzqFblxtdXZTjeUcPggrXfGTOWDROdY0AXHmX52
         FQ5daFMMYxAX8NS/Dt+Z/Yu2JbbNCSfWiEgDSWx1WEdZb6wiBHr659HBu/MBErQZbONo
         fO+4mPxeJi/pWiw68rq1F6b7HiUVFto3rInvZ7cN+V87+gXLyEWFbuWvss0neqOT4+QB
         omAg==
X-Gm-Message-State: AOAM533RpGdCxfmBz/iYkTNh1Jtk0vj3h7aWSfRpKbo8223RQ3h+Ecs4
	yx81C9T0nVgcSMbBYWIpPQkQyYj1
X-Google-Smtp-Source: ABdhPJyOQH+I+lUOwRriQmpOTtG3236uelfyjcB3kUnnKDiaBAWJ48ynwdAd+AmGoJ3RoGZhUnLYug==
X-Received: by 2002:adf:ab1b:: with SMTP id q27mr6297475wrc.268.1590383379745;
        Sun, 24 May 2020 22:09:39 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a10sm17221451wmf.46.2020.05.24.22.09.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2020 22:09:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH] ath10k: add SDIO firmware for QCA9377 WiFi
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CA+5PVA5K0naJRhBvmDmArkBWQBCuA6p2yP+pYPMr3dZ47q53aQ@mail.gmail.com>
Date: Mon, 25 May 2020 09:09:35 +0400
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 ath10k@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <37BB0344-C9EB-41F5-87E7-D66DA45A488E@gmail.com>
References: <20200524135933.1623-1-christianshewitt@gmail.com>
 <CA+5PVA5K0naJRhBvmDmArkBWQBCuA6p2yP+pYPMr3dZ47q53aQ@mail.gmail.com>
To: Josh Boyer <jwboyer@kernel.org>
X-Mailer: Apple Mail (2.3445.104.14)


> On 24 May 2020, at 8:34 pm, Josh Boyer <jwboyer@kernel.org> wrote:
>=20
> On Sun, May 24, 2020 at 9:59 AM Christian Hewitt
> <christianshewitt@gmail.com> wrote:
>>=20
>> This commit adds the SDIO firmware for ath10k/QCA9377 cards. The file
>> is from the Boundary Devices repo [1] and has the same license as the
>> existing firmware-5.bin file. Support for QCA9377 WiFi was merged for
>> Linux 5.7 [2].
>>=20
>> [1] =
https://github.com/boundarydevices/qca-firmware/tree/bd-sdmac-ath10k
>> [2] =
https://github.com/torvalds/linux/commit/6e51b0e4913ca2c93059f73ca477ca30e=
a95b6a0
>=20
> That repo got it from Kalle's untested repo, and didn't carry over the
> Signed-off-by.  You didn't carry over the Signed-off-by from the repo
> you got it from.  3 levels of indirection to include a file with a
> giant notice from an untested sources is a bit too much for me to feel
> comfortable with.

Apologies Josh, I have been using my own repack of the Boundary Devices
repo and had completely forgotten Kalle=E2=80=99s repo existed and was =
the
original source of the file.

> Kalle, is there a reason you didn't send this upstream 3 years ago?

SDIO support is a relatively recent addition to the ath10k driver and
the commit message in this RFT [1] probably explains why his repo has
it described as untested.

I=E2=80=99m happy to submit v2 with corrected references or let Kalle =
handle
the submission, whichever is best or easiest is fine with me.

Christian

[1] https://patchwork.kernel.org/patch/11162833/=
