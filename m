Return-Path: <SRS0=V9Am=WF=tuxedocomputers.com=ggo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28977C282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E79CBC4CEE3; Tue, 18 Mar 2025 13:40:30 +0000 (UTC)
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E853C4CEDD
	for <linux-firmware@kernel.org>; Tue, 18 Mar 2025 13:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E853C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (host-212-18-30-247.customer.m-online.net [212.18.30.247])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 28D912FC0190;
	Tue, 18 Mar 2025 14:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742305219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Eq/ebP2CwM8wTQ/fwb2hWC6lSTwZgA4O8KrnlqmEgmU=;
	b=asv/mvU2GdoK+zoyUo++r/22A6/BQ+1ibi6sY0mldkBVFa1zwoUySI6f0ZBoGNlNvRSgl2
	yRyturHQY963jQjLs84wafwaG1JmDH/RCeJkqUnjxGD6TXYyDfG54KkQb0LA7h4TnKhI2Y
	5RiBWxoDXFLy3Ndyp2Y2R377mme9nAc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
Date: Tue, 18 Mar 2025 14:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Christoffer Sandberg <cs@tuxedocomputers.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
From: Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH] ath12k: WCN7850 hw2.0: update board-2.bin
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Added an additional board string with qca-swiss-army-knife:
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,
qmi-chip-id=2,qmi-board-id=255

Tested with 2.4GHz, 5GHz and 6GHz (iperf3 -t30 --bidir)

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 ath12k/WCN7850/hw2.0/board-2.bin | Bin 1986952 -> 1987068 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/ath12k/WCN7850/hw2.0/board-2.bin
b/ath12k/WCN7850/hw2.0/board-2.bin
index
48f18e23014c4a8d1d771c4bd1ed1ceda00a33ef..659acff5411e6f10accbf227b46088fa83ec0291
100644
GIT binary patch
delta 89
zcmV-f0H*(lqj~(Jd4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
vgcO7ogcgJsgcyVwgc^h!v>f=90qB>ptr1g~OqCpV0WpV9l^nNEl^r>}c)}mC

delta 87
zcmV-d0I2``qj`v<d4PlggaU*Egam{Iga(8Mgb0KQgbIWUgbaiYgbsucgb;)ggc5`k
tgcO7ogcgJsgcyVwgc^h!v>f=90d$wKtr1g~OqCpVhc=cRw>Fj?#=AG9A7=mn

-- 
2.43.0

