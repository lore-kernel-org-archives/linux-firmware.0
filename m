Return-Path: <SRS0=/z3v=TN=realtek.com=hayeswang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE096E77184
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Dec 2024 01:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2ED9C4CED0; Fri, 20 Dec 2024 01:28:03 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E4B1C4CECE
	for <linux-firmware@kernel.org>; Fri, 20 Dec 2024 01:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E4B1C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BK1Rvf76685989, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1734658077; bh=GT2I7BmRJ5ljhEGHQXzwnRplE+tKs3o/oaTSrSJHgRQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=sv+woFte5abboVlCq5cdRlerfgjEw0C6l33ywMVXWYrJnkpAN8bxRTN8ahU6SL3t1
	 l/K+IXKwocRTqn4PD9vm3AB4ZBU+9DQ1rcGHqYM6Fo7JB2y5cNKhIYm/HOy5VbVxMx
	 L55MHKOaQE/soDflbx7tu6uJpMOvMqm40UramvGigNLYDGvKe/xzW076U0Kn40l/S7
	 UzHK5Mn48IoUJaEGx6TBh1SiFHcsmPodT8B2fyLWW6HRECDu01WIexW7XGusYPYGCR
	 +J+YuQfhkDED44FxaJ+bd01fEjJvBuoawjaDVP7ccD2nltJSB+h0cnZtEtWW9DwukO
	 Jb7nJrFMu23Nw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BK1Rvf76685989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 09:27:57 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Dec 2024 09:27:56 +0800
Received: from RTEXH36505.realtek.com.tw (172.21.6.25) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 20 Dec 2024 09:27:55 +0800
Received: from fc40.realtek.com.tw (172.22.241.7) by RTEXH36505.realtek.com.tw
 (172.21.6.25) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 20 Dec 2024 09:27:55 +0800
From: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: ChunHao Lin <hau@realtek.com>
Subject: [PATCH v2] rtl_nic: add firmware rtl8125bp-2
Date: Fri, 20 Dec 2024 09:27:48 +0800
Message-ID: <20241220012748.10723-437-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChunHao Lin <hau@realtek.com>

This adds firmware rtl8125bp-2 for rtl8125bp rev.b.

Signed-off-by: ChunHao Lin <hau@realtek.com>
---
v2:
- update file mode from 100755 to 100644
---
 WHENCE                 |   3 +++
 rtl_nic/rtl8125bp-2.fw | Bin 0 -> 752 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8125bp-2.fw

diff --git a/WHENCE b/WHENCE
index 075c276a..9410990f 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3562,6 +3562,9 @@ Version: 0.0.4
 File: rtl_nic/rtl8126a-2.fw
 Version: 0.0.2
 
+File: rtl_nic/rtl8125bp-2.fw
+Version: 0.0.4
+
 File: rtl_nic/rtl8126a-3.fw
 Version: 0.0.5
 
diff --git a/rtl_nic/rtl8125bp-2.fw b/rtl_nic/rtl8125bp-2.fw
new file mode 100644
index 0000000000000000000000000000000000000000..26f892d0580480dac1099b56576e0099b5ccbc50
GIT binary patch
literal 752
zcmYk)ZAg<*7{>A2$C|R%TsmZ!xYIC^s5z&}7?O_~Vp1U@A|mEqlo@JcGkYQ8A|paV
zLL#DBNJvCPjF7Mw#FmVRh>D1ah=YVgM65paxvRd^1Aq7(o}2r8IU*v7iP1o<e|I>(
z%YVq{^?B=6t-q!=P~)%XPkwQBjTQZyREeQUZ&;0mA}TZ<Rq@yfH5NIlhDQ=($3lrA
z6%S2BVk&YZI;8ymU|k?s=aY?pcIAnfnIbnts#zhkG8?lq2P<YyR?1wgjFqzrrkICS
zvMS_@Xb}s*eGV<C(+1k~26Si(4(LL3YAd?54c*#~9_>J{E=HerqF<L{K)W!g%MjM(
zi0TSh7P;HuL20fM?rat8W;Kd)J210tCziK+AtgQ(<oqy`^>Aey_&)&SM-b`uMyRPh
zkVO+lWea!gMSiXgEy;FxraB<${V31};YoI)CDjF$?1q`@f#mnHK3LNIFrE%T9t|Sa
z9EM(xqI_i-TQV_N&BL(fMp2X*r{laofraD*Y?(=(kMsVMy#Ewb>NI34FrPXDBYPII
zd=9g%=ecVdYwH)dZwAB77x8Ou7RJgY$kJsrI<MgMzN?&{<NS53HqG;VgXaaFZ=%n<
zMc=0HK;$l+rti^<FrM6pJXoS1a^GX_Tc%eyli|!Nou!}A&*>NROZpZ4hJH)Gqu<jX
z=#TU#TGMOvXL_CfLVrcW$Tzq)eTQMo!L#`%{=OYp(AZpv=~gR(P8%{!cJ!JKxc|N>
TF<Y%}RG<WTd`BiN|9!s!`Va;X

literal 0
HcmV?d00001

-- 
2.43.0

