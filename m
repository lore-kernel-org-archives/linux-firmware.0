Return-Path: <SRS0=ABA8=GZ=gmail.com=wjalakasi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7236C61DD3
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 22:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B26741F00A3A; Tue,  1 Sep 2026 22:26:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788301618;
	b=ZhFkm3oRxi/gMSLXO9fnTAUVv+6O/Ml0UeKVi12x4sGICmrOr6F4iOcHmsYsaGJ+OS+h
	 P0qZHEk6oTtD6ulK+CC6h3REfYOlhpo2G0SNhpPU5irf/Da4R6wujNhq2KNujAhhnGlSR
	 PzIWgq36tKPmEtqYgvvaJU+wzPSCmiRag0nXMJ+XjX/f5zlgwzPHWrW3mJU7WLWc/jAhb
	 8BLgj3Guc1dFiTGj7q8bGXopBsbBOLp1ASQfrUbUdqKmouTcbUPKxjB9zCLz//ZhkdcPx
	 yQnSVv2Lf0xjI/fVM1vkuxONSlAIm3hryLa75oE4mi2o3/sgSqHxE2f1DR99WP+ay2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788301618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:Date:
	 X-Superhuman-ID:From:Message-ID:Subject:X-Superhuman-Draft-ID:
	 X-Superhuman-Thread-ID:List-Id:To:Cc:X-Entity-Ref-ID:Content-Type;
	bh=KBs/NE2Ow2iKAg+LJ+7n0GakcVfDxbwAiDGH+n/ocHc=;
	b=QG+Dlh4itWGOKZYfgoxpVt2ECzKO5yZb7kDUGErOdbEsvTqsthRB/yUDtU1LC8ZRNl5Z
	 oQcwq6Dld9MybIx4PqBnNlnw92Q4n6waSrvzU++BnvJ9rvx0mEv3czIeOUwUiOKORKaJC
	 PprrEf7L8yhnkNmHn+83yR9dKYsrOe31sR83aQDyD8MGWVVyrsvsAmuHOyMEvWWnL7u12
	 LvXo0PBZGKyUfjRAylaxSkY03xDGoECBsfG/mzkImwHnRq8gEtKDHI5lSJ/a8uMua3Ozl
	 Z27+XUUnFO9EEAr0zE1JwkB2Lt6Yq9eTEIBWKGJ01fX+y7T7Bv3h4WhnpXwU9egEjRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTvOU6A3;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FE301F000E9
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 22:26:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DTvOU6A3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0FE301F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso221338e0c.1
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 15:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301617; x=1788906417; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:from:date:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBs/NE2Ow2iKAg+LJ+7n0GakcVfDxbwAiDGH+n/ocHc=;
        b=DTvOU6A3gwKJWKtn5blFgrg8EcMkY1qeEoHEh35TRLO65YQyL5/h65D8cMggdK3z8Z
         drDrDtEqMCrw6+w4ert75a8PUXH9yuI9iYzY53+mYSEhpUoAeyYV7Y5PEZFrtgSYyXpS
         HIEG1vh0HRV7y2FcWIB8N5rlfNY8fkaaMnmpaUZ/q9inPZB4foGjlanmwWxfqLTeDreA
         ZQhOzSbiIo4sKKSbvbRxCzcvnFV7YY2C1WdBod/0dZiOtmDxm7KBOohT2/F010Hzjbpc
         AN64gUql+lNwmXxHmtjotjZQkBZwsXzEJDdqPejg52t2x85jNKyqcXVwVM5UUIUkXJYZ
         YMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301617; x=1788906417;
        h=content-type:cc:to:subject:message-id:from:date:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KBs/NE2Ow2iKAg+LJ+7n0GakcVfDxbwAiDGH+n/ocHc=;
        b=UPIEKt7uRLrtRgKWOJatONRN/AzrHFlIiviUiJhkHy+ooMOta2GSfT7PFB3xgezPMT
         PLaKjNIzzBorwJLIzYARtnEL/1uksNt63S/yPY0OkC//nyFyX8xNQXgS0tFSpQjE/6EN
         svbTDdF/9l9YLCcrqSdaV+oMf7nnnR2UJMa32b7T3vC3ueRfEdJxcwaHzqRPjzj02DRk
         htouVxkfOB0w3w0Oec6LoN2dCt/93hkMoSF92BWuzWw6iIHtVlfXZ+AD+zwyykHBMLn4
         yhbKJ9WJn+y71Qr9TYDC1KZ9VwcsDu4F5+AgDrECOGcH5780fL6TXmjtBmK8EaoYskJW
         2lZw==
X-Gm-Message-State: AFuF++llhlFs1EmFLDarwxjMxd79Lc9UaSz3fM+sVx8ZhLvc94vUcqsH
	LUHPdKqPwWFQ4Af+RCAFCZjy+kMdzc+7c4hfH6u2nJtDxczbme4rkO0UvrzFXnQx
X-Gm-Gg: AYBFou1LWB1Z9wZ5AHTX9sv47vve2YgUuSrBlKKA0aRQUP0XIkjbWJt9Rr2+Z+ItQfO
	YQ2lpsjjrc62R9gQkpj/FNR5BcX3WnXyVL0MggFRy6mA9sab25pFZHcHG3fW5HVzBjZ/92cqUAw
	zD5wsbwPqMc4N8IElbs1SLbatxvwz1WZ5ni2mQzcB4ooTfTCguD4gO6Liw6+tarNUPqqVcAycag
	Dn/3GmD9gPNzGFmwUtzrAVUBRkpXr3MuOwdAY+QqOFgjSnp7Dg3M95Ip20/2u2WSCbDJPvwzYC+
	CoaHL03FaDYkZnWontdR0RLXoPos0OCrZPI3wsIp7MxU5ldw3ReQ17qw20IUdrqiFDhHWtAeNgV
	XnD3TOAKfXrUfN61C9B9QTmZJDeIBky67yyvrRHFoQxPp3xE+KHMDxMtZtqpXPTvqunXtLlS+iM
	TYQgpK5bRExQK+uY11ahuPKCB466lMw3LqnS+ASxQ47GH9XuiDPVZuit1MO/qBCnbLZC88RYk1D
	4Xb8yX+aJszW8c/XwQOcW5+XMzlVQ==
X-Received: by 2002:a05:6122:46a4:b0:5bf:9f77:477a with SMTP id 71dfb90a1353d-5c7d2722cfbmr126387e0c.2.1788301616614;
        Tue, 01 Sep 2026 15:26:56 -0700 (PDT)
Received: from localhost (0.92.231.35.bc.googleusercontent.com. [35.231.92.0])
        by smtp.gmail.com with UTF8SMTPSA id 71dfb90a1353d-5c7cd8ce9c1sm754683e0c.10.2026.09.01.15.26.55
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 15:26:55 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 22:26:54 +0000
X-Superhuman-ID: mtj8km9v.a22a6bcc-8a4a-41cb-8b06-25a970b4893b
From: "Wiza Jalakasi" <wjalakasi@gmail.com>
Message-ID: <mtj8kka3.730e0eb0-657f-4b6b-a45a-1a522c9041fa@we.are.superhuman.com>
Subject: cirrus: missing CS35L56 spkid0 tuning for Dell XPS 13 DX13260
 (10280e53)
X-Superhuman-Draft-ID: draft008b7e9012adca45
X-Superhuman-Thread-ID: draft00fdc3bcb5bd1f40
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com, rf@opensource.cirrus.com, simont@opensource.cirrus.com
X-Entity-Ref-ID: mtj8km9v.a22a6bcc-8a4a-41cb-8b06-25a970b4893b
Content-Type: multipart/alternative;
 boundary=c386e4d56e34ae3c424f7c774cf1c3a570515f0e6d0ec40f5f4501d36dda

--c386e4d56e34ae3c424f7c774cf1c3a570515f0e6d0ec40f5f4501d36dda
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hello, Requesting the missing spkid0 CS35L56 tuning for the Dell XPS 13 DX1=
3260 (audio subsystem 1028:0e53). Problem ------- linux-firmware 20260810 s=
hips tuning for this SSID as spkid1/spkid2/spkid3 only: cirrus/cs35l56-b2-d=
sp1-misc-10280e53-spkid{1,2,3}.wmfw cirrus/cs35l56-b2-dsp1-misc-10280e53-sp=
kid{1,2,3}-amp{l,r}.bin My unit's amps report speaker-ID 0 (clean read; no =
"Failed to read spk-id" or "Invalid spkid" in the log), so the driver reque=
sts: cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0.wmfw cirrus/cs35l56-b2-dsp=
1-misc-10280e53-spkid0-ampl.bin cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0=
-ampr.bin These do not exist, both amps log FIRMWARE_MISSING, and the speak=
ers are completely silent. Hardware: 2x CS35L56 Rev B2 on SPI (OTP1 fw 4.2.=
1), CS42L43 codec on SoundWire, SOF sof-audio-pci-intel-ptl. Kernel 7.2.2-a=
rch1-1 (Arch Linux), SOF_SDW_SIDECAR_AMPS quirk applied; amps bind and boot=
 their DSP, only the tuning is missing. Kernel log (dyndbg on the cs35l56 m=
odules): cs35l56 spi-cs35l56-left: Cirrus Logic CS35L56 Rev B2 OTP1 fw:4.2.=
1 (patched=3D0) cs35l56 spi-cs35l56-left: DSP fwf name: 'b2-dsp1' system na=
me: '10280e53-spkid0' cs35l56 spi-cs35l56-left: DSP1: Firmware: 1a00d6 vend=
or: 0x2 v4.2.1, 42 algorithms cs35l56 spi-cs35l56-left: FIRMWARE_MISSING cs=
35l56 spi-cs35l56-left: Can't read tuning IDs (right amp identical) Evidenc=
e that spkid0 should alias the spkid1 tuning ------------------------------=
--------------------- This machine dual-boots Windows 11, where the speaker=
s work. Inspecting Dell's Windows audio package for this SSID (DriverStore =
FileRepository, xucsmeext_0e53.inf): 1. Its tuning files b2_bridge_ss{1,2,3=
}_0e53_{lw,rw}.bin are byte-identical (md5-verified, all six files) to linu=
x-firmware's spkid{1,2,3} ampl/ampr bins for 10280e53, and it carries the s=
ame 4.5.9 firmware. 2. The Windows package contains no set 0 at all, yet Wi=
ndows audio works on this unit. Its INF resolves the tuning filename from a=
 GPIO read (b2_bridge_ss _0e53_lw.bin), so Windows evidently maps this unit=
's reading to ss1. 3. As a local test I symlinked spkid0 -> spkid1 (wmfw + =
ampl + ampr) and the speakers work correctly. This mirrors the spkid0 alias=
ing already present for many other Dell SSIDs in cirrus/. Request ------- P=
lease add the spkid0 alias (or files) for 10280e53 -- on the evidence above=
 a symlink to the spkid1 tuning, but you have the authoritative mapping. Ha=
ppy to test on this hardware. Related distro report: https://github.com/oma=
com/omarchy/issues/9687 This report was prepared with the help of an AI ass=
istant from diagnostics gathered on the machine. Thanks, Wiza Jalakasi

Warmly,

Wiza Jalakasi
https://wiza.jalaka.si

Sent via Superhuman ( https://superhuman.com/refer/9o2pqxe0?utm_medium=3Dsi=
gnature&utm_source=3Dproduct )
--c386e4d56e34ae3c424f7c774cf1c3a570515f0e6d0ec40f5f4501d36dda
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head></head><body>Hello,

Requesting the missing spkid0 CS35L56 tuning for the Dell XPS 13 DX13260 (a=
udio subsystem 1028:0e53).

Problem
-------
linux-firmware 20260810 ships tuning for this SSID as spkid1/spkid2/spkid3 =
only:

  cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid{1,2,3}.wmfw
  cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid{1,2,3}-amp{l,r}.bin

My unit&#39;s amps report speaker-ID 0 (clean read; no &#34;Failed to read =
spk-id&#34; or &#34;Invalid spkid&#34; in the log), so the driver requests:

  cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0.wmfw
  cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0-ampl.bin
  cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0-ampr.bin

These do not exist, both amps log FIRMWARE_MISSING, and the speakers are co=
mpletely silent.

Hardware: 2x CS35L56 Rev B2 on SPI (OTP1 fw 4.2.1), CS42L43 codec on SoundW=
ire, SOF sof-audio-pci-intel-ptl. Kernel 7.2.2-arch1-1 (Arch Linux), SOF_SD=
W_SIDECAR_AMPS quirk applied; amps bind and boot their DSP, only the tuning=
 is missing.

Kernel log (dyndbg on the cs35l56 modules):

  cs35l56 spi-cs35l56-left:  Cirrus Logic CS35L56 Rev B2 OTP1 fw:4.2.1 (pat=
ched=3D0)
  cs35l56 spi-cs35l56-left:  DSP fwf name: &#39;b2-dsp1&#39; system name: &=
#39;10280e53-spkid0&#39;
  cs35l56 spi-cs35l56-left:  DSP1: Firmware: 1a00d6 vendor: 0x2 v4.2.1, 42 =
algorithms
  cs35l56 spi-cs35l56-left:  FIRMWARE_MISSING
  cs35l56 spi-cs35l56-left:  Can&#39;t read tuning IDs
  (right amp identical)

Evidence that spkid0 should alias the spkid1 tuning
---------------------------------------------------
This machine dual-boots Windows 11, where the speakers work. Inspecting Del=
l&#39;s Windows audio package for this SSID (DriverStore FileRepository, xu=
csmeext_0e53.inf):

1. Its tuning files b2_bridge_ss{1,2,3}_0e53_{lw,rw}.bin are byte-identical=
 (md5-verified, all six files) to linux-firmware&#39;s spkid{1,2,3} ampl/am=
pr bins for 10280e53, and it carries the same 4.5.9 firmware.

2. The Windows package contains no set 0 at all, yet Windows audio works on=
 this unit. Its INF resolves the tuning filename from a GPIO read (b2_bridg=
e_ss<spksetid_gpio>_0e53_lw.bin), so Windows evidently maps this unit&#39;s=
 reading to ss1.

3. As a local test I symlinked spkid0 -&gt; spkid1 (wmfw + ampl + ampr) and=
 the speakers work correctly. This mirrors the spkid0 aliasing already pres=
ent for many other Dell SSIDs in cirrus/.

Request
-------
Please add the spkid0 alias (or files) for 10280e53 -- on the evidence abov=
e a symlink to the spkid1 tuning, but you have the authoritative mapping. H=
appy to test on this hardware.

Related distro report: https://github.com/omacom/omarchy/issues/9687

This report was prepared with the help of an AI assistant from diagnostics =
gathered on the machine.

Thanks,
Wiza Jalakasi<div><br/></div><div class=3D"gmail_signature"><div dir=3D"ltr=
"><div dir=3D"ltr"><span><div><div dir=3D"ltr"><div dir=3D"ltr" style=3D"co=
lor:rgb(136,136,136);font-size:12.8px"><span style=3D"color:rgb(0,0,0)">War=
mly,</span></div><div dir=3D"ltr"><span style=3D"font-size:12.8px;color:rgb=
(0,0,0)"><br/>Wiza Jalakasi<br/></span><div dir=3D"ltr"><a href=3D"https://=
wiza.jalaka.si" style=3D"font-size:x-small" target=3D"_blank">https://wiza.=
jalaka.si</a><br/></div></div></div></div>
</span>
</div></div><br/><div style=3D"clear:both">Sent via <a href=3D"https://supe=
rhuman.com/refer/9o2pqxe0?utm_medium=3Dsignature&amp;utm_source=3Dproduct" =
target=3D"_blank">Superhuman</a></div><br/></div><div style=3D"display: non=
e; border: 0px; width: 0px; height: 0px; overflow: hidden; visibility: hidd=
en;"><img src=3D"https://r.superhuman.com/~ytd5cYzxZ8u2R4-XASRHm0lkJmbDnnHW=
_Pauee9tLDtqLTl8zOeVEwBafW3A3a81Gug4qCW6bSLItR99HQDuax5qxcUJvPK4yKW0.gif" a=
lt=3D" " width=3D"1" height=3D"0" style=3D"display: none; border: 0px; widt=
h: 0px; height: 0px; overflow: hidden; visibility: hidden;"/><!--          =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                        --></div></spksetid_gpio></body></h=
tml>
--c386e4d56e34ae3c424f7c774cf1c3a570515f0e6d0ec40f5f4501d36dda--
