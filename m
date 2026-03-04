Return-Path: <SRS0=DR+N=BE=gmail.com=flashdavies@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A3EDEBFD
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Mar 2026 01:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90949C19422; Wed,  4 Mar 2026 01:50:01 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8DBDC116C6
	for <linux-firmware@kernel.org>; Wed,  4 Mar 2026 01:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8DBDC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-798374d0f44so97871397b3.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 17:50:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772588999; cv=none;
        d=google.com; s=arc-20240605;
        b=azj5YPSej1cvqGE1XJxxVW9UrES7+1XUsKamDwLAfeirSQvoI3Q+4c6FVVKR5s2nEa
         UdjNwkaiSHM/LW3EK6gEhtDbZ2tVIhoCOqkPhK/RnBEl/Y9cr9hTLd2U9DhaYkHaV4ba
         IWxVMJZANBr4JWg9nWSKvNQ4gWbygTipQe1FyTp0N84TOQDMzvyFl8ZftBS01QxmeEaB
         +NwnPYqDmII1jFtU8HAKoKDZNV/5aCDXQ+3j0rp5e7RN9gnMTvrH3ZyYTeWukE8XzEYw
         wBoVTVID0OFJ9nTX8mraqHq8lZgb0ba3EPEkG7WEewXyjVK17+ktxSG77LcU565i/Kud
         Wx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4X1xUMSztPTQiNwd4yKG3mRLdq2CDEaifQTvKP5eL1M=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=iD83OwJdMyMgQ3BS4gQzs+N04iD+lY9G6lz2SGw/tR7SWcit9znhvgKD98KgDMHwUX
         zwZnzvrMss0LWV2Ij3XXQUSRXlzCbhACS5tlMPAQlky7TZIXCdW4Hi7FZNssEjdQUh0x
         +h/z9ukRc4hebsSV3w+vA0fwQqo3JOsvutJ9GkohenllgZx8AYInpuSdkS//v1W2tqbs
         JPN0Q95F/KsA1/zpjcr9gB72655VQfJXq+mNj2LzfjUlmOIaEGe+F9H6/QyUAVL4DXmX
         XNTM3h8mdQjUeIGfNR4pPIfrWwTCRVH9pYlOJ5SnLFPMW4NGzT7GfLTFjFeCP15FNP07
         Mpvw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772588999; x=1773193799; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4X1xUMSztPTQiNwd4yKG3mRLdq2CDEaifQTvKP5eL1M=;
        b=Pv8n927XQmr3sjVUUiefV5QWqBjiTojqhb8/IfwVOwNjPQRuSQM9OcnNOBvImE1HOC
         e96X3duonp0znh1YketyYIf4eOgOMqp61SzrPwURd8XX4AnLzbweYFvarZeShxte//Lk
         YJsIN5iCXU3aV5ng08o6/912LEOVoTeEKxy4JiB6tp0ikioDjaCLYWauLdyxr7LbyQDR
         YPbyb/JTH6IG/j8XNtYeMlvzax1RJBxjQN4BMIi/kY4GPv+EcbXa2RzIvZztvxqjurTe
         RPDJ2PoPZXZHU/Whewq/uZXlBdKGyi9wcaYeY/TqOVOxk3F6a+kgy8EEPRmlbokxNmoX
         J41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772588999; x=1773193799;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4X1xUMSztPTQiNwd4yKG3mRLdq2CDEaifQTvKP5eL1M=;
        b=NTN5g2vO61fHPlTnmuvK4iUHrvNar4iAIp73+G84Twp33FKbPlq3Q50LrhJTkS0Z4b
         ePxKV6ObniiWAFlk/6ulGDIcXDC8woYnSd21MDfsyqa4665EH2C7r9RrabXH52g34zcX
         H+Gw0rgvbCkiG9LmsmtbeDdjmdcQ9rrTswXNJv5PWv3IeYktWZPeNPhLVpAxSH0FWxAH
         YTbEQid3WrWSQqIKqL7q5Yk9cjPrrIoLsYQBVA5Lm/R+zn0kvZzmXpRScd/+uFx03Obc
         HHxFfd/oviMc3930zj+VtAvTSYXwPhrHow07Mqjs/DmAkXKB4mRVWydjhqUqrNSqPxwx
         C1vA==
X-Gm-Message-State: AOJu0Yy9BI5e81IsFzyQROZJ6phbGLcKjTy/K4uqt4YiofWsTyeyjXjL
	aaDK1EGMnlXKXcLVrqGj5BeVoNm/rKotvnQ91ifkneMe6aV/ZiHkSVMNLOI5W67vWiPKVT3SloF
	bZcbMz90CTDBy9DCXAjwZCGd49N9maDlafYqf
X-Gm-Gg: ATEYQzzA/YEj2VprHLAinXuqOjkuYLKlp6ARmSOXg74071JqrSdfs+DTCikt4trlC0R
	po3OiGLBaoLTI4RMxcQAZhem+Am5R93VlzXxbKeHKBatsNgxvgK1wCcQN9HoxU+khvc/cgJb/Ey
	5PeOoKQo0CAgYu9uGNddpQxHfF2tbNbPQkxS46TWFHiKaLMdu/bI7W5W39RRtglqslqVCt77qCw
	nLPaJChtxvXf228DGb7L+rehwaLWx7JMj/1jFwoS5wEbcwxQiSvsvqAQskJzHj66eQFBo4KvAri
	07uXKXMM6CpNv1TGW6X0E8g5TfR5TK3UqqGoGA32+Q==
X-Received: by 2002:a05:690e:130d:b0:63f:b6c0:23f8 with SMTP id
 956f58d0204a3-64cedce4f47mr3092751d50.33.1772588999586; Tue, 03 Mar 2026
 17:49:59 -0800 (PST)
MIME-Version: 1.0
From: Stephen Davies <flashdavies@gmail.com>
Date: Wed, 4 Mar 2026 11:49:48 +1000
X-Gm-Features: AaiRm52baFztgeC8yvQ-0QsZFDPDUtOxWt9d8ueNCbJp4rKg9CJAl_WPOjF8BDQ
Message-ID: <CAM26m_sB+bkFnLKVFfpmPExVKEczwj1NsS76dZzW+e0tkuupSw@mail.gmail.com>
Subject: Missing MT6639 firmware for MT7927 (PCI ID 14c3:6639)
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000a7372d064c290948"

--000000000000a7372d064c290948
Content-Type: text/plain; charset="UTF-8"

Hello,

I ran into a firmware issue with a MediaTek MT7927 WiFi 7 device
(PCI ID 14c3:6639) on Ubuntu 24.04.4 with kernel 6.17.

Hardware:
MediaTek MT7927
PCI ID: 14c3:6639
Motherboard: ASUS ProArt X870E Creator

The mt7925e driver loads correctly, but the required MT6639 firmware
is not currently present in linux-firmware.

Without the firmware, dmesg shows:

Direct firmware load failed with error -2
mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin
mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin

WiFi works correctly once the following firmware files are installed:

mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin
mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin

Bluetooth also requires:

mediatek/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin

These firmware blobs can be extracted from the official ASUS Windows
driver package:

DRV_WiFi_MTK_MT7925_MT7927_TP_W11_64_*

Once placed in /lib/firmware/mediatek/, both WiFi and Bluetooth
initialize correctly.

It may be helpful to add these MT6639 firmware blobs to the
linux-firmware repository so MT7927 devices work out-of-the-box.

Best regards,
Stephen Davies

--000000000000a7372d064c290948
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I ran into a firmware issue with a MediaTek =
MT7927 WiFi 7 device<br>(PCI ID 14c3:6639) on Ubuntu 24.04.4 with kernel 6.=
17.<br><br>Hardware:<br>MediaTek MT7927<br>PCI ID: 14c3:6639<br>Motherboard=
: ASUS ProArt X870E Creator<br><br>The mt7925e driver loads correctly, but =
the required MT6639 firmware<br>is not currently present in linux-firmware.=
<br><br>Without the firmware, dmesg shows:<br><br>Direct firmware load fail=
ed with error -2<br>mediatek/mt7927/WIFI_RAM_CODE_MT6639_2_1.bin<br>mediate=
k/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin<br><br>WiFi works correctly once=
 the following firmware files are installed:<br><br>mediatek/mt7927/WIFI_RA=
M_CODE_MT6639_2_1.bin<br>mediatek/mt7927/WIFI_MT6639_PATCH_MCU_2_1_hdr.bin<=
br><br>Bluetooth also requires:<br><br>mediatek/mt6639/BT_RAM_CODE_MT6639_2=
_1_hdr.bin<br><br>These firmware blobs can be extracted from the official A=
SUS Windows<br>driver package:<br><br>DRV_WiFi_MTK_MT7925_MT7927_TP_W11_64_=
*<br><br>Once placed in /lib/firmware/mediatek/, both WiFi and Bluetooth<br=
>initialize correctly.<br><br>It may be helpful to add these MT6639 firmwar=
e blobs to the<br>linux-firmware repository so MT7927 devices work out-of-t=
he-box.<br><br>Best regards,<br>Stephen Davies</div>

--000000000000a7372d064c290948--
