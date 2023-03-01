Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD254C7EE37
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1D22C43442; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96AA8C433AA;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=EgmmuD88HMGoC//SRbEAtyMBH/iqeHb6QKYyCyBVteg=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=EgwnROSYb1GXWyP9A6z6nrq28OrrfRhoOsPDIlGvTM3yYI0fl7JjHaPlucjRc5vgu
	 65bfwL7SjspzNZsuKslaUrrJPeyhMSMIKMSA/PscCzJw5rjvytDGSJdfOxhkIFAh9y
	 1UbTdemh4qgtipO1lJz9j7BHT6llzHA41Q2OsR//oGDsLNVMveK9Lq6ah7FheeLKkU
	 iCWwo5PM0Kuc40gOvUHPLWaZwgTcUwO8zWPpJTAi3GpL5YY+W/MKK3qLcFll8dXgBU
	 U9d/k7I1zjeMDXzgvd18gLzIlegvgj2W4ovHNNdDzPrS/fbNIasxVjOUsgRNYKEjMr
	 RLvadYohb72tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A4DC7EE37;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:19 +0000
Subject: [PATCH RESEND v2 05/16] WHENCE: comment out duplicate MediaTek
 firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=777;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=y/dsWtna2WkULqajga1juBXTFdyO0iJ6fIGKMsgSkJs=;
 b=8mPWGuKxknU01+gpIjc4cBlDjm1aNQpar8GYb4EjQ2C4BtgCUtAzO47EieISM0hjkqE3MEN7S
 rPMtmWX/MJZB0lnyMMLowkL82xHhgOVh9gUikHsLzG24nFe3HBJEdBy
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

As mentioned in the inline comment - file is already listed further
down. To prevent check_whence.py errors, comment it out.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/WHENCE b/WHENCE
index 7de6d6b..bce94c5 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5183,8 +5183,9 @@ File: mediatek/mt7622pr2h.bin
 Version: 20180621204904
 File: mediatek/mt7668pr2h.bin
 Version: 20180517181834
-File: mediatek/mt7663pr2h.bin
-Version: 7663e2ccn04-2006030247
+# Note: explicitly commented out, since it's duplicated further down
+# File: mediatek/mt7663pr2h.bin
+# Version: 7663e2ccn04-2006030247
 
 Licence: Redistributable. See LICENCE.mediatek for details.
 

-- 
2.39.2

