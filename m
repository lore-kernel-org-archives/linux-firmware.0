Return-Path: <SRS0=s5lf=EM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD1CC2D0A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2020 05:11:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF99D204EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2020 05:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f5GcstAD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="QTjePEKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF99D204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgU9UdW0FKcjBCLuXvjHtQLC/HJCHAlRhUORrMUHvd8=; b=f5GcstADmkyawAfcT0fmQr+Gv4
	AaspuY94i9pDeVT8rVxSYkm13wYhEs/nq196FGWueycOEA6Zl1mosye9aM/pDoY9LXWGbTi1fcl6i
	npYknl1AQC8HOFhdnHZvA7UuaxSVBgtNbEND0/iADDjbTZZbr0YZgD8kiu87B0OgYAZfgkXaDY4vk
	mFJ8nZifus1zJB2LWZp40bjBnehbMhsYYjM9eRBfwKIi9dAOFfs4nV7nfUXKA2Zzt43rCaUW66dkO
	Ooz2hfruuitp+aHwd0K11c7IZUxc2jX+IO0M5yZEdEKy22j+DahkcaNDujcxHChhbhll7a/GVyFbj
	kEFfMgJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kau1L-0005qq-Fl; Fri, 06 Nov 2020 05:10:43 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kau1H-0005qU-OQ
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Nov 2020 05:10:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604639440; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=4UR8D5/5hBJVI24Xm9gMBoDEqojzX5OtDodI21zNGEU=;
 b=QTjePEKh+b404qb7l29Dppr1lGh6DGnME6zNKVOsIH4Ko2o8gPkYOvkZegKwgWoZSmt8Tcjr
 CHtjDXyqOQAlg1xbtUzofqXMOGxMcEHFksZSCXpFqnzSRrWw37ka1y5Kfxl55p+WRcwD3tkY
 jVOGikBT1r96G457RHBgKRDhH3U=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJiYzAxZiIsICJsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fa4dac45f52a2916b4339c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 05:10:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 09F9BC433C8; Fri,  6 Nov 2020 05:10:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asitshah)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A664C433C8;
 Fri,  6 Nov 2020 05:10:27 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 06 Nov 2020 10:40:27 +0530
From: asitshah@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-arm-kernel@lists.infradead.org,
 mchehab@infradead.org, linux-media@vger.kernel.org,
 stanimir.varbanov@linaro.org, linux-media-owner@vger.kernel.org
Subject: Update venus firmware files for v5.4
Message-ID: <c1bcb5eedc160e99d65576d431816a41@codeaurora.org>
X-Sender: asitshah@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_001040_327593_8C28BB6A 
X-CRM114-Status: GOOD (  11.14  )
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
Message-ID: <20201106051027.JRGWmNDTlaQO5_vXGyzjC-2ZUuBWPqvW5nZJKFnERFM@z>

Hi Team,

Please include updated Venus Firmware bins for v5.4.

Snapshot of pull request is as below, let me know if anything is 
missing.

>>>>>> 

The following changes since commit 
dae4b4cd084102cd49c37aa8b579b208028ab025:

   Merge branch 'v1.1.5' of 
https://github.com/irui-wang/linux_fw_vpu_v1.1.5 into main (2020-10-23 
08:10:37 -0400)

are available in the git repository at:

   https://github.com/shahasit/video-linux-firmware/tree/master

for you to fetch changes up to 8a46c32a26b3f22835543b158877aa0b0e01e8d6:

   qcom : updated venus firmware files for v5.4 (2020-11-06 10:33:37 
+0530)

----------------------------------------------------------------
Asit Shah (1):
       qcom : updated venus firmware files for v5.4

  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
  qcom/venus-5.4/venus.b02 | Bin 873100 -> 873680 bytes
  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
  qcom/venus-5.4/venus.mbn | Bin 919212 -> 919792 bytes
  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
  6 files changed, 0 insertions(+), 0 deletions(-)

<<<<<<

Regards,
Asit

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
