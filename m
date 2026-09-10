Return-Path: <SRS0=+HhT=HC=gmail.com=sourenahashemi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD4C79F9F
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2ADB1F00893; Thu, 10 Sep 2026 11:04:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.140
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789038259;
	b=gwbHzLLaVuALv8h6MlUY1OP7V4hReGH9FLKjC1eR+8eds+6nPKYBYoxm5M8Dz4uNcDRs
	 6xrkKyGk4ZcAvEvjqW4Tm1xekRQv4unL9wDLQFSj0LyvfzXPRUIY3TX2vjoc1sUHYcDhq
	 3LAdqYWpHlHA/Mb4qj/FQMBw2pgYE8/Qv6lXGi05oOajSGaSUe1zjdgXvkMawpMMagdNk
	 Y1R9UC01gv1DVtlvHcLVc24R0C9h90qi7gGgRMl3ZRjfrpvg5YW+L//+XdVrhsprXaXgY
	 kfeZAm+CZIMS/M3CLDVKZO7FT90+CLrUXlCSnsSyz8EsoEFsne/BGsxT/BX02t2FI5w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789038259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:List-Id:To:
	 Content-Type;
	bh=lo/Xr7etN3OaC/SdUE5RF8ORpPFILKpg6V6IMqHnMgc=;
	b=v1hKoO9fyccpMofHqOX2ePyl03UUaCkojI4NFwEbEPfz6MJ+CUUJhprBZqfRv1GYK9f0
	 mwIHJ9h4lFd7e32IkkMu9kLXmj3Vf7E8YLkvzb54a3XmjssgLDHtIeAOS4kFzP92koS0x
	 MdWYLujnsiP/WUsBU/0yYCPHKpz1qat1PdkIUgdJTZeCEE10rYKn5Sgsrd9rUuHD9Fsck
	 MaMF20n3uIxLIahcJum6KtqWghpQkHeGl2moFmmEkPVWjDE+662B7PWBIoYVksIZzMy1F
	 GZ+PuLerqWVKxG2DnbjuNEQAGrPuLNDcndx5QJnTNahLmkne4QBqXPyK6RPf1ySP7ag==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S5DshcAL;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.227.140
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8D3C1F000FF
	for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S5DshcAL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E8D3C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2035020a91.2
        for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 04:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789038258; cv=none;
        d=google.com; s=arc-20260327;
        b=E+Ec6TnI+2c0kFXRttkwGToxNHKmGwSTfHhv/2sNJtIOniCidAlQtMSV89mDWWLBxz
         JpWi8oJL7OotTen6eW2cm64+nWTiQmchhtZNs70rwC8zHtjEnWE2v3RgY1pf5SjoZXp8
         /82eaDeN4D5EvGMgEcdNDC8bPWmvE3slWXgTWQySvA4qlW2mra32Yo/fVKsmcpxyakih
         8YOkOLwBE8NxEREi3mBs05mrFEMM4+jKJEFtcKTclhCYJcv4uKev8KzvtlUII938b6+q
         D2LjKuNj66uXDlbR67yTUe98ZYINBZpgnASHBzn9S2brkjSk+6+wCs1Q7tCcgkG0HQ6y
         9FNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lo/Xr7etN3OaC/SdUE5RF8ORpPFILKpg6V6IMqHnMgc=;
        fh=TTGsA66+vbsv9SqhigN9OyCbSxoFW4KiTNE/lGpDuLI=;
        b=XU+jc8ZzUyldnxXMMRAXpXtr48xDfrg/BYMAL6ZE6Joml9i41VvOIowIycFfTR197W
         Orer3lDpVgWSyF5F1e3TTFCKei8HHIi4PtL+a2GDJ60GF09SLXee6hmgL6oA6C0lsSKB
         RdKtOlpC3xd8Dk6o+E6z9YlFlEYnc11cqhFL56oxRSbkg6SkKbNOxeZ3r4iK41X29rVz
         XCLSHW2aIHyDzvpUWpZnuxG+aN+1bHSLZk3HrVOVm/fAfCUFBpVCYziSuyWF6Gst8KX6
         KMZVdyrsa8HdrSx8UZrDax3nMWpe/jHQokpd7pwLfLvVhUY3AL+WF/vQV5GiwPElJDAP
         +rhA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038258; x=1789643058; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lo/Xr7etN3OaC/SdUE5RF8ORpPFILKpg6V6IMqHnMgc=;
        b=S5DshcAL0+mxdwlNerdkjIPGsi0pwxLGuaXXtt3/Lcb63wsOyNVze1oySD74L2T3WC
         Rh4Pbf//4i9Cw69++nRX9zAV7dx5BV+TXzCQAdLjzVrPWQXmG1SIGjyYa34jKOqCdES3
         uKPdzqVRlRT9AJZShTLUmNWoaWBP/O9LyTyXjcUluGEp0i2MZ7X4ov+lXQH6cHrrft98
         Y73vLFURyIAbPh/sB4NKt9pNqJE1VxcN/juVxo/LNaeHqOHjnlFqNMjttAlMGHtcniI9
         wbRDnnFurufXjFWmcBi7hVeKZHdyxXPMVlm94rTC3Ama5eaXLVTupecaXRtmihtv8oev
         N4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038258; x=1789643058;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lo/Xr7etN3OaC/SdUE5RF8ORpPFILKpg6V6IMqHnMgc=;
        b=N7NrR3aeRMorv5aN2iKFYK7cOVcujG/vmRkWHJF8NN2sc0/gVjS+MiC2a4fbVEijsq
         +1hT6Q4341u8uv/iWB6ia+T/HbXwwyuG1BFrPMMe0ftvGqnBlitcw9o83O0CuFNgeWFd
         /nSTfpgz0RnRGJ08jh6DyvLg/LnvcYOBaeUtKzDFgERe3TdeeNXLp6/KXOYV5ESrz6WO
         o8xjvIPUGoyFKz+x1Kufw4XspMycyzToKGspvIhOZuXLD/0zD3OzlLv+uB93j/1pWDCF
         /FG3r1OomnIedkBtWB0I8v53EYaB4jBCrgeXqkaX/+uxWoLIWgKLksSYGwIy7SL2W+23
         Jy9g==
X-Forwarded-Encrypted: i=1; AKwUvBz8hSSREkPXDbM/e6U38yHv3j+ZMz3VA0jLNV8lBD0jojnYZJP88ypUn/1Afbo/Ye+qAmjddoifIIjH7nHRHg==@kernel.org
X-Gm-Message-State: AFuF++ldPrL4wRm9/8vN0yfAFM9HlmHK/GnW5UESVxyg5FE+dZW44P7u
	zs7z5+6EmuBK+ZyqZChXQQ8WYcNLS/jAg+Cei1dj1dLwNejdzbSMYGmaYgsozigc/AyRfFXFdZG
	LIOgsk3Xq4Aw3uq5zGO5hZpqAeb/CEUI=
X-Gm-Gg: AYBFou0MmORFHZnajp9XkIQrWa27PydiFRnzDiBVl/gHo9tW9YNk4nKqpBiziC7s97y
	tnKxJwBkZc+se0slqzh+MNi+2lTqnTYiCP/C5DNbW8JTn9dkkoyUoFh9JVMY2ec1Wto9ZBSAg5/
	UF2epvy0lXHpqYV0XWCv9V2yQi4IyeRZQLW6QJRHBD0KjMuTfu9BpKZakcaSt0YwCBVrb0HIXf3
	UYy60RZP6a0RwCpItb8A6/2Q3SiLZ1DH4Yinm+h7En4ue+9YPJ33Y0QxWsCNmrhWMvYJsPIVuuu
	2hJDDId+1/pYIYzpiSMkY8OIHqeCOiI1MPFziWPuNtIRDrfqe8YYgUl3jbnjqVR63tfUAI/VQVi
	6MEGs3i8S9lUilQ==
X-Received: by 2002:a17:90b:3851:b0:396:40e6:f631 with SMTP id
 98e67ed59e1d1-39bac1389e1mr16855461a91.3.1789038257983; Thu, 10 Sep 2026
 04:04:17 -0700 (PDT)
MIME-Version: 1.0
From: sourena hashemi <sourenahashemi@gmail.com>
Date: Thu, 10 Sep 2026 04:04:05 -0700
X-Gm-Features: AcwNN1U0LyRLqJwQV0-DfLF45Bx8gux4RRAt9hr3CygJhGCbN5y8sDfpHX3exhc
Message-ID: <CAPhw+4NFAX6xZkBPe+i4JTEuU61vLFW14s1NJApVeZ9n5ZtM1Q@mail.gmail.com>
Subject: rtl_bt: rtl8852cu_fw_v2.bin is ~3 years behind the vendor's current release
List-Id: <linux-firmware.lore.kernel.org>
To: linux-bluetooth@vger.kernel.org, linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000db5604065b1eed14"

--000000000000db5604065b1eed14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dmitry,

linux-firmware currently ships rtl_bt/rtl8852cu_fw_v2.bin with an internal
build stamp of 2023-05-10, while Realtek's current Windows driver for the
same chip carries a build stamp of 2026-01-29. Would it be possible for a
newer rtl8852cu firmware blob to be submitted to linux-firmware?

Details

Hardware

  - ASUS TUF Gaming F16 (FX608JMR)
  - Realtek RTL8852CE (combined Wi-Fi / Bluetooth)
  - Bluetooth radio on USB 13d3:3612

Bluetooth: hci0: RTL: examining hci_ver=3D0c hci_rev=3D000c lmp_ver=3D0c
lmp_subver=3D8852
Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1
Bluetooth: hci0: RTL: btrtl_initialize: key id 0
Bluetooth: hci0: RTL: loading rtl_bt/rtl8852cu_fw_v2.bin
Bluetooth: hci0: RTL: loading rtl_bt/rtl8852cu_config.bin
Bluetooth: hci0: RTL: cfg_sz 6, total sz 71983
Bluetooth: hci0: RTL: fw version 0x040d7225

Software

  - Ubuntu 26.04.1 LTS
  - Kernel 7.0.0-31-generic
  - linux-firmware 20260319.git217ca6e4.1ubuntu
  - BlueZ 5.85

Version Gap

Both the epatch blob shipped in linux-firmware and the .dat blob shipped in
the vendor's Windows driver carry a u32 at offset 0x08 that decodes as a
YYYYMMDD build stamp:

| File                                 | Signature | u32 @0x08 |
| :----------------------------------- | :-------- | :-------- |
| `linux-firmware rtl8852cu_fw_v2.bin` | RTBTCore  | 20230510  |
| `vendor rtl8852c_mp_chip_new.dat`    | BTNIC003  | 20260129  |

The vendor file comes from ASUS's current Bluetooth driver package for this
laptop (Bluetooth_ROG_Realtek_J_V178.4039.2510.0902Sub2_49946.exe,
rtkbtfilter.inf DriverVer 03/03/2026, 178.4039.2510.0902).

SHA-256 Hashes:

  - d1314df53b8f4282f9db57a727ba77c180bc6fd05bf2c306e960326a4ef48660 =E2=80=
=94
rtl8852cu_fw_v2.bin (decompressed, from linux-firmware)
  - 34834fc68883d25c9d59502e47616b3969e4235bc3a209c07a9a9d4d139218e8 =E2=80=
=94
rtl8852c_mp_chip_new.dat (from vendor package)

While the files are in different container formats, they share a
significant amount of identical content: comparing 32-byte blocks at a
4-byte stride yields 627 matches in contiguous runs at small, fixed offset
deltas. With entropy at 7.08 vs 7.14 bits/byte, the vendor payload appears
to be a raw firmware image using a different header rather than an
encrypted or compressed payload.

Context

Three years is a significant gap for a Bluetooth blob, especially given
that the RTL8852CE is widely deployed across ASUS, Lenovo, Acer, and MSI
laptops.

Please note that this is not a formal bug report against the current
firmware. I initially investigated this while troubleshooting Bluetooth
A2DP dropouts and br-connection-page-timeout issues, though USB runtime
autosuspend or Wi-Fi power sharing remain the primary suspects.

I would be happy to test a newer blob, provide additional dumps, or run any
diagnostics on this hardware.

Thanks,
sourena hashemi

--000000000000db5604065b1eed14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Dmitry,<br><br>linux-firmware currently ships rtl_bt/=
rtl8852cu_fw_v2.bin with an internal build stamp of 2023-05-10, while Realt=
ek&#39;s current Windows driver for the same chip carries a build stamp of =
2026-01-29. Would it be possible for a newer rtl8852cu firmware blob to be =
submitted to linux-firmware?<br><br>Details<br><br>Hardware<br><br>=C2=A0 -=
 ASUS TUF Gaming F16 (FX608JMR)<br>=C2=A0 - Realtek RTL8852CE (combined Wi-=
Fi / Bluetooth)<br>=C2=A0 - Bluetooth radio on USB 13d3:3612<br><br>Bluetoo=
th: hci0: RTL: examining hci_ver=3D0c hci_rev=3D000c lmp_ver=3D0c lmp_subve=
r=3D8852<br>Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1<br>Blu=
etooth: hci0: RTL: btrtl_initialize: key id 0<br>Bluetooth: hci0: RTL: load=
ing rtl_bt/rtl8852cu_fw_v2.bin<br>Bluetooth: hci0: RTL: loading rtl_bt/rtl8=
852cu_config.bin<br>Bluetooth: hci0: RTL: cfg_sz 6, total sz 71983<br>Bluet=
ooth: hci0: RTL: fw version 0x040d7225<br><br>Software<br><br>=C2=A0 - Ubun=
tu 26.04.1 LTS<br>=C2=A0 - Kernel 7.0.0-31-generic<br>=C2=A0 - linux-firmwa=
re 20260319.git217ca6e4.1ubuntu<br>=C2=A0 - BlueZ 5.85<br><br>Version Gap<b=
r><br>Both the epatch blob shipped in linux-firmware and the .dat blob ship=
ped in the vendor&#39;s Windows driver carry a u32 at offset 0x08 that deco=
des as a YYYYMMDD build stamp:<br><br>| File =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | Signature | u32 @0x08 |<br>| :--------------------------------=
--- | :-------- | :-------- |<br>| `linux-firmware rtl8852cu_fw_v2.bin` | R=
TBTCore =C2=A0| 20230510 =C2=A0|<br>| `vendor rtl8852c_mp_chip_new.dat` =C2=
=A0 =C2=A0| BTNIC003 =C2=A0| 20260129 =C2=A0|<br><br>The vendor file comes =
from ASUS&#39;s current Bluetooth driver package for this laptop (Bluetooth=
_ROG_Realtek_J_V178.4039.2510.0902Sub2_49946.exe, rtkbtfilter.inf DriverVer=
 03/03/2026, 178.4039.2510.0902).<br><br>SHA-256 Hashes:<br><br>=C2=A0 - d1=
314df53b8f4282f9db57a727ba77c180bc6fd05bf2c306e960326a4ef48660 =E2=80=94 rt=
l8852cu_fw_v2.bin (decompressed, from linux-firmware)<br>=C2=A0 - 34834fc68=
883d25c9d59502e47616b3969e4235bc3a209c07a9a9d4d139218e8 =E2=80=94 rtl8852c_=
mp_chip_new.dat (from vendor package)<br><br>While the files are in differe=
nt container formats, they share a significant amount of identical content:=
 comparing 32-byte blocks at a 4-byte stride yields 627 matches in contiguo=
us runs at small, fixed offset deltas. With entropy at 7.08 vs 7.14 bits/by=
te, the vendor payload appears to be a raw firmware image using a different=
 header rather than an encrypted or compressed payload.<br><br>Context<br><=
br>Three years is a significant gap for a Bluetooth blob, especially given =
that the RTL8852CE is widely deployed across ASUS, Lenovo, Acer, and MSI la=
ptops.<br><br>Please note that this is not a formal bug report against the =
current firmware. I initially investigated this while troubleshooting Bluet=
ooth A2DP dropouts and br-connection-page-timeout issues, though USB runtim=
e autosuspend or Wi-Fi power sharing remain the primary suspects.<br><br>I =
would be happy to test a newer blob, provide additional dumps, or run any d=
iagnostics on this hardware.<br><br>Thanks,<br>sourena hashemi<br><br></div=
>

--000000000000db5604065b1eed14--
