Return-Path: <SRS0=1QMK=Y4=realtek.com=hayeswang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1CAC61DB2
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Jun 2025 07:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20B9BC4CEED; Fri, 13 Jun 2025 07:12:00 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7FFEC4CEE3
	for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 07:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7FFEC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55D7BmE923775645, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1749798708; bh=BmFJppDebLfBS9qX/m90tDIXMs7h0ldahE5MzFzrQrA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=S2PK6WUeQMS50WTJW7Hfy6+gG969GiUP6e3EkjD4ncjMBJxMHD2eJ+c/YDr/oS8Ux
	 HOBF7AdxzvBdhjmgavEE/jHsZKFabobJL8PN69pOt2+3rbnZwhFURNr6pF1zzq2YnI
	 jzAO+BcAmZwOurWz8Yx73D3gkI/eqzRd5e2nEIfvjH8+kqai3OTYq2fubB6wOvw3gD
	 xbvBzWrxyK329VxSiCETHilwB0/uTZXsUfTqjgk4PGpl8n+6foboNY2HVoDyA/FOAJ
	 iRi+ZexAvraPI0clRmMNvXY+4yMiXINlPuW5UUxSrNDZrw3GES3hN+k2e5BbhUteRI
	 yrB0YDR+s1f9A==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55D7BmE923775645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-firmware@kernel.org>; Fri, 13 Jun 2025 15:11:48 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 15:11:50 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 13 Jun 2025 15:11:49 +0800
Received: from fc40.realtek.com.tw (172.22.241.7) by RTEXH36506.realtek.com.tw
 (172.21.6.27) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Jun 2025 15:11:49 +0800
From: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <nic_swsd@realtek.com>, Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH linux-firmware] rtl_nic: update firmware of RTL8153A
Date: Fri, 13 Jun 2025 15:11:39 +0800
Message-ID: <20250613071139.19299-443-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

-rtl8153a-4.fw
   version: rtl8153a-4 v3 06/12/25

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 rtl_nic/rtl8153a-4.fw | Bin 712 -> 1184 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_nic/rtl8153a-4.fw b/rtl_nic/rtl8153a-4.fw
index b0c5e02354b1cee6f3849775b32f9fa39951afc7..a1d5745131421b933cd0ef9bf759592ae79d3f0a 100644
GIT binary patch
delta 798
zcmX|<UrbYH7{=doTFR-Y?P=AvoKXv_$YhRkj%Z_MXvvJ{+sxvB$Cg-+twSbJ(Wd^n
zkb({IAfnJ2B{K|z|E`QCB)ViVU(uZGVoQv0(Tl}=Ze#iG_|9Ac(}GKD;(PU6yuUo}
zo9FqZY}9^e?%adZPd4BEdDGdcia)%$+fV=A`tbbgKW|mvoc?ErY}<T1*%5ARQna<}
z0x2aBTHnwpH^@!!es}=b$^q;Gn5!+oXt+>-x`F^NR<tY|@~n5+Y{^dtY<udnQO*<G
zy|X2@bI+IZx+Wzihh#aV$O;H#DG^DK)DwklB;O2<b#{GVV9hEnH+=@yt_Q9M?V`h6
zW^g{NyK`<MI0F9Kf!fpzS}<!;Lat_{+~9NY(`B1?{PXe4zow^z-<`Bz;5LTbjH&q2
z#L3yGvqom5=f{43??7*fe1pnZxq%ZA75DQ7Jg)h;WBg(w2pm8ae9r@X_3oo|xZr@g
zf)#cMLyP-`GeS1X`D>tf{$~f{@`l*44lQ;}OU4hy;ztt)!Ad-&k$7Kbd$@gFUOkC_
zqv;e>9eMKYfl*{*3CwryA3l(?kQm;d<A*_WNUc$e+iU)X0_HUGvsNR2;vo_kSCMvG
zSpI^AG^_a^wqs{yMtVTMn25wf>LN0Y>}(5$%8Yb}MkgZi`)cGuo7il&D>AN&JU0~#
zzV0q*n1-;mG9z7~eRK>hur;`s-cU2rMG95z3ivtOTW=^bZ?43U`Xn-IR;xaok<QYj
zaGc&i^GqyRr08LK3oS4^=6v1KQTjD`RI!bogB}QsJM)>T^OH^j`QX%lcrR6zR~WSK
z@D|a+y7r1?CTJcN^e8C?`3%{aRV+6_yNbf>stS5Nfzr;93VH*vm9(gW{t+n?9VTd5
zRA~;PMQl(7-9Zct+O@#7;3_fw_VtX%4C9sb3Uaf5XGF6RgEoYgn64s?!3X;40Os@$
v@lxtiyQSsyUMT`AOLUH5ewfGbs3lv?*Snn9Mf)ZpU+hqez1V^5HvZKA#<@W~

delta 318
zcmZ3$d4e_Na5Gz;k22%E*QMM1l6Nh=`^-0|>}bE_&*gkB3Y)~QC>53DSQwfbC+eCg
zlo=@)80j0B>l+y`zyT8j1H%Ib28Iv@h97Ew7#3Lkv18Eq!^Ut=%t>UDxS0?eTZzr&
zjf~PNrNv3{1&Jle8SzF2hL#4F29^xn|2ZD;JrI1L@<986@dK*|HWL>YYB3#S*vG&C
zAsHDM7z`L07-ArXH(2~(XVCb=%n-yeiKmBS@<v8EH3kNTf}BLC$;tUCsSx9h4GrTB
z7<xS!m>-BeFnBQe17n<{*#U;cISO-Bj1RC2vVLSp6!&20<bA**$o-Kaak?kRhv^;+
voyrIJUI=+KN{habKfsWfF39qM=>WqHCr%JKVe)HcZI*x+U6&_ouv7p5hs<Xc

-- 
2.49.0

