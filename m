Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA190C7EE3A
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87844C433A1; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 662F9C433D2;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=xfHfzmLPQflUfEVXhqYWQZzXNSW0JdlIEFytWslZ+uw=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=KmkeUqT9b2esrqbRPN2lcwQaAdfcBWN0B3mr+0lfmEPuvkMipUFY9/x0KlZVMVBP2
	 R823D62kt45MACVY/vctGvrcNSWBnoU/qqaVx5AWgEMdPn0LR8El5+cDtemenxj2An
	 LUeLiBikUc0dX7LOgMirDc+TnOJaRqEqtJI/hXo9z3glGJMkuEdKQszxtJy56uu4h1
	 q/Ny3WAm9hs6hvTlfhaYniSIn2APXKrwKA9jCoJlK6OxJHgrTsI9LlSj9fwt7TfAwS
	 81mwn1uy4vEqiTh/VhUeg59gqdcJTiPZmdOJl8PglMymVPhHSUmJ8HEBCbA66kVV+v
	 CgoewnehyeYKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447F3C6FA9D;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:15 +0000
Subject: [PATCH RESEND v2 01/16] WHENCE: remove trailing white space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-1-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=2576;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=mgS7Y0cvjYzJn1nYe+Iu8x0mMDsUQ+mbNDsX3/lyyJ4=;
 b=zPVSE7qs/dMW5PT4gBQNKjRFzWtByRgh5ChM1tE173Yh/X1JMOnsUvYlTCjfbDz/1bl/Yf2Eh
 dtYdCA+5IVgDWKvCrnjTCNp/jrZDVnKweLdPGo1alo3iZ6ht2TsFlzZ
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/WHENCE b/WHENCE
index e957cc9..205162e 100644
--- a/WHENCE
+++ b/WHENCE
@@ -395,7 +395,7 @@ Version: 8.07.00 MIDQ
 
 Licence: Redistributable. See LICENCE.qla2xxx for details
 
-Available from http://ldriver.qlogic.com/firmware/ 
+Available from http://ldriver.qlogic.com/firmware/
 
 --------------------------------------------------------------------------
 
@@ -2563,29 +2563,29 @@ Licence: Redistributable. See LICENCE.ueagle-atm4-firmware for details
 Driver: ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
 
 File: ueagle-atm/930-fpga.bin
-File: ueagle-atm/CMVeiWO.bin    
-File: ueagle-atm/CMVepFR10.bin  
-File: ueagle-atm/DSP9p.bin	
+File: ueagle-atm/CMVeiWO.bin
+File: ueagle-atm/CMVepFR10.bin
+File: ueagle-atm/DSP9p.bin
 File: ueagle-atm/eagleIII.fw
-File: ueagle-atm/adi930.fw     
-File: ueagle-atm/CMVep.bin      
-File: ueagle-atm/CMVepFR.bin    
+File: ueagle-atm/adi930.fw
+File: ueagle-atm/CMVep.bin
+File: ueagle-atm/CMVepFR.bin
 File: ueagle-atm/DSPei.bin
-File: ueagle-atm/CMV9i.bin     
-File: ueagle-atm/CMVepES03.bin  
-File: ueagle-atm/CMVepIT.bin    
+File: ueagle-atm/CMV9i.bin
+File: ueagle-atm/CMVepES03.bin
+File: ueagle-atm/CMVepIT.bin
 File: ueagle-atm/DSPep.bin
-File: ueagle-atm/CMV9p.bin     
-File: ueagle-atm/CMVepES.bin    
-File: ueagle-atm/CMVepWO.bin    
+File: ueagle-atm/CMV9p.bin
+File: ueagle-atm/CMVepES.bin
+File: ueagle-atm/CMVepWO.bin
 File: ueagle-atm/eagleI.fw
-File: ueagle-atm/CMVei.bin     
-File: ueagle-atm/CMVepFR04.bin  
-File: ueagle-atm/DSP9i.bin	    
+File: ueagle-atm/CMVei.bin
+File: ueagle-atm/CMVepFR04.bin
+File: ueagle-atm/DSP9i.bin
 File: ueagle-atm/eagleII.fw
 Version: 1.1
 
-Licence: Redistributable. Based on 
+Licence: Redistributable. Based on
          https://mail.gna.org/public/eagleusb-dev/2004-11/msg00172.html
 
 --------------------------------------------------------------------------
@@ -3951,7 +3951,7 @@ License:
 
   This SDD ("Static Dynamic Data") file is licensed strictly for use with
   the Sagrad WiFi modules (such as the SG901-1091/1098) that utilize the
-  cw1200 driver. There is no warranty expressed or implied about its 
+  cw1200 driver. There is no warranty expressed or implied about its
   fitness for any purpose.
 
   Permission is hereby granted for the distribution of this SDD file as

-- 
2.39.2

