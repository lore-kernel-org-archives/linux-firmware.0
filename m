Return-Path: <SRS0=MP8O=EQ=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5686C83F10
	for <linux-firmware@archiver.kernel.org>; Thu, 31 Aug 2023 08:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7E2FC433C7; Thu, 31 Aug 2023 08:14:15 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAC07C433CA
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAC07C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2A71541D38
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693469651;
	bh=YPcOyWy+gho0oeDn6wV8ktVxL7HBQxiMu6d31Z1mdRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=rvlpwxgZ/0qYGp1KAOSoCB7BkpayfulTKz3gEgO/VGH+Aayib4jXF8AvcPgOfCOjc
	 3ZIQd8pIUBIO9GL5pqDW3/U4iF/97eKIwvNJ2dQfdkxMd1bWCz2ZpqxFZEFoKmA9wB
	 K+6fPREnfE9M9lrY5yF8m7mBGmSADUjAb5cgrOlhWB+oDOQcTCac0wdBbCro7lzMgr
	 KnfYkJViui/RAh+4Up9fvpZtRBVopzjHRLjVS/vNIfjf0WJIXlVL2njKICL2v1aeni
	 Q+BL0BRYiPMMqZIBZJtbCFN8+INfM7wFZ0a2JG1VC/dbTZ1E257zqMA+nMZeLQooHv
	 mpdrtZ21ji/uA==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401be705672so3668315e9.2
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 01:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469650; x=1694074450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPcOyWy+gho0oeDn6wV8ktVxL7HBQxiMu6d31Z1mdRo=;
        b=XIZekAel/i0e05J6Pd1lX6BoEOOkjtR3Bl42C0TOkUWsPY+OxiHCiJ/6xYgpW3wTes
         HGHSLjdCUP/yVbwr4dLm3d87cu2RSpi5hDmM4Y1yxGwnjXRFTdgONJsAOjKmsm1Jqc/z
         CNT0DQwQpjropZLk92O3LXw7vS7q38zaiV9K2f+cWCROE0Tz7VsIluYy8WXbPs6gOqb4
         ACx0VSEcoA/XD4J3MDBMydEMZx8iZLD/uZgi2g9mzl2RaJD3oaDjGNAVbACL7vwBiVmM
         Opztkr/vEEAl5okf7JmZ0X+SrQFuON6c3CtesoL3pQYi5xHBts6+VGllkJeBf88Robmp
         tLMA==
X-Gm-Message-State: AOJu0YwK2/pcSDHxhUUAv4i+x4e5EBt6M1CM4kYX4sPycf+gxtheHiji
	C4pH57HPhoVqhFlWMKm0pO45UDvb1zuGfX2rDYarBajq45AGThqAD9AaOfv8nnX0e989eUedU8U
	nLwyJOgxzeOBOq8JdLxO21VGMFN4HpLxoAkvzbS23O7DyGw==
X-Received: by 2002:a5d:5483:0:b0:319:7c0f:d920 with SMTP id h3-20020a5d5483000000b003197c0fd920mr3328879wrv.57.1693469650385;
        Thu, 31 Aug 2023 01:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHykBVJEpV4UQfvtgNB3MH74xeRcnzUKsu31jE8TgzdLc9x9wiH/XZgXshjulTye1xco7CtAA==
X-Received: by 2002:a5d:5483:0:b0:319:7c0f:d920 with SMTP id h3-20020a5d5483000000b003197c0fd920mr3328871wrv.57.1693469650209;
        Thu, 31 Aug 2023 01:14:10 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id d17-20020a056000115100b00313de682eb3sm1346052wrx.65.2023.08.31.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:14:09 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH 2/3] WHENCE: amd-ucode: Use new RawFile keyword
Date: Thu, 31 Aug 2023 10:13:44 +0200
Message-Id: <20230831081345.47699-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230831081345.47699-1-juerg.haefliger@canonical.com>
References: <20230831081345.47699-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace old File/Raw entries with a single RawFile entry now that
copy-firmware and check_whence support that.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 WHENCE | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/WHENCE b/WHENCE
index 390a5689408e..852e88f55341 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3912,20 +3912,15 @@ License: Redistributable. See LICENSE.amd-sev for details
 
 Driver: microcode_amd - AMD CPU Microcode Update Driver for Linux
 
-File: amd-ucode/microcode_amd.bin
-Raw: amd-ucode/microcode_amd.bin
+RawFile: amd-ucode/microcode_amd.bin
 Version: 2013-07-10
-File: amd-ucode/microcode_amd_fam15h.bin
-Raw: amd-ucode/microcode_amd_fam15h.bin
+RawFile: amd-ucode/microcode_amd_fam15h.bin
 Version: 2018-05-24
-File: amd-ucode/microcode_amd_fam16h.bin
-Raw: amd-ucode/microcode_amd_fam16h.bin
+RawFile: amd-ucode/microcode_amd_fam16h.bin
 Version: 2014-10-28
-File: amd-ucode/microcode_amd_fam17h.bin
-Raw: amd-ucode/microcode_amd_fam17h.bin
+RawFile: amd-ucode/microcode_amd_fam17h.bin
 Version: 2023-07-19
-File: amd-ucode/microcode_amd_fam19h.bin
-Raw: amd-ucode/microcode_amd_fam19h.bin
+RawFile: amd-ucode/microcode_amd_fam19h.bin
 Version: 2023-08-08
 File: amd-ucode/README
 
-- 
2.39.2

