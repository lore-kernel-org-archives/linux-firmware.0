Return-Path: <SRS0=gqvC=3M=zzy040330.moe=jun@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1016DCA0FFF
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Sep 2025 14:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA2F8C4CEF1; Mon,  1 Sep 2025 14:59:45 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91BD8C4CEF0
	for <linux-firmware@kernel.org>; Mon,  1 Sep 2025 14:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91BD8C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=zzy040330.moe
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=zzy040330.moe
ARC-Seal: i=1; a=rsa-sha256; t=1756738781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QRNzhX+iDrjgocnYtmBOCoJERM37dBJNuM1JNiswYA/MTfLwzvBu86xI8erARI/tJHdr2bcgFokz1Fe6EHiS3n86b6mf9jMLCeqPCj/BtJljMYorHyEq21p/VbauhvoKbOUbPd+TvfI8R7CcHTA3un4D7+z8LNXgeEdkvuNV/ME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756738781; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3u/2YkP3WK+Yog104ahdRZY0/L852gL9kxlUwkaMw6w=; 
	b=KLKolHtL5W65h/lDPciVfKf/UQ7nOzKcsDjM0S6Pw5HAybEusG2g+U1+TIFy1OY+Cl3gtoaesx4R16AjJZwmd+wwJWkrSiI+CRM1+Rbkfewef6eqeA0TB06dN+oSYBkHGM/txQwBymPEa3Rql41iABB7JbMxedaDy3IpsTgBF3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zzy040330.moe;
	spf=pass  smtp.mailfrom=jun@zzy040330.moe;
	dmarc=pass header.from=<jun@zzy040330.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756738781;
	s=zmail; d=zzy040330.moe; i=jun@zzy040330.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3u/2YkP3WK+Yog104ahdRZY0/L852gL9kxlUwkaMw6w=;
	b=QXYiwYBT/YC4P1F30Sj7Nw+/GFq9ePvcJ/HGXRAfglwHPRONSAC8SFfUIvJ9JTzr
	psuIxmEjJeqUYwE138PCb3kBGl29hoyoSMtFhQJSJMYVoSmVwVS31WPxhpLuUpVrwbS
	rameaizvcRrTpj/PqnWhdU5ka6BnLG8kuQ1gdfu0=
Received: by mx.zohomail.com with SMTPS id 17567387796381023.56828165499;
	Mon, 1 Sep 2025 07:59:39 -0700 (PDT)
From: Ziyu Zhou <jun@zzy040330.moe>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Ziyu Zhou <jun@zzy040330.moe>
Subject: [PATCH] cs35l56: Rename firmware for Thinkbook 16P Gen6 (17AA3921) without multiple speakers
Date: Mon,  1 Sep 2025 22:59:34 +0800
Message-ID: <20250901145934.86404-1-jun@zzy040330.moe>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Remove the 'spkid1' suffix from
cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp*.bin and its corresponding
wmfw symlink, since Thinkbook 16P Gen6 (Subsystem ID 17AA3921) does
not have multiple speakers. The suffix prevents the kernel from
finding the correct firmware, which leads to very low speaker volume
and the error message: ".bin file required but not found".

Signed-off-by: Ziyu Zhou <jun@zzy040330.moe>
---
 WHENCE                                              |   6 +++---
 ...1.bin => cs35l56-b0-dsp1-misc-17aa3921-amp1.bin} | Bin
 ...2.bin => cs35l56-b0-dsp1-misc-17aa3921-amp2.bin} | Bin
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename cirrus/{cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin => cs35l56-b0-dsp1-misc-17aa3921-amp1.bin} (100%)
 rename cirrus/{cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin => cs35l56-b0-dsp1-misc-17aa3921-amp2.bin} (100%)

diff --git a/WHENCE b/WHENCE
index 2161ec89..7cd782b3 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8295,9 +8295,9 @@ File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin
 Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
 File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
 File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
-Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
-File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
-File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
+Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
+File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
+File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
 Link: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1.wmfw -> cs35l56/CS35L56_Rev3.11.21.wmfw
 File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin
 File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin
diff --git a/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin b/cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
similarity index 100%
rename from cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
rename to cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
diff --git a/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin b/cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
similarity index 100%
rename from cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
rename to cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
--
2.51.0
