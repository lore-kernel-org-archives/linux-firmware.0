Return-Path: <SRS0=RTcC=HH=realsil.com.cn=javen_xu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F5C88E53
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Sep 2026 07:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE8331F000FF; Tue, 15 Sep 2026 07:57:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789459047;
	b=F9Uk2MrnlrjR3rOy3q6gFb3snW1LQ97d2RHYsMV+XC1MdWFQa5pASlYjLwNXp1yXzKYM
	 fWLdN/rtcruKl7Rr65YkFzcjM0M9RSxPQyhKrtkdtJcs+rj4NRSe2WRtQkNOcW2TsZwtm
	 n8pi/hTUoyWQsCviMxJVb/WB3b3iCXWqvQb0meS/LMfBSEzbx60O6yc0JmgqH5AwyS0F/
	 96rYouBofSgBa9Z7SmWaKqEFM8XgCKTSj/8chIAN35TO1yFlK68K0opg2maNOd7ZOFU8L
	 t2W2rXsaLAs+1+bpc6hxP8b0jMnh/qVB/3gN1WmRTKTiG4XDaM0Jk2UizxINuzS6vzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789459047;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=BzmAuErCNZ4nAK5wgazGo0NnnPxhZnE1ArCMQM5XeM8=;
	b=jA5H8dgajCnxFcWRCLj0BTk1CZLxPJaRbTK3+lP/nE8g8SYOse52rpXwkwdPYm0A+mJb
	 eOyfQ3it7dF7OUcKDLjrtNBF6iJTD8dEaghshvoJKPPMa8hKpmRkD3kL+inSdNAB3cJup
	 Hi8oioHpY1CT4zx7IzUquJel9dYNvipnFbuBrLSxexPAg4ctbkbDtB2EAZPuyePCPRI0b
	 SOFBF92/XZ6geINci20sMhmbkNe7+z4dNIKXkDK5pJzMiEz6DIfJGUlP/7yUr8UY76Wmk
	 3Vu1yrDw8gINRoZv6B6pmnh4Qamlm+GBr1gdonxenh1tW2ub0SRlYHWbvofk3cGwYKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=WWrYPBry;
	dmarc=pass header.from=realsil.com.cn;
	spf=pass smtp.mailfrom=realsil.com.cn;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64FD11F00898
	for <linux-firmware@kernel.org>; Tue, 15 Sep 2026 07:57:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realsil.com.cn header.i=@realsil.com.cn header.a=rsa-sha256 header.s=dkim header.b=WWrYPBry
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 64FD11F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68F7vJ9C11358537, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789459040;
	bh=BzmAuErCNZ4nAK5wgazGo0NnnPxhZnE1ArCMQM5XeM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=WWrYPBry3X60A/uVl0wskDdDeEA5hUrdsZY/xM3hHC5bi7F4hhtlZMc4QpKK0S7B3
	 p7Buof+/nku6jp6D2yLtj6RTrD/OoFYm2LONm8p//RGerUzUtMt9xbY8v/YarJy6uu
	 hdSQQFIkzcPpF/jvOCuC9ZxmX5D7glbgN5XJsc4ze2yrppLqMy9cFzH6MR3LQA52Og
	 KIC2LsNMVQjZFrVllkKedi3JEnCTCBG+vM1ovRmfzsyqqBZspdT6w5k7Ry1U309Zoy
	 GmbbczDUowSKlZVSeMlw4YwFYLxAWt2OiBn6OcR3WzmXGUd/xoSNz7Vz9kOw+aI2qz
	 ceF80HAZMWStA==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68F7vJ9C11358537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Sep 2026 15:57:20 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 15:57:19 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 15:57:19 +0800
From: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
	<nic_swsd@realtek.com>
CC: Javen Xu <javen_xu@realsil.com.cn>
Subject: [PATCH net-next v1] rtl_nic: add firmware rtl8261d.bin for RTL8261d
Date: Tue, 15 Sep 2026 15:57:17 +0800
Message-ID: <20260915075717.668-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

Add firmware for RTL8261d in phy driver.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
 WHENCE               |   3 +++
 rtl_nic/rtl8261d.bin | Bin 0 -> 212 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8261d.bin

diff --git a/WHENCE b/WHENCE
index a15aa24e..4db5e3dd 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3628,6 +3628,9 @@ Version: 0.0.5
 File: rtl_nic/rtl8261c.bin
 Version: 0.0.1
 
+File: rtl_nic/rtl8261d.bin
+Version: 0.0.1
+
 Licence: Redistributable. See LICENSE.r8169 for details.
 
 --------------------------------------------------------------------------
diff --git a/rtl_nic/rtl8261d.bin b/rtl_nic/rtl8261d.bin
new file mode 100644
index 0000000000000000000000000000000000000000..a6add868b60430414480ed594c36225cb86447c6
GIT binary patch
literal 212
zcmcEU2?=sBG&5oV0s$aqKguD`Ag{24g@q9$#K0uau!D__ks*Zv$d@-;!q1@G0G5!q
z0J0eiAZ(Dh-VP*jFcYF4!ejuehq0k*L0k+oVQN5bfUqHMU_f$%Tmx7JWF`kpJp<4U
I43j`S0B*4trT_o{

literal 0
HcmV?d00001

-- 
2.43.0

