Return-Path: <SRS0=U1HG=4R=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1A0C3F2D1
	for <linux-firmware@archiver.kernel.org>; Sat, 29 Feb 2020 02:15:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D95FE246AE; Sat, 29 Feb 2020 02:15:10 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26D5246A8
	for <linux-firmware@kernel.org>; Sat, 29 Feb 2020 02:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b7aQxeT1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26D5246A8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=briannorris@chromium.org
Received: by mail-pg1-f176.google.com with SMTP id b1so2429895pgm.8
        for <linux-firmware@kernel.org>; Fri, 28 Feb 2020 18:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JFBFunz7+53J1Vf2ij9GrCnSQCSVBqQ3ke6XS93ZjLQ=;
        b=b7aQxeT1B9Orr7a3OJGozep+U4fCc02DGvCfoxaEI2apxq72q4V8zNc1X+6JWKNMuj
         lsWdDCX9WrEQPzqR53R1+BOxPhx+kWHQuF5UL9byHXGO25YRHezt4badLPzd/oTBfGp+
         MJd3alY6CTvln2+0mjCz8lYQdCUv296MDdWbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JFBFunz7+53J1Vf2ij9GrCnSQCSVBqQ3ke6XS93ZjLQ=;
        b=ahB5Vz4HoEgdFFUa4tYmfEq8LAZk2DZ8WeXca+Ze8YG++kSlcUzw+2hpoajkpWiky7
         zBtZsQbMwGnUlt7Oz8O0PgdGbgPanm+iiO6BOVXckgdvZQ+mY/o52oMJVRB/knd5TQ3m
         h5DT8RgMv72QGROSVY5zxlCJ6DonE0y3K8PqRjXUptTOg4sI+55aNaJkieSAdI1yE/m2
         wGcYyEvdrGOfA0WAjbI2LhMIldwi1PTyEip7zMRT7W0i9sHf+4x8lirVIWT205O5q0AP
         661b9j6JMlDPIO20rNfENlp3sknf7ejUUk1mwZVtSdHCv1MzPmR0ANNnMAt4NW36El2F
         G+vA==
X-Gm-Message-State: APjAAAUs4kFPwtGuud7h1Iwpwp7psSxL65tWGp2a5GDiCTWOJgFtKlIf
	oCiO8L8XuaIuBIn+sbNpQEwHEcpWz6Q=
X-Google-Smtp-Source: APXvYqyHjin8p50TEeZ9b8swzfZhgnhgOpUmDnCTbK/H+amVGl78SklQjKiU/QD7DYXf8sSC4aGG4w==
X-Received: by 2002:a63:b917:: with SMTP id z23mr7130332pge.186.1582942509597;
        Fri, 28 Feb 2020 18:15:09 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:534:b7c0:a63c:460c])
        by smtp.gmail.com with ESMTPSA id s206sm12826343pfs.100.2020.02.28.18.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 18:15:08 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Brian Norris <briannorris@chromium.org>
Subject: [PATCH linux-firmware] check_whence: python3/utf-8 support
Date: Fri, 28 Feb 2020 18:15:05 -0800
Message-Id: <20200229021505.143663-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WHENCE contains non-ASCII characters, so we should specify an encoding.
To get the encoding= arg in python2, we pull open from 'io' directly.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 check_whence.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/check_whence.py b/check_whence.py
index 04f41dfc5f9e..2d31f3839106 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -1,9 +1,10 @@
 #!/usr/bin/python
 
 import os, re, sys
+from io import open
 
 def list_whence():
-    with open('WHENCE') as whence:
+    with open('WHENCE', encoding='utf-8') as whence:
         for line in whence:
             match = re.match(r'(?:File|Source):\s*"(.*)"', line)
             if match:
-- 
2.25.0.265.gbab2e86ba0-goog

