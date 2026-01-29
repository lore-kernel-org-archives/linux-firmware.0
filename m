Return-Path: <SRS0=XO7x=AC=realsil.com.cn=javen_xu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E16D46C1D
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Jan 2026 02:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D969BC2BCB2; Thu, 29 Jan 2026 02:40:17 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F1A8C2BC9E
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 02:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F1A8C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60T2e0miD2175716, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1769654401;
	bh=flGJGiDOuDV6R2cNtVISqDNuRlgSv7+9ZfASD4w/MW4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Q2LhdyuWH9wsEcSdWA+MBu0/3T8+QxltGXxWAqXNU9mUxAo+QX719xoL5D2B4IBQX
	 gQag/qaymJpn5nzjQpYknS0DqOxgR4lYJtWDP/KNk2sAmHvAoI2bLhHt497t95fBBr
	 1cEw3HbKPpu2sR08sYLZGl1u4vGaybpACMEKLPhCplxintJkrjyFZ/EGdDD3NCSnJE
	 QzpqnP9C0Dd4KhLkzR7LuHY/Pkdp5iuQBr45H/OcG6FtH7b0uVcVgQsols1syD0XEs
	 Dq0QaZ74gan/rd+Ix1mpTl2HSwzn64nAV15bDiRvfmk9fmlx8cqjFANRDbJRSaSSRU
	 rpWtf4no1L4GQ==
Received: from RS-EX-MBS1.realsil.com.cn ([172.29.17.101])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60T2e0miD2175716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Jan 2026 10:40:00 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS1.realsil.com.cn (172.29.17.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 29 Jan 2026 10:40:00 +0800
Received: from 172.29.37.154 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 29 Jan 2026 10:40:00 +0800
From: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: Javen Xu <javen_xu@realsil.com.cn>
Subject: [PATCH] rtl_nic: add firmware rtl8125cp-1 for RTL8125cp
Date: Thu, 29 Jan 2026 10:39:52 +0800
Message-ID: <20260129023952.1338-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Javen Xu <javen_xu@realsil.com.cn>

This adds firmware rtl8125cp-1 for RTL8125cp.

Signed-off-by: Javen Xu <javen_xu@realsil.com.cn>
---
 WHENCE                 |   3 +++
 rtl_nic/rtl8125cp-1.fw | Bin 0 -> 1728 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8125cp-1.fw

diff --git a/WHENCE b/WHENCE
index 9f6a9f52..f148485c 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3675,6 +3675,9 @@ Version: 0.0.4
 File: rtl_nic/rtl8125k-1.fw
 Version: 0.0.1
 
+File: rtl_nic/rtl8125cp-1.fw
+Version: 0.0.1
+
 File: rtl_nic/rtl9151a-1.fw
 Version: 0.0.1
 
diff --git a/rtl_nic/rtl8125cp-1.fw b/rtl_nic/rtl8125cp-1.fw
new file mode 100644
index 0000000000000000000000000000000000000000..210f14c38488faf51c072d3e3c819e5800e06345
GIT binary patch
literal 1728
zcmai!UufG^6vuDUG^<$`LwlCRTH2p&C}nP0lCE7T>Vi`d@lUB^%v!r<NlTS=hEUs8
zMmg5D>pF!F^uZVD=BA+Ho&*uJ8c<&*Zc^Es{Cp66a)L0cg7I^cUzr2NwujI6o_p>&
z_n!OfHO83Y<gwmVx;t0cojQ_CBojSOGPNhYZ%?|1Nq!30S)Vaa+>CUJqf?2jGm*_X
z+2eVqFh1i<<X&*bo-IyHXN#jwAv>8HcXH3?N1b$6U%I<*Z_3o#T%^gAZf{j%I<Yz|
zgw<nVEP^#)f<>_y)`T@<EtrF~VR5WOYm9M?396DW;u;m#uTeLkF*m49Zk;x}A#HK%
z)p5hx=0-H`HfV<{+UZ7hryJ8<Zj&b5W=*;+8u;8%e~H{5$F(=!q0y_I>i=@5nooC8
zD}hd;)9AhE9&|6d4}A~%K6D0sKl%amL+FRmkDwn#KaTE451<dC51|jE2hl_5Ve|<4
zC_0ZGLyx1MLmxvQM;FjV^dx!;eFFU=`XqW5t>`&zFU;#5W>K4JmedI^Yo*s3)Sh^q
z`YJs)nYpdD{}FyGf1hb(Yzo|sYh4){oiYB^yfG`r)FuyvTD4sp)wGKyK58V7sLip$
zec8F_Ds%W6;KmkFfxgS4V|Pi#U%k&;^}xACZT5>EgazUb!Sa65!yX4c4tX5*IO4G%
z)=<;dcD&lQj;(ECq7kJYywl^|9#bCod0hAxhVUg9L~H6r{oBd)D*AQuT@&pe5p~|J
z=6-UU=oWl8GNQiIq5<?-=7TS@?u_Wl9B~oR$HG-kH&kP$XRGVKV7<+mW4+z$b~}c#
zO+UHp_-*!K`Hm&=?O90PIQizkrXIehtPeKB-^;hoTmKNb{=~mb{N{bwbu(ktb@xJh
zmgte{_{wmV2Uzzj>-JN-JILA3(T{mi+ar5Ed)6Rl&BIgV_Fu&4opYYJw?s2oXq6b-
zOCMwWE0{xkfI0tr@Pg=9S4AJZQmy$kHUFZf!~Ets?Os1*Z+0KM?LJ--U9xAv{|xbe
z5P!ywy}sD^H;A`=dy_R```r*z?=j@D4xVN{2+zX+Y~04a;2Jb=07hV|5k1NG{|V=t
zg$tKNFMUT}882EL=S~*?TX()My1rHPHNWV>8Z|aVOWfCOAMo9-i>~#HZjdX>{8~x$
zd(KtSKZt&#<fg_iKZy>IXXd(S?Qf#xpV{NL)Fj`vHoimFt)GJIb<pMs@x8F868+e5
znON%Bdk77({)T85Im;*T)0<(=^dn~&fm2<gN1^Rm-s7UjC6CJ<U-8%r?f;~G8zPmr
ld`IPdsJtDX-*|6Ei#BTfrq5h28;807eTy=@H|8Hde*-ZO6(0Zq

literal 0
HcmV?d00001

-- 
2.43.0

