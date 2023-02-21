Return-Path: <SRS0=u6lA=6R=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609FCC61DA3
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Feb 2023 21:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3047BC4339B; Tue, 21 Feb 2023 21:23:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28813C433D2;
	Tue, 21 Feb 2023 21:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28813C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f44.google.com with SMTP id f13so22100177edz.6;
        Tue, 21 Feb 2023 13:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MzI9IaEYK3mu8UhySWHMQWy3ljfnMJk+3UzdqGyQSIY=;
        b=e/CxAAAaTxEChBjAyMnX9Ww/K2GC9NdCZRELdXIF3OhrKh/cWA8GSmCnCseyu8tUsl
         iet2W7zwo0IJ84TAE/DQvpJ41j4QIuWbRXrVK5dFuSOwd2i/S5zOpU+4S+DUzjXrgSqm
         l/C6Sxy4zElqjB6o8EqRFfBG4ZLWtN6AdvMj09JS4WpOtGsEJOn8PwO6zFXW84R8Dk0Q
         V9l1km9h7dv1KTk9xUqflzkh+ZK2yngRhQT5Eqi93otGOvBxL9dRiwrGeEFUp1puNaxj
         6WlscWp5ZVk6qSXPuCP7Juo70ZsiEahPvNyoFuj5y2dC1tF7Pfgm+B3sLwAmwp075+Ya
         KVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzI9IaEYK3mu8UhySWHMQWy3ljfnMJk+3UzdqGyQSIY=;
        b=CcVTYm2Et1y9ebomHLwcuWrGJ8Hs6rq47L2pLQqyi+KiIXq/ldIhTTiS/7kDPMW9WZ
         /jQ3Ve9cqv5lHK+0Qcq0iB76kYXHjfPFUHp56NZFGyxfNCKZF3Dp6eCX/22ZsArrlQoG
         ebyyF1CT1MjYlqAOgalALZBgr9YK9GXXtRYZSpzB78G+dbnDRLh6+JfmOByPnwzyyo65
         2yy+IE60z4ubTzQj0aAzB1kC29EavjexsnPCpBjWo4R0VJ5d6itg69lX5SJfpKQUTIIg
         P7MAdsI6oNPkSNa4R4uUL9AROhiBzKu/3CAshqC9//UtIDVxmLkSMDsjOAh9UhU6s3pm
         1qDQ==
X-Gm-Message-State: AO0yUKUDLyOwbmNFRGuzUorSCPKp9uRnD9GeGnF+cPhLc8FSi7AC3MOP
	OX/KHaFMl0cSINLXGY5aE3kMYyclKpAbbPkykLU=
X-Google-Smtp-Source: AK7set/jChbbb7ExyetMvVTw+zrpCwPdbBETvfVkcsmv/3mY4H9U1TznBsduSX9W8CHoS6SdB7H2tx6GYxCMDgMVtHU=
X-Received: by 2002:a17:906:5a42:b0:8b1:7ac6:318a with SMTP id
 my2-20020a1709065a4200b008b17ac6318amr7874154ejc.4.1677014584871; Tue, 21 Feb
 2023 13:23:04 -0800 (PST)
MIME-Version: 1.0
References: <3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com>
In-Reply-To: <3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 Feb 2023 22:22:53 +0100
Message-ID: <CAFBinCBWyiObgbyuT2Xc=FnoTTTUBu3sePpybdrocVZr7SVDWw@mail.gmail.com>
Subject: Re: Bug/Problem with rtl_bt/rtl8822cs_config.bin
To: Christian Hewitt <christianshewitt@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Hilda Wu <hildawu@realtek.com>, Josh Boyer <jwboyer@kernel.org>, 
	Linux Firmware <linux-firmware@kernel.org>, 
	Bluez mailing list <linux-bluetooth@vger.kernel.org>, Vyacheslav <adeep@lexina.in>, 
	Max Chou <max.chou@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

+ Max Chou as the author of commit 848fc6164158 ("Bluetooth: hci_h5:
btrtl: Add support for RTL8822C")

On Tue, Feb 21, 2023 at 8:13 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
[...]
> I can also use the oldest upstream firmware with the Armbian config:
>
> [    7.315358] Bluetooth: hci0: RTL: examining hci_ver=0a hci_rev=000c lmp_ver=0a lmp_subver=8822
> [    7.318754] Bluetooth: hci0: RTL: rom_version status=0 version=3
> [    7.318772] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_fw.bin
> [    7.319680] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_config.bin
> [    7.341340] Bluetooth: hci0: RTL: cfg_sz 73, total sz 30817
> [    7.612533] Bluetooth: hci0: RTL: fw version 0x05990d54
>
> The config file Armbian are using [0] is sourced from an Amlogic (Android) BSP
> repo shared to manufacturer Jethome (Vyacheslav on CC). There is no obvious
> version info. There are newer (more recently committed) config files available
> in updates to the Amlogic repo (alongside older 0599_0D54 firmware) and all work
> with any upstream firmware file.
I did compare the two config files and they differ in certain areas.
- upstream config: 1500000 baud, flow control is disabled
- Armbian config: 2000000 baud, flow control is enabled

Seeing that the Armbian config works with a higher baud rate my guess
is that there's some issue with flow control instead.

For those who are interested, here's the raw data provided by the
rtlfw tool from [0].
Armbian (= working) config:
Signature: 0x8723ab55
Data len:  67
len=16  offset=000c,{ 02 50 00 00 50 c5 ea 19 e1 1b fd af 5f 01 a4 0b
},UART_CONFIG
len=2   offset=01be,{ 1a 19 }
len=1   offset=01bb,{ 3d }
len=4   offset=01c0,{ 10 00 60 01 }
len=11  offset=1000,{ 00 ff 04 5d 00 03 00 ff ff ff ff }
len=11  offset=1040,{ 28 08 30 30 00 ff ff ff ff ff ff }
len=1   offset=01c4,{ 02 }

upstream (= non-working) config:
Signature: 0x8723ab55
Data len:  27
len=16  offset=000c,{ 02 80 92 04 50 c5 ea 19 e1 1b fd af 5b 01 a4 0b
},UART_CONFIG
len=1   offset=007a,{ 37 }
len=1   offset=00d9,{ 0f }

The baud rate is encoded in the first four bytes and can be decoded
with the help of btrtl_convert_baudrate() from Linux'
drivers/bluetooth/btrtl.c
Flow control is encoded as BIT(2) in data[12].

I am hoping that Hilda and/or Max can provide some ideas on how to
solve this issue.


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/tools/rtlfw.c?id=5d347b54714e0f2d750253be09b68b0c3119dd0a
