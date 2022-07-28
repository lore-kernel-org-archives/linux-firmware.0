Return-Path: <SRS0=Lob0=YB=opensource.cirrus.com=prvs=1208a2b764=ckeepax@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38226C04A68
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Jul 2022 11:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC2A6C433D7; Thu, 28 Jul 2022 11:59:28 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D41EAC433D6
	for <linux-firmware@kernel.org>; Thu, 28 Jul 2022 11:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D41EAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S86DSE014791
	for <linux-firmware@kernel.org>; Thu, 28 Jul 2022 06:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=jXUPgNsUQswM0nAal6pmoYL6QO7uIA1iO+wjafemHLc=;
 b=nRB2TwovsFLK7Zt3veUYpgSm4xM+x+ldAKqaqcfe/KVN1GReB2KHI9cELmehgNynWZVv
 lc+HzNCs5diahQQUMwCvCZDwTYw53aod9oXgvk72B1TwQq9ykZ+ONKq7FXCjwZwOSxo0
 /0U7z+G7bBRnfVPFvtCmINbarGGgijwvfK03k9lwff18F5kcjJnulsWaou2NopS4Ap7j
 cKWLvSjAbch/uLpNGYBoFD4PP2Cf/GN4api6f/zlKUcoHYnSERYBudZsMzoGwolmEkZb
 vjmrqCqOSWDqbD1Jr+majWBBKaS/8CQFm7GJdt6FUOr9F/CW72V9IBKuectdIg1/W2CD CQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hged1xuua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 Jul 2022 06:59:26 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 28 Jul
 2022 06:59:24 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Thu, 28 Jul 2022 06:59:24 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D40B3475;
	Thu, 28 Jul 2022 11:59:24 +0000 (UTC)
Date: Thu, 28 Jul 2022 11:59:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitaly.rodionov@cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PULL v2 linux-firmware] Add firmware for Cirrus CS35L41
Message-ID: <20220728115924.GI92394@ediswmail.ad.cirrus.com>
References: <4f8ed799-7011-fe97-b606-4bcaa4e80ca3@cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f8ed799-7011-fe97-b606-4bcaa4e80ca3@cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Ea1vnMQ9TVKXLTVUDAeLKn-ZudIvsk6V
X-Proofpoint-ORIG-GUID: Ea1vnMQ9TVKXLTVUDAeLKn-ZudIvsk6V
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 28, 2022 at 11:37:46AM +0100, Vitaly Rodionov wrote:
> Hi,
> 
> We are adding firmware files to support Cirrus Logic smart amplifier
> CS35L41
> 
> Please, let me know if there are any problems.
> 
> Thanks,
> 
> Vitaly
> 
> changes since version 1:
> 
> Corrected LICENSE.cirrus
> 
> 

This still seems to include the problematic clause, lets make
sure we review this internally before sending a v3.

Thanks,
Charles
