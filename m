Return-Path: <SRS0=Qrxm=YO=mediatek.com=ryder.lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B5C00140
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Aug 2022 16:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 461FFC433C1; Wed, 10 Aug 2022 16:45:31 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26B92C433D6;
	Wed, 10 Aug 2022 16:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26B92C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7030b5b00643403aabe4e7cf862ab20b-20220811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xjxCoi5hOqipKdbAywsT9ZQgRnNFcm/4tZuCvBDtqy4=;
	b=TKMFFNPYse12ezEuJc2DJnCkxvAXbngWuun4+MBnG7Q7iam7410/bDJrS73MQSbrvhne+vprTW7AI8nA19xEabwA5kVnu4ouR9niV4jFZkAoldcSTdp+2tYy/3AZ3uckaZyS9n8ULgiCyx4SrvDgSUBhbXoy22FUak+7IASx2Tk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:d7b3ad0f-fa64-428f-bd21-e5294a6ce10e,OB:0,LO
	B:10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:51
X-CID-INFO: VERSION:1.1.9,REQID:d7b3ad0f-fa64-428f-bd21-e5294a6ce10e,OB:0,LOB:
	10,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:51
X-CID-META: VersionHash:3d8acc9,CLOUDID:06b34c9c-da39-4e3b-a854-56c7d2111b46,C
	OID:db721e920402,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7030b5b00643403aabe4e7cf862ab20b-20220811
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 212922149; Thu, 11 Aug 2022 00:45:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 11 Aug 2022 00:45:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 11 Aug 2022 00:45:20 +0800
Message-ID: <0e387e3e57388bb58449feee12b54cfe414836ba.camel@mediatek.com>
Subject: Re: [PATCH 1/2] mt76: move move mt76_sta_stats to mt76_wcid
From: Ryder Lee <ryder.lee@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Evelyn Tsai" <evelyn.tsai@mediatek.com>, <linux-firmware@kernel.org>,
	<linux-mediatek@lists.infradead.org>
Date: Thu, 11 Aug 2022 00:45:20 +0800
In-Reply-To: <a9ded159fd293b25c745dea966e5b00a2601e56d.1660092593.git.ryder.lee@mediatek.com>
References: <a9ded159fd293b25c745dea966e5b00a2601e56d.1660092593.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

On Thu, 2022-08-11 at 00:37 +0800, Ryder Lee wrote:
> This is a preliminary patch for WED's TxS support.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76.h     | 42 ++++++++++-------
> --
>  .../net/wireless/mediatek/mt76/mt76_connac.h  |  3 +-
>  .../wireless/mediatek/mt76/mt76_connac_mac.c  |  4 +-
>  .../net/wireless/mediatek/mt76/mt7915/mac.c   |  3 +-
>  .../net/wireless/mediatek/mt76/mt7915/main.c  |  2 +-
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 -
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   |  3 +-
>  .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 -
>  9 files changed, 29 insertions(+), 33 deletions(-)
> 

Oops. I sent to the wrong mailing list. Please ignore these patches.

Ryder

