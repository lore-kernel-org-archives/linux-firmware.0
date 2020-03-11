Return-Path: <SRS0=zcan=44=lists.infradead.org=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DADC10F25
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2020 03:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B7D20578
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2020 03:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0Prc05o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iERI+jak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B7D20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T7f7CgmyTnER2jhWPn8Ik1hzbiUuS0zD7u2Bt5SLx0E=; b=I0Prc05oMJTGJS
	XluSfRyfaucCo2VCOQoTbBK4fmo8uKAGWJq7cO58oPA0uXmWplbWxaE/qEiDgfdDxolAacp6K9EdH
	jma1/AUo3beh6zYKPlm4/zu4zzZFsGFUym/n3tj2KRM4XzBWVQxz0NJ4FfjMw73l+yXnM6F/UFYZE
	NNBecOXmA8nsGgxDDprKHpNOXxKhodVhTW1+wI6K05UMXh7PSNedZVDFizxLSPBKbvZwJGcmQM0pg
	fhF89xuOHbi94iLln+GUozoKjfcncMHDLf6Y/dIFP5PDO/nTmmYhO/Wrl53IvGL1QnLjfrTb1Z4yE
	6n0Jq9KWH6cih1XF92zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBsAV-0001kC-Ha; Wed, 11 Mar 2020 03:36:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBsAS-0001iq-At; Wed, 11 Mar 2020 03:36:25 +0000
X-UUID: ed183455145b4cb0bd93342115f93a52-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DPJUQnv87RbzN8dm0Mgk9azwyYcGOhnHBbgcNu92ga0=; 
 b=iERI+jak/HtMasoCvWXvUVw192XtrcERlG2u980a1zpgERP8wFU7foQ3UYStKaKb9IoBEKp51wPndZ01t5tthjGJZhPYwV/6NEBtFSh0vg54X+sRXqkXP66IJgZtStHfuirh/KnKuMIsW7yKirTbIWqZYlzOA2upjLNd0dhkwXU=;
X-UUID: ed183455145b4cb0bd93342115f93a52-20200310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <erin.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 211004139; Tue, 10 Mar 2020 19:36:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 20:36:23 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 11:35:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 11 Mar 2020 11:35:23 +0800
From: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: Create Mediatek MT8183 SCP firmware 
Date: Wed, 11 Mar 2020 11:36:01 +0800
Message-ID: <20200311033602.31905-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_203624_386695_71F3659B 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: menghui.lin@mediatek.com, maoguang.meng@mediatek.com,
 srv_heupstream@mediatek.com, drinkcat@google.com, yunfei.dong@mediatek.com,
 linux-remoteproc@vger.kernel.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, shawnku@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20200311033601.GT6-yssPDVJLHKv7oyzq1KUult_v8J2galk3RKe8J_s@z>

The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:

  Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)

are available in the Git repository at:

  https://github.com/erinlo/linux_fw_scp v12573.77

for you to fetch changes up to a52150d8e1fe65994464b15ea162bdc89ba61ce8:

  mediatek: Add mt8183 SCP firmware (2020-03-11 10:36:45 +0800)

----------------------------------------------------------------
Erin Lo (1):
      mediatek: Add mt8183 SCP firmware

 mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/mt8183/scp.img

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
