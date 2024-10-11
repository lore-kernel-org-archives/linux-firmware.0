Return-Path: <SRS0=bm9j=RH=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A25D2447B
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Oct 2024 06:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18E89C4CED1; Fri, 11 Oct 2024 06:16:14 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FDF2C4CECD
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 06:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FDF2C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539d0929f20so856511e87.0
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728627370; x=1729232170; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=;
        b=QrjA7a81Ll7+cNUypF6grPcEcp6/xzUyyeG4kUDEUejR0WzjZjT1u+AcPHQRViR+NO
         4uMbTJ4sNEbnln55FfaF6am+U7/XACLSTwjWKl3UMfln2KpVQXevVci81VPD+WwMdbcH
         mV83i2nDBQnpppjkfQ5Xb0URQ1rcVeLgxy+YGGiLNwqsKg7Pad33ro2PxFUKPMWe3s5f
         JBU3VCWKyohylSJBZDnZFMLW+B19A4wsDG09R/0klcpb6bSQ9wkt7whwE4shkryMf/RX
         ucQz+Ao9PCiHP/+tEki8m/YuhPHzd0hRB0WJedltAl73O3PZnxz9LSYT7zlNFpTS2QAI
         jTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728627370; x=1729232170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zztn8OGm5T9Dev73bEcKrvo8yczZXjOdvebFEeUvOQ=;
        b=PX2BiB0Aevdi2YzLKJT87TWUf245u5EC9S/6BSInoySGse3iYB2GT1K/bLKVnkYiWr
         nnv13Th1CCYGsiM6JxDdrr01h7eyftxtiJ/bhyclFhQQMyiVYvQtBvSMfi7cq0D3+OQc
         3DEzjMg0KTyjU++CZIIGBFAU1zYClVO22jvYj1lrYYVzbMRrYGpuqcv1Pyg4zPUI7zV+
         8fGFFvhG1RC9wCUWRh6p3YxZsYv0Zn8Bq5MHGQqOjQPM2RABtGRzRQ+/b8DY8IKhvXV1
         8tuP3c7d6yHnTcsZa9DsVwa1RkC/shFcil4FFO73fke679y11yQcZjsJ5DRaje0AoeZ4
         3dcg==
X-Forwarded-Encrypted: i=1; AJvYcCXL0+oti3m6aZH/Egy5QIYG07dlL0T23mG/crQcWwQc6K9Mlrs+oGm66BfsLYFhRY8zWkx7DsBrrAl/QPoHjw==@kernel.org
X-Gm-Message-State: AOJu0YwXZ+pel5D5zc0S2nw8JfghZe10kHtw50xNS2OFAAG7jFO6bUeN
	7QmqJcQK7eJfvV/NHDjCDo7SLVgC1Zqv+8tS+po42dIn8jXE7fRPmO3rnWo7UvQ=
X-Google-Smtp-Source: AGHT+IGc7gwTinuZHuGbc8LwJ5A7daFk3nc9VI9bk/hUTAkqi5rsZF98BxeF52XkN+XPoNa2N5quuA==
X-Received: by 2002:a05:6512:3a96:b0:536:7ba7:496d with SMTP id 2adb3069b0e04-539d6e555efmr477576e87.11.1728627369655;
        Thu, 10 Oct 2024 23:16:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8613sm496309e87.74.2024.10.10.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 23:16:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-firmware@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific subdir
Date: Fri, 11 Oct 2024 09:16:06 +0300
Message-Id: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware under ath11k/WCN6750 can not be utilized on other devices using
WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
attempt to propose a solution by moving the file into device-specifig subdir.
Other platforms can place firmware files in other subdirs, depending on the
SoC.

Note, while performing the move I also propose squashing the firmware file.
This is the practice recommended by the msm platform maintainers for the DSP
firmware (not to mention that it also saves us from the extra symlinks). If
Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.

For now this is an RFC in order to gather opinion form respective platform and
driver maintainers.

----------------------------------------------------------------

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware wcn6750-device-specific

for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:

  ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ath11k: move WCN6750 firmware to the device-specific subdir

 WHENCE                                             |  12 ++----------
 ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
 ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b08                      |   0
 ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
 11 files changed, 2 insertions(+), 10 deletions(-)
 rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
