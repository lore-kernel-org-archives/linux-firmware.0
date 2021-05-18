Return-Path: <SRS0=PSJ+=KN=redhat.com=bskeggs@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53092C433B4
	for <linux-firmware@archiver.kernel.org>; Tue, 18 May 2021 06:36:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2ABAD61004; Tue, 18 May 2021 06:36:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB873611B0
	for <linux-firmware@kernel.org>; Tue, 18 May 2021 06:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB873611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bskeggs@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621319798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=euvkuedTE5JmxpmedOnaMbQ7UGDBZi+6/tInlfAMX+I=;
	b=Ddg/mm760t2AXW7u4SjXYyAYpSu66u5FCgjHc1JXyPsuj1IBy1dhXkS7mFk+mqT07cHwHA
	egXMJSHtPHnlM84lrU4KPWtUV9yP5GPamD8i8ESWotPIJ0ZgRjZyTe3LfOVzB6kzbRIsNu
	bhxQMvCYaP18sGvE9qm3dxzSX4KN9ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-DtVHc0vMOpqB86fTyrA5jw-1; Tue, 18 May 2021 02:36:36 -0400
X-MC-Unique: DtVHc0vMOpqB86fTyrA5jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3664E107ACCD
	for <linux-firmware@kernel.org>; Tue, 18 May 2021 06:36:36 +0000 (UTC)
Received: from localhost.localdomain (vpn2-52-16.bne.redhat.com [10.64.52.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB0AA690F1;
	Tue, 18 May 2021 06:36:33 +0000 (UTC)
From: Ben Skeggs <bskeggs@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] nvidia: fix symlinks for tu104/tu106 acr unload firmware
Date: Tue, 18 May 2021 16:36:31 +1000
Message-Id: <20210518063631.5072-1-bskeggs@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bskeggs@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Bootloader and firmware proper got swapped, resulting in module unload,
suspend, and runtime suspend issues on affected chipsets.

Fixes: 1487a8abdbac ("linux-firmware: nvidia: move firmware symlinks to WHENCE")
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 WHENCE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/WHENCE b/WHENCE
index 24106a4..b6e573a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4722,8 +4722,8 @@ File: nvidia/tu102/sec2/sig.bin
 Link: nvidia/tu104/acr/bl.bin -> ../../tu102/acr/bl.bin
 Link: nvidia/tu104/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
 Link: nvidia/tu104/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
-Link: nvidia/tu104/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
-Link: nvidia/tu104/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
+Link: nvidia/tu104/acr/unload_bl.bin -> ../../tu102/acr/unload_bl.bin
+Link: nvidia/tu104/acr/ucode_unload.bin -> ../../tu102/acr/ucode_unload.bin
 Link: nvidia/tu104/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
 File: nvidia/tu104/gr/fecs_data.bin
 File: nvidia/tu104/gr/fecs_inst.bin
@@ -4744,8 +4744,8 @@ Link: nvidia/tu104/sec2/sig.bin -> ../../tu102/sec2/sig.bin
 Link: nvidia/tu106/acr/bl.bin -> ../../tu102/acr/bl.bin
 Link: nvidia/tu106/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
 Link: nvidia/tu106/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
-Link: nvidia/tu106/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
-Link: nvidia/tu106/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
+Link: nvidia/tu106/acr/unload_bl.bin -> ../../tu102/acr/unload_bl.bin
+Link: nvidia/tu106/acr/ucode_unload.bin -> ../../tu102/acr/ucode_unload.bin
 Link: nvidia/tu106/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
 File: nvidia/tu106/gr/fecs_data.bin
 File: nvidia/tu106/gr/fecs_inst.bin
-- 
2.31.1

