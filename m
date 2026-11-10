Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D81C606A330
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Nov 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EakL87xC
Received: by smtp.kernel.org (Postfix)
	id 77A6A1F008A1; Tue, 10 Nov 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794301534;
	b=SRBpwHmss1lEs9wxXpPpmSzo82HKJebcQ2Y4e3p0cOEwYsrp4C+F8z2BJWM8o+CngUC1
	 FQsPX8B+/U6QlcZsKFmtsK6vFfnqme+ATPQ3cXeEXhHAlH+JIpeXb264EdSoX4kpyYTe/
	 /BvUrzAcIYXYhjUUAPHoLOzJA67jSZmw2aNjo2m15ylLCd3G8tTBExkn94RcYi92BXExs
	 F2UB66nCQ1KSJ349lQgTIjOZWm56PqibZd1wIsHQ0QKIBueOMDyQdzLzEuStahfAaH/n5
	 O1bScMB6mWEIljDoSbtyYgRxIwvkEkRN+39gwN1XfoXG1GVRXRa3CWIx6rLznvhM2gA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794301534;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:List-Id:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=NHR8IPOrPITxXizJ/X4GEsKOm3jbuApv5uKX06EZa7E=;
	b=f4WzU8Xc+NZo5BaiAPkEPdQZIR2G3eI6Tzddu7/E6ofBNAwYIqcFycH+OtJLN52diPrE
	 2f7SW72qtkki3FnbnK61t1rsHi/EhObXl1R/c0/eOe1PTb6sJftuyuKbtGk0rA27cjOvt
	 l9SRCnx2vj9JgYAMxwgkwaepJXotoIKLVZjqsBDL5v5axVlSGPD+8Q91S2oyR6krfnEzz
	 Rpw3uf5tab1x4Q2xNUNwRoz9Sdq0WsF4zuWNnCtbVTkAETY28nbj6uWkepzOKtH63CNZr
	 OBI5sYAUg5u0y6jGWzkvaQHuvpQgmLikOrsckF5n4dbXfr1G3ZoDu2ksEpZvw3PL61g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D56D21F0089F;
	Tue, 10 Nov 2026 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794301534;
	bh=NHR8IPOrPITxXizJ/X4GEsKOm3jbuApv5uKX06EZa7E=;
	h=From:Date:Subject:List-Id:To:Cc:Reply-To;
	b=EakL87xCjxnAoPgiUShCK48/mQy9MWS/9YGobQ/MzqDemh1a3MzIAeNnPXOiiGBx7
	 bqtuEuiIE42ww1XWNZk20MlMiP5bFhxoU0shaVR6BgZ3C14pbXtMICwEDh3mU4bUs7
	 LdnxvlAZvFoNPaNhk8L4CSYivjANgqoGKdRuicAqtyc5zTvS1R7Pdyrwz9KAAwTd4t
	 F0dcJvznPKUxbQTOd/H12MGgiRtDDrnNFzqABGmBpyTVfmC6sb996SHL3tJL8FQISI
	 Q9jQ/k1nsuh6ccenSVVtro+T7fjPk//biSc3VyWxTOlIies8cHbv+cDffv7NPzwRBs
	 v77X5lbFcvN1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 52D3748A4E;
	Tue, 10 Nov 2026 09:05:33 +0000 (UTC)
From: Yang Li via B4 Relay <devnull+yang.li.amlogic.com@kernel.org>
Date: Tue, 10 Nov 2026 17:05:22 +0800
Subject: [PATCH] amlogic: Update w155s2 firmware to version 6b.10
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-upgrade_w155s2_bin-v1-1-4533ba6005cd@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAFHe8moC/x3MTQqAIBBA4avErBMcyYKuEhFqU83GYqQfkO6et
 PwW72VIJEwJ+iqD0MWJ91iAdQVhc3ElxXMxGG1aRNTqPFZxM003WpvM5DkqMkG3zndNWCyU8BB
 a+Pmnw/i+H+qq6/5kAAAA
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: bluez-devel@lists.bluez.org, Yang Li <yang.li@amlogic.com>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794301531; l=1127;
 i=yang.li@amlogic.com; s=20240418; h=from:subject:message-id;
 bh=4MadsrxCz7u2kuThDp1gRCH+zvOW7t7Vn6MZBQWV2wY=;
 b=C74V5cmQmGTQ81F3QAxcNE5VwdDUghsmI8eaIO8Tk8Chqq9/hk4et3HoOtjX6awzwYUaG0RV8
 8S08+vi4pD6AEV9bIgMGricfoom8nSe+rDxXxdyOpBgAZCyzdNG+usi
X-Developer-Key: i=yang.li@amlogic.com; a=ed25519;
 pk=86OaNWMr3XECW9HGNhkJ4HdR2eYA5SEAegQ3td2UCCs=
X-Endpoint-Received: by B4 Relay for yang.li@amlogic.com/20240418 with
 auth_id=180
X-Original-From: Yang Li <yang.li@amlogic.com>
Reply-To: yang.li@amlogic.com
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-24.1 required=3.0 tests=ALL_TRUSTED,BAYES_00,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MENTIONS_GIT_HOSTING,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yang Li <yang.li@amlogic.com>

Release notes:
- Allow cases where BD address is not burned into
  eFuse (no longer restricted).
- Mark secure connection as unsupported.

Signed-off-by: Yang Li <yang.li@amlogic.com>
---
 WHENCE                         |   4 ++--
 amlogic/aml_w155s2_bt_uart.bin | Bin 393224 -> 393224 bytes
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/WHENCE b/WHENCE
index 27de996d..2101bbae 100644
--- a/WHENCE
+++ b/WHENCE
@@ -10733,8 +10733,8 @@ Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.1.22_2.0.0/nxp
 
 Driver: amlogic - Amlogic SoC Firmware
 File: amlogic/aml_w155s2_bt_uart.bin
-Version: 42.23
-Info: 0x2de8
+Version: 6b.10
+Info: 0x6789
 
 File: amlogic/aml_w265s1_bt_uart.bin
 Version: 43.13
diff --git a/amlogic/aml_w155s2_bt_uart.bin b/amlogic/aml_w155s2_bt_uart.bin
index 02f1fe3f..5ffcd15f 100644
Binary files a/amlogic/aml_w155s2_bt_uart.bin and b/amlogic/aml_w155s2_bt_uart.bin differ

---
base-commit: a42217fc9c813dfc2e0254f0ac21ff6034098a79
change-id: 20261110-upgrade_w155s2_bin-e2c06ab74cf5

Best regards,
-- 
Yang Li <yang.li@amlogic.com>


