Return-Path: <SRS0=8t+c=D2=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840DFEB64DD
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Aug 2023 09:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5106DC433C9; Wed,  9 Aug 2023 09:24:12 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51317C433CA
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 09:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51317C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54D4E3F546
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691573048;
	bh=YgXrPXsYiwqkyzUnh/JlrEom8eBjkRBNQjvRZlznaT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=eBsSIzffXVA+SVFWqDC470kelCG81K7d/6wTuSVpwLQQwlHFDARIiDCXhNSHZgn9Z
	 besf0QzwzBwj9axWbw6nisq1FArpd/Ew9fZZ+mnJhxDab4AUxfol8pvtuyyfI3T5Xy
	 M4Ge7VL9Wbm/OgKJRZcLZktj8nCINzTVyRtTE5QEYNoLOBEt5c5Q5e9c1mO+gJpFqB
	 8PmxbXwV5bnIj1c3NQNet3iEe2TbfwkLjXHp0DmZlaVyuhVygHB+PQGN3kyG8Gf+GQ
	 B+Ny4f9p6/sdy+aljl0TIwXRIU0a2VErdAX4JBcJAuVCFt3lKlX48bk8DnBai5maZ/
	 Q/3lTnmZxTwBw==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-314256aedcbso2945431f8f.0
        for <linux-firmware@kernel.org>; Wed, 09 Aug 2023 02:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691573048; x=1692177848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgXrPXsYiwqkyzUnh/JlrEom8eBjkRBNQjvRZlznaT4=;
        b=FYmTnCvUka93sipu2tmDtmd+qfbrnqiPAzjPhCIGz+NPGCw2OwmV/zUhXM+dn06Taa
         pgStcFPjDiiw3wk6YO3o/+EFTm5gH/J6TpqYIPzIkyBd6Uf1OeHOegVjwoOnsNoefNb7
         PdSwa4ReJtxTt0xS5xpqNF2awrfJxlKtJ6lxGDZV6VnfU+XzTgyRYiGnxTNDDlNGJq5g
         PxhuypLhcWQ7+wRAlg9R78YM0CpnTSfVdXD7RBNWsoYMldlUxRQ9NhHFQSxgJDiJYYVV
         vr76DIF7iWJgBQon+vHVgewUQRHxrSRpU3pmHnMntGgfWCQQm3C0wv7E+aCO4P92ikAG
         wvDQ==
X-Gm-Message-State: AOJu0YxyhRpEQwpepFVxNsmwkgtp9axBJuOtPkrXmWsU0BzSZnXTupwe
	L4quzjdHFFoSQhYD3rA9ntYlQif688lpnFxy247guEtb0q5rXQtdRNRyRmT3GEYYSRdUa1L79+2
	VkFnTd1cPKwBlBNk6pSaUcw8XYWkM32CH8yB8/3cdZVHkaQ==
X-Received: by 2002:a5d:6b86:0:b0:317:54de:9719 with SMTP id n6-20020a5d6b86000000b0031754de9719mr1289635wrx.70.1691573048004;
        Wed, 09 Aug 2023 02:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/6PqBFOP+Gx1H0mZqWx2cFOkBpzZCpwW3fS62gDro8JKAoZABqPSM9HUJBZLCHyUJAg91w==
X-Received: by 2002:a5d:6b86:0:b0:317:54de:9719 with SMTP id n6-20020a5d6b86000000b0031754de9719mr1289626wrx.70.1691573047624;
        Wed, 09 Aug 2023 02:24:07 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id g5-20020a5d5545000000b0030e56a9ff25sm16194737wrw.31.2023.08.09.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:24:07 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	jwboyer@kernel.org
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH] copy-firmware: Support additional compressor options
Date: Wed,  9 Aug 2023 11:23:58 +0200
Message-Id: <20230809092358.575787-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any options following the compressor option --zstd or --xz are passed on
to the compressor as additional options so that - for example - the
compression level can be specified:

  $ ./copy-firmware.sh --zst -19 <destdir>

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 copy-firmware.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 148f0f199e5f..20746a47420b 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -44,6 +44,14 @@ while test $# -gt 0; do
             shift
             ;;
 
+        -*)
+            if test "$compress" = "cat"; then
+                echo "ERROR: unknown command-line option: $1"
+                exit 1
+            fi
+            compress="$compress $1"
+            shift
+            ;;
         *)
             if test "x$destdir" != "x"; then
                 echo "ERROR: unknown command-line options: $*"
-- 
2.39.2

