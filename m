Return-Path: <SRS0=sU6d=UX=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCD3C0218F
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Jan 2025 18:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 441F0C4CEDF; Fri, 31 Jan 2025 18:36:49 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 461DEC4CED1
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 18:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 461DEC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so3601641e87.1
        for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 10:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738348606; x=1738953406; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8plRFAHh7mI6kkL3UD0gwGrqijV3KEVlzmBJhXxQQc=;
        b=Qx/E/1ZKIlyZoyKt1tsttY8F7nIFYSYbzwC+LsE+7uwKbOBYgT9vrE4igmFr/xQej1
         YJWZcD6NYjvoKsHZagn7oeGOfH7b+wB4kwiEnIDGwX8yQz2y5v0pNiVZUU3i36SSTEY4
         vcsQSfuYEZfuF7GipJhO0XWmzL9Wj37joY00la27LaafwnVtvg9IZOVWNdfENjHRyYY1
         dM+FRk684fSP4JzKStThoGhHazChrKlAkznwKVN3Bmiy5tck6kNC5VQWZNCPh2snmpFU
         b1KfmcVHahegLl8ggN+Hd4mnpRK7XUmXYiuuAgjhsqCBXZKTTXezfzLiuyt0BDngmZYD
         WAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738348606; x=1738953406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8plRFAHh7mI6kkL3UD0gwGrqijV3KEVlzmBJhXxQQc=;
        b=MdMNhy03CVCxUCjlJmFRlxtBjdGVnsCfxIlWbZvGx+5ZqdWrBBujOsKrWoVxAnyHpP
         jEWHHHbxQcDE5XL00Vk9NWXq5s/AcvZqnhW1fcW+6G8nehHzi5aROrpxHLeL6csJ/p32
         LlHmtDM1INHrZ7A75P0pAcRGIBTYrBxDQ4t+Ighci1UDcKbMkh7miy3hYLfy29faQ6aJ
         WXMG8frg8tlJp1Ix660ZUwrROESQCJTaQiNlpgYawEV4Qmv3RuLAkSMAhTsBU7GcJym+
         QvsnShaCDscMUWBd83wmTvzGNZWV/t/ZMHoEUt+bKNyCP5JeKUpKXbEPd6kjMnU0PonC
         CUDg==
X-Gm-Message-State: AOJu0YzLnNKe8mXQf49/tTWKoVpAzRtHwT41dgKHL1wNaSH26OajGlcD
	MwlReK+2eabVfVvRLzbmnbtUjH1ypX5XTWN0ZNcsmBWp1Nuc492uEXpjoMyO8V4l/1GetoeKXEz
	NfhvBTA==
X-Gm-Gg: ASbGncsxuHtAOeJzoRtAuh/P5YFUgawAoJGOB4B7JKYT+SjdkRti8cFpjo8FRtJM80M
	xzUMVIrmiXCnI0Da3LGqrVl+aUECcT5tXeNuwAEJbFK+CRKT3kr/Dl9HG0RAjp+LX9l2seXGflE
	Hymu58S78ISSVJCYB6b8u2iDQvRFgDGhX6VPhe4qfPOKN8TQ4tcSLlmoKSeeU9LDVXyTKR01ye4
	9g417MH8r+JCPSbnJ0qIHpqk29rPMbrXmNloAUwZm75AW061eo7Z7j89+mSOnmjZvwn+ZkJ/oFa
	cdDVbpSJp22W7fcYpJkNGrcL7dl/dwrXDtWZgGBQvkoV6aGJ/zhJsJs5ci8=
X-Google-Smtp-Source: AGHT+IE5f/pDCGBChoCaqLBlp61ZUNEyMU8aX2tXtks3+gKPAth9hOR17Qabm2Q4hFZXfEo6owwb2w==
X-Received: by 2002:ac2:52b0:0:b0:542:1bdb:9a61 with SMTP id 2adb3069b0e04-543ea3d697bmr2500859e87.19.1738348605996;
        Fri, 31 Jan 2025 10:36:45 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeccesm555864e87.243.2025.01.31.10.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:36:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-msm@vger.kernel.org
Subject: qca: add bluetooth firmware for the WCN3950 BT/WiFi chips
Date: Fri, 31 Jan 2025 20:36:39 +0200
Message-ID: <20250131183643.3321810-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add BT firmware for the WCN3950 chip, found on e.g. Qualcomm Robotics RB1
platform.

----------------------------------------------------------------

The following changes since commit 50ce0eea27cc73566f5c7d0060409d796ef40a16:

  Merge branch 'main' into 'main' (2025-01-31 15:56:49 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware.git cmbt

for you to fetch changes up to 8e74b76b7b63860210cbae5bd55f98e2e94cf627:

  qca: add firmware for WCN3950 chips (2025-01-31 20:13:42 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qca: restore licence information for WCN399x firmware
      qca: move QCA6390 firmware to separate section
      qca: add firmware for WCN3950 chips

 WHENCE           |  31 ++++++++++++++++++++++++++++---
 qca/cmbtfw12.tlv | Bin 0 -> 47307 bytes
 qca/cmbtfw13.tlv | Bin 0 -> 21555 bytes
 qca/cmnv12.bin   | Bin 0 -> 2690 bytes
 qca/cmnv13.bin   | Bin 0 -> 1641 bytes
 5 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 qca/cmbtfw12.tlv
 create mode 100644 qca/cmbtfw13.tlv
 create mode 100644 qca/cmnv12.bin
 create mode 100644 qca/cmnv13.bin
