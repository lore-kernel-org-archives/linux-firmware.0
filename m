Return-Path: <SRS0=5gqD=UY=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DDDC0218A
	for <linux-firmware@archiver.kernel.org>; Sat,  1 Feb 2025 16:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02195C4CED3; Sat,  1 Feb 2025 16:21:01 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88444C4CEE0
	for <linux-firmware@kernel.org>; Sat,  1 Feb 2025 16:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88444C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so3306139e87.3
        for <linux-firmware@kernel.org>; Sat, 01 Feb 2025 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426857; x=1739031657; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=;
        b=LCA3OUdxYYBbs2+v6Cc1fNwu1rXQaCMyBs7BZOhNUnHpcI/Dy8/NXhd9Y3Rg9fqSSE
         VRb5hwbZprNFP0BF92uBwYFgbAK98ThWGskV2FAI2JEmQARuBrIUok6JY73PqHqSc60f
         IJE0sWsKa0pvdMbiRiBulSCD3rrOZt3UrcDhRbGUzFUBRdGAGpROjSgeMYr5d2Jqrv6v
         q+Q2YzT+LnDJMJ8ZflxupRAEmfxqu3DcqNdZyP5PXRjmz2huDH3E42L9UQJ7KZQjtlvw
         OYKbnxnwNp0MTQ9ldcclOxu2xukIkESNU1cdkVF3EBXq0Rr56EBjS6e9/YvJ2cGQY0aW
         Xzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426857; x=1739031657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVrpqivVclrkNJ3DXwl8qw6V7kQmEH15SzRImukJaRc=;
        b=urVqS6v2Suo/JUMpplN0gD36B0gfvRsAWQod3FvzN9mVPJSF+OdCtFnRzWtQ5fy/LI
         3edfzcvToGeBfjvKF8ASdbXfZ9DV0NjSkkPhMSAO2DV/biFbJ7T/aG1JXofpw05aeXqe
         zWY7iosSkGH6qUs2XVR83eEvhZVsxr5x1iSmfCF8vrTQU8heTivPBdlItYypcwJOhLeU
         DVVlKNedG4+p8fQJvNSzw8hG+l98O0k1PIJVr1l4crUa1OcKjqbaezxZgynVEPoy2Xtt
         JVdzbvKsooL2PE8lG3r27dmeqUz3tO03YSLHrFN1Q89lJlrdeWNrmV99/6WKNKUczumR
         gjGg==
X-Gm-Message-State: AOJu0YwpYZ3Lsu0WvV7IwQMLjXIwKkH2sOxEgX7W8DlfK071E4Y4EouG
	msDY72MooF7IBBnatcpem8XKzlExeABr8Ft5rt+2jkqwuYh0iHfGggmuQLOcBdxBlOTjBh30uaW
	wse4UkRU3
X-Gm-Gg: ASbGncsUhV+uy8FZIH+RBHdb07Su16xN4p+wO+slj/iQZ6R9J+i2Hi8ud+C+9TyC6kt
	eRiRUqH1vqegJcVZDXIAj5h++aKTb5ecajHJJc+wvflmVhDmy6/WerEVuCcMskbZqb5t8/PLc48
	zgvuTgc+WHC+boyjuXXokouxqAmUyCEd79v3hKgkUNS1yBb/uHwzfghUm9dqZ64jhoGIsL2Vbaz
	cYvVzYYmlwUVifI7urnhhBcxTqbF4ZApLqC5xFg0ii8MLjGQyof7yVyIDLqz6r1819iDh/xpoCe
	+PCqDK+yNG8qjbrY38cMct/ESVF69d8=
X-Google-Smtp-Source: AGHT+IGzLjvNy5md5KJMNowDOz5fBZmGTDNe2Ls3qAbLpqBRkp4azUKYm8Ap4tW15m6c0DiiSs6j3g==
X-Received: by 2002:ac2:4d05:0:b0:540:1e17:10eb with SMTP id 2adb3069b0e04-543e4c3a0d9mr4750727e87.48.1738426855892;
        Sat, 01 Feb 2025 08:20:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf0fb8sm775308e87.7.2025.02.01.08.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:20:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: ath11k: add device-specific firmware for QCM6490 boards
Date: Sat,  1 Feb 2025 18:20:52 +0200
Message-Id: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
NAK this.

Compatibility links are added to follow the names in the existing DTs for the
QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
those is fine, I can drop those link.

The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:

  Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware rb3gen2-wpss

for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:

  ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      ath11k: add device-specific firmware for QCM6490 boards

 WHENCE                                |   7 +++++++
 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
 2 files changed, 7 insertions(+)
 create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
