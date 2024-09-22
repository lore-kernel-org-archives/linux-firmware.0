Return-Path: <SRS0=y8fy=QU=gmail.com=fujita.tomonori@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3979CF9C6C
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 10:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98369C4CEC6; Sun, 22 Sep 2024 10:21:14 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5EF26C4CEC4
	for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 10:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5EF26C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-717934728adso2445106b3a.2
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 03:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727000471; x=1727605271; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uojfxPK2CABOTY9ydRpTFUsuaPr1U2qs/fPXAF9qfM=;
        b=mlyyuOiPzwqLp5auEidwTzslCcxxae+DwPxNme7Tsf7cL3zGmf928ohy/awZZhCOc+
         6hSw5DPvP0atYhdpWBEHzjOaf6RCPN6sFXQR/U2XY7OyKW8g2dAYOflN5zgsO+yAK93X
         RluRMtdOWgqVXkKh+/rmTWwB4QM/Z/GjxxllikjHgc9MWQj+dJoYV+eVq5RQemQnMuJ1
         wJYu1K2slQvHzAA1bdOu+AUClYSixXc9ZwGzCsqs48Y7i6R9KPvc9lKG+3w/OgD7poFa
         rg6VemC+2OpBngvcyrIv8n9dyQCp9VVI3qNCMXohgoPD/D/be6toYcagpQjLlMh511nM
         0lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727000471; x=1727605271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uojfxPK2CABOTY9ydRpTFUsuaPr1U2qs/fPXAF9qfM=;
        b=r2mscKLiyoXrD6DPiSYWxiDbgRd8DbS83nPBllL010LtAuEzy/wSiXZD/8RaNIyT2U
         c/53ouo2tXPl0Q8mfcpGGodA3rn7Y4wXs1BQhmoloSJ/PjOkLKZSr7jINCqPUmVBiFo8
         8oN8POce5blH0UNcYl4W46BHAmuq5V51C2OS9GmLq7f3aoUhMu6fwnngbhPUpxti4WqT
         6s6tClXLzHalCJt/0AbTzBsiIwW/mhWeaorZF4J6Ocof3HaqKpevPBt3uEcF7zDJd94o
         iMGpN2cPtiUF6/8jGV0olc1ZAV6pOboa7qvVPPJXmdtpi+9crrmKHdPWl7G4wIHZy8LD
         +hWQ==
X-Gm-Message-State: AOJu0Yy3l7ppnnEIOHknXEBVMfKHZYuLUfPt4dkVDBLQVC+Hzg4CZbq1
	cmX5owEWXfkX3vsXYhAFS3EYyEIDWKWLflXYlxkPALs0hV3d6L8+GJVmRI3+
X-Google-Smtp-Source: AGHT+IHzJgHavNWATyGabRAr0VWD35d0b/Xp+bWquHRJiPrdsM6TCjZJa5wIHB5ZGgLhBncyDnJHhA==
X-Received: by 2002:a05:6a00:2e1e:b0:718:da06:a4bf with SMTP id d2e1a72fcca58-7199c96e37bmr11017228b3a.2.1727000470644;
        Sun, 22 Sep 2024 03:21:10 -0700 (PDT)
Received: from localhost.localdomain (p4468007-ipxg23001hodogaya.kanagawa.ocn.ne.jp. [153.204.200.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab535csm12280456b3a.58.2024.09.22.03.21.09
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 03:21:10 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
Date: Sun, 22 Sep 2024 10:20:24 +0000
Message-ID: <20240922102024.218191-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware for Applied Micro Circuits Corporation QT2025 10G
Ethernet Phy.

The firmware data was stored as an array in the source code for Tehuti
Networks TN40xx Network cards, distributed under GPL2. Tehuti Networks
went out of business without the driver merged into the mainline.

The driver for QT2025 Phy has been merged into the mainline recently.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 WHENCE            |   8 ++++++++
 qt2025-2.0.3.3.fw | Bin 0 -> 24543 bytes
 2 files changed, 8 insertions(+)
 create mode 100644 qt2025-2.0.3.3.fw

diff --git a/WHENCE b/WHENCE
index 3897121a..6b4f2308 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7534,3 +7534,11 @@ File: intel/ish/ish_lnlm.bin
 Version: 5.8.0.7716
 
 License: Redistributable. See LICENCE.ish for details
+
+--------------------------------------------------------------------------
+
+Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
+File: qt2025-2.0.3.3.fw
+Version: 2.0.3.3
+
+Licence: GPLv2.
diff --git a/qt2025-2.0.3.3.fw b/qt2025-2.0.3.3.fw
new file mode 100644
index 0000000000000000000000000000000000000000..c59d0bcfcc6f68f2f7a9ae931dcd004210dadc6b
GIT binary patch
literal 24543
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%0DsKv^WX(?PJT<T&GjwILsV+}_nbxJR
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

literal 0
HcmV?d00001


base-commit: 6c88d9b8253b8ec6df701a551a56438ea2e5bacf
-- 
2.34.1

