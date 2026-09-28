Return-Path: <SRS0=Z4m2=HU=gmail.com=s.h.vandelden@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8817CA5FA3
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 19:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B95E61F00893; Mon, 28 Sep 2026 19:55:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.43
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790625334;
	b=zDjSpNcFpu2+tDwxlHQpKBPaD88nS9Gm3eVIpabLv1B5ZD/dMQA/jsTjSUi6x7p/y2MN
	 i+jbXtyzf6tBKcmUhiFiMiwMHplxe1NO37kmVmp0hZIssRTyMsnG3Gixan86RkBoeDWNV
	 qyQiuN3dymYSkXvv4stky8hW54iaIZKRKLfxih1U9FS3NXHHXwhG03CQVcyNNQzbY95qZ
	 AJKu/Is64K1Mz64Y8LiJt/R99d9JxqfXGLrrh9GfqsXm+wOAe9EJtK6KkdgCaRZfBD5qE
	 FiNZVaghl6tIkfH0wvg/8Q8SFYim+sF+60pz5R+DYQh2jt4tO+5Gs4yPWadjsl5qEoQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790625334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:List-Id:To:Cc:
	 Content-Type;
	bh=kOtvj05JsVBWZXqt9kwOcJeJEPiJwi5KTbKAmNAmb1Y=;
	b=pKEq3HyL2iasMt7W3LboatxUp5YBikZN/Q5O87LbX0yPGW2BoXvF+cyVQxJLuKDYzTli
	 VW0B1vC1yJhqrgZi2gJwdKycXbcQLd60M5znPu3pMTaD41Ns1ejhc2rZ3spij7eCBsWgm
	 46aPH2pYXccxzBCpmaO1+7Z5dR6tdMTowIuogijbIvsHAAMqyQPlw9/YjmEs7y3CRwWmG
	 mMMYvEvZKYct9h6sa0c9vMphgEv/BJL4wHZQPQlEM6U8oF3OX8SSDihqf1fapk/ZW6D6H
	 WMokk1EF7Pzq137rXKKU8vqwV4c/FMSc6aRfIGGEifwGOHork2hkfG2zMXeNxT8eKjQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sjm2Xejo;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.229.43
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97F521F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 19:55:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sjm2Xejo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 97F521F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso4029583eec.2
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790625333; cv=none;
        d=google.com; s=arc-20260327;
        b=igxnt5sXGPfyJvmWnTnESq83ID8R2vfoymHk23VCLdYQbuJvJKeDO2NcJp5wm7OAgF
         noKOHFmwaQP1KCsYB0+oCo0h+4avLeh9FAegl79laypCVKa+7c5Q3byIVHF7EIelOSNi
         twwiqPq6Upar+MEOGYvNx1PFBkNPRUM3HBtRa1MAO5OfaBai0rAOIu+vBo63EwdfgMlT
         vBOHWrOJhpAo+WPSdp3Qxo0b89vpMgcYfUHj1Pgdf0WpaPlYxpBTwZiYEZ2Y9FXZwAY4
         NzSoUDUJy7DwsQUF27Ng1FVqXNdQAJKlgCoD6jW9kkb+y3umc4ctqIcPmh84rGbkIHhS
         clFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kOtvj05JsVBWZXqt9kwOcJeJEPiJwi5KTbKAmNAmb1Y=;
        fh=7yQPd2GXSeddbriV96ZkIYLVqbixEl3VGvOcZOmGlEM=;
        b=WLGctz7kSe/MNQK3frb8PitzOFCxMF4dvFtZpwnls1Nq+zHCiIRmTiU31MHHQztVuc
         MC4AEoH1mxWOv8YBLXuVAp+zq0bemvrzsDalsU/RysoXAECtwuiW8eTOffy63aZzsOXT
         M3rcOTDXcB4ZcZmxaNY4njQwIWBa2g9auDVCPmcUu2eBe41VLkF4aduTH24mfH2wlCB2
         GcvksG3gfvwyfEYkiMemE0VWCkiTSh6MbP90yca7hCfObzzXn3A3/+ImCWAZ1PXf2Bhu
         fVXmngOxYMQcewVqVHcsGzsqdzBzRQDrfHTAABdBosMk21GkVpuoHMuiYdKd6Gts53Vp
         t5jA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625333; x=1791230133; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kOtvj05JsVBWZXqt9kwOcJeJEPiJwi5KTbKAmNAmb1Y=;
        b=sjm2XejoR9qLXO4nqWuCkCLvm6ciHeRVzY2JK+kPDS8ZEJENNlCv2YrvNsoNJmpbGk
         x/x51pMHlyJT+cvi0smYz4qR8IrKlpLzSu4Ta/DK985M4WGGBBuDyT+ndsO7Rbv20ipj
         aW8t8YNqLy9uZgZ6Aszvjyjn0YzQxXG31DQVW50Hyl7TSF4IkPogCQboKNvXYUy8lKK5
         pM5c9gzH8RGY5luiVWcO58F405/h/gZw/EHxZBA21ZB/1vJSbZH4BS8h0xLxk+IVdgfS
         1G9u0MO1cbyCeZ5ZbVzQELgu6B7D7v7eMg+q0DVy0zKf7Nw2RNxnqYQO/s1R1I66GcYS
         9A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625333; x=1791230133;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kOtvj05JsVBWZXqt9kwOcJeJEPiJwi5KTbKAmNAmb1Y=;
        b=nVRiaIt87cLR5mfTUxmz0PYX+bUZwEPFclmOZcfUP5u7OLAWTdSwfP+GdtDHMIik04
         yi4Vj/MC1zZo0owWIppsp4IEodle7h1ynjTQqoABcQaxywp6LXu5AWR99KB5NUKdv/KL
         GYOds/4Lnq2tHNfHwh4CVNvHTBopTa5RgWe9ADb65Rt1sJO40tRmb1oxHUdCBpYPYtoY
         Kpff4fhwzAsHpg5N+1MbO4hqnOfSf20Sd1IDYdy/LY/kH9EPaz+MsWYaMzNHB05J0Pzt
         NcV2xeOZhOAesOCfMUdhMhHIiK5gNCcu5OxZiXFe0gaX69EisgZdB1MouzKErSP6BZNX
         PxGg==
X-Forwarded-Encrypted: i=1; AKwUvBwx8f2HDNJdtBOaCct1SiO7MrdgT8pdc9eOrP8tykKoX5xBMv0QJUqb1E80oA0+evnDkGAIQyDPSAYBiZ9X8g==@kernel.org
X-Gm-Message-State: AFuF++nInDQ28c1ARNh25cZhmfa1eqt+aKqLnpFJ48xPHuYuQn2jHOLo
	SpOJJNX34F/LkaLKjDhBHZ0/IFXlkCtuToZrd+dTawKYeEJdGM8VyMP691u+IzL4nIntLVe8pBd
	Pcf3r0/a+23Dqhi6P8ly7i9MnKm0vWoN7MlYz
X-Gm-Gg: AYBFou2enj4RviyUXlqKAdKnQ1R7geHZv/W2PCwNXLijvXYnytSr69n2GrjvwJHrWWu
	HzO7JxBcMUULxjDbLoyYQFN4cV24l9MmPOUwo+ubNf4jgJXQTeq8Qdr0HhQLs3D9TssyIERzGx7
	NsRtr7d5QQQH5TlhMu53UUzSMQiG/L0ZeN4slIHfcZSPgs/LS3VFzQ8xCSAYesp/z+tyhwBx/1Y
	eDGWuZq2bESGOD3eT1Q9mql8OUIy9N7fTb9F/h3aFjPCeKGHmxWYcyY4xeY8Iy56m0dDKYxcNFv
	qdra3/AYDPdK1scZKQn9TeF/43A6GBA48rb65yktIfSNjZJ1wKf5LMsHvwmnlmqfL3ngXTMqMSJ
	ytgyNwEZIRi8Gea2PUwuocQFGyqatdLs1YTVnwOw1SXDhLirN4SSkHDgo+ZUp37um0NUV2wWnlE
	mrWAfiWQNQYDCIUhdLlyO8bR5SmNynwj8C/qPuXUsvomznlHE6wPfqy/QauKCxcc/nBsfb
X-Received: by 2002:a05:7022:b055:10b0:145:bd2a:525a with SMTP id
 a92af1059eb24-146cfbd49a5mr11396616c88.26.1790625332474; Mon, 28 Sep 2026
 12:55:32 -0700 (PDT)
MIME-Version: 1.0
From: Sander van Delden <s.h.vandelden@gmail.com>
Date: Mon, 28 Sep 2026 21:55:21 +0200
X-Gm-Features: AclHuK8nrFLueLEuhlUydVoyNMIqrSTJl1PaMft6N-xDPuepPs5E8o-UUfLpWpA
Message-ID: <CAPdpv3xfQiW-Fmn2ydPYSztbm7KV+f=E4dSAD=sT7TACugc-Ew@mail.gmail.com>
Subject: cs35l56: ThinkBook 16p G6 IAX (17aa:3921) requests firmware without
 spkid, linux-firmware only ships spkid1
List-Id: <linux-firmware.lore.kernel.org>
To: linux-sound@vger.kernel.org, linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
Content-Type: multipart/alternative; boundary="000000000000de3569065c9072cb"

--000000000000de3569065c9072cb
Content-Type: text/plain; charset="UTF-8"

Hello,

On a Lenovo ThinkBook 16p G6 IAX the CS35L56 driver requests firmware
names without a speaker-ID suffix, but linux-firmware only ships the
spkid1 variants for this SSID. Out of the box, no firmware file matching
the requested names exists.

Hardware
--------
- Lenovo ThinkBook 16p G6 IAX, machine type [output of: sudo dmidecode -s
system-product-name]
- BIOS: [output of: sudo dmidecode -s bios-version]
- Codec: Realtek ALC287, subsystem ID 0x17aa3921
- Amps: 2x CS35L56 Rev B0 OTP3, ROM fw 3.4.4, on I2C (CSC3556)
- SOF on Intel Arrow Lake (sof-arl-s.ri, 2.14.1.1)

Software
--------
- Kernel: 7.0.0-34-generic (Ubuntu HWE kernel, Linux Mint 22.3)
- linux-firmware: [output of: apt policy linux-firmware]The same problem
occurred on every kernel I have used on this machine:
Ubuntu 6.8 (generic), 6.14 and 6.17 (HWE), and 7.0 (HWE). Audio only
worked correctly after manual firmware workarounds. I have not yet
tested an unmodified mainline kernel.

Observed behaviour
------------------
The driver reports the system name without a spkid suffix:

  cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: DSP system name: '17AA3921',
amp name: 'AMP1'
  cs35l56-hda i2c-CSC3556:00-cs35l56-hda.1: DSP system name: '17AA3921',
amp name: 'AMP2'

and therefore requests:

  cirrus/cs35l56-b0-dsp1-misc-17aa3921.wmfw
  cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
  cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin

linux-firmware only provides:

  cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw.zst
  cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin.zst
  cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin.zst

The HDA side also has no SSID quirk for this machine:

  snd_hda_codec_alc269 ehdaudio0D0: ALC287: picked fixup  (pin match)
  snd_hda_codec_alc269 ehdaudio0D0: Found 2 CSC3556 on i2c
(-%s:00-cs35l56-hda.%d)

Workaround
----------
Symlinking the requested names to the spkid1 files:

  cs35l56-b0-dsp1-misc-17aa3921.wmfw.zst      ->
cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw.zst
  cs35l56-b0-dsp1-misc-17aa3921-amp1.bin.zst  ->
cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin.zst
  cs35l56-b0-dsp1-misc-17aa3921-amp2.bin.zst  ->
cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin.zst

results in a clean load on both amps, with no coefficient version
warnings, and the speakers work correctly:

  DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa3921.wmfw: Fri 05 Jul 2024 11:25:55
Central Daylight Time
  DSP1: Firmware: 1a00d6 vendor: 0x2 v3.11.21, 41 algorithms
  Calibration applied

Question
--------
I cannot tell whether the speaker ID is supposed to be read on this
model (and the kernel is missing a quirk or config for it), or whether
this model has only one speaker variant, in which case WHENCE links for
the non-spkid names would fix it. I also cannot confirm that spkid1 is
the correct tuning for my unit; it is simply the only one available,
and it sounds correct, although some extra base would be welcome ;-)

alsa-info:
https://alsa-project.org/db/?f=858b94b1e69ba260d94b17d7037f82b0a71fc2b1

I am happy to test patches or provide further logs.

Thanks,
Sander

-----------------------------------------------------
Dr. ir. Sander H. van Delden

S.H.vanDelden@gmail.com
Jan Jordensstraat 36709TJ Wageningenmobile: +31 (0)6 49 91 54 42
-----------------------------------------------------

--000000000000de3569065c9072cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:georgia,serif;font-size:small;co=
lor:rgb(68,68,68)" class=3D"gmail_default">Hello,<br><br>On a Lenovo ThinkB=
ook 16p G6 IAX the CS35L56 driver requests firmware<br>names without a spea=
ker-ID suffix, but linux-firmware only ships the<br>spkid1 variants for thi=
s SSID. Out of the box, no firmware file matching<br>the requested names ex=
ists.<br><br>Hardware<br>--------<br>- Lenovo ThinkBook 16p G6 IAX, machine=
 type [output of: sudo dmidecode -s system-product-name]<br>- BIOS: [output=
 of: sudo dmidecode -s bios-version]<br>- Codec: Realtek ALC287, subsystem =
ID 0x17aa3921<br>- Amps: 2x CS35L56 Rev B0 OTP3, ROM fw 3.4.4, on I2C (CSC3=
556)<br>- SOF on Intel Arrow Lake (sof-arl-s.ri, 2.14.1.1)<br><br>Software<=
br>--------<br>- Kernel: 7.0.0-34-generic (Ubuntu HWE kernel, Linux Mint 22=
.3)<br>- linux-firmware: [output of: apt policy linux-firmware]The same pro=
blem occurred on every kernel I have used on this machine:<br>Ubuntu 6.8 (g=
eneric), 6.14 and 6.17 (HWE), and 7.0 (HWE). Audio only<br>worked correctly=
 after manual firmware workarounds. I have not yet<br>tested an unmodified =
mainline kernel.<br><br>Observed behaviour<br>------------------<br>The dri=
ver reports the system name without a spkid suffix:<br><br>=C2=A0 cs35l56-h=
da i2c-CSC3556:00-cs35l56-hda.0: DSP system name: &#39;17AA3921&#39;, amp n=
ame: &#39;AMP1&#39;<br>=C2=A0 cs35l56-hda i2c-CSC3556:00-cs35l56-hda.1: DSP=
 system name: &#39;17AA3921&#39;, amp name: &#39;AMP2&#39;<br><br>and there=
fore requests:<br><br>=C2=A0 cirrus/cs35l56-b0-dsp1-misc-17aa3921.wmfw<br>=
=C2=A0 cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin<br>=C2=A0 cirrus/cs35l=
56-b0-dsp1-misc-17aa3921-amp2.bin<br><br>linux-firmware only provides:<br><=
br>=C2=A0 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw.zst<br>=C2=A0 ci=
rrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin.zst<br>=C2=A0 cirrus/cs3=
5l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin.zst<br><br>The HDA side also has=
 no SSID quirk for this machine:<br><br>=C2=A0 snd_hda_codec_alc269 ehdaudi=
o0D0: ALC287: picked fixup =C2=A0(pin match)<br>=C2=A0 snd_hda_codec_alc269=
 ehdaudio0D0: Found 2 CSC3556 on i2c (-%s:00-cs35l56-hda.%d)<br><br>Workaro=
und<br>----------<br>Symlinking the requested names to the spkid1 files:<br=
><br>=C2=A0 cs35l56-b0-dsp1-misc-17aa3921.wmfw.zst =C2=A0 =C2=A0 =C2=A0-&gt=
; cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw.zst<br>=C2=A0 cs35l56-b0-dsp1-m=
isc-17aa3921-amp1.bin.zst =C2=A0-&gt; cs35l56-b0-dsp1-misc-17aa3921-spkid1-=
amp1.bin.zst<br>=C2=A0 cs35l56-b0-dsp1-misc-17aa3921-amp2.bin.zst =C2=A0-&g=
t; cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin.zst<br><br>results in a cl=
ean load on both amps, with no coefficient version<br>warnings, and the spe=
akers work correctly:<br><br>=C2=A0 DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa3=
921.wmfw: Fri 05 Jul 2024 11:25:55 Central Daylight Time<br>=C2=A0 DSP1: Fi=
rmware: 1a00d6 vendor: 0x2 v3.11.21, 41 algorithms<br>=C2=A0 Calibration ap=
plied<br><br>Question<br>--------<br>I cannot tell whether the speaker ID i=
s supposed to be read on this<br>model (and the kernel is missing a quirk o=
r config for it), or whether<br>this model has only one speaker variant, in=
 which case WHENCE links for<br>the non-spkid names would fix it. I also ca=
nnot confirm that spkid1 is<br>the correct tuning for my unit; it is simply=
 the only one available,<br>and it sounds correct, although some extra base=
 would be welcome ;-)<br><br>alsa-info: <a href=3D"https://alsa-project.org=
/db/?f=3D858b94b1e69ba260d94b17d7037f82b0a71fc2b1">https://alsa-project.org=
/db/?f=3D858b94b1e69ba260d94b17d7037f82b0a71fc2b1</a><br><br>I am happy to =
test patches or provide further logs.<br><br>Thanks,<br></div><div style=3D=
"font-family:georgia,serif;font-size:small;color:rgb(68,68,68)" class=3D"gm=
ail_default">Sander</div><div style=3D"font-family:georgia,serif;font-size:=
small;color:rgb(68,68,68)" class=3D"gmail_default"><br>--------------------=
---------------------------------<br>Dr. ir. Sander H. van Delden<br><br><a=
 href=3D"mailto:S.H.vanDelden@gmail.com">S.H.vanDelden@gmail.com</a><br>Jan=
 Jordensstraat 36709TJ Wageningenmobile: +31 (0)6 49 91 54 42<br>----------=
-------------------------------------------<br></div></div>

--000000000000de3569065c9072cb--
