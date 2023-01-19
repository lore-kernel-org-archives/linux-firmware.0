Return-Path: <SRS0=xDj6=5Q=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434F3C004D4
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Jan 2023 20:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1F88C433D2; Thu, 19 Jan 2023 20:43:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49E50C433EF;
	Thu, 19 Jan 2023 20:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49E50C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id k16so2485537wms.2;
        Thu, 19 Jan 2023 12:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lguEp6MjdVZpJXsIxeKJN8nNE8gfWUoV4GtahPlQsbU=;
        b=qVghgS6I7QsRBgrHdQEniLJXWxuu4Jb5TnxzEHVJTlR1resnfgzHaEaQK6WxkZVl1A
         GXWOhw3WK81IQYhswZd8sqLzNP/ajz2kX+RwHYdgDIn5jCkbl2/IPwvxRY751Gp4i70L
         rFT/NfmDL/8CQeAO+xNKzAj2YrGsdSfsWFJfYV5M2zQpEtxFvfGlRE6OJ4MIEL/X4xSK
         T7Qq3OkFNAWKPMjsvceYNJu068vUZxmXJJlZcqKtcnhWFfty3S+xitewZSNvFrcyZoTt
         j5x1SUWCn/jqzHDFj+qHamyO0i8tOiJyUpkda0oV4gZo45v06JxBxqKiMgfS1fAno6W8
         CrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lguEp6MjdVZpJXsIxeKJN8nNE8gfWUoV4GtahPlQsbU=;
        b=EmylmwQfv/3HNFkUBfoM83hqOkh2wx8t2SYIaiYyfqsFk09vKMXYZePA5eRRqbxZ3b
         0J/l3WtQ0oQoSLgR5K5Sp3Oh/0/V6v6KyjA8Kuz3y3fZbDIKHMfO61SNlmrWeLa2Lxgt
         jHkdqe7PUNLte021ezwPdp13SP92J0DpA5W0SPam/tHprpKFRcrMhxM7vjhBWyKWWQWP
         JJAdWaCn/aMXT+IITxOSYmIrZeW52GRO30axS2xdV0lspfM+VP5+NnERdxV134KZLP/y
         zwzlcMtRn9j8e/z4WUh1g8zb1S/xP9JCIPoohLAC9R0Ok1F+NrihW0eT+9QR5/iTZ0gR
         KgUw==
X-Gm-Message-State: AFqh2krnRZxsjuGD0R7dQmNiRc9UfTI6BJCzeNGPxfVLtSKvi3gj/dgH
	4BA3pXwKFDatA2sYioJ/rg3yIbwZvn4=
X-Google-Smtp-Source: AMrXdXuiBJo5XQV4X121tU5Vimo/rLBbZGCsws/SaPDWDIkk0+HN/oryChdLXVbUdsf/+pAF1QLfQA==
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id n13-20020a05600c4f8d00b003d33d1b6354mr7857420wmq.3.1674160986360;
        Thu, 19 Jan 2023 12:43:06 -0800 (PST)
Received: from morpheus.home.roving-it.com.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id m37-20020a05600c3b2500b003daf681d05dsm216531wms.26.2023.01.19.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:43:05 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [PATCH 0/5] Remove obsolete iwlwifi firmwares
Date: Thu, 19 Jan 2023 20:42:54 +0000
Message-Id: <20230119204259.507365-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the EOL of the 4.9 LTS kernel I thought it time to review the
amount and support levels of the iwlwifi firmware as they are now
getting large and most are unused. Going through each of the remaining
LTS kernels I looked at the latest supported rev and removed the
intervening ones that would generally never get laoded.

The firmware reversions have never been raised in any of the LTS
cycles and interestingly the max rev hasn't been bumped since
5.18 yet there have been a number of newer revs sent here since
then.

With this there's supported revs of firmware available for all
upstream cards for all supported LTS kernels. For those using
old non LTS kernels they are unlikely to be bumping firmware and
the old tagged releases and git is always available.

Cc: Gregory Greenman <gregory.greenman@intel.com>

Peter Robinson (5):
  iwlwifi: remove old unsupported older than 4.14 LTS
  iwlwifi: remove 4.19 and 5.4 intermediate old firmwares
  iwlwifi: remove 5.4 and 5.10 intermediate old firmwares
  iwlwifi: remove 5.10 and 5.15 intermediate old firmwares
  iwlwifi: remove old intermediate 5.15+ firmwares

 WHENCE                            | 276 ------------------------------
 iwlwifi-1000-3.ucode              | Bin 335056 -> 0 bytes
 iwlwifi-3168-22.ucode             | Bin 1028092 -> 0 bytes
 iwlwifi-3168-27.ucode             | Bin 1032436 -> 0 bytes
 iwlwifi-5000-1.ucode              | Bin 345008 -> 0 bytes
 iwlwifi-5000-2.ucode              | Bin 353240 -> 0 bytes
 iwlwifi-6000g2a-5.ucode           | Bin 444128 -> 0 bytes
 iwlwifi-6000g2b-5.ucode           | Bin 460236 -> 0 bytes
 iwlwifi-6050-4.ucode              | Bin 463692 -> 0 bytes
 iwlwifi-7265D-22.ucode            | Bin 1028376 -> 0 bytes
 iwlwifi-7265D-27.ucode            | Bin 1032740 -> 0 bytes
 iwlwifi-8000C-22.ucode            | Bin 2120860 -> 0 bytes
 iwlwifi-8000C-27.ucode            | Bin 2227284 -> 0 bytes
 iwlwifi-8000C-31.ucode            | Bin 2310116 -> 0 bytes
 iwlwifi-8265-22.ucode             | Bin 1811984 -> 0 bytes
 iwlwifi-8265-27.ucode             | Bin 2234528 -> 0 bytes
 iwlwifi-8265-31.ucode             | Bin 2307104 -> 0 bytes
 iwlwifi-9000-pu-b0-jf-b0-33.ucode | Bin 2632620 -> 0 bytes
 iwlwifi-9000-pu-b0-jf-b0-41.ucode | Bin 2620464 -> 0 bytes
 iwlwifi-9000-pu-b0-jf-b0-43.ucode | Bin 2543536 -> 0 bytes
 iwlwifi-9260-th-b0-jf-b0-33.ucode | Bin 2637216 -> 0 bytes
 iwlwifi-9260-th-b0-jf-b0-41.ucode | Bin 2620656 -> 0 bytes
 iwlwifi-9260-th-b0-jf-b0-43.ucode | Bin 2558176 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-48.ucode      | Bin 1106228 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-53.ucode      | Bin 1209628 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-55.ucode      | Bin 1223144 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-62.ucode      | Bin 1329296 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-63.ucode      | Bin 1334856 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-68.ucode      | Bin 1355836 -> 0 bytes
 iwlwifi-Qu-b0-hr-b0-71.ucode      | Bin 1364312 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-48.ucode      | Bin 1052796 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-53.ucode      | Bin 1147104 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-55.ucode      | Bin 1163672 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-62.ucode      | Bin 1248672 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-63.ucode      | Bin 1252748 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-68.ucode      | Bin 1275268 -> 0 bytes
 iwlwifi-Qu-b0-jf-b0-71.ucode      | Bin 1285192 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-48.ucode      | Bin 1106248 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-53.ucode      | Bin 1209644 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-55.ucode      | Bin 1223160 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-62.ucode      | Bin 1329312 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-63.ucode      | Bin 1334872 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-68.ucode      | Bin 1355852 -> 0 bytes
 iwlwifi-Qu-c0-hr-b0-71.ucode      | Bin 1364328 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-48.ucode      | Bin 1052816 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-53.ucode      | Bin 1147120 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-55.ucode      | Bin 1163688 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-62.ucode      | Bin 1248688 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-63.ucode      | Bin 1252764 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-68.ucode      | Bin 1275284 -> 0 bytes
 iwlwifi-Qu-c0-jf-b0-71.ucode      | Bin 1285208 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-48.ucode     | Bin 1105668 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-53.ucode     | Bin 1209628 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-55.ucode     | Bin 1223140 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-62.ucode     | Bin 1328924 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-63.ucode     | Bin 1334804 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-67.ucode     | Bin 1347524 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-68.ucode     | Bin 1355800 -> 0 bytes
 iwlwifi-QuZ-a0-hr-b0-71.ucode     | Bin 1364308 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-48.ucode     | Bin 1052608 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-53.ucode     | Bin 1147104 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-55.ucode     | Bin 1163668 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-62.ucode     | Bin 1248672 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-63.ucode     | Bin 1252744 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-68.ucode     | Bin 1275264 -> 0 bytes
 iwlwifi-QuZ-a0-jf-b0-71.ucode     | Bin 1285188 -> 0 bytes
 iwlwifi-cc-a0-46.ucode            | Bin 1044452 -> 0 bytes
 iwlwifi-cc-a0-48.ucode            | Bin 1096704 -> 0 bytes
 iwlwifi-cc-a0-53.ucode            | Bin 1205332 -> 0 bytes
 iwlwifi-cc-a0-55.ucode            | Bin 1219356 -> 0 bytes
 iwlwifi-cc-a0-62.ucode            | Bin 1292672 -> 0 bytes
 iwlwifi-cc-a0-63.ucode            | Bin 1298688 -> 0 bytes
 iwlwifi-cc-a0-67.ucode            | Bin 1310488 -> 0 bytes
 iwlwifi-cc-a0-68.ucode            | Bin 1314392 -> 0 bytes
 iwlwifi-cc-a0-71.ucode            | Bin 1322288 -> 0 bytes
 iwlwifi-so-a0-gf-a0-64.ucode      | Bin 1515812 -> 0 bytes
 iwlwifi-so-a0-gf-a0-67.ucode      | Bin 1524432 -> 0 bytes
 iwlwifi-so-a0-gf-a0-68.ucode      | Bin 1533812 -> 0 bytes
 iwlwifi-so-a0-gf-a0-71.ucode      | Bin 1550124 -> 0 bytes
 iwlwifi-so-a0-gf4-a0-67.ucode     | Bin 1541932 -> 0 bytes
 iwlwifi-so-a0-gf4-a0-68.ucode     | Bin 1552216 -> 0 bytes
 iwlwifi-so-a0-gf4-a0-71.ucode     | Bin 1566352 -> 0 bytes
 iwlwifi-so-a0-hr-b0-64.ucode      | Bin 1427384 -> 0 bytes
 iwlwifi-so-a0-hr-b0-68.ucode      | Bin 1429192 -> 0 bytes
 iwlwifi-so-a0-hr-b0-71.ucode      | Bin 1456960 -> 0 bytes
 iwlwifi-so-a0-jf-b0-64.ucode      | Bin 1365628 -> 0 bytes
 iwlwifi-so-a0-jf-b0-68.ucode      | Bin 1378284 -> 0 bytes
 iwlwifi-so-a0-jf-b0-71.ucode      | Bin 1400056 -> 0 bytes
 iwlwifi-ty-a0-gf-a0-62.ucode      | Bin 1455104 -> 0 bytes
 iwlwifi-ty-a0-gf-a0-63.ucode      | Bin 1460012 -> 0 bytes
 iwlwifi-ty-a0-gf-a0-67.ucode      | Bin 1482872 -> 0 bytes
 iwlwifi-ty-a0-gf-a0-68.ucode      | Bin 1494304 -> 0 bytes
 iwlwifi-ty-a0-gf-a0-71.ucode      | Bin 1494024 -> 0 bytes
 93 files changed, 276 deletions(-)
 delete mode 100644 iwlwifi-1000-3.ucode
 delete mode 100644 iwlwifi-3168-22.ucode
 delete mode 100644 iwlwifi-3168-27.ucode
 delete mode 100644 iwlwifi-5000-1.ucode
 delete mode 100644 iwlwifi-5000-2.ucode
 delete mode 100644 iwlwifi-6000g2a-5.ucode
 delete mode 100644 iwlwifi-6000g2b-5.ucode
 delete mode 100644 iwlwifi-6050-4.ucode
 delete mode 100644 iwlwifi-7265D-22.ucode
 delete mode 100644 iwlwifi-7265D-27.ucode
 delete mode 100644 iwlwifi-8000C-22.ucode
 delete mode 100644 iwlwifi-8000C-27.ucode
 delete mode 100644 iwlwifi-8000C-31.ucode
 delete mode 100644 iwlwifi-8265-22.ucode
 delete mode 100644 iwlwifi-8265-27.ucode
 delete mode 100644 iwlwifi-8265-31.ucode
 delete mode 100644 iwlwifi-9000-pu-b0-jf-b0-33.ucode
 delete mode 100644 iwlwifi-9000-pu-b0-jf-b0-41.ucode
 delete mode 100644 iwlwifi-9000-pu-b0-jf-b0-43.ucode
 delete mode 100644 iwlwifi-9260-th-b0-jf-b0-33.ucode
 delete mode 100644 iwlwifi-9260-th-b0-jf-b0-41.ucode
 delete mode 100644 iwlwifi-9260-th-b0-jf-b0-43.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-48.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-53.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-55.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-62.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-63.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-68.ucode
 delete mode 100644 iwlwifi-Qu-b0-hr-b0-71.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-48.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-53.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-55.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-62.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-63.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-68.ucode
 delete mode 100644 iwlwifi-Qu-b0-jf-b0-71.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-48.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-53.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-55.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-62.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-63.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-68.ucode
 delete mode 100644 iwlwifi-Qu-c0-hr-b0-71.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-48.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-53.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-55.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-62.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-63.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-68.ucode
 delete mode 100644 iwlwifi-Qu-c0-jf-b0-71.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-48.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-53.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-55.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-62.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-63.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-67.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-68.ucode
 delete mode 100644 iwlwifi-QuZ-a0-hr-b0-71.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-48.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-53.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-55.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-62.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-63.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-68.ucode
 delete mode 100644 iwlwifi-QuZ-a0-jf-b0-71.ucode
 delete mode 100644 iwlwifi-cc-a0-46.ucode
 delete mode 100644 iwlwifi-cc-a0-48.ucode
 delete mode 100644 iwlwifi-cc-a0-53.ucode
 delete mode 100644 iwlwifi-cc-a0-55.ucode
 delete mode 100644 iwlwifi-cc-a0-62.ucode
 delete mode 100644 iwlwifi-cc-a0-63.ucode
 delete mode 100644 iwlwifi-cc-a0-67.ucode
 delete mode 100644 iwlwifi-cc-a0-68.ucode
 delete mode 100644 iwlwifi-cc-a0-71.ucode
 delete mode 100644 iwlwifi-so-a0-gf-a0-64.ucode
 delete mode 100644 iwlwifi-so-a0-gf-a0-67.ucode
 delete mode 100644 iwlwifi-so-a0-gf-a0-68.ucode
 delete mode 100644 iwlwifi-so-a0-gf-a0-71.ucode
 delete mode 100644 iwlwifi-so-a0-gf4-a0-67.ucode
 delete mode 100644 iwlwifi-so-a0-gf4-a0-68.ucode
 delete mode 100644 iwlwifi-so-a0-gf4-a0-71.ucode
 delete mode 100644 iwlwifi-so-a0-hr-b0-64.ucode
 delete mode 100644 iwlwifi-so-a0-hr-b0-68.ucode
 delete mode 100644 iwlwifi-so-a0-hr-b0-71.ucode
 delete mode 100644 iwlwifi-so-a0-jf-b0-64.ucode
 delete mode 100644 iwlwifi-so-a0-jf-b0-68.ucode
 delete mode 100644 iwlwifi-so-a0-jf-b0-71.ucode
 delete mode 100644 iwlwifi-ty-a0-gf-a0-62.ucode
 delete mode 100644 iwlwifi-ty-a0-gf-a0-63.ucode
 delete mode 100644 iwlwifi-ty-a0-gf-a0-67.ucode
 delete mode 100644 iwlwifi-ty-a0-gf-a0-68.ucode
 delete mode 100644 iwlwifi-ty-a0-gf-a0-71.ucode

-- 
2.39.1

