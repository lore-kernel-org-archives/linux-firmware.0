Return-Path: <SRS0=7ho4=XI=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C1C43334
	for <linux-firmware@archiver.kernel.org>; Sun,  3 Jul 2022 22:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFF62C341CB; Sun,  3 Jul 2022 22:13:34 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63EC7C341C6;
	Sun,  3 Jul 2022 22:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63EC7C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id lw20so13697255ejb.4;
        Sun, 03 Jul 2022 15:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYztfvmy8RWG4o5RZPuKKP+xY2+Q/GzWUvq7Om/q30Q=;
        b=XR6PST1aWi8ZJyL1ZrbcxwUAxznpz7ohhSrcsUCpzA8dVG0NQvMspIg/Rt2+WFP/gW
         Yo6MAUfFta6G8ayrRSsVsrjGOOiwlo/YBl7kDL2JWA96wuP0piMQjVMtlwszbvFJttfM
         DnNaH7OJtXiJpWU3ugfHO/b10svnAb/c5Uze51iWIzyG+lPtW1SDmPUeERsRCXA7uESo
         dXGAPacLBKbc6M6RkYdEnZKJgS0GItBVQAAC0Ly/mdTr9vITIVYVPVgb77MZp1zGFEKE
         2eDAwj+fh/af2anskIzRlzD4MVpibGLnB4ynuU6aoL5nV1QUyldMTdzoacm3MkZzpD0H
         F2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYztfvmy8RWG4o5RZPuKKP+xY2+Q/GzWUvq7Om/q30Q=;
        b=H4hWN6qcfukWnJZMghmOz05I+6bu7raP6YmPygwFJQ9KAXG+p67VbGqr23wdWcb6pe
         by9CDk90dO7wS8prpskel0Ppf01EOdtVEadr4V76vnHn5osqXEoEzPCY66o1/PhpXiJP
         V2ELdR+F++FWmL15bFNSR5GSk3SxIF/SoQY5jKuOvSR7JaYvhTnD/kshrW+ut21Pm9aO
         fNoKX3Q2aYMgkvwPv7c8aCuYEZOlcPswZM2OUb7VX8AqG+oZZ5l4hLVOE2My0MtcUr+B
         AhgIhqz0d+3q2AN9viVo8F6cJxfgU/BbH8HPSPSramw7Ie9HeZvFlm3lfK+TGlv0VvF0
         KUzA==
X-Gm-Message-State: AJIora8xFb/hVG762CuUEOYRyUq4bWRAy2XyLIlbjq0DUx0JZejfHGpW
	nNfW1jEWFL2lUey9eMcszTwak5Yf/3I=
X-Google-Smtp-Source: AGRyM1vHoo6NrqV8iS/HjXowmHdUxVUJWnRxEh/JPa49KVaTOeSa7unpwl4DuiECCRy4Fy4DMyEQuw==
X-Received: by 2002:a17:906:2dd:b0:712:1293:3dd8 with SMTP id 29-20020a17090602dd00b0071212933dd8mr25382635ejk.448.1656886411673;
        Sun, 03 Jul 2022 15:13:31 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id 8-20020a170906300800b0072aadbd48c7sm2166491ejz.84.2022.07.03.15.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 15:13:31 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] Drop ATM Ambassador devices firmware
Date: Sun,  3 Jul 2022 23:13:28 +0100
Message-Id: <20220703221328.670535-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ambassador driver driver was dropped from the kernel with
commit e05afd0848f8 and it appears the driver has been broken
for some time so lets drop the obsolete firmware.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE      |  18 ------------------
 atmsar11.fw | Bin 9726 -> 0 bytes
 2 files changed, 18 deletions(-)
 delete mode 100644 atmsar11.fw

diff --git a/WHENCE b/WHENCE
index 8ac1450..f7c6cdf 100644
--- a/WHENCE
+++ b/WHENCE
@@ -17,24 +17,6 @@ Licence: Redistributable. See LICENCE.cypress for details.
 
 --------------------------------------------------------------------------
 
-Driver: ambassador -- Madge Ambassador (Collage PCI 155 Server) ATM NIC.
-
-File: atmsar11.fw
-
-Licence: Allegedly GPLv2+, but no source visible. Marked:
-
-  Madge Ambassador ATM Adapter microcode.
-  Copyright (C) 1995-1999  Madge Networks Ltd.
-
-  This microcode data is placed under the terms of the GNU General
-  Public License. The GPL is contained in /usr/doc/copyright/GPL on a
-  Debian system and in the file COPYING in the Linux kernel source.
-
-  We would prefer you not to distribute modified versions without
-  consultation and not to ask for assembly/other microcode source.
-
---------------------------------------------------------------------------
-
 Driver: snd-korg1212 -- Korg 1212 IO audio device
 
 File: korg/k1212.dsp
diff --git a/atmsar11.fw b/atmsar11.fw
deleted file mode 100644
index e14f6bd25fda6e83e7ce958a374e7f5e0d3e30a4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 9726
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

-- 
2.36.1

