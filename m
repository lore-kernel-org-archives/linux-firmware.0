Return-Path: <SRS0=z7r/=HH=bedmex.com=yanli.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77422C88E53
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Sep 2026 09:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3601F1F00893; Tue, 15 Sep 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.127.231.18
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789463756;
	b=FkhPMvZnIpd71FNyPZwJMdcwRiahKPzbHqCJXO1gcxI0kmXEV4UBnXqqtoeGpO0jr58K
	 +me6YM/bNlJAcFtZGBIP/pu79FT3ip2Hh+XHXKdQLEOKTswC+sdntRW3B0OkOSamylXhq
	 x0OviiHy39A/N7lIZn6qr8/ja7XVpawQGP6LE4/4oEhtbhdI5lAjBcJ231KAaS1dQ2zfI
	 M/SOEcmHVIVX39bU7OkmhZmOlZ0RABnfIspe21UB8u1V0cqnGiOUhK6XaWvDYUp8To8Kp
	 YxTvjHu91LxSL7yRy6HwKpNb71P+5eJHdLpnsmLbKxsD9kuihkhVH/BA+1/dELPtWNg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789463756;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Transfer-Encoding:
	 Content-Type:X-Mailer:List-Id:To:Subject:Message-Id:Mime-Version:Cc:
	 From:Date:X-Original-From:X-Lms-Return-Path;
	bh=V4GAeuuAiWMEnNUuu+Bt/vGKCg1cSlmqtum1a7qUxWU=;
	b=RjcVpx1848l7PdP76wvNnM0l/7xt6oyKMfoUYy7eRRtnz9i/33wfVfZyxV0hBtP1e4Fu
	 wEZ2Sx3AbTX/yw0Y7zj24LyrY+zHh5RK2gN0zR7VjgujfTLzBrOy9XdIrhf26hvCMkEJS
	 nEZUWuREQ3DmTrcD/nt7uTIB8hStKZBXQq9SykYQd/9bSEUmtjM2DPj5npqRF/U+STv8x
	 17Tai9WQ0p0SQLbW3SBdLKNX1VwCUGFEcU196q0Ags++L4uhjRu29OKxUoCJ4fW4a0MYa
	 txMJ0ifMftxxS1ww2wl+VmZfY8xJHGSfQia/EwVyhsr45i+X0rHJ5qvYSZHZYbRG6Zg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=wL6f2e0c;
	dmarc=none header.from=bedmex.com;
	spf=none smtp.mailfrom=bedmex.com;
	arc=none smtp.remote-ip=209.127.231.18
Received: from va-2-18.ptr.blmpb.com (va-2-18.ptr.blmpb.com [209.127.231.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C7A41F000FF
	for <linux-firmware@kernel.org>; Tue, 15 Sep 2026 09:15:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bedmex-com.20200927.dkim.feishu.cn header.i=@bedmex-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=wL6f2e0c
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7C7A41F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bedmex.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bedmex.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=bedmex-com.20200927.dkim.feishu.cn; t=1789463746;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=V4GAeuuAiWMEnNUuu+Bt/vGKCg1cSlmqtum1a7qUxWU=;
 b=wL6f2e0ckpeUyDTCR0T9cBNtS2Dv9IQ93NHjs7q4oywgR1OA0HmNZbherln13F59YTng1s
 Csg9qwSl9tHsWIIKX/QYmPzBRE77j4W/5ziHkvfHLN545MgriewBeVJVnUX/CQxq/ahoOg
 0wRuqfoI2xWn1HC0xOCOiMEoh7UDU3DS7lmUfQCvoaQJKkcozZ0zUsoB8hpELkPb5rTYOl
 670BgC4R7P63fIrc+LBaqQ/IeJL/INyD4CnQNB+x3d4XYE4LMPQi+8ffm2/mhJIifE4T/u
 34RUKChu+ZIVWRPvrlrpyJZHQwSkNVnzoE9i+Myjk6ulC78gOKYGvkURd0RCRg==
Received: from bmxpxe-virtual-desktop.. ([36.141.79.164]) by smtp.feishu.cn with ESMTPS; Tue, 15 Sep 2026 17:15:43 +0800
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.34.1
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH] aic: Add AIC8800D80 Bluetooth firmware
Message-Id: <20260915091540.3937692-1-yanli.yang@bedmex.com>
Mime-Version: 1.0
Cc: <zhirunliu@aicsemi.com>, <dijiaxu@aicsemi.com>, <chunqiuliu@aicsemi.com>, 
	<liheng.wei@bedmex.com>
From: "Yanli Yang" <yanli.yang@bedmex.com>
Date: Tue, 15 Sep 2026 17:15:40 +0800
X-Original-From: Yanli Yang <yanli.yang@bedmex.com>
X-Lms-Return-Path: <lba+26aa90cc0+c3d347+kernel.org+yanli.yang@bedmex.com>

Add the ADID, patch and patch-table firmware files for AIC8800D80
Bluetooth under aic/aic8800d80/, used by the btaic driver.
Record version v6.9.1.1 in WHENCE.

The btaic driver source is being prepared for upstream submission
and has not yet been submitted to the Linux kernel mailing lists.

AIC has confirmed that LICENSES/LICENSE.aic applies to all three
firmware files included in this submission.

Signed-off-by: Zhirun Liu <zhirunliu@aicsemi.com>
Signed-off-by: Dijia Xu <dijiaxu@aicsemi.com>
Signed-off-by: Chunqiu Liu <chunqiuliu@aicsemi.com>
Signed-off-by: Liheng Wei <liheng.wei@bedmex.com>
Signed-off-by: Yanli Yang <yanli.yang@bedmex.com>
Assisted-by: OpenAI Codex
---

This submission introduces a new vendor license text and requires
maintainer review.

 LICENSES/LICENSE.aic                          |  20 ++++++++++++++++++
 WHENCE                                        |  13 ++++++++++++
 aic/aic8800d80/fw_adid_8800d80_u02.bin        | Bin 0 -> 1708 bytes
 aic/aic8800d80/fw_patch_8800d80_u02.bin       | Bin 0 -> 28468 bytes
 aic/aic8800d80/fw_patch_table_8800d80_u02.bin | Bin 0 -> 23272 bytes
 5 files changed, 33 insertions(+)
 create mode 100644 LICENSES/LICENSE.aic
 create mode 100644 aic/aic8800d80/fw_adid_8800d80_u02.bin
 create mode 100644 aic/aic8800d80/fw_patch_8800d80_u02.bin
 create mode 100644 aic/aic8800d80/fw_patch_table_8800d80_u02.bin

diff --git a/LICENSES/LICENSE.aic b/LICENSES/LICENSE.aic
new file mode 100644
index 0000000000000000000000000000000000000000..66a9d3dbe8ef58d21c15f61103fe71a5ee9c43f6
--- /dev/null
+++ b/LICENSES/LICENSE.aic
@@ -0,0 +1,20 @@
+Copyright (C) 2020 AIC semiconductor.
+
+Anyone may copy and redistribute this firmware unchanged, alone or
+with other materials, and use it on its intended hardware, worldwide,
+royalty-free, without registration or a separate agreement. These
+rights are perpetual and irrevocable for distributed copies.
+Mirroring, installation media, container/cloud images, and reversible
+compression or packaging are permitted if the restored binary is
+unchanged. Redistribution must retain this notice and license.
+Modification of the firmware binary is not permitted.
+
+The copyright holder grants everyone a worldwide, non-exclusive,
+royalty-free, perpetual and irrevocable license under patent claims
+it owns or controls necessary to copy and redistribute the firmware
+and use it with its intended hardware for full device functionality.
+
+To the extent permitted by law, the firmware is provided without
+any express or implied warranty, including merchantability, fitness
+for a particular purpose or non-infringement, and the copyright
+holder is not liable for damages arising from its use or distribution.
diff --git a/WHENCE b/WHENCE
index eaac3208c246043317e15bb7c653fa45b21420e8..4d4cde22abf1b925bfa39de39cad6b0967e153ac 100644
--- a/WHENCE
+++ b/WHENCE
@@ -10752,3 +10752,16 @@ Link: morsemicro/mm81x/v56/bcf_boardtype_0a02.bin -> bcf_aw_hm677.bin
 Version: 56
 
 License: Redistributable. See LICENCE.morsemicro for details.
+
+--------------------------------------------------------------------------
+
+Driver: btaic - AIC8800D80 Bluetooth support
+
+File: aic/aic8800d80/fw_adid_8800d80_u02.bin
+Version: v6.9.1.1
+File: aic/aic8800d80/fw_patch_8800d80_u02.bin
+Version: v6.9.1.1
+File: aic/aic8800d80/fw_patch_table_8800d80_u02.bin
+Version: v6.9.1.1
+
+Licence: Redistributable. See LICENSE.aic for details.
diff --git a/aic/aic8800d80/fw_adid_8800d80_u02.bin b/aic/aic8800d80/fw_adid_8800d80_u02.bin
new file mode 100644
index 0000000000000000000000000000000000000000..ab3f0578cc214e17c61c9290b0bac9aea19c56a4
GIT binary patch
literal 1708
zcmeH{Ur1AN6vw|ytlzzN=b(a+l*A=0BqUcF?O}nDgyAZSNee~<u7C8Pg4C)JLZf`x
zLxgD$N@jD3NQ@Ze!$Kblf(#5+?4iJF4?Qf{gOtIlqu0?Nd*}~71ReO?-{E|J{Lb(E
z?&0LpjPNicZ!R~ZtdT*x8PiQxJl6bG&+nV`F_I@3O@|qAVa^_vFtT-w@*NESPR8Y3
z4DVLa1;-F$Sg0Fe6t*)`Hiev^6(|G>72*zsvK9r`5rwH^3W+-kg-;cHPZVtT)cpC$
zlMJ(8oA<x{q=qzjZfi&;G?<Sy%$`%|49a<@6_RHZy3Y%p))_Mw6#S&)>=gw^kL10k
z5bINL_9_&MU)wMF*6FCP*5^}XGK=%&bLT#3m?*IJnIAQj>pIdOG}zv2NQ*zfmX_b2
zU&Agd?vLt-G}zI0$)1;%Y@MpN!x{SfJk!q@?&pj9VaYE3|KNY>1>CJNPoj)bVN&>0
z3ym`_3SGjlTK1*Y-^p=1B8lJc_0TJsU9V+c33r7tq4W)-R%Ybvpwx6jdS3`!WmL)P
zxXwrm72?nIGv4;eJnWUV$GY>xCLN`lb)*DGjgIimpVtzOTXDw<1DS_}1}7o7jo{r*
z@N6Lr)DT9i2=NV~RTBK`3CU{FD+rObqM3vjYY5tEVHF{<QnYph*){{ytp+?D25hGc
zbTu1r9xxDoXCRO@;L8~Bir;XYFm;qLc94+TPpI5S2(=KLdkMphgq+JjcM&00OfX9b
z6GCt~p;i%my4=f72t-A{Md%nIJQ$RC_xH7W<W0;&*4&$`(;O$b?-OPhdSuzcPyYPF
M&)&FaAyCBl0%Yu}@c;k-

literal 0
HcmV?d00001

diff --git a/aic/aic8800d80/fw_patch_8800d80_u02.bin b/aic/aic8800d80/fw_patch_8800d80_u02.bin
new file mode 100644
index 0000000000000000000000000000000000000000..e73e2e9de9339187bee3ada096f454ffdcff2bb8
GIT binary patch
literal 28468
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
X*7lZGc+QW86dv$ftpTy+^LY3t$qL5|

literal 0
HcmV?d00001

diff --git a/aic/aic8800d80/fw_patch_table_8800d80_u02.bin b/aic/aic8800d80/fw_patch_table_8800d80_u02.bin
new file mode 100644
index 0000000000000000000000000000000000000000..8ead7efe32cd4b333f89254e5e3f3ccda8170aba
GIT binary patch
literal 23272
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

literal 0
HcmV?d00001


base-commit: 1522c78ab870b3c051d8a3a1d24ecbbc12b23be5
-- 
2.34.1
