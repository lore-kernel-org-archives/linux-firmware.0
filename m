Return-Path: <SRS0=nHsr=TM=realtek.com=hayeswang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E98E77184
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Dec 2024 08:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3C47C4CED0; Thu, 19 Dec 2024 08:49:08 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0552C4CECE
	for <linux-firmware@kernel.org>; Thu, 19 Dec 2024 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0552C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BJ8mtKyB3743570, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1734598135; bh=LxLW6jvUsTwlqNdIBESKS/thBwChNJxIe+ELDi0MHfg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=BwRTdj+Ji5L7d2YQTfOL7Zu/sU57IA4wQA3l5krHZ1U33VvscBBo9GXFkQj9+Y+J+
	 B5XzL5fhRrx+9y2xCFY1Xl6WQEbqbYqsIHUpy4vXRCxEIloqjB4OtnRj6UxyVtI1aq
	 nBe+NXCHPwFpibCaIbXQR7TEHLVj5wqYpTgiU4MeNdf7NenfDTGuSl7Bud12KK1xu2
	 fL1a3WHA2h7lmYbsWaxVdahPjd1s7ncs9oGOGUUxsTb+UPlc3SC29or0aajTFSsiV4
	 ZSnfhXzJkDVWLnWsdBE9QqcZbMGdYnGdRAgG/krg1ZwUd9e+iaa63Qyo0ZplZ7OQOU
	 X8c/9RH/cy+sw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BJ8mtKyB3743570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 16:48:55 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Dec 2024 16:48:55 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 19 Dec 2024 16:48:54 +0800
Received: from fc40.realtek.com.tw (172.22.241.7) by RTEXH36506.realtek.com.tw
 (172.21.6.27) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Dec 2024 16:48:54 +0800
From: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: ChunHao Lin <hau@realtek.com>
Subject: [PATCH] rtl_nic: add firmware rtl8125bp-2
Date: Thu, 19 Dec 2024 16:48:52 +0800
Message-ID: <20241219084852.8737-1-hayeswang@realtek.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS02.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: ChunHao Lin <hau@realtek.com>

This adds firmware rtl8125bp-2 for rtl8125bp rev.b.

Signed-off-by: ChunHao Lin <hau@realtek.com>
---
 WHENCE                 |   3 +++
 rtl_nic/rtl8125bp-2.fw | Bin 0 -> 752 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 rtl_nic/rtl8125bp-2.fw

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
new file mode 100755
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

