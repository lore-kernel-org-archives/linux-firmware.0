Return-Path: <SRS0=2fXX=JK=gmail.com=hkallweit1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51790C4828F
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Feb 2024 14:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EDD0C433C7; Thu,  1 Feb 2024 14:24:09 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 588F2C433F1
	for <linux-firmware@kernel.org>; Thu,  1 Feb 2024 14:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 588F2C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a354fc17f24so125726466b.0
        for <linux-firmware@kernel.org>; Thu, 01 Feb 2024 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706797445; x=1707402245; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TATRm3dnccuy5N2bOU1e+Z32IBDig3yIgJBRI6zopGk=;
        b=jKr9JFF+BoHz3w88ysUj/DVyhxO3TbOBDwKq67pLjf/5XBUyzGzDG2ZfLjnczmithE
         BhkluftNEDUIb1ZGf6OJ8/7PhdpDLpDlSln/cJgO/tUCBlEhWRkswh2ETCUQApbxgKnA
         ygjT3HjcchfjHfxE1JgKK8BLef0LciDDAnIrA6MzuzBHNBVRO3b7bOQuBMiL396G3iTB
         n3TZP6rAHCB+37ps9aIJzHjD2aqI/9iqdC6uGcnsgLm7YFhkpmDIbXoIZv6BrVC6ypG6
         QFT0b+gPFb8yhZIpHdKRsI9jwKihAu7NVbGuTbr9B3U/80abjT5zDgVD+W1wWFgItQGK
         6y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797445; x=1707402245;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TATRm3dnccuy5N2bOU1e+Z32IBDig3yIgJBRI6zopGk=;
        b=fkGtcxJ/+zrQrCuQb2wkxjxsKXzjWyZosrvEUWJCQjV/zm/4Zkh2k7L3MGPqNh9FTZ
         hEWeoUflx76VF+x6UkuPLn4pCWQ+TZBbn38o+TiDbjVbpbiypFqS3qcnOJVi58RwTwGe
         /18D9ilSz3Qo5gSjM0TyO7WSt+JgIBxPtn4jdRkhZuXIguVk/VM+2YC22HkUbXgcOd7H
         JRYJuLCM6MqZhh+OUOgCRaOq8Djkjw/MZDlvBHjQ4XRC53h+09zWVsbdp3g+xOTtEEcq
         Fygi0e5lqWH07qXUINVAdCUQLv7Zl6g613MEMnFPNQgPDxNiUrEBX7/QKW7RgW1n/y0Q
         jCUg==
X-Gm-Message-State: AOJu0YxzFRsijeLXzgZtaMbvgZ0wbo+e4uEIjWbYaAJVR9VRiRhFNVWz
	M8fCmVxVQ1zFwmZiXTKCY+jPLBn6By7RY02FHVe/4hHcrJN2r0/kTwtiW0In
X-Google-Smtp-Source: AGHT+IFuugE//xMWO/FWaMuEUvaM27EESMwGRRqSGFV2UodQqmcaYgzx9PC7VRnq6rKa3uK8LEyIxQ==
X-Received: by 2002:a17:906:3515:b0:a36:2dc:1903 with SMTP id r21-20020a170906351500b00a3602dc1903mr1945208eja.68.1706797445030;
        Thu, 01 Feb 2024 06:24:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWQie0XUn5YuuQjTc5y/pH7dLjBv6qV6kEuXB2kOX8BcKMq1XZA9aQOL80jByuIlkdAJFd6HdWdxLbFHH+ihvKnntn/9XggOw+jJcp7/FhKYvYrbV3iChYLUg3HQw2/Ag==
Received: from ?IPV6:2a01:c23:bcb7:3100:3940:b422:9f20:414f? (dynamic-2a01-0c23-bcb7-3100-3940-b422-9f20-414f.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:3940:b422:9f20:414f])
        by smtp.googlemail.com with ESMTPSA id x5-20020a1709064bc500b00a35f1000146sm3610832ejv.49.2024.02.01.06.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 06:24:04 -0800 (PST)
Message-ID: <62adc40d-fd8e-4a5e-9671-8a42260fc81c@gmail.com>
Date: Thu, 1 Feb 2024 15:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Chun-Hao Lin <hau@realtek.com>, Linux Firmware
 <linux-firmware@kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] rtl_nic: add firmware for RTL8126A
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Realtek provided a firmware file for new chip version RTL8126A.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 WHENCE                |   3 +++
 rtl_nic/rtl8126a-2.fw | Bin 0 -> 29248 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8126a-2.fw

diff --git a/WHENCE b/WHENCE
index 99632bb..211202c 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3356,6 +3356,9 @@ Version: 0.0.2
 File: rtl_nic/rtl8125b-2.fw
 Version: 0.0.2
 
+File: rtl_nic/rtl8126a-2.fw
+Version: 0.0.2
+
 Licence:
  * Copyright © 2011-2013, Realtek Semiconductor Corporation
  *
diff --git a/rtl_nic/rtl8126a-2.fw b/rtl_nic/rtl8126a-2.fw
new file mode 100644
index 0000000000000000000000000000000000000000..116cda08c1d4c323e2cf02a037d4070858e4a426
GIT binary patch
literal 29248
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

literal 0
HcmV?d00001

-- 
2.43.0

