Return-Path: <SRS0=E75q=AJ=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3031C77B75
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Apr 2023 11:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7902FC433EF; Tue, 18 Apr 2023 11:13:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CEC4C433D2;
	Tue, 18 Apr 2023 11:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7CEC4C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id iw7-20020a05600c54c700b003f16fce55b5so3768374wmb.0;
        Tue, 18 Apr 2023 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681816377; x=1684408377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnPq/aR8KXRGxCNObmTUTzfbgwc4Jwr1tMZWmoD29r4=;
        b=WSGUIdBbsh17HfpIdr1SQnUD9q0Yo3xlkrhYSY88wwFbG4VnSSxCTNgL+0LFxS/0+X
         hUtMcYoVpv8DNo0VW8DVoOi7YqZM+sr3KuVq3ipOeb0mpRFDphVNEz6qxxVb00wsyWKk
         XA963ZNrQtwarjMd2Bq8m+X2gHqLc1ydIE39pJWj8ukPX9UaUk6C39FfddsJSkPdLYNg
         FCvPf/gmuPxKpsxUb9ZyIga+aTgGqKuzWjyrfBKJSNsd8XgXU5PuHNynqsbg7nCPFBHY
         OgarNk5xDvSMIHhrD9tvMZKVbFfUWJNr/++Po3JC3mttRnnOhRBr5BDt8dlHmfd8US3Z
         J0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681816377; x=1684408377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnPq/aR8KXRGxCNObmTUTzfbgwc4Jwr1tMZWmoD29r4=;
        b=JkJ/l67J0KesuAOlXuLKQ+08umOaTMZjvTvodxr7DHZygKJA+G3ii1HkYDWESH6fyi
         ltaRoTBQ+4xWErOYq758e+130M0wGHrNhBZ4j+EL+UnKnB4Izuy6dZ481euG1BUZhMxc
         eWTP8ZrK3UUgFHb2sq+DViI9ix/P36+ZV57TntHuV3y9jL2nKMdf7OFOk3S9cKBlpXYT
         vSOdJhnMvnWHhtYON9uwYejV6vcO/Ufr/paItemBERyeLs6ch5N1WEEIVTMvXU3ud1Vf
         Qhek5OfMzpfBa+SIP6Je8A4Zi/ZHniXoiaZ7hYEgkDLHwGRLYLu6VU8jinUgxhR28nVh
         wKGg==
X-Gm-Message-State: AAQBX9e1g8j4utJ/Mxadl7rQ6refWtRg7yLFqcT6Hrio2b0uRi9JX8Qa
	gO6ikHbRsdb5K6bGEndalckJw4aK8Ds=
X-Google-Smtp-Source: AKy350b9GgTtIuKIF1Q34CGWYxynyG+1Nl+fryr4SY2m7SGvdrGnbZRHXDITFqB7nPPDcGjlpzvJEA==
X-Received: by 2002:a7b:c4cd:0:b0:3f0:9a9d:4a0d with SMTP id g13-20020a7bc4cd000000b003f09a9d4a0dmr14105025wmk.21.1681816377306;
        Tue, 18 Apr 2023 04:12:57 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id o8-20020a05600c378800b003ed2433aa4asm14569673wmr.41.2023.04.18.04.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:12:56 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] mt76xx: Move the old Mediatek WiFi firmware to mediatek
Date: Tue, 18 Apr 2023 12:12:52 +0100
Message-Id: <20230418111252.936859-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a few original Mediatek firmware still in the
firmware root so move them to where the rest of the
Mediatek WiFi firmware reside and link them back to the
old location so there's a transition.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

I'm pretty sure I have the link direction correct but it wouldn't be the
first time I've screwed it up so verification would be useful :)

 WHENCE                                              |  12 ++++++++----
 mt7601u.bin => mediatek/mt7601u.bin                 | Bin
 mt7650.bin => mediatek/mt7650.bin                   | Bin
 mt7662.bin => mediatek/mt7662.bin                   | Bin
 .../mt7662_rom_patch.bin                            | Bin
 5 files changed, 8 insertions(+), 4 deletions(-)
 rename mt7601u.bin => mediatek/mt7601u.bin (100%)
 rename mt7650.bin => mediatek/mt7650.bin (100%)
 rename mt7662.bin => mediatek/mt7662.bin (100%)
 rename mt7662_rom_patch.bin => mediatek/mt7662_rom_patch.bin (100%)

diff --git a/WHENCE b/WHENCE
index 7cc9afd..0f60f10 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1454,8 +1454,9 @@ Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
 
 Driver: mt7601u - MediaTek MT7601U Wireless MACs
 
-File: mt7601u.bin
+File: mediatek/mt7601u.bin
 Version: 34
+Link: mt7601u.bin -> mediatek/mt7601u.bin
 
 Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
 
@@ -3843,7 +3844,8 @@ File rtl_bt/rtl8761bu_config.bin
 
 Driver: btmtk_usb - Bluetooth USB driver
 
-File: mt7650.bin
+File: mediatek/mt7650.bin
+Link: mt7650.bin -> mediatek/mt7650.bin
 
 Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
 
@@ -5248,11 +5250,13 @@ Licence: Redistributable. See LICENCE.mediatek for details.
 
 Driver: mt76x2e - MediaTek MT76x2 Wireless MACs
 
-File: mt7662.bin
+File: mediatek/mt7662.bin
 Version: 1.9
+Link: mt7662.bin -> mediatek/mt7662.bin
 
-File: mt7662_rom_patch.bin
+File: mediatek/mt7662_rom_patch.bin
 Version: 0.0.2_P69
+Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_patch.bin
 
 Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
 
diff --git a/mt7601u.bin b/mediatek/mt7601u.bin
similarity index 100%
rename from mt7601u.bin
rename to mediatek/mt7601u.bin
diff --git a/mt7650.bin b/mediatek/mt7650.bin
similarity index 100%
rename from mt7650.bin
rename to mediatek/mt7650.bin
diff --git a/mt7662.bin b/mediatek/mt7662.bin
similarity index 100%
rename from mt7662.bin
rename to mediatek/mt7662.bin
diff --git a/mt7662_rom_patch.bin b/mediatek/mt7662_rom_patch.bin
similarity index 100%
rename from mt7662_rom_patch.bin
rename to mediatek/mt7662_rom_patch.bin
-- 
2.40.0

