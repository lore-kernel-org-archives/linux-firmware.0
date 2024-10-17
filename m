Return-Path: <SRS0=IxDW=RN=gmail.com=zenmchen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425D7D374A8
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Oct 2024 15:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04316C4CEC7; Thu, 17 Oct 2024 15:20:50 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E2C2C4CEC3
	for <linux-firmware@kernel.org>; Thu, 17 Oct 2024 15:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E2C2C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so846061a12.2
        for <linux-firmware@kernel.org>; Thu, 17 Oct 2024 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729178448; x=1729783248; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cIB9OSf3uU/Zoyv5JOLucA0RZXRQSDDvqQX1qLlh9w=;
        b=aBkH//7lLm7RBWN327m9kNpZOis65AZrF7DmfXuDOTcx4VUhqlyQ/mhr+rky71i57A
         fUxDuOhz3qP0VNdKgJvKsshQlUZFX7d8iM8vlhPur3Gd0TJQ9aezmteHi7PeSRMGyeow
         z00MRwSnC/mEgmPfr6hLbIA2Kz2n+J8M+SzHuKFMpsNYOWT/4/Oe3Nv2GklxbMR5CVMQ
         pIZNsflB2SF7iGY0VF4xlquzpzGhsQcBLGKi5h+keXiwLW8J9rD3mvsbZ69yVvqPGk6S
         z7A0QEQUUO+n/6FpT4o9j/8YNe1Js+Bdjt0lXrptyXUXXsjlvg9jK8dQXp4H8uCfiNSR
         XgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729178448; x=1729783248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cIB9OSf3uU/Zoyv5JOLucA0RZXRQSDDvqQX1qLlh9w=;
        b=HC3Kr5SFzT35xWJapVLtVcV05XlJ9Z8f/glT1KiFAp7tYLgcZD6dC1DiBqj55cyKOO
         yK3zkRFo0oaKZ7qfVUIoPiIsopevSW2jMxx5HMgKCq6TynCpSr3zSNzn+F4EiHvkjGkS
         Xm/F6gScbidprQ8gzuTkxUqPWsEMfm65/sFAVNFw1w9IPQNcyLnNvaBIV17vMv7plHzW
         /NwLIwfeGplXzbIlmtcjTMqQ4Hj3q03UvqeW5imxesqZ2wfBY20qWm7jmuoIW/vbrGN/
         hGHf1CzSm+ANtKpknYgdWjPmlTrc9rihMkHDD3YMBbkNNDLj5nC+Osj9O9IepLUR/EoQ
         6I4A==
X-Gm-Message-State: AOJu0Yzg9LuhG418S+ioyjtm1JNz34rVFfITj+748y3wF9Ptl1cl+GTI
	IkQAekkyepkamlkGTkD3b0TuNA8GJDBYOZP6cuZk5GLT2rG+TiOjYzZc/GH/SJw=
X-Google-Smtp-Source: AGHT+IEPPgHjuuQZWKgZDii8aAlvqol8xvBwCwNFnr9dhtOFvAeoX8eU2Irn39wDFoFO0zSViiVG8Q==
X-Received: by 2002:a17:902:ccd1:b0:20b:70b4:69d8 with SMTP id d9443c01a7336-20ca16bd6cdmr262757365ad.37.1729178448028;
        Thu, 17 Oct 2024 08:20:48 -0700 (PDT)
Received: from BM5220.hitronhub.home ([2407:4d00:9c00:839f::7acc])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d180367d9sm45469665ad.149.2024.10.17.08.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 08:20:47 -0700 (PDT)
From: Zenm Chen <zenmchen@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org,
	rtl8821cerfe2@gmail.com,
	pkshih@realtek.com,
	Zenm Chen <zenmchen@gmail.com>
Subject: [PATCH 0/2] Remove unused firmware images
Date: Thu, 17 Oct 2024 23:20:41 +0800
Message-ID: <20241017152043.10205-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused firmware images in rtl_bt/ and rtlwifi/

Zenm Chen (2):
  rtl_bt: Remove unused firmware images
  rtlwifi: Remove unused firmware images

 WHENCE                          |  30 ------------------------------
 rtl_bt/rtl8192ee_fw.bin         | Bin 38764 -> 0 bytes
 rtl_bt/rtl8192eu_fw.bin         | Bin 37904 -> 0 bytes
 rtl_bt/rtl8812ae_fw.bin         | Bin 40520 -> 0 bytes
 rtlwifi/rtl8192eu_ap_wowlan.bin | Bin 25264 -> 0 bytes
 rtlwifi/rtl8192eu_wowlan.bin    | Bin 29008 -> 0 bytes
 rtlwifi/rtl8723bs_bt.bin        | Bin 9120 -> 0 bytes
 rtlwifi/rtl8723bu_ap_wowlan.bin | Bin 20886 -> 0 bytes
 rtlwifi/rtl8723bu_wowlan.bin    | Bin 26398 -> 0 bytes
 rtlwifi/rtl8723defw.bin         | Bin 27726 -> 0 bytes
 rtlwifi/rtl8822befw.bin         | Bin 127496 -> 0 bytes
 11 files changed, 30 deletions(-)
 delete mode 100644 rtl_bt/rtl8192ee_fw.bin
 delete mode 100644 rtl_bt/rtl8192eu_fw.bin
 delete mode 100644 rtl_bt/rtl8812ae_fw.bin
 delete mode 100644 rtlwifi/rtl8192eu_ap_wowlan.bin
 delete mode 100644 rtlwifi/rtl8192eu_wowlan.bin
 delete mode 100644 rtlwifi/rtl8723bs_bt.bin
 delete mode 100644 rtlwifi/rtl8723bu_ap_wowlan.bin
 delete mode 100644 rtlwifi/rtl8723bu_wowlan.bin
 delete mode 100644 rtlwifi/rtl8723defw.bin
 delete mode 100644 rtlwifi/rtl8822befw.bin

-- 
2.46.2

