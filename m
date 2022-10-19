Return-Path: <SRS0=Q7Nb=2U=gmail.com=azamat.hackimov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D40FC433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Oct 2022 16:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFB7FC433D6; Wed, 19 Oct 2022 16:15:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B7E7C433C1
	for <linux-firmware@kernel.org>; Wed, 19 Oct 2022 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B7E7C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id j4so29023755lfk.0
        for <linux-firmware@kernel.org>; Wed, 19 Oct 2022 09:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Up39VfBC8Q2sAGA+c4MjQa+H8pdRlysKXF4W891rIWk=;
        b=glDaHzSSftoVogOUA+95rqF0ZoKDImoowx+3RSeYrKBnC0FIVnmE0ew35MrpLDdGMb
         eTU8rJ7yjrA1lSNHmrRGbUoTmoVTwrpC8CC+vYEqFXpIOgCfilTPhu3bmwbtA7043zJQ
         SjfZpAus+qPV2UHUkOm+8oVO+OCNOg/kfrCmdm3CQUIELeT1oFQ2RD51vCgVQt6HpGPF
         ryyWPjJ/NBYFD2Wtt0vwJDoJLqekyrStdVtURKAw1GlC5Kd1bywaBXGSpjueELEKARD0
         53ivnRTqLLzyiyMYa8WVUBsoKDS6vc+cBBPo+jHMrNXxIF5QqURou9q6PVPaqVdL7Zfe
         touw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Up39VfBC8Q2sAGA+c4MjQa+H8pdRlysKXF4W891rIWk=;
        b=exKZigzUTQ/y9svnc+rDyxJlq/lg21bwxU2AAkL8wtxzJXA4gNNkTYLv/IeP0zgBkh
         i6dMdiMkD0VF1yHLvyZaddkIC6Nj2l/keiK/RX2gAqTZjeZKfeV8+gl/JMOtFpXsQdta
         Stt86pM1b+3QjXy3bbI0jSb1lC8KLA1vU3onInbxyQIWohNFvHriFlqKK9O0fjAFFRuM
         R4SxHof2vqSrYeVSvi7cXQyTnLIXl/9TY80wgylTsDV5CzbJS3/Qy/1vYB6eF5OjOorv
         qbjGi76tMWhF4eldxgwRKWw9odlkK6Z+5chMwBfOuAUUfXIiJ0fPeU+NfjTbCXgFintV
         uVow==
X-Gm-Message-State: ACrzQf0s7Ufskn/gFIyajduQHDEgQLj4Q949t0zdj8b0ZA2+rGfb6dgC
	vhGQXpkXISJFpJ3/4gEYoIVzcOcJl/3r7rBxMuuxSERSdpI=
X-Google-Smtp-Source: AMsMyM7I4M0W+zWdL55+hyj9vYm6t/YG/s+HhPx9VIXnJy9x80lY+A5bB0LoLYjMAbP/Aks035IoEKP3zUYPkd5kiew=
X-Received: by 2002:a05:6512:3f8b:b0:492:d1ed:5587 with SMTP id
 x11-20020a0565123f8b00b00492d1ed5587mr3323167lfa.355.1666196142032; Wed, 19
 Oct 2022 09:15:42 -0700 (PDT)
MIME-Version: 1.0
From: Azamat Hackimov <azamat.hackimov@gmail.com>
Date: Wed, 19 Oct 2022 19:15:30 +0300
Message-ID: <CAFqVybqsda75NPUAYX47FCQp0OAkRWOUw7K9UbPawbNo=Th2bQ@mail.gmail.com>
Subject: Feature request: Adding tools to be able to split the linux-firmware
 package into separate components
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

The size of linux-firmware already reaches over 1 GB. Linux
distributions typically do not split the linux-firmware package into
components, which results in the user's installation storing files
that are never used by the system and take up unnecessary space. This
problem is especially acute for embedded systems or systems running in
containers.

There has been a request among some distributions to separate
linux-firmware into components in order to make it easier for the user
to install and use firmware. Among them are Arch Linux[1], Fedora[2],
Alpine[3], however, separation on the side of the maintainers of the
distribution is fraught with difficulties associated with the
inability to reliably separate the individual components of the
linux-firmware package by driver or even by category.

I propose to provide a similar mechanism for filtering prerequisites
on the side of the linux-firmware package. To do this, I propose to
transform the WHENCE file into a structured file that can be processed
by an additional tool that can filter the necessary components by
driver, category, manufacturer or license.

Suggested structured file format is YAML (although other formats are
possible), example entry (actual existing entry from WHENCE):

```
drivers:
  - driver: emi62
    description: EMI 6|2m USB Audio interface
    category:
      - drivers/usb/misc
    vendor: Emagic
    license: Unknown
    info: |
      Converted from Intel HEX files, used in our binary representation of ihex.
    files:
      - name: emi62/bitstream.fw
        version: 1.0.0.191
        info: DATE=2002oct28
      - name: emi62/loader.fw
        version: 1.0.2.002
        info: DATE=10.01.2002
      - name: emi62/midi.fw
        version: 1.04.062
        info: DATE=16.10.2002
      - name: emi62/spdif.fw
        version: 1.04.062
        info: DATE=16.10.2002
```

The firmware-install utility to query and filter a structured file
should parse the following options:

firmware-install list [--category <LIST>] [--driver <LIST>] [--license
<LIST>] [--vendor <LIST>]
  List drivers and firmwares that applies to filter

firmware-install show <DRIVER>
  Show information about driver

firmware-install install <DESTINATION> [--category <LIST>] [--driver
<LIST>] [--license <LIST>] [--vendor <LIST>]
  Install firmwares that applies to filter

firmware-install check
  Check format and content of structured file (like check_whence.py does)

After the implementation of such a utility, maintainers of Linux
distributions will have a convenient tool that will allow them to
create sets of linux-firmware-* packages with content separation
instead of a monolithic installation of all firmware.

[1] https://bugs.archlinux.org/task/72559
[2] https://fedoraproject.org/wiki/Changes/Linux_Firmware_Minimization
[3] https://lists.alpinelinux.org/~alpine/devel/%3C4d19a51c-3eba-9775-0208-4d87da66effc%40bitmessage.ch%3E
