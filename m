Return-Path: <SRS0=Qoea=BG=gmail.com=sl1pkn07@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF5C77B75
	for <linux-firmware@archiver.kernel.org>; Wed, 17 May 2023 00:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3A87C4339B; Wed, 17 May 2023 00:13:16 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E85FDC433D2
	for <linux-firmware@kernel.org>; Wed, 17 May 2023 00:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E85FDC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f38bea8be8so6378248e87.0
        for <linux-firmware@kernel.org>; Tue, 16 May 2023 17:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684282393; x=1686874393;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/UBXOAOKoOX6dgfyNb8QHOokJ9pqi4gKbQtwNSv7GcQ=;
        b=AdOVMkC6e9RjDsoZ03lh9QTZKhFqjk3MkG2x/k0LH4jX2L4gHzbn+jiFBweqDsmtWB
         BEyk/ErS580Tpxw/caU/TYiAHCfs9pUFJRbJd747OJ0Qbv39wqnT8/0PRI8yuBqOfhSc
         W5loB/Y82tuIEkIuw0muipjUBlGgvZcMDzMy8sAAcrIgG1yul8Y1EzkdO7FMcA5mA0dj
         H1v2UxngXomn7q315XXMGb1Z+7EuX5mXP7CGC/Ira5/jXgCnZKvkMxUdvyKY2FumWxP9
         NmG9rMCMUq6JXAc8TjtaKxdETSfbWseI9y1DpT46AlbcOgZ89mL2nM+nrDTdUbqrETVD
         BKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684282393; x=1686874393;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/UBXOAOKoOX6dgfyNb8QHOokJ9pqi4gKbQtwNSv7GcQ=;
        b=XIg9VxA75PPmgQMROBQ+SMyxhGXEGNVWmopoOt8yve7I/riVo2VIIJA+F5PaMJ4pHF
         lZzh4ElEgw+E1gcxyIlF3XtCDmLrRYOHB8eFJbToInLUhjUqPOC7YlVHQ7Dk4tsDkF9W
         F88EMN9PljOfslpaJ9sxQoJejXbr9ysFMMkVf/39kymIF0l1NWyrJcy8MWn03VR9EZBc
         +WAOgfWTHVsscyZ511cISWVTMYVKRia/+jFXUEYrzDTm9buMk+3bJsL3GTOMVlgWj/nI
         GS7AgDUD/gbkAMsBp+N2BBWS6rQ1YW1a6pLE/p3JTvJf2atqEzyAfzNenetsbemaPbsD
         21hg==
X-Gm-Message-State: AC+VfDxYzuS4aMy/8uquvmpBvD3i2x7BhoU+Enn773/FvGonvGq3bfZh
	ywfbeDGoJ4HLc09LCugg9lnD6xBXp0CgjoqaDxEQTA5v3Do=
X-Google-Smtp-Source: ACHHUZ5FWoA/M3bh6xkE7Ny2mijWaoWSBxlCspIGpC+44hZPmIiFQIl2XMGwsB+GnUP7aTai0E++aUCTBG87xRM1bDg=
X-Received: by 2002:a05:6512:21c3:b0:4ed:d5ce:7dea with SMTP id
 d3-20020a05651221c300b004edd5ce7deamr88296lft.27.1684282393453; Tue, 16 May
 2023 17:13:13 -0700 (PDT)
MIME-Version: 1.0
From: sL1pKn07 SpinFlo <sl1pkn07@gmail.com>
Date: Wed, 17 May 2023 02:12:37 +0200
Message-ID: <CAAaYXTtWEE0XjvQfaPw5_MiKiDS7uhb=X+0zAuX8b1hDv0Bj2Q@mail.gmail.com>
Subject: [PATCH] WHENCE: Add support to SoQuartz CM4 modules
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000c3684a05fbd88db7"

--000000000000c3684a05fbd88db7
Content-Type: text/plain; charset="UTF-8"

Pine64 SoQuartz CM4 modules ship with AW-CM256SM.

This bring wifi enabled in the, at the moment, tree knowed carriers:

CM4io (Official Raspberry Pi CM4 carrier)
Model-A (Pine64 CM4IO-like Carrier for SoQuartz64)
Blade (Pine64 BLADE form-factor Carrier for SoQuartz64)

Greetings

---

diff --git a/WHENCE b/WHENCE
index 61da3444..9c9f5f1a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2720,6 +2720,10 @@ Link:
brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sd
Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt ->
brcmfmac43455-sdio.AW-CM256SM.txt
Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt ->
brcmfmac43455-sdio.AW-CM256SM.txt
Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt ->
brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,soquartz-cm4.txt ->
brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt ->
brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt ->
brcmfmac43455-sdio.AW-CM256SM.txt
+

Licence: GPLv2. See GPL-2 for details.

--000000000000c3684a05fbd88db7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Pine64 SoQuartz CM4 modules ship with AW-CM256SM.<div><br>=
</div><div>This bring wifi enabled in the, at the moment, tree knowed carri=
ers:</div><div><br></div><div>CM4io (Official Raspberry Pi CM4 carrier)</di=
v><div>Model-A (Pine64 CM4IO-like Carrier for SoQuartz64)</div><div>Blade (=
Pine64 BLADE form-factor Carrier for SoQuartz64)</div><div><br></div><div>G=
reetings</div><div><br></div>---<div><br></div><div><span style=3D"font-fam=
ily:monospace"><span style=3D"font-weight:bold;color:rgb(0,0,0)">diff --git=
 a/WHENCE b/WHENCE</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">index 61da3444=
..9c9f5f1a 100644</span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">--- a/WHENCE</=
span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0)">+++ b/WHENCE</=
span><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,178)">@@ -2720,6 +2720,10 @@</sp=
an><span style=3D"color:rgb(0,0,0)"> Link: brcm/brcmfmac43455-sdio.beagle,a=
m5729-beagleboneai.txt -&gt; brcmfmac43455-sd
</span><br> Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -&gt; brc=
mfmac43455-sdio.AW-CM256SM.txt
<br> Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -&gt; brcmfmac4=
3455-sdio.AW-CM256SM.txt
<br> Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -&gt; brcmfmac4345=
5-sdio.AW-CM256SM.txt
<br><span style=3D"color:rgb(24,178,24)">+Link: brcm/brcmfmac43455-sdio.pin=
e64,soquartz-cm4.txt -&gt; brcmfmac43455-sdio.AW-CM256SM.txt</span><span st=
yle=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+Link: brcm/brcmfmac43455-s=
dio.pine64,soquartz-model-a.txt -&gt; brcmfmac43455-sdio.AW-CM256SM.txt</sp=
an><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+Link: brcm/brcmfmac43455-s=
dio.pine64,soquartz-blade.txt -&gt; brcmfmac43455-sdio.AW-CM256SM.txt</span=
><span style=3D"color:rgb(0,0,0)">
</span><br><span style=3D"color:rgb(24,178,24)">+</span><span style=3D"colo=
r:rgb(0,0,0)">
</span><br> =C2=A0<br> Licence: GPLv2. See GPL-2 for details.
<br> <br>
<br></span></div></div>

--000000000000c3684a05fbd88db7--
