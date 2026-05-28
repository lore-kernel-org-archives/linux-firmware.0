Return-Path: <SRS0=Ei1Z=DZ=realsil.com.cn=javen_xu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4182CD5BD1
	for <linux-firmware@archiver.kernel.org>; Thu, 28 May 2026 07:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91F0D1F00A3A; Thu, 28 May 2026 07:47:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779954436;
	b=EEpAN7vX/O0xcN1CuK0EAmf1dL+VD2C8RAMIVE8e2InFUpubkPbjFFaIiJBvZqy7q/vn
	 izb70kxICxNe2aG5NaPq/GvSf5zu8zxO0UzX29CbnwJt0mrdkoe6f50ZNhwqVkYeSYorR
	 C0Ab8ovmIGO2RBRISBiDkMvWF/X6QrqpBrt5UqfmUj4yctYVx/M9Acca7tPny3vKBn+3s
	 KCwWmL0wg15c5lAnbkFYpcvYFoR91A039qKfwURwKgMm41FFtpZhnOh4IxP/KIJ4Iif0L
	 ddfZkcXiV5uRnD2BPJI5K9vc2q5B3JwRbquoYVWKR+w95nrBovVtsirIWIcrRvfAyMA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779954436;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=lks/yyTVeiQoWSgkVYtl3PGT3K7FYvDEQg0t83m2oVw=;
	b=nfm0umtTDCWgTIspd59vG5aRuPqw4r8KRRZosedsCaav4RTcUySfEAKahX2Ls8bzJnOx
	 TVvag5kgCOr9g4zTdIrLdvc2gpF91iuyNei2h4zXytwsFw1WC8kQL3nXbNn4RaQZqPu/R
	 4r63D8xsKnGv9UPIhL8h7l0eUceYxW6FpTvn/+fZElRUgMGdjejpt7EMFrIwvcb9LQ6RL
	 Iywt/uHuPIc9OwFj86ZVxELmis7OGH23ck5Wu31n1ZUrY8PU6kA5KnqKQSqkj1abMLQaQ
	 tzJGAt4KGyPngDKNnPCMqS72cS+kWrutUqAfc6V61sur2FceCqIPpZud+8/PKnPogtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=oJ6ewfkt;
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3723E1F000E9
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 07:47:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=oJ6ewfkt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3723E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 64S7l9MY13169209, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1779954430;
	bh=lks/yyTVeiQoWSgkVYtl3PGT3K7FYvDEQg0t83m2oVw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=oJ6ewfktAtMxSkCy/h0uv/Z+C1653ECL/DRGe6OakxfYkM8bHf7YMelXdYpeZI7z9
	 SOU3c/TUZ23csEhZXQcnOVmnu4/pI/n3e9p+TX46K30C9iruL7tG8npzseybDeqYO1
	 DluYsyJ0V7j9vpy4X0wkc2kKfqnZenJlzR6HyOVnh/3/Kf47ITHi1Xe62lmpXlDZKC
	 N+rqUsMHbmRcgCryS0CvOuX8ZP24shpp3+REKm6Mzi2L3FBbf8uo60zJiqnUHrntfj
	 O5tdYr27XS++zRF9iF+7ZIO5NNvlzXyZnH6lev1vYV0nqEBBETtU0dYHaGyHjGIiIn
	 qOA7aZAs6lF8g==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 64S7l9MY13169209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 May 2026 15:47:10 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 May 2026 15:47:09 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 28 May 2026 15:47:09 +0800
From: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
	<nic_swsd@realtek.com>
CC: Javen Xu <javen_xu@realsil.com.cn>
Subject: [PATCH v1] rtl_nic: add firmware rtl8261c.bin for RTL8261c
Date: Thu, 28 May 2026 15:47:06 +0800
Message-ID: <20260528074706.1025-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

Add firmware for RTL8261c in phy driver.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
 WHENCE               |   3 +++
 rtl_nic/rtl8261c.bin | Bin 0 -> 56588 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8261c.bin

diff --git a/WHENCE b/WHENCE
index 2d3aaebd..d7eb4a51 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3735,6 +3735,9 @@ Version: 0.0.5
 File: rtl_nic/rtl8127a-1.fw
 Version: 0.0.5
 
+File: rtl_nic/rtl8261c.bin
+Version: 0.0.1
+
 Licence: Redistributable. See LICENSE.r8169 for details.
 
 --------------------------------------------------------------------------
diff --git a/rtl_nic/rtl8261c.bin b/rtl_nic/rtl8261c.bin
new file mode 100644
index 0000000000000000000000000000000000000000..404c1ee2b0c108437757c21b30df7b40f9e82a11
GIT binary patch
literal 56588
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

literal 0
HcmV?d00001

-- 
2.43.0

