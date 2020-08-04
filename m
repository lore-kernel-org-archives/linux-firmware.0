Return-Path: <SRS0=w98M=BO=gmail.com=jskier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF0BC433E0
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Aug 2020 14:14:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A627F2177B; Tue,  4 Aug 2020 14:14:22 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D55722B40
	for <linux-firmware@kernel.org>; Tue,  4 Aug 2020 14:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqZ8GXj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D55722B40
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jskier@gmail.com
Received: by mail-pl1-f196.google.com with SMTP id t11so3101945plr.5
        for <linux-firmware@kernel.org>; Tue, 04 Aug 2020 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=3uUKSnY7Zudb5WrVusbGb8SpngC06gW/VvRZ9wDFMZ0=;
        b=LqZ8GXj6QQ0o/HYsfnT1edfTbUkqdQX++VnoSVrXctLR4m3gna9K8fqyfNsfM/jBxv
         wcDaBR4pBY5qfbBP84E5tcDYUXpxS+p0BESofOSmbHm9iTL6hYm8r3K6s8BarSGiBRmO
         p+HNwnCAiP6Pif27KUcC9PYCAgxh4OB1l+3E6/9x0fGrrbok5Sxx0xp1Ku1SM3ZAkCqm
         x7T4taP2epw8RPfgRj09oOvRnFcH7NvCBME3Z/jJYYumAkfbgE9JXJL6u8vbkdFCPSjH
         0Ztg8+Hts9In19fhMPdYii556gHFr6cMGI/vakw2YnzX9kEqXgy0+PBMMq9D/+CrJwNh
         SckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=3uUKSnY7Zudb5WrVusbGb8SpngC06gW/VvRZ9wDFMZ0=;
        b=lOIXq19d3HQ2PX5w8ijQOvFjQ+tKP5Tl9XwM6hYyxc355s3cIE3zneSem8AZMP6sGZ
         EMpo0anKKwASuL7b2KJKggf3zPz4zICPkX80hMrnguYK+8r5NIMVXn0QNvH2/ePG3KRU
         GXMSRAG+XK2EzKKmKHToEXheLOxJ0lufElzih5h74pbByfEjBFIFpbwCWsettakDCP0W
         Tf28dq9KH1ldVVDaVfl8RYivffdzZNX0ZZE3xNSOHqTpKrkFwYqxspieiAgdFYZ9Pf29
         WDErRWTAtOQbjOYtezFUktTa5Dr8OCuRS53ATjrNQQHlIZkZMAZobUghIZqckNW+Gp9r
         Ssjw==
X-Gm-Message-State: AOAM5311am0UqDUXaJWpgt84fMwM19zHLzzkFeFBM1C2gVyFpISzuwmN
	BZCz5nCpT14fif9GdiQGbKsgX5p09r1KkcgD6tqaNSXZAs0=
X-Google-Smtp-Source: ABdhPJxZw0DYZobk1tDilB2fd9h+eNsf9qVTjU5CU8Wyu0rUpFBmv1PoGcPrVpsMyPFZRZ9QnUfYcYoEtXrHeeXe1ZY=
X-Received: by 2002:a17:90a:13c7:: with SMTP id s7mr885883pjf.233.1596550461773;
 Tue, 04 Aug 2020 07:14:21 -0700 (PDT)
MIME-Version: 1.0
From: Jeremy MJ <jskier@gmail.com>
Date: Tue, 4 Aug 2020 09:14:11 -0500
Message-ID: <CACEdYO2pyeEsLayHVEfKLR_5c-LETdiGndAmd-i0eO3ocx4ueg@mail.gmail.com>
Subject: Re: Question about rtl8761b Realtek bluetooth dongle firmware
To: sztsian@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have reached out to realtek to inquire about licensing and
permissibility of inclusion of the firmware to linux-firmware, will
update if / when I hear back.

This came up with another user on the Mint forums, who has a specific
brand using this chipset which provides beta Linux drivers and
firmware:
https://forums.linuxmint.com/viewtopic.php?f=49&t=319260&e=1

I have tested both the driver and the firmware in linux 5.8; both
appear to mostly work (a couple of unexpected event for opcode errors
with the bluetooth module when using the firmware).

Thank you Zamir for your work on the initial device recognition issue.
Would be nice to have broader support of bt5 dongles in Linux.

Regards,

--
Jeremy MountainJohnson
jskier@gmail.com

----
From: Zamir SUN <sztsian@gmail.com>
To: linux-firmware@kernel.org
Cc: sztsian@gmail.com
Subject: Question about rtl8761b Realtek bluetooth dongle firmware
Date: Fri, 10 Apr 2020 23:44:49 +0800
Message-ID: <4bb6d05c-b6b6-f8c8-3a49-f76cd129c665@gmail.com> (raw)

Hi,

Recently I purchased a unbranded USB Bluetooth dongle which is found not
supported by Linux yet. And the vendor declare it to have rtl8716b chip.
After playing with it for a while we've figured out that it's mostly
compatible with the btrtl driver, with the difference firmware needed.
We found the firmware from the Windows driver CD shipped along with the
dongle and confirmed it works in Linux. I've carefully checked the
Windows driver as well as the installer and did not see any EULA. As I
don't work for Realtek, neither the producer of this USB dongle, so I am
writing to ask if I can submit to linux-firmware?

The patch to the driver is already sent out
https://patchwork.kernel.org/patch/11483367/

Thanks in advance.
-- 
Zamir SUN
Fedora user
GPG : 1D86 6D4A 49CE 4BBD 72CF FCF5 D856 6E11 F2A0 525E
