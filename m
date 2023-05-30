Return-Path: <SRS0=I7UB=BT=service.87fuh.top=zt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F226C77B7A
	for <linux-firmware@archiver.kernel.org>; Tue, 30 May 2023 12:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC856C4339B; Tue, 30 May 2023 12:27:28 +0000 (UTC)
Received: from service.87fuh.top (unknown [47.87.144.168])
	by smtp.kernel.org (Postfix) with ESMTP id BB39BC433EF
	for <linux-firmware@kernel.org>; Tue, 30 May 2023 12:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB39BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=service.87fuh.top
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=service.87fuh.top
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=mykey; d=service.87fuh.top;
 h=Date:From:To:Subject:Message-ID:Mime-Version:Content-Type:Content-Transfer-Encoding;
 bh=RgLBMjZjyooaUgIhd/xqRsVLfNk=;
 b=H5VVSXt1pysmD186yoGrTiEhjfo7yXK92xmGFUOl83D+c8t5kwLR5ui4GeMU3QHzp3EsuXChLQx/
   9t2LFeozPfVWKrrgbl9tk5+EFMfw5KyZ49/jTs9Zx9m7rdahLjACdp4DIzoDOZnp+d6JTR+5nyda
   w4xPrQD7JG+M3D1tLGM=
Received: from yahoo2.com.cn (20.210.225.200) by service.87fuh.top id henlqs0001ga for <linux-firmware@kernel.org>; Tue, 30 May 2023 08:27:15 -0400 (envelope-from <zt@service.87fuh.top>)
Date: Tue, 30 May 2023 21:27:07 +0900
From: "global.mynavi.jp" <zt@service.87fuh.top>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: =?utf-8?B?5Zyo5a6F5Yuk5YuZ44Gr6YGp44GX44Gf44Ki44Or44OQ44Kk44OI44Gn44GZYyAg?=
Message-ID: <20230530212716005743@service.87fuh.top>
X-Priority: 1 (Highest)
X-mailer: Foxmail 6, 13, 102, 15 [cn]
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

5rGC5Lq65YuV55S744G/44Gf44GE44Gq44ON44OD44OI44Ov44O844Kv44Ki44Or44OQ44Kk44OI
DQrjg6Ljg7zjg6vjga7llYblk4Hlo7LkuIrjgpLkvLjjgbDjgZnjgZ/jgoHjga7li5/pm4YNCuew
oeWNmOOBquaTjeS9nA0K5pmC6ZaT44Gu6Ieq55Sx44CB5pC65biv44GV44GI44GC44KM44Gw5LuV
5LqL44GM44Gn44GN44KLDQox5pelMeS4h+WGhu+9njXkuIflhobnqLzjgZLjgosNCuaui+alreW+
jOOCguWJr+WPjuWFpeOCkuW+l+OBn+OBhOaWueOBr+OBlOebuOirh+OBj+OBoOOBleOBhO+8gQ0K
56eB44GuTElORSBJROOBq+mAo+e1oeOBl+OBpuOBj+OBoOOBleOBhO+8mnprMTk4NzExDQo=


