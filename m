Return-Path: <SRS0=8Zmg=AK=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDC7C77B73
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Apr 2023 11:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37D1AC4339B; Wed, 19 Apr 2023 11:15:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D410C433D2;
	Wed, 19 Apr 2023 11:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D410C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id l31-20020a05600c1d1f00b003f1718d89b2so1296347wms.0;
        Wed, 19 Apr 2023 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681902942; x=1684494942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2MpM85vpJN1NAfvmTqWTUxO3+rG/2D2KEQV4BnQVXg=;
        b=iFy9wyLmXY6v6+ZiTrSMYFGK799SODBLG5NY3Gqo6h5rEclm6OVlafGg0j26BLF94i
         C4am/i9eEr1jDpTmcHmjgj7PEMsXmWKp3sgm+9ZONpu/2/EoA6soYpWJxzZrsfPv5LmD
         gx9jAH7+uCuxr2kKWG4xVRshq1bfz1UhqExMfaZNkamodD4GEuZiU1rZDfXzz0o4TCpu
         Rar2sNS5IrIO4DuoWJbjkPM+4RwAn2qAFYH1jYNMijy0VU0GoAth3v3YhduHiyPrubmA
         OtP2K1712W7WuMUB+oKuE9UKjIq+E03UJWGqVgD0v3bErJHXcD4IKkR11vRW5iF9++Yt
         o4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902942; x=1684494942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2MpM85vpJN1NAfvmTqWTUxO3+rG/2D2KEQV4BnQVXg=;
        b=hz6WFpqajS8Lva0PkfM9PCinbQ2l6WlOyn1udGIQo7+NU65g13r6FWkXPlfV7cSrZA
         1QVsSLk/qFaDkG+vhkJcJ16LqB3U8WXtTOXukfTt+8GoghfEYmaKnGeWXsvAo7yxiyvl
         mJUvHODjcSciivQIAPPOMcWP1we2O9xY8RYm2TgSFsaC2f6lWK6WdoE7EMiiZ8QPO+GJ
         IdTAd6A8XTn1ybx9QjC1J8LEMjEJpVYz9TKWGevKXGbFzi3lAiRFg9PsS1SsJ5Hg669y
         IO7DSmo5KGafmZ1d4psrPD+2lHJcKFAEw7SnuD35f/h+OHqZKv2g97Cr0e1FGRTWknON
         I8Gw==
X-Gm-Message-State: AAQBX9e20dS16Z8+erJ4MVaWIJWYWSqk6+sJtjRr8SD1HTa3ceYLlanM
	eTEIblxhyxOYQ0KotDI9H8IQTBcunqw=
X-Google-Smtp-Source: AKy350bs9Hr8vBLDy7yMWf01wRnplZnO7xtHy+L+R4e5FFH7ikFOvipu2poLwf0MFpKARtPpfo1qBw==
X-Received: by 2002:a05:600c:1d09:b0:3f1:7a31:2c86 with SMTP id l9-20020a05600c1d0900b003f17a312c86mr1824422wms.16.1681902942146;
        Wed, 19 Apr 2023 04:15:42 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id o23-20020a05600c379700b003ef5f77901dsm1840515wmr.45.2023.04.19.04.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:15:41 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] drop cpia2 firmware
Date: Wed, 19 Apr 2023 12:15:39 +0100
Message-Id: <20230419111539.1254128-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpia2 driver has been dropped upstream in 6.3 and the
firmware is no longer referenced so can be dropped.

9ea8a9c72a9b ("media: cpia2: remove deprecated driver")

They of course still live on in git and older linux-firmware releases.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE                |  13 -------------
 cpia2/stv0672_vp4.bin | Bin 824 -> 0 bytes
 2 files changed, 13 deletions(-)
 delete mode 100644 cpia2/stv0672_vp4.bin

diff --git a/WHENCE b/WHENCE
index 033cbc93..9b497fec 100644
--- a/WHENCE
+++ b/WHENCE
@@ -273,19 +273,6 @@ Converted from Intel HEX files, used in our binary representation of ihex.
 
 --------------------------------------------------------------------------
 
-Driver: cpia2 -- cameras based on Vision's CPiA2
-
-File: cpia2/stv0672_vp4.bin
-
-Licence: Allegedly GPLv2+, but no source visible. Marked:
-	Copyright (C) 2001 STMicroelectronics, Inc.
-	Contact:  steve.miller@st.com
-	Description: This file contains patch data for the CPiA2 (stv0672) VP4.
-
-Found in hex form in kernel source.
-
---------------------------------------------------------------------------
-
 Driver: dabusb -- Digital Audio Broadcasting (DAB) Receiver for USB and Linux
 
 File: dabusb/firmware.fw
diff --git a/cpia2/stv0672_vp4.bin b/cpia2/stv0672_vp4.bin
deleted file mode 100644
index 856589042108e5d11e6275afbcc2dd0e5479b43e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 824
zcmZvaZAep57{~9<b#vZjx!sxbg(VgkB4GyM3t31X)`Z!XGiQX8D<plWFTLQ0NCmO5
zm+fA|F)fD;l86!^kR@zLALa|Fn`P`nba$BDO~}KhjjXJ5xAm<L=g;9hf1dyEc{q|;
z2p|cwpcKkrHg~pljWe_wIfL;dXJ~HW3~V#&=A`U4SIn~Z4fZ5^gVnPS*hl^qMI&%6
zusL8pkD{nPI0L8PBy>RswDH99I;C2ABA=!-JR$kEPp((_HOT2JOO)v8gxc?ltK%h`
zbZ~+>sC$MqZZg67+LE+!ELys}#r$B81v{8stXG(ySg%Kmu<r#bb;}aNzVf7chc-U_
zPBWVKrHfn4FYLI@{Kk5h*~2=>{K5LTs|M>xS1s0Yp4h3|u1|X7v++|r(K~4CHGTkP
zpt>oTR4PI|u^)glxo;uRnIkH<L@0(f%p?)K4`-TIn?5NP6>~fxZpjq1S~j@cGSeE?
ziu9!5GGHL^tH6Ta1m^m?@m-DYHZVu6%yU#|DL{o86$nud%0*3zyMf?;m2>vURd-gp
zPyhXYJw(6U$`iT^!ic;*P0^C3FlF+`ATZNhfp|ps%_@=9Y)+9*XFRXJvQbUUDL8~Y
zK`9smp+G{Q1G~ccKulN>R)Z9oqdOd_bdkCvu@X`qfI%`y^8{Fwau+$|e5HWdY%Dw;
zk-;e!*wpr~$F$-4fzhbeZyOi}pQXLn<#{E;9&beEl5Bbh?nN7LtuNYuJc(LVXDvW=
zJ{$7z1aVsAYs*XVO|+@-CSRs0NeNGo<mjEDp_HRF<?v)`2RNlTy<Vwkw7(JOjN6g@
z`5sSLSziaD5pB5?rjfF}FpRkgf-LXuyw!QFlaP^>Vz+3GCEwB>cg`x@ltr6RqN4CS
yOFmK-Rz!ds^JY>S3y<<dw949pvq+e2?coggUpw$y5jqq;f$U-SOEo$!Cj13ZgO14n

-- 
2.40.0

