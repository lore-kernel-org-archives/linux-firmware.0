Return-Path: <SRS0=8Zmg=AK=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA4C6FD18
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Apr 2023 10:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 499B4C4339E; Wed, 19 Apr 2023 10:21:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EB5BC433D2;
	Wed, 19 Apr 2023 10:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EB5BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f177cb2c6cso10873705e9.2;
        Wed, 19 Apr 2023 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681899661; x=1684491661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAOl/Dx61U+T8YK2g8wnWfHnZItlSI78O33XkrArYKE=;
        b=q8rRpxR772VI44urmR3dPttM8fvYN8e9fV344SfBvV5elmQaygDV9gW/+kfIkJkQCv
         X1HdLnKb+VO7J+KiP0XoFwyBLXmWDqefssNSEGSh6IxQH+wOzlw+dAivHZwiAkaRV80Q
         PTcuoQF7xHrovm0Gzkhi9ybZG8BgrCon9dF95sEdvhYKayYqbApTsU6wr3Uwj2dyhuws
         LjwTjnQWEGwMQJn8dVegsl9hzd5Tgz4Qt4ridJeI4OSMX5bdNIc+ODVfusNorWd1e8vJ
         gqvk0icHkSfot8GLL+95Zc+R99exPGHJFE/kjdmx5/SivSM4nm+S0nwZK9jgwBFRfg6s
         HQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899661; x=1684491661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAOl/Dx61U+T8YK2g8wnWfHnZItlSI78O33XkrArYKE=;
        b=YiwMA4isZhcpLTgFgAfuOXmc5fSo51waJJ+NjbBG1ka8wBNDwExrYrJ9wy6KDIEE14
         JFAwUy79Es8G7nUZGcKp7+NoXPaf6xhrcOfZlTDndyfVmggrwQiBRy3EExNG5SYQ2xtt
         GWRbp91UDsGLbT6eMNsBYOY+arf9EfYmbLZHvywLtK8heYX3FNRSOw3RX01Dsfne1cYD
         MXdIwW/YDnnu1sTtIIMFmCR1rVBuGaeEDU5SQCLzqxGyedeoWAsd5cgmy6sm1PVaZI61
         gquH5j52ZLJj7StY4PYU6F98T61J13sqGK4uLdg/9XHCn9WYkQ+9CbkZ5MS7cqRDz+cd
         v9ug==
X-Gm-Message-State: AAQBX9ex0A3BrWrjA+vuWpNc5ekj1kfeFUkGSkVH2loHtpadTjF6lET5
	zMQhmsntJGzYxlKxPG0UDLQZPJLjStk=
X-Google-Smtp-Source: AKy350YbJqn/vAjSEZq1RYPZeh6o1M4XJLzVgZ/UOM040dYtB/dvSYRdWYcaUyhkc0/ntAEuMXQN4g==
X-Received: by 2002:a5d:44cb:0:b0:2ce:fd37:938c with SMTP id z11-20020a5d44cb000000b002cefd37938cmr4595763wrr.50.1681899661326;
        Wed, 19 Apr 2023 03:21:01 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id q13-20020adfcd8d000000b002e51195a3e2sm15400512wrj.79.2023.04.19.03.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 03:21:00 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] Group all Conexant V4L devices together
Date: Wed, 19 Apr 2023 11:20:57 +0100
Message-Id: <20230419102057.1242812-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All the Conexant V4L devices are from the same vendor
and covered under the same license so they can be
bundled together into a single group.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE | 44 ++++----------------------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

diff --git a/WHENCE b/WHENCE
index 033cbc9..fa75f75 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1104,22 +1104,6 @@ Licence: Redistributable. See LICENSE.ipu3_firmware for details
 
 --------------------------------------------------------------------------
 
-Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
-
-File: v4l-cx231xx-avcore-01.fw
-
-Licence: Redistributable.
-
-  Conexant grants permission to use and redistribute these firmware
-  files for use with Conexant devices, but not as a part of the Linux
-  kernel or in any other form which would require these files themselves
-  to be covered by the terms of the GNU General Public License.
-  These firmware files are distributed in the hope that they will be
-  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
-  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-
---------------------------------------------------------------------------
-
 Driver: tehuti - Tehuti Networks 10G Ethernet
 
 File: tehuti/bdx.bin
@@ -1274,40 +1258,20 @@ Found in hex form in kernel source.
 
 --------------------------------------------------------------------------
 
+Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
+
+File: v4l-cx231xx-avcore-01.fw
+
 Driver: cx23418 - Conexant PCI Broadcast A/V with MPEG encoder
 
 File: v4l-cx23418-apu.fw
 File: v4l-cx23418-cpu.fw
 File: v4l-cx23418-dig.fw
 
-Licence: Redistributable.
-
-  Conexant grants permission to use and redistribute these firmware
-  files for use with Conexant devices, but not as a part of the Linux
-  kernel or in any other form which would require these files themselves
-  to be covered by the terms of the GNU General Public License.
-  These firmware files are distributed in the hope that they will be
-  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
-  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-
---------------------------------------------------------------------------
-
 Driver: cx23885 - Conexant PCI Express Broadcast A/V decoder
 
 File: v4l-cx23885-avcore-01.fw
 
-Licence: Redistributable.
-
-  Conexant grants permission to use and redistribute these firmware
-  files for use with Conexant devices, but not as a part of the Linux
-  kernel or in any other form which would require these files themselves
-  to be covered by the terms of the GNU General Public License.
-  These firmware files are distributed in the hope that they will be
-  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
-  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-
---------------------------------------------------------------------------
-
 Driver: cx23840 - Conexant sideport Broadcast A/V decoder
 
 File: v4l-cx25840.fw
-- 
2.40.0

