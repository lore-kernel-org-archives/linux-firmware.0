Return-Path: <SRS0=k957=7J=debian.org=bage@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2561CC6FD1F
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Mar 2023 00:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC625C433D2; Fri, 17 Mar 2023 00:16:24 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13DA8C433EF
	for <linux-firmware@kernel.org>; Fri, 17 Mar 2023 00:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13DA8C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dI6Xp9vZNnFcfXvdacyaFw9JZ3CW7aFnKlJPAkNLPw4=; b=GvOP5FIrtRg+yB2tZGQ2r065pc
	grm6urbpTbAwRRSR5qkr+mGmQim4A7zd0t5a1j5nynOPO7bpEV2TAre/ENAmKLcwkyNrt3Ofage4m
	iDoCn+k9o8ZAzeB2OK7cA9A2ZHfarcGhtpuIoEWl/CNdkDPLXS95/x071K952sBVL55wRI67APRBF
	fCELcbORr3xgYZauI4i/af712CKaG984G8sahRPdh8I+Qx/dWPy+K2w8gLzMlY9lTLTlgHJh+NbyW
	bk625HHMUJMEJg0t/3Bl56+5D3/2I4ERLjAbnHn4g/7T2o+9JVFH0VJsxnJc63zvBGsRPscpZIHu3
	sIhyqKPQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1pcxlQ-00BEvi-OP; Fri, 17 Mar 2023 00:16:09 +0000
From: Bastian Germann <bage@debian.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] rtl_bt: Add firmware and configuration files for the Bluetooth part of RTL8723CS
Date: Fri, 17 Mar 2023 01:16:04 +0100
Message-Id: <20230317001604.2398-1-bage@debian.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

These files come from GitHub project anarsoul/rtl8723bt-firmware which
licenses it under LICENCE.rtlwifi_firmware.txt with the same license that
is contained in the corresponding linux-firmware license file.

The btrtl support for this chip has entered bluetooth-next and so the
firmware should be provided with linux-firmware.

Link: https://github.com/anarsoul/rtl8723bt-firmware/tree/8840b1052b4ee426
Signed-off-by: Bastian Germann <bage@debian.org>
---
 WHENCE                         |   4 ++++
 rtl_bt/rtl8723cs_xx_config.bin | Bin 0 -> 63 bytes
 rtl_bt/rtl8723cs_xx_fw.bin     | Bin 0 -> 25004 bytes
 3 files changed, 4 insertions(+)
 create mode 100644 rtl_bt/rtl8723cs_xx_config.bin
 create mode 100644 rtl_bt/rtl8723cs_xx_fw.bin

diff --git a/WHENCE b/WHENCE
index 5289158..0e3ae9a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3768,6 +3768,10 @@ File: rtl_bt/rtl8723b_fw.bin
 File: rtl_bt/rtl8723bs_fw.bin
 File: rtl_bt/rtl8723bs_config-OBDA8723.bin
 Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config-OBDA8723.bin
+File: rtl_bt/rtl8723cs_xx_config.bin
+Link: rtl_bt/rtl8723cs_cg_config.bin -> rtl_bt/rtl8723cs_xx_config.bin
+Link: rtl_bt/rtl8723cs_vf_config.bin -> rtl_bt/rtl8723cs_xx_config.bin
+File: rtl_bt/rtl8723cs_xx_fw.bin
 File: rtl_bt/rtl8761a_fw.bin
 File: rtl_bt/rtl8761b_fw.bin
 File: rtl_bt/rtl8761b_config.bin
diff --git a/rtl_bt/rtl8723cs_xx_config.bin b/rtl_bt/rtl8723cs_xx_config.bin
new file mode 100644
index 0000000000000000000000000000000000000000..0f507eddc70330b267bff501b1ebb96432b2887e
GIT binary patch
literal 63
zcmWGtt=w+O@P&bq@f!nEBf~ESCZPr%1_7pqNh|?JUr9cc{<}V&aS69N17k8!4P!JT
S3pY16mlFe%W55FjMkfG3=@0b)

literal 0
HcmV?d00001

diff --git a/rtl_bt/rtl8723cs_xx_fw.bin b/rtl_bt/rtl8723cs_xx_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..d4bebfec14c2d9e43813efd3cd44ca6f45885192
GIT binary patch
literal 25004
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

literal 0
HcmV?d00001

-- 
2.39.2

