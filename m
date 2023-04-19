Return-Path: <SRS0=8Zmg=AK=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2111C6FD18
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Apr 2023 10:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2FFAC4339C; Wed, 19 Apr 2023 10:58:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40450C433D2;
	Wed, 19 Apr 2023 10:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40450C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f177cb2c6cso11061215e9.2;
        Wed, 19 Apr 2023 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681901883; x=1684493883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NxTGk07kTs8WmBTICLE5hcFrRUC9SNU8xlZl+g6cbEk=;
        b=cPEBPUi8IL7DHOE1eYXp3w4KYMVWk5G4A8qgAAjvOPVn1wYvnt7T0CS4Wzdta4t1j/
         CEzbajSj+jNbfd5Zynegth7kBotYnnSvxoffAZvQj6WlMEXiX24X8/qOBTwDu4kxA9KR
         XbbHotohe4GZZKyZOBFeaRdvve2pcxMlW7SLxUqzLNbRXHf5mbLKht5ASAXukQgL6vTg
         YWREIUs5fZTnc8TLjceIrQqPn3fpuCHMDo35a3tlTC5LDQKxjoRzKvK64AS//av/DMG7
         RmkdBQ5xdxqQNpHtR/8qC/fCzNL2Z3JgbAg9fMuvJB2qlBDIO4cZXSl3DdBA3w4P3P7f
         2D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681901883; x=1684493883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxTGk07kTs8WmBTICLE5hcFrRUC9SNU8xlZl+g6cbEk=;
        b=UY9tV8VKrHERL3j2XmmotG9TiMCVbLTZz54nmsrVtPDSWWgvVfh0WA+Zq18Q5CGL0T
         GWQHDEE3B8wLlMqBuJiiGqrvjKfG91z+EE0yWKj45JCQEL8vXB4clCwBQM+6zDoTkLqW
         u8dgnV6ljLAeqcMZnQp+oC+57CAWV8SwcP8HCJq5zy2tykI5XTIO5I/eYfpolLhz5brf
         AGATrE49ss0F9xbPWhGhn8uIscHhcNrahWPXQJAZqRIgTv8OKs1u/ZZKIj29k1NJB844
         BzXWLQpqGH7/TC0mvskoaR+o9mBDXWX1wgY2Ki5DaHuNtmDUpSLK8Ajf37DMQsQMvPhJ
         AJ3g==
X-Gm-Message-State: AAQBX9eAV1FjhdxSWPGwJNTAWgDfPnHetIF6/n6hqc7BzTNbGqycA9Z7
	JzhhtR+VEwUhGhC48KkrD9KkvM1ZWGE=
X-Google-Smtp-Source: AKy350Yo8V4DKQNrm6pq0aoI6YC7hL5dW9Td/5ELMBpazxei+MNEHYfhYWIQ4ldfvIz2yRwasSYXhg==
X-Received: by 2002:a5d:6acd:0:b0:2f8:f9b0:c681 with SMTP id u13-20020a5d6acd000000b002f8f9b0c681mr4569888wrw.66.1681901883062;
        Wed, 19 Apr 2023 03:58:03 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id y32-20020a05600c342000b003f173956a82sm1817769wmp.21.2023.04.19.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 03:58:02 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] drop matrox and r128 firmware
Date: Wed, 19 Apr 2023 11:58:00 +0100
Message-Id: <20230419105800.1250191-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The matrox and r128 drivers were marked legacy 7 years ago, and put
behind an appropriate Kconfig option at that time. They've been
dropped from the upstream kernel as part of the 6.3 kernel release.

The firmwares are no longer referenced in the upstream kernel so can be
removed. The upstream commits were:
96ed7db55bef ("drm: Remove the obsolete driver-mga")
28483b8666bf ("drm: Remove the obsolete driver-r128")

They of course still live on in git and older linux-firmware releases.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE              |  63 --------------------------------------------
 matrox/g200_warp.fw | Bin 11214 -> 0 bytes
 matrox/g400_warp.fw | Bin 16790 -> 0 bytes
 r128/r128_cce.bin   | Bin 2048 -> 0 bytes
 4 files changed, 63 deletions(-)
 delete mode 100644 matrox/g200_warp.fw
 delete mode 100644 matrox/g400_warp.fw
 delete mode 100644 r128/r128_cce.bin

diff --git a/WHENCE b/WHENCE
index 033cbc93..d48646ec 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1563,69 +1563,6 @@ Licence: Redistributable. See LICENCE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
-Driver: mga - Matrox G200/G400/G550
-
-File: matrox/g200_warp.fw
-File: matrox/g400_warp.fw
-
-Licence:
-
-Copyright 1999 Matrox Graphics Inc.
-All Rights Reserved.
-
-Permission is hereby granted, free of charge, to any person obtaining a
-copy of this software and associated documentation files (the "Software"),
-to deal in the Software without restriction, including without limitation
-the rights to use, copy, modify, merge, publish, distribute, sublicense,
-and/or sell copies of the Software, and to permit persons to whom the
-Software is furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included
-in all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-MATROX GRAPHICS INC., OR ANY OTHER CONTRIBUTORS BE LIABLE FOR ANY CLAIM,
-DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
-OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
-OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-
-Found in hex form in kernel source.
-
---------------------------------------------------------------------------
-
-Driver: r128 - ATI Rage 128
-
-File: r128/r128_cce.bin
-
-Licence:
-
-Copyright 2000 Advanced Micro Devices, Inc.
-
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
-
-Found in decimal form in kernel source.
-
---------------------------------------------------------------------------
-
 Driver: radeon - ATI Radeon
 
 File: radeon/R100_cp.bin
diff --git a/matrox/g200_warp.fw b/matrox/g200_warp.fw
deleted file mode 100644
index 2c7f7fec396622ba946146721295e804fcceec65..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 11214
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

diff --git a/matrox/g400_warp.fw b/matrox/g400_warp.fw
deleted file mode 100644
index 57f1088e06fbc6bc64bc74b97edc32999a42eff1..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 16790
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

diff --git a/r128/r128_cce.bin b/r128/r128_cce.bin
deleted file mode 100644
index 18b00b7b6555e063893b54326ae0e58be02a5c06..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2048
zcmeH{%W4!+5Qgh?kDb<xv5AZ!Xu{wG3<kr1s2SmOnz(VLBDnCf2=NZy!DJ;4L1dyR
z@d*?c;ss<DE<_{tM!bW#@Urs}glydD|JOMk27ClPQ2q5^r@Bs6_4J5{B+W5gK~V;{
zy$K_4!6X|Us*#gZy}QZLk^QI1>6wcuIX8D@maHvYU#YCsG`@D@(UT5sq&-Y&B=juh
zUdLpxb+X<Ac1wwJX_-JO15id}fcs$MyJP=Xunb%0^_LFK`ukwrriv?;kuBF0QAW8O
zHV8BErwZ##`jZ5ZP^3y?74>R;IM@2~-*9t<NNXd=JS6K}1>)S{A!@`Q^*rYMGNO8M
z6VEg2<=acuKU!pY_2#i{)In6?bL`7$sT`pn`HDQF&?TwH+tnZY`l9@|`ZKZW@6tMr
zbP4_FOBeGVf^j~~L*0fk|Fp7rKe7`N{=nsriunhHzvcE9U;WZJ9iK!}mtCsG9tM+U
z-Tnjv{JwUOm=F2)xngJF@0hdYJdNxb1~l(pu*k<ap36SyH?qvXpG2PvP{%&?i#_K!
zIOp|w5c9AXz|MJ0x&3h-i2UOl9Mf4(HVl8t_dp)^baRvRgx4oMPk~q|zZb-7A4NaV
z*2RZ0gCf`&jSF%>OjNh5hyAgB_H!1Ls*L4;5tEZWuuHHqzN^b1e}~VVj+-DJv<m>w
zqaRCkD5WOu;V(4-%p=NqR`H!meNz7qjO4!Vw$^EcUztc(Z!@{7cST>)_yCP_8XrC1
zdcJdUjrY_^_>|Jfyn2oQ-@*Ta&p&V1azCqDd}GRPjd$&I_I(?E^sO6aqH14wt#g=g
z{dVqi4(#zRjQJUFG8aef<`ideqrN+Y{_gI9N#f?g@BKb3lnhs;9nia_3r67H%VUuB
zJ|OX4UV~*=8;0fQYVwB=-2Y7a_|V5AS=#dcXD+Uf4>FGL6VI(V0Ai&F9rb+NCX_~^
UjPqmN><>%Nb+`Yo|MUd@0D=F4-v9sr

-- 
2.40.0

