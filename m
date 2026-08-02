Return-Path: <SRS0=ZjVf=F3=gmail.com=lucacaffarelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B497CC55162
	for <linux-firmware@archiver.kernel.org>; Sun,  2 Aug 2026 13:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8014B1F00A3A; Sun,  2 Aug 2026 13:23:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785677002;
	b=EtJMDcbsdLdllIGP9jN7ivWgzd+AYS7gF+z1AAp7to1bkZfPPBvSYwpDZtSS61/BTDxx
	 cpmDLDAf+Fk+7roNIZgdw79lONT9J8Kg4s4nsWVYW3z5Dgrm+Z+Pso1hCeHzrq2xaallB
	 +X+ciK5Arr/lp9cKba+UjC7gliekNGZHh9T/6OuDwDR0CvWwKerBw/usumHxkrLx3YuI/
	 CIgRrAguIbI/kAE3v6ao1R4r2rarBpsbTEOFPWSR3ewnUq0cX8j/Zk1QyWGKwXoXi8lxV
	 O0H/gr0HlOmc+nbiJn9PgHQAtmVjTxOJd9Rp3QXuG2ilL8/RVHMIJvT5H8H2gAzXLaA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785677002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:List-Id:To:Cc:Content-Type;
	bh=q+GIK/w7n1DEYYQMzvBSIfLb9GR0YXMOPg69ownGL4A=;
	b=rzf6UiABOSxouzGvDOdjj8Aee4wWk6wwdOCMJRbwBinFEmjYxtjQbaeEPkYYuvyp7ABq
	 l9+LHjDbOb3NHmQpCiqag7yXmwofedcW2Mz9nE9Enlnl0x/uf/rfNfVVfZqycY+lKo67t
	 zz5f0eoE5fpTGQWPkXVGN0O4oXBrsiD/xqOyvXL3Zj1TjJqlV8FZf4L8dNJRoMEcOsw7D
	 CTCdk0lrRBjQssF7fBY8Ihzb1uWdcp0v2wUMzcbCb9qopwtAdvgC8e5vDFlmpcHuAL7LS
	 LukgkNSQqqxJWchelXh9u4nkk1tZYoCpxMhp+dZgESRkbmCiQnAfMW6Ph8KbxpfbMgA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SRxlYe1z;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF09B1F000E9
	for <linux-firmware@kernel.org>; Sun,  2 Aug 2026 13:23:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SRxlYe1z
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DF09B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c2b2c9eccso15509001cf.2
        for <linux-firmware@kernel.org>; Sun, 02 Aug 2026 06:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785677001; cv=none;
        d=google.com; s=arc-20260327;
        b=pQ67tOOaY9Qkq8EMzDiDAEeiaygNlWNz0adbCzqxMuiXOpiy20vyCTF7yFI2madKHf
         3feXIq0TuskExs9q14akWTcmTo8Tn78XA6iFpw5ds6drClE92F81dXCjT4NUnih+nmtF
         Q9t/9LV0HK3VCt25yZzSPrD9ZjZACoR6XWA/oEYgD5X1Llbw9V3houy3/vgAycjFDv9I
         QcbP+H92mjHZFC5sO6Vm4iValAN1+BvuHy8phBZEisZmPBJ8NQlv4sZiTAIKkh2IygfM
         7KC/uDe97D1hyi+Rha+4UDtjPnev/kPG3gRYHu8VIX7B1ATbsaUF7Q6Z3x8KYqfwRMXP
         4slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=q+GIK/w7n1DEYYQMzvBSIfLb9GR0YXMOPg69ownGL4A=;
        fh=daDvrnIbR3OBG1EGjzpHJy3WfsOB9DSFRgX5lBdCTb8=;
        b=epaPNA2vHxQMkIlo0iuz2N/qqMaoOaAUhIbAV3D5i1sOxp3v8mvuVGPSV3AuSH9cnV
         bUkVOW8lEnNOHuE/gplf7b30eKi6jn6yzEZnR4B53uPRIkmM4kX1Da0uq6BLJ2r9q0OK
         1VjvPyIz8SLSIfCVs0EOVca3rs9Cw1xHgGkBIWsR1Hmj4/oeangCBhlgP+oht2y2dhPX
         U3eLz5UL66lpmRxXRTJi6hQhPBPhegv7/NXsXgRzjAHFjLQTi1LecEBzehWFMfiw+Sbt
         7o3HL+hfYF3y8v9MNxSQhSERpgggxEOiSJ+MzhGiCFBpPrc7V7qfcXbMcyva9Eld0CBx
         /0PA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785677001; x=1786281801; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+GIK/w7n1DEYYQMzvBSIfLb9GR0YXMOPg69ownGL4A=;
        b=SRxlYe1zQPnnIhkyhQqqDUChU3E7UrScxi04D6AgL2mnw2rEvElrq7Rm30YIY3Oll1
         uxh8S9KCgEReOUYXbWPgHeZMvw3yRA1jcz7yLg5IuWsSwxU5cGxy+HSXwUmeSPyMkVGY
         jJKH9ygQyWfwRaJCjBGjA/s05Rn5K1qQtyiG86kj46dfLNTMH9Jatke/AmpxNUj2Oudw
         tTBH+A346cQXCmrYsigmUaoKm4CVG3gIeBU7z+oM6uV4bwRpEENmEypeg6fGneDBUKaS
         /C1ifs3J8MI6r4EoBDNceJbUsts9HDc2mjetfPI6J8VHcNjh1PCTo8YQiSqrQAK0I7k7
         lcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785677001; x=1786281801;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q+GIK/w7n1DEYYQMzvBSIfLb9GR0YXMOPg69ownGL4A=;
        b=WCBrHkfA18qDd2sykLm5SpHidyYLcZkfLcZ5juvBCj8w/j8gTEaa5QUjsKAeYSTWCy
         jX+I9SCNVbKrZHPHZLc/pED+B0HbChJztRH/HW8Yfm3hw4IrWEWgPocwGNCVjWUmmbwA
         uYT0uLDLWvRHgFPYUJz+YEqhNG3diSQCJ78lvyC84cqMSHJjGtgwfQVi7aXaUbmUKR+8
         bd5CRTlJEag+wX80BrIAvpdJTpQrAz5HMusWGhrCqxQP86wFaTCZPBd6J254dwar5dgG
         l7iCq+2zjyrc22I4ANacM6qlGqpemBqDfrrdGIa2ByZiskdkctaiLnYGP3OHGN61cG7Y
         qscQ==
X-Gm-Message-State: AOJu0YwJfuh4edqqiO+/Y4x8SCrjF64hB1YZGnlxk0avjj58Lg755US2
	FOiQCQ5pAm3XRudoQMBgfdJJLaoOmKmk/qgRyYHTO915orWlJLXwGebXsAYS/lwzIQVOzQHN/4J
	PRgCz22c6ny6Og2hoSjx7NTFwGmOFomHQb38G
X-Gm-Gg: AR+sD13QsUgZGIJ8SJIreAd6VS2H4wg8zc+sweml6dDBvSly+anF2YC7StMm00BgbGO
	vaiUkKI7rHNdCUFX7uDOMNk5qFU3NdLRYgl9o3dKHqIcyLHqkkqrsyrOrRqPtnuZx874/DD4gig
	kghGjM74i7p386l2+5pVHCiBU1/plzq3JUKFltUUOX7cGIZcx48LAjWyIuKxWN7Hs7XwmJOwNmm
	eRt9Y6glnLf1zwrjv/zIKe4BsMfTrU5a2zK6zjpfH3K/QJV5dpBk2mhwtLMZsuVeq11bJFve+pq
	HeIoFvSvI9cZC+H881Samcpdz/EcNutM96PRQHzjFgnB2yZJCihUrQTT
X-Received: by 2002:ac8:7dd1:0:b0:528:a8c:aa00 with SMTP id
 d75a77b69052e-52b566718bemr123318891cf.8.1785677000839; Sun, 02 Aug 2026
 06:23:20 -0700 (PDT)
MIME-Version: 1.0
From: Luca Caffarelli <lucacaffarelli@gmail.com>
Date: Sun, 2 Aug 2026 15:23:09 +0200
X-Gm-Features: AUfX_mwqpORmSZTqrzOG4IePTqlAtZwDSlbGz1JiOEb5u3Eaa1_CpwOCYzQfuSk
Message-ID: <CAPGq_Y+g12MHPm-N+jO=6=xNn1UhL_i5J-WwH+6G6quVwuhJqQ@mail.gmail.com>
Subject: [BUG] cirrus: cs35l41 tuning alias for SSID 103C8C4D mutes left speaker
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Content-Type: multipart/alternative; boundary="00000000000051947e065810539b"

--00000000000051947e065810539b
Content-Type: text/plain; charset="UTF-8"

Hi,

The CS35L41 tuning files aliased for SSID 103C8C4D silence the left speaker
entirely on HP OMEN 16-u1xxx. Using the generic firmware instead makes both
channels work, so this looks like an incorrect alias rather than a hardware
or driver problem.

System
------
Machine:        HP OMEN by HP Transcend Gaming Laptop 16-u1xxx (SKU A18V4EA#ABZ)
BIOS:           F.29, 2026-03-31
Audio:          Realtek ALC245 (10ec:0245), subsystem 103c:8c4d
Amps:           2x Cirrus Logic CS35L41 (35a40) rev B2, i2c CSC3551,
shared reset
Distro/kernel:  Fedora 43, kernel 7.1.3-101.fc43.x86_64
linux-firmware: 20260622

Current aliases
---------------
cs35l41-dsp1-spk-prot-103c8c4d.wmfw.xz
    -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw.xz
cs35l41-dsp1-spk-prot-103c8c4d-spkid1-l0.bin.xz
    -> cs35l41-dsp1-spk-prot-103c8bb3-spkid1-l0.bin.xz
cs35l41-dsp1-spk-prot-103c8c4d-spkid1-r0.bin.xz
    -> cs35l41-dsp1-spk-prot-103c8bb3-spkid1-r0.bin.xz

The tuning bins are aliased to those of a different machine, 103C8BB3.

Symptom
-------
The left speaker produces no output at all. The right speaker works normally.
The driver reports no error: both amps probe, load firmware, apply calibration
and bind successfully, with identical parameters.

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8c4d.wmfw: format 3 timestamp
0x6128e16b
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Calibration applied: R0=5407
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type:
spk-prot, Gain: 14
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID:
103C8C4D, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 1
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applied: R0=5550
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - Type:
spk-prot, Gain: 14
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID:
103C8C4D, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 1

ALSA and PipeWire are balanced (both channels 0.00 dB, balance 0.00), and the
codec pin node 0x17 shows Amp-Out vals [0x00 0x00] on both channels.

What I tested
-------------
1. Stock aliases (wmfw 103c8c4d + bins from 103c8bb3, l0 and r0):
   left channel silent.

2. Both amps forced to load the same tuning bin (repointed the l0 symlink at
   the 103c8bb3 r0 bin, so both amps get byte-identical firmware and tuning):
   left channel still silent. This rules out the per-channel bin as the cause.

3. Generic firmware (cirrus/cs35l41-dsp1-spk-prot.wmfw, timestamp 0x62b5c26c,
   plus cirrus/cs35l41-dsp1-spk-prot.bin): both channels work and are
   balanced, at a noticeably lower output level.

Test 3 shows the left speaker and its amp are functional, so this is not a
hardware fault. Test 2 shows the tuning bin is not the discriminating factor.
The remaining difference between the two amps is the factory calibration read
from NVRAM, R0=5407 (left) against R0=5550 (right). My guess is that the
103C8BB3 tuning constants, combined with the model wmfw, put R0=5407 outside
the expected range for the protection algorithm and the channel gets muted,
but I have not confirmed that from the firmware internals.

Request
-------
Could the correct CS35L41 tuning for SSID 103C8C4D be added? If it is not
available, dropping the 103C8BB3 alias would be preferable to the current
state: users would fall back to the generic firmware, which produces working
stereo output instead of a dead left channel.

My current workaround is to shadow the model-specific names with the generic
firmware under /lib/firmware/updates/cirrus/.

Happy to run further tests or provide additional logs.

Thanks,
Luca Caffarelli

--00000000000051947e065810539b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre>Hi,<br><br>The CS35L41 tuning files aliased for SSID =
103C8C4D silence the left speaker<br>entirely on HP OMEN 16-u1xxx. Using th=
e generic firmware instead makes both<br>channels work, so this looks like =
an incorrect alias rather than a hardware<br>or driver problem.<br><br>Syst=
em<br>------<br>Machine: =C2=A0 =C2=A0 =C2=A0 =C2=A0HP OMEN by HP Transcend=
 Gaming Laptop 16-u1xxx (SKU A18V4EA#ABZ)<br>BIOS: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 F.29, 2026-03-31<br>Audio: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rea=
ltek ALC245 (10ec:0245), subsystem 103c:8c4d<br>Amps: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 2x Cirrus Logic CS35L41 (35a40) rev B2, i2c CSC3551, shared r=
eset<br>Distro/kernel: =C2=A0Fedora 43, kernel 7.1.3-101.fc43.x86_64<br>lin=
ux-firmware: 20260622<br><br>Current aliases<br>---------------<br>cs35l41-=
dsp1-spk-prot-103c8c4d.wmfw.xz<br>=C2=A0 =C2=A0 -&gt; cs35l41/v6.61.1/halo_=
cspl_RAM_revB2_29.63.1.wmfw.xz<br>cs35l41-dsp1-spk-prot-103c8c4d-spkid1-l0.=
bin.xz<br>=C2=A0 =C2=A0 -&gt; cs35l41-dsp1-spk-prot-103c8bb3-spkid1-l0.bin.=
xz<br>cs35l41-dsp1-spk-prot-103c8c4d-spkid1-r0.bin.xz<br>=C2=A0 =C2=A0 -&gt=
; cs35l41-dsp1-spk-prot-103c8bb3-spkid1-r0.bin.xz<br><br>The tuning bins ar=
e aliased to those of a different machine, 103C8BB3.<br><br>Symptom<br>----=
---<br>The left speaker produces no output at all. The right speaker works =
normally.<br>The driver reports no error: both amps probe, load firmware, a=
pply calibration<br>and bind successfully, with identical parameters.<br><b=
r>=C2=A0 cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: DSP1: cirrus/cs35l41-dsp=
1-spk-prot-103c8c4d.wmfw: format 3 timestamp 0x6128e16b<br>=C2=A0 cs35l41-h=
da i2c-CSC3551:00-cs35l41-hda.0: Calibration applied: R0=3D5407<br>=C2=A0 c=
s35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, =
Gain: 14<br>=C2=A0 cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound =
- SSID: 103C8C4D, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 1<br>=C2=A0 cs35=
l41-hda i2c-CSC3551:00-cs35l41-hda.1: Calibration applied: R0=3D5550<br>=C2=
=A0 cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Firmware Loaded - Type: spk-p=
rot, Gain: 14<br>=C2=A0 cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: CS35L41 B=
ound - SSID: 103C8C4D, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 1<br><br>AL=
SA and PipeWire are balanced (both channels 0.00 dB, balance 0.00), and the=
<br>codec pin node 0x17 shows Amp-Out vals [0x00 0x00] on both channels.<br=
><br>What I tested<br>-------------<br>1. Stock aliases (wmfw 103c8c4d + bi=
ns from 103c8bb3, l0 and r0):<br>=C2=A0 =C2=A0left channel silent.<br><br>2=
. Both amps forced to load the same tuning bin (repointed the l0 symlink at=
<br>=C2=A0 =C2=A0the 103c8bb3 r0 bin, so both amps get byte-identical firmw=
are and tuning):<br>=C2=A0 =C2=A0left channel still silent. This rules out =
the per-channel bin as the cause.<br><br>3. Generic firmware (cirrus/cs35l4=
1-dsp1-spk-prot.wmfw, timestamp 0x62b5c26c,<br>=C2=A0 =C2=A0plus cirrus/cs3=
5l41-dsp1-spk-prot.bin): both channels work and are<br>=C2=A0 =C2=A0balance=
d, at a noticeably lower output level.<br><br>Test 3 shows the left speaker=
 and its amp are functional, so this is not a<br>hardware fault. Test 2 sho=
ws the tuning bin is not the discriminating factor.<br>The remaining differ=
ence between the two amps is the factory calibration read<br>from NVRAM, R0=
=3D5407 (left) against R0=3D5550 (right). My guess is that the<br>103C8BB3 =
tuning constants, combined with the model wmfw, put R0=3D5407 outside<br>th=
e expected range for the protection algorithm and the channel gets muted,<b=
r>but I have not confirmed that from the firmware internals.<br><br>Request=
<br>-------<br>Could the correct CS35L41 tuning for SSID 103C8C4D be added?=
 If it is not<br>available, dropping the 103C8BB3 alias would be preferable=
 to the current<br>state: users would fall back to the generic firmware, wh=
ich produces working<br>stereo output instead of a dead left channel.<br><b=
r>My current workaround is to shadow the model-specific names with the gene=
ric<br>firmware under /lib/firmware/updates/cirrus/.<br><br>Happy to run fu=
rther tests or provide additional logs.<br><br>Thanks,<br>Luca Caffarelli</=
pre></div>

--00000000000051947e065810539b--
