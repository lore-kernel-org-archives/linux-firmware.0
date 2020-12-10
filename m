Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E759C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 02:19:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED50723BC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 02:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED50723BC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8nSJc5MSD/uAwFh66tm+gYnMScyyGsW1vvvthT4rZkI=; b=JOJ1NIzTXlk9aSS5/GYMZ85v3v
	U4lU3EaL3/8w299BWEQBIUoGoB2MRG3z8dl6B9BLalc02/ifjx7sKm1Lm/+8caggmR/sv40lwgmla
	GK9yzBHUauaDqCovdZfEuSuIhPWT09UyF3vhk9PGmqIshT0+7jXmrb4XAGP3mrngbu3JXlLIoTAbS
	dZD4PLZ/T7x3PYSThm2dDSTuGG2UCYebh/kexQmrWDKM+nMIDX/tHWdgl41o8dmo2jINsnrvTVYhH
	PvYgWn9eNEBXhHmptuSgeom5UlJG7VENtLQUtQTpgzJ589LMk+br/ZLPMzbB5aPQsJxUlwzxc8PiR
	kB8jlWaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knBWp-0006FW-Gl; Thu, 10 Dec 2020 02:17:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knBWj-0006Di-FM; Thu, 10 Dec 2020 02:17:54 +0000
X-UUID: e0b58525224344aea2b7ade3159a0f88-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hPUGXthfBFhPVKwsd/RUdpEoyeEf7xCuwRpy/RK2YIE=; 
 b=ZXI4529gNZRgVGtAd12x8C6kdqPM+nrQ0wHkC0/t2KR8a8cGkeBHTEtOkXr7hGQ2y9ZWWjRNda+lSRoYO09q7XalAt4zou5EVWRu4Lh9guiNgbk38F3xSP5V5eSCCTZGRCKYbi5A1nWJFWpZ8LgjmDDLAVtBnqUq/tIYMO47WrM=;
X-UUID: e0b58525224344aea2b7ade3159a0f88-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 817377750; Wed, 09 Dec 2020 18:17:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 18:07:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 10:07:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 10:07:42 +0800
From: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
Date: Thu, 10 Dec 2020 10:07:39 +0800
Message-ID: <20201210020740.21467-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_211753_706326_C77304EF 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT.Chen@mediatek.com, Maoguang.Meng@mediatek.com,
 srv_heupstream@mediatek.com, irui.wang@mediatek.com, Yunfei.Dong@mediatek.com,
 erin.lo@mediatek.com, Longfei.Wang@mediatek.com,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210020739.qB3meX8NaPLLaL07wxDoDIAxgFt6A01DpkWu0quoCVU@z>

Hi linux-firmware maintainers,

The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:

  Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.6.git v1.1.6

for you to fetch changes up to 0fe0fe022b7f88f581254487b1d1768df1b218bb:

  mediatek: update MT8173 VPU firmware to v1.1.6 (2020-12-10 09:38:07 +0800)

----------------------------------------------------------------
Irui Wang (1):
      mediatek: update MT8173 VPU firmware to v1.1.6

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
