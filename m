Return-Path: <SRS0=Y2gx=6R=gmail.com=christianshewitt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D999AC6379F
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Feb 2023 07:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9398AC4339C; Tue, 21 Feb 2023 07:13:35 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A171C433D2;
	Tue, 21 Feb 2023 07:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A171C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id u5so2033462vkl.4;
        Mon, 20 Feb 2023 23:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3q2pzU9Qz6VR/qGmSVfVV1MeAe6CaEVEzfExBv8Dc1s=;
        b=iXgKBYy5yxtPqzbtlPjctm5jlsHcZc6U/v2vDahSMUzTUm9mIpm4MjWcMXW0754LnE
         BCmA8xw5HjIijZDtesveZTYnbKqhX8xxrdlS5HXnviSn6nFDZJ8KHwMWyCUe/hZbK5HN
         jNpwsqyH/qeYAEWInjeW8IEO1H5tVanYJ2tK1NO7v+040vYA8YhqXp8ElLfiXGt5A8wl
         ASz8nQJj3hA5BGB3gNV8bHBJPnP1bIy8/yVRxPQEDqfleRb79X+dEPCfWWkbttkNnTAq
         YFLDTItkeZhS4v11mtQCz0CFGd32fL2jdHSb8CX4Dg28rS2pIwhPxHqjED1TgvcYJR5x
         nIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3q2pzU9Qz6VR/qGmSVfVV1MeAe6CaEVEzfExBv8Dc1s=;
        b=FYkOq01kF55d9EvHR35Ui5tv6QPv33wHQyeEVCxrvZ/3uXBaVqrDKSQpVuFjvU/peY
         T0u5UxsdfaLdj6RN+6OSmfetiZhWtTlI9XfbTGQiVVfnDwHWmzSL1q+fbk6WCOSvYx9W
         Dd+MhzmDhi6CG51/gVdOkJ74M+9KRcrBU90iYWfI2WIFujX9g3uDgSz+NrdbsHOmLmzf
         06GPOpxLchyaQUDPG2ZpJIfYTCx+VHRuBT0fPPFBBYY6cHbpTeBAO79QtjkcnJnvVvEa
         lKlZTF1PKz1gBFV2bScpxSnhW0e5oLlHiOVDbqBZZ+85Za6LViPwSG5u0T99vakvWxD8
         PBcQ==
X-Gm-Message-State: AO0yUKXfMHVxUNe0uKXvgVCZ/ntzVSpI3i+gfr0DmhCuJ2D7MM0eXx42
	Ywo7/gk+iy7iYIZbPm4tUrwCBCOj174=
X-Google-Smtp-Source: AK7set+loPpTa9ITQdtl4VtkX5HEBpkGoTEXNHeupxdN4rap1aqxF1m21V30bvjHsYuJWupQFkl4qQ==
X-Received: by 2002:a1f:a08e:0:b0:400:fe65:477e with SMTP id j136-20020a1fa08e000000b00400fe65477emr3288251vke.9.1676963613527;
        Mon, 20 Feb 2023 23:13:33 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id d189-20020a1f9bc6000000b003c115870e46sm615400vke.7.2023.02.20.23.13.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2023 23:13:33 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Bug/Problem with rtl_bt/rtl8822cs_config.bin
Message-Id: <3B9D4DB2-D2CD-44FE-817A-F6EA8A0AD734@gmail.com>
Date: Tue, 21 Feb 2023 11:13:28 +0400
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vyacheslav <adeep@lexina.in>
List-Id: <linux-firmware.lore.kernel.org>
To: Hilda Wu <hildawu@realtek.com>,
 Josh Boyer <jwboyer@kernel.org>,
 Linux Firmware <linux-firmware@kernel.org>,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

I=E2=80=99m working with the RTL8822CS WiFi/BT mezzanine for BananaPi =
M2S/M5 boards.

SDIO WiFi works fine. The BT side fails to load firmware:

[    7.413297] Bluetooth: hci0: RTL: examining hci_ver=3D0a hci_rev=3D000c=
 lmp_ver=3D0a lmp_subver=3D8822
[    7.416873] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D3
[    7.416892] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_fw.bin
[    7.418200] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_config.bin
[    7.453778] Bluetooth: hci0: RTL: cfg_sz 33, total sz 36529
[    9.469947] Bluetooth: hci0: command 0xfc20 tx timeout
[   17.629661] Bluetooth: hci0: RTL: download fw command failed (-110)

The same is also observed on an Amlogic Android box with 08 silicon:

[    3.950116] Bluetooth: hci0: RTL: examining hci_ver=3D08 hci_rev=3D000c=
 lmp_ver=3D08 lmp_subver=3D8822
[    3.963304] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D3
[    3.969522] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_fw.bin
[    3.969556] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_config.bin
[    4.026336] Bluetooth: hci0: RTL: cfg_sz 33, total sz 36529
[    6.086301] Bluetooth: hci0: command 0xfc20 tx timeout
[   14.566290] Bluetooth: hci0: RTL: download fw command failed (-110)

The device is working in Armbian who bundle an older firmware:

[    7.319820] Bluetooth: hci0: RTL: examining hci_ver=3D0a hci_rev=3D000c=
 lmp_ver=3D0a lmp_subver=3D8822
[    7.323114] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D3
[    7.323150] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_fw.bin
[    7.325103] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_config.bin
[    7.348972] Bluetooth: hci0: RTL: cfg_sz 73, total sz 40777
[    7.699139] Bluetooth: hci0: RTL: fw version 0x05a91a4a

However it=E2=80=99s not a regression in firmware. Further testing =
pinpointed the
rtl8822cs_config.bin file. I can use the latest firmware (FFB8_ABD6) =
with
the config file bundled with Armbian:

[    7.504405] Bluetooth: hci0: RTL: examining hci_ver=3D0a hci_rev=3D000c=
 lmp_ver=3D0a lmp_subver=3D8822
[    7.507827] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D3
[    7.507850] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_fw.bin
[    7.509158] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_config.bin
[    7.529486] Bluetooth: hci0: RTL: cfg_sz 73, total sz 36569
[    7.850914] Bluetooth: hci0: RTL: fw version 0xffb8abd6

I can also use the oldest upstream firmware with the Armbian config:

[    7.315358] Bluetooth: hci0: RTL: examining hci_ver=3D0a hci_rev=3D000c=
 lmp_ver=3D0a lmp_subver=3D8822
[    7.318754] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D3
[    7.318772] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_fw.bin
[    7.319680] Bluetooth: hci0: RTL: loading rtl_bt/rtl8822cs_config.bin
[    7.341340] Bluetooth: hci0: RTL: cfg_sz 73, total sz 30817
[    7.612533] Bluetooth: hci0: RTL: fw version 0x05990d54

The config file Armbian are using [0] is sourced from an Amlogic =
(Android) BSP
repo shared to manufacturer Jethome (Vyacheslav on CC). There is no =
obvious
version info. There are newer (more recently committed) config files =
available
in updates to the Amlogic repo (alongside older 0599_0D54 firmware) and =
all work
with any upstream firmware file.

I=E2=80=99m happy to apply test patches to get more output and I can =
provide remote
access to the board or arrange hardware to be shipped if that helps at =
all.

Hopefully RTL folks can spot whether this is a driver issue or something =
not
present in the upstream config?

Christian

[0] =
https://github.com/armbian/firmware/blob/master/rtl_bt/rtl8822cs_config.bi=
n

