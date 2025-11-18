Return-Path: <SRS0=krWk=52=realsil.com.cn=javen_xu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325DDCEBF97
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 02:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1EC2C2BCB2; Tue, 18 Nov 2025 02:36:22 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 570D1C4CEF5
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 02:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 570D1C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AI2a1Rh9650279, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1763433361;
	bh=9AjSCC0RcAL9sqkg0HQwtYoJgsNPetJWQzmCfuu5ryg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Id3PdNB7Wizr630mOvYw4bVOlsT5luDSqID8kHsvsARNI9QG2wIAHwzVmdvsw4rGF
	 dr/z0FakAIsdQEn0xT1KCJltiM3rvg1G61k5x1BSLIrBBfnUadS7VX/N3p6KbA6JWi
	 qDnKjWkLU4/hPc3yUkrPq04RG4KdWe3AETnWxcn4n86hb0Re/lT/AaCS0KYr1ro8GV
	 z0c4Hh4pyIVUj3Nbr4IK2XnsjmYzxlyg40Rl18d+iwdazEPOqRSTTP4LSMevZkClf4
	 6WhdkXD6vI75oQhbFsyTC2E28tEXEyoX3Dp7+WU9FAgJRIVUsmoohnSNGs1DeMF7Sr
	 UdmgGd4y1V0/w==
Received: from RS-EX-MBS4.realsil.com.cn ([172.29.17.104])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AI2a1Rh9650279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Nov 2025 10:36:01 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS4.realsil.com.cn (172.29.17.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 18 Nov 2025 10:36:01 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS2.realsil.com.cn
 (172.29.17.102) with Microsoft SMTP Server id 15.2.1544.36 via Frontend
 Transport; Tue, 18 Nov 2025 10:36:00 +0800
From: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: javen <javen_xu@realsil.com.cn>
Subject: [PATCH] rtl_nic: add firmware rtl9151a-1
Date: Tue, 18 Nov 2025 10:35:56 +0800
Message-ID: <20251118023557.3424-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds firmware rtl9151a-1 for RTL9151A.

Signed-off-by: javen <javen_xu@realsil.com.cn>
---
 WHENCE                |   3 +++
 rtl_nic/rtl9151a-1.fw | Bin 0 -> 640 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl9151a-1.fw

diff --git a/WHENCE b/WHENCE
index b2a73d16..46f3345d 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3615,6 +3615,9 @@ Version: 0.0.4
 File: rtl_nic/rtl8125k-1.fw
 Version: 0.0.1
 
+File: rtl_nic/rtl9151a-1.fw
+Version: 0.0.1
+
 File: rtl_nic/rtl8126a-2.fw
 Version: 0.0.2
 
diff --git a/rtl_nic/rtl9151a-1.fw b/rtl_nic/rtl9151a-1.fw
new file mode 100644
index 0000000000000000000000000000000000000000..f2eb2c4219b7ebeb6ccdfd44c7bbde90687c2f33
GIT binary patch
literal 640
zcmb7=O-lk%6o!u<nM`7Xb5M!UOGUUz9mynD1Jw`c7s#N7L6(Ra?GEl*1TKpf*~hMJ
zi=a)oX<Mtd{eymjy>}dH8QqzOhkNJDnKLgDQMY%nX_swx&8`*m#k{R-yI@xer81uB
z)d2$#{HavkW<T$$wp&;3VMBFVr>b2)R(t#1_KDkVs*c;Mw^aS8(NuP&THdIxm+1UT
z_X-d><N2%*<v<h|AO_;V1PQ<(3DRHzEP@PBU<s^%RS6M&5=BJ3e&h`1bYByfcfW|Y
zrw+b}I+GkUa40xx5DkfDid#ljmc<g<WywET5+D}cV~9EQv*gGUg|h^#XJYL%iz%27
zPWjIL!+|rF*$<Y!GwpF{O??d;BbG>vB^Y3FZdrz4`wsgDmhe5x>pRQN8|qD#S^`F&
z=NgMbjh<(WcjGsfOeQQb--hp~?}+cP?;!k$_Xxhg3?>|+X%0vd|DE!(@N)9ck)?N*
Uk>6UK@7IJB{AcbCvL%0g0|KF(0RR91

literal 0
HcmV?d00001

-- 
2.43.0

