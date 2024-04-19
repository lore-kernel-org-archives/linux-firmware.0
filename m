Return-Path: <SRS0=psH5=LY=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3467DC4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Apr 2024 11:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AD87C2BD10; Fri, 19 Apr 2024 11:20:36 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1480CC072AA
	for <linux-firmware@kernel.org>; Fri, 19 Apr 2024 11:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1480CC072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2852919276.0
        for <linux-firmware@kernel.org>; Fri, 19 Apr 2024 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713525634; x=1714130434; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEnz5uf3QelU49vFE9szrPoxjVw6conpunMlTwUR+kg=;
        b=cNkFf+Gzs1TgvHRIxu2DoC6cGj/fgKwtAFKNW6D+JkA2057JoLcGMrJJkvVinEnao9
         S85kOHTO6Os/Yvdn0eJQRq1jKM/M0rUgbMyeVtpuWUQ1bREenXZu+lE3+bwxiBk6ZQZl
         p1g3385HWGXgI34btoT9C4BfI290c5VhmOflyAD9Ss71W3on/U7OL9d0mBZWG6rCFano
         KkOQPu3bPH+13S242QyFoF7hfq8SEbocqvhxATz/x4mXc+DVYFmObNCGokn+ZCRu5w4V
         LrdfnloXwl9wEgineslMo4vAQshO9lD21iJDUNrIocKffPlxUlbHG/hj3F8FqqsupGeq
         8THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713525634; x=1714130434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEnz5uf3QelU49vFE9szrPoxjVw6conpunMlTwUR+kg=;
        b=S3WZeJPLt+qL1Fi1b74N8PnAABqQd7FRPf+YXdv8hILRC5QJcsZubr46gSvb3s9HJt
         6rdTBDOccZynmBrFu5tjIhU5LmpfPHT6IeoHuKEe5XSiY50eguXHkvooqrKpo6VX+2Jv
         MYDsLx9/eij0W3lHTtsNqBYOwXo8hprgOElnpstKLX/xjCBg4J4tuWpdomhy0SN3/6do
         u7DAxKP9x+Da/ur//k2vmput3WE95MinRuYJaGgNJYKFAyZ8NcO51Yk/cFqcF3pGf5Hi
         HTQo2V8JkoZXI9A2MSXYPW7qp5a0mVgSwQ0vVGeNUFB+q6Vs8TblD88otG5/ImWTJqBg
         M3FA==
X-Gm-Message-State: AOJu0YwMacDUExJlkji9mo57vzNAgzrxPcN1939aQ05pY0ev+5XaaQO1
	CEFFO9RsSDhRVawJ0KBmg1N3eEaiLNV2ihOdaFMi9iVcJVm1mH1mle4nfNEb8pq49KRCesDr2a+
	g/Vi0NaXlwkU8jXME2SOG0zYIrf5+qOGH
X-Google-Smtp-Source: AGHT+IEr3L4grqpaAhDaYKQraW2bNnAKbz3bvV/HtsEYWUgWCBiaFYxAua6yOVoA3NPtDIFta5QJS3EHPLHdbsQyu78=
X-Received: by 2002:a25:aa8e:0:b0:dc7:4645:83ab with SMTP id
 t14-20020a25aa8e000000b00dc7464583abmr1433843ybi.0.1713525634023; Fri, 19 Apr
 2024 04:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <70a172c1-5f65-4392-a1f3-a3f2a8befa2c@opensource.cirrus.com>
In-Reply-To: <70a172c1-5f65-4392-a1f3-a3f2a8befa2c@opensource.cirrus.com>
From: Josh Boyer <jwboyer@gmail.com>
Date: Fri, 19 Apr 2024 07:20:22 -0400
Message-ID: <CA+5PVA5eC14gLHPxx6jv5O6SSyoupfXuJysj0G_n7M4uBWYZgw@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware, tuning parameters and
 fixes for CS35L41
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 11:53=E2=80=AFAM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> We would like to add firmware files to support Cirrus Logic Smart Amp
> CS35L41 for Lenovo Legion Slim 7 16ARHA7.
> In addition there is a fix for the firmware and tuning files names for
> 104316a3.
> Also add tuning parameter files for various laptops.
> Tuning parameter files are loaded by the driver at the same time the
> Firmware and tuning is loaded.
>
> Thanks,
>
> Stefan Binding
>
> The following changes since commit e6786998c1b5faa669d4154436232dc490079d=
6b:
>
>    Merge branch 'mt7922' into 'main' (2024-04-17 11:59:01 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/CirrusLogic/linux-firmware/ cs35l41-various

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/197

josh

>
> for you to fetch changes up to dfadf5687922f239eb8b04df0e1726230098b802:
>
>    linux-firmware: Add tuning parameter configs for CS35L41 Firmware
> (2024-04-18 16:39:54 +0100)
>
> ----------------------------------------------------------------
> Stefan Binding (3):
>        linux-firmware: Add CS35L41 HDA Firmware for Lenovo Legion Slim 7
> 16ARHA7
>        linux-firmware: Fix firmware names for Laptop SSID 104316a3
>        linux-firmware: Add tuning parameter configs for CS35L41 Firmware
>
>   WHENCE                                            | 129
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++----------
>   cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin         | Bin 0 -> 1536 bytes
>   cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin         | Bin 0 -> 1540 bytes
>   cirrus/cs35l41-dsp1-spk-prot-17aa3877-l0.bin      | Bin 0 -> 5680 bytes
>   cirrus/cs35l41-dsp1-spk-prot-17aa3877-r0.bin      | Bin 0 -> 5680 bytes
>   cirrus/cs35l41-dsp1-spk-prot-17aa3878-l0.bin      | Bin 0 -> 5704 bytes
>   cirrus/cs35l41-dsp1-spk-prot-17aa3878-r0.bin      | Bin 0 -> 5704 bytes
>   cirrus/cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg | Bin 0 -> 32 bytes
>   cirrus/cs35l41/bincfgs/cs35l41-dsp1-16_5dB.bincfg | Bin 0 -> 32 bytes
>   cirrus/cs35l41/bincfgs/cs35l41-dsp1-19_5dB.bincfg | Bin 0 -> 32 bytes
>   10 files changed, 119 insertions(+), 10 deletions(-)
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3877.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-cali-17aa3878.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3877-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3877-r0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3878-l0.bin
>   create mode 100755 cirrus/cs35l41-dsp1-spk-prot-17aa3878-r0.bin
>   create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-14_5dB.bincfg
>   create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-16_5dB.bincfg
>   create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-19_5dB.bincfg
>
