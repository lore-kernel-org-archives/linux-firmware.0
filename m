Return-Path: <SRS0=q9uK=DP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEABC433E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2020 09:52:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F752083B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2020 09:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y43HKBCD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="SHJLqhpa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F752083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=blqGA6Zhw2CvDF1TSnJ2Ebo3UUnAkRHCm+5d1U34jxM=; b=Y43HKBCDeqZ28Wtm+zDbAARnTl
	rRLbfyKxZfzCPCAJcbF0B+GXqtpJPpdDUgFJRUsGIthXzr4Nm3+PfPk2OSeUftR40NUFwsb1F+Tgl
	OPQHwwzzsBKG7gtg0Ik7az2ZjunDSQJH+1Wlm3T3yav9/y7KmunvI+dYIaXzDaIFhrAje5bwfc8G4
	pcY090s79/IzdspblSZpUurnl+vqR3mIS8HvwxUqzhlpvsLN78dNIBITMxd11yPAHdGYyWzAoG4a+
	uy2ssV6cj6piD7uDBTW4ryzUmDJwELDr0Mob2erq0BvXY/dLwU3A8wvwqUJDTm/gsDxIKcO/2Y4xs
	2jq9owBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQSZ9-0004jB-Vz; Thu, 08 Oct 2020 09:50:28 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQSZ6-0004iH-Tb
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Oct 2020 09:50:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602150624; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=nWdMd8MZpUYyOsN0kzXo+k8AyVDvs4bqcIXdBl3u4uM=;
 b=SHJLqhpavWm/fYXy5YGVpRjToNO5TsDCoOTKH12imSKOGvjWtsYkpRBgWdtVPd822mmPcyw+
 Y7+e9+wZNLRG107Sevj7+4JrCT7cMTc6bmLoWLlG3yPBS8H8JBhxfrcB1LoRNUgU4Cgp2mrj
 21NqYJvZx1H3NCoj5yigFgWQ4Lk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJiYzAxZiIsICJsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f7ee0de57b88ccb561ad864 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 09:50:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B7684C43387; Thu,  8 Oct 2020 09:50:22 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asitshah)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48117C433CA;
 Thu,  8 Oct 2020 09:50:22 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 08 Oct 2020 15:20:22 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@infradead.org, linux-media@vger.kernel.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Subject: Update venus firmware files for v5.4
Message-ID: <290a085b0fb686ce6aacbd02be560e52@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_055024_987181_70B728AE 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: dikshita@codeaurora.org, vgarodia@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201008095022.qtatLyH_jUHJzOIdL_ARSINB6S9TYvru31nzo3h5NVo@z>

Hi Team,

Please include updated Venus Firmware bins for v5.4.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>>> 

The following changes since commit 
00a84c516078defb76fbd57543b8d5c674a9a2be:

   linux-firmware: Update AMD SEV firmware (2020-09-16 08:01:44 -0400)

are available in the git repository at:

   https://github.com/shahasit/video-linux-firmware/tree/master

for you to fetch changes up to a09b728b77f5e3b335ff85c6c729248e0121f02c:

   qcom : updated venus firmware files for v5.4 (2020-10-08 15:07:59 
+0530)

----------------------------------------------------------------
Asit Shah (1):
       qcom : updated venus firmware files for v5.4

  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 870812 -> 873100 bytes
  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn | Bin 916924 -> 919212 bytes
  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)

Regards,
Asit

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
